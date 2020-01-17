package com.duogesi.service;

import com.duogesi.Mail.Mymail;
import com.duogesi.Utils.*;
import com.duogesi.Utils.Date;
import com.duogesi.entities.amount;
import com.duogesi.entities.chehang.order;
import com.duogesi.entities.chehang.order_details;
import com.duogesi.entities.chehang.temple_data;
import com.duogesi.entities.huodai.*;
import com.duogesi.mapper.ShipMapper;
import com.duogesi.mapper.additionMapper;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Service
public class Huodaiservice {

    @Autowired
    private ShipMapper shipMapper;
    @Autowired
    private com.duogesi.mapper.priceMapper priceMapper;
    @Autowired
    private com.duogesi.mapper.amountMapper amountMapper;
    @Autowired
    private RedisUtil redisUtil;
    @Autowired
    private com.duogesi.mapper.chehangMapper chehangMapper;
    @Autowired
    private com.duogesi.mapper.additionMapper additionMapper;
    @Autowired
    private SerializeUtil serializeUtil;
    @Autowired
    private Swtich swtich;

    public static Map convertBeanToMap(Object bean)
            throws IntrospectionException, IllegalAccessException, InvocationTargetException {
        Class type = bean.getClass();
        Map returnMap = new HashMap();
        BeanInfo beanInfo = Introspector.getBeanInfo(type);
        PropertyDescriptor[] propertyDescriptors =  beanInfo.getPropertyDescriptors();
        for (int i = 0; i< propertyDescriptors.length; i++) {
            PropertyDescriptor descriptor = propertyDescriptors[i];
            String propertyName = descriptor.getName();
            if (!propertyName.equals("class")) {
                Method readMethod = descriptor.getReadMethod();
                Object result = readMethod.invoke(bean, new Object[0]);
                if (result != null) {
                    returnMap.put(propertyName, result);
                } else {
                    returnMap.put(propertyName, "");
                }
            }
        }
        return returnMap;
    }

    //货代所有订单
    public PageBean get_orders(int pageSize, int page, int user_id) {
        if(page==0){
            page=1;
        }
        Swtich swtich1=new Swtich();
        List<Ship> list = shipMapper.get_order((page-1)*10, pageSize,user_id);
        for (Ship ship :list
        ) {
            swtich1.swtich_schdule(ship);
            ship.setMudigang(swtich1.switch_mudigang(ship.getMudigang()));
            ship.setCountry(swtich1.switch_country(ship.getCountry()));
            if(ship.getDetails().getCompensate()==1){
                ship.setManbipei("慢必赔");
            }
        }
        PageBean pageBean = new PageBean();
        int allRows = shipMapper.get_orders(user_id).size();
        int totalPage = pageBean.getTotalPages(pageSize, allRows);
        int currentPage = pageBean.getCurPage(page);
        pageBean.setList(list);
        pageBean.setAllRows(allRows);
        pageBean.setCurrentPage(currentPage);
        pageBean.setTotalPage(totalPage);
        return pageBean;
    }
    //   货代所有订单的details
    public details getdadetails(int id){
        return shipMapper.get_dadetails(id);
    }

    //    货代所有订单的orders
    public List<order> get_schdule_orders(int id){
        List<order> list = shipMapper.get_schdule_orders(id);
        Swtich swtich1=new Swtich();
        for (com.duogesi.entities.chehang.order order:list
        ) {
            swtich1.swtich_order(order);
//            order.setDest(swtich1.switch_mudigang(order.getDest()));
        }
        return list;
    }
//    添加任务
    public Boolean insert_mission(Ship ship, details details) {
        LocalDateTime localDateTime = LocalDateTime.now();
        if (localDateTime.toLocalDate().isBefore(details.getCut_time().toLocalDate())) {
            if (ship.getMethod().equals("美森") || ship.getMethod().equals("海派")|| ship.getMethod().equals("海卡")) {
                Date date = new Date();
                String middle = date.date(localDateTime);
                int i = (int) (Math.random() * 900 + 100);
                String myStr = Integer.toString(i);
                StringBuilder stringBuilder = new StringBuilder();
                String s = String.valueOf(stringBuilder.append("SE" + middle + myStr));
                ship.setNumber(s);
            } else {
                Date date = new Date();
                String middle = date.date(localDateTime);
                int i = (int) (Math.random() * 900 + 100);
                String myStr = Integer.toString(i);
                StringBuilder stringBuilder = new StringBuilder();
                String s = String.valueOf(stringBuilder.append("AI" + middle + myStr));
                ship.setNumber(s);
            }
            if (ship.getEtd().before(ship.getEta())&&details.getCut_time().before(details.getCut_end())&&details.getCut_end().equals(ship.getEtd())) {
// || ship.getEtd().equals(details.getCut_end())
                if (shipMapper.insert_schdule(ship) == 1) {
                    details.setShip_id(ship.getId());
                }
                if (shipMapper.insert_schdule_details(details) == 1) {
                    return true;
                } else return false;
            } else return false;
        }else return false;
    }
    //任务跟踪，获取最新状态
    public Ship get_status(int user_id, String id) {
        Ship ship=new Ship();
        Swtich swtich1=new Swtich();
        try {
            ship = shipMapper.get_status(user_id, id);
            swtich1.swtich_schdule(ship);
        }catch (Exception e){
            System.out.println(e.toString());
        }finally {
            return ship;
        }
    }
    //任务跟踪，更改最新状态
    public boolean update_status(int status,String number,int user_id){
            //执行
            if (shipMapper.update_status(status,number)==1) {
                if (status==6){
                    //船次订单已完成后所有用户订单改为已完成
                    shipMapper.update_xiaoorders_status(number);
                }
                if (status==1){
                    //船次订单装柜后所有用户订单改为服务中
                    shipMapper.update_xiaoorders_status_1(number);
                    //如果订单号为SP开头，删除对应船次订单的特价促销
                    if (number.startsWith("SP")){
                        redisUtil.del(String.valueOf(shipMapper.get_id(number)));
                    }
                }
            return true;
         }else return false;
    }
    //获取拖车订单
    public List<order> get_mydetails(String numbers, int user_id) {
        Swtich swtich1=new Swtich();
        if(shipMapper.update_status_user_id(numbers)==user_id) {
            List<order> orders = shipMapper.get_mydetails(numbers);
            for (com.duogesi.entities.chehang.order order:orders
            ) {
                swtich1.swtich_order(order);
            }
            return orders;
        }
        else return null;

    }
    //确认到货
    public int change_status(int id,int address_id,String numbers,int status) {
         int staus=shipMapper.check_staus(id);
        if (staus==1||staus==4) {
            return shipMapper.change_status(id);
        }else return 0;
    }

    //获取海派价格
    public List<price_include> get_price_haipai(int user_id,String country){
      List<price_include> myprices = priceMapper.get_price_include(user_id,"1",null,null,country);
        swtich2(myprices);
        return myprices;
    }
    //获取美森价格
    public List<price_include> get_price_meiseng(int user_id,String country){
        List<price_include> price_include = priceMapper.get_price_include(user_id,"2",null,null,country);
        swtich2(price_include);
        return price_include;
    }
    //删除海派价格
    public int delete_haipai(int id){
        return priceMapper.delete_price_haipai(id);
    }
    //获取空派价格
    public List<price_include> get_price_kongpai(int user_id,String country){
        List<price_include> price_include =priceMapper.get_price_include(user_id,"0",null,null,country);
        swtich2(price_include);
        return price_include;
    }
    //获取空派价格
    public List<price_include> get_price_kongpai_direct(int user_id,String country){
        List<price_include> price_include =priceMapper.get_price_include(user_id,"3",null,null,country);
        swtich2(price_include);
        return price_include;
    }
    //获取空派价格
    public List<price_include> get_price_kongpai_mingan(int user_id,String country){
        List<price_include> price_include =priceMapper.get_price_include(user_id,"4",null,null,country);
        swtich2(price_include);
        return price_include;
    }
    //获取海卡价格
    public List<price_haika> get_price_haika(int user_id){
        List<price_haika>  list=priceMapper.get_price_haika(user_id,null,null,null,"American");
        for (price_haika p:list
             ) {
            p.setCountry(swtich.switch_country(p.getCountry()));
        }
        return list;
    }
    //获取海卡价格加拿大
    public List<price_haika> get_price_haika_canada(int user_id){
        List<price_haika>  list=priceMapper.get_price_haika(user_id,null,null,null,"Canada");
        for (price_haika p:list
        ) {
            p.setCountry(swtich.switch_country(p.getCountry()));
        }
        return list;
    }
    //获取海卡价格欧洲
    public List<price_haika> get_price_haika_europe(int user_id){
        List<price_haika>  list=priceMapper.get_price_haika(user_id,null,null,null,"Europe");
        for (price_haika p:list
        ) {
            p.setCountry(swtich.switch_country(p.getCountry()));
        }
        return list;
    }
    //获取海卡价格日本
    public List<price_haika> get_price_haika_japan(int user_id){
        List<price_haika>  list=priceMapper.get_price_haika(user_id,null,null,null,"Japan");
        for (price_haika p:list
        ) {
            p.setCountry(swtich.switch_country(p.getCountry()));
        }
        return list;
    }

    //删除海卡价格
    public int delete_haika(int id){
        return priceMapper.delete_price_haika(id);
    }

    //添加海卡价格
    public int insert_haika(price_haika price_haika,int user_id){
        return priceMapper.insert_price_haika(price_haika);
    }

    //新版 新增价格
    public int insert_price(price_include price_include){
        if(priceMapper.insert_price(price_include)==1){
            return 1;
        }else return 2;
    }
    //修改ups单号
    public Boolean update_ups(int id, String ups){
        if(shipMapper.set_ups(id,ups)==1){
            return true;
        }else return false;
    }

    //       <!--根据orders的numbers查询schdule_id-->
    public int check_schdule_id(String numbers,int user_id) {
      int i=0;
      if (shipMapper.update_status_user_id(numbers)==user_id) {
          i = shipMapper.check_schdule_id(numbers);
      }
        return i;
    }
//    获取本月金额
    public amount get_total_byhuodai(int user_id){
        // 获取当前年份、月份、日期
        Calendar cale = Calendar.getInstance();
        // 获取当月第一天和最后一天
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String start_data, end_data;
        // 获取前月的第一天
        cale = Calendar.getInstance();
        cale.add(Calendar.MONTH, 0);
        cale.set(Calendar.DAY_OF_MONTH, 1);
        start_data = format.format(cale.getTime());
        // 获取前月的最后一天
        cale = Calendar.getInstance();
        cale.add(Calendar.MONTH, 1);
        cale.set(Calendar.DAY_OF_MONTH, 0);
        end_data = format.format(cale.getTime());
        amount amount=amountMapper.get_total_byhuodai(start_data,end_data,user_id);
        if(amount==null) {
            amount amount1=new amount();
            amount1.setAll(BigDecimal.valueOf(0));
            amount=amount1;
        }else {
            synchronized (amount){
                amount.setAll(amount.getTotal().add(amount.getTax()).add(amount.getCustomer()).add(amount.getInspect()).add(amount.getAdditional()));
            }
        }
        return amount;
    }

//获取当月总订单金额
    public List<amount> get_order_amount(String start_data, String end_data, String numbers,int user_id){
        List<amount> amounts=new ArrayList<>();
        if (!start_data.equals("")&&!end_data.equals("")&&numbers.equals("")) {
            amounts= amountMapper.get_order_amount(start_data, end_data, user_id);
        }else if(start_data.equals("")&&end_data.equals("")&&!numbers.equals("")){
            amounts=amountMapper.order_amount(numbers,user_id);
        }
        for (amount a :amounts
                ) {
//                a.setLocal(a.getCustomer().add(a.getAdditional()).add(a.getInspect()).add(a.getTax()));
                a.setAll(a.getCustomer().add(a.getAdditional()).add(a.getInspect()).add(a.getTax()).add(a.getTotal()));
        }
        return amounts;
    }

    //更新到仓的数据
    public Boolean daocang(int id, temple_data data, String email, String numbers, MultipartFile[] image, HttpServletRequest req, int item_id, int user_id) throws IllegalAccessException, IntrospectionException, InvocationTargetException {
        if (chehangMapper.get_change(id)==0&&chehangMapper.before_update(id)==2) {
            Mymail mymail = new Mymail();
            String[] path = new String[image.length];
            String[] filenames = new String[image.length];
            Map<String, Object> map = convertBeanToMap(data);
            StringBuilder s = new StringBuilder();
            s.append("请确认，您的订单：" + numbers + "，入仓数据如下<br>" + "箱数：" + data.getCtn() + "ctns,重量：" + data.getWeight() + "KG,体积：" + data.getVolume() + "CBM。" + "<br>如有疑问，请在邮件发出的24小时内联系客服提出，过期将视为默认处理。谢谢配合！");
            //动态获取上传文件夹的路径
            ServletContext context = req.getServletContext();
            String realPath = context.getRealPath("/rucang/");//获取本地存储位置的绝对路径
            if (!image[0].isEmpty()) {
                for (int i = 0; i < image.length; i++) {
                    //获取到上传的文件数据
                    String contentType = image[i].getContentType();
                    //判断上传文件是否为图片
                    if (contentType == null || !contentType.startsWith("image/")) {
                        System.out.println("===不属于图片类型...===");
                        return false;
                    }
                    String filename = image[i].getOriginalFilename();//获取上传时的文件名称
                    filename = numbers + i + ".jpg";//创建一个新的文件名称    getExtension(name):获取文件后缀名
                    filenames[i]=filename;
                    path[i] = realPath + "/" + filename;
                    copy(image[i], realPath, filename);
                }
                try {
                    mymail.sendMail2(path, email, String.valueOf(s), "【数据确认】",filenames);
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    Timer timer = new Timer();
                    //数据存入redis
                    redisUtil.hmset(numbers, map);
                    //定义定时器,从redis拿出数据,存入数据库
                    chehangMapper.update_change(id);
                    timer(id, timer,item_id,user_id,numbers);
                    return true;
                }
            } else {
                try {
                    mymail.send(email, String.valueOf(s), "【数据确认】");
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    //数据存入redis
                    redisUtil.hmset(numbers, map);
                    //定义定时器,从redis拿出数据,存入数据库
                    Timer timer = new Timer();
                    timer(id, timer,item_id,user_id,numbers);
                    chehangMapper.update_change(id);
                    return true;
                }
            }
        }
        else return false;
    }

    private void timer(int id, Timer timer,int item_id,int user_id,String number) {
        timer.schedule(new TimerTask() {
            @Override
            public void run() {
                Map<String, Object> map = redisUtil.hmget(number);
                if (map.isEmpty()){
                    timer.cancel();
                }else{
                    temple_data data = new temple_data();
                    order_details order_details = new order_details();
                    try {
                        BeanUtils.populate(order_details, map);
                        BeanUtils.populate(data, map);
                    } catch (IllegalAccessException e) {
                        e.printStackTrace();
                    } catch (InvocationTargetException e) {
                        e.printStackTrace();
                    }
                    order_details.setOrder_id(id);
                    //获取当前月份
//                // 获取当前年份、月份、日期
//                    LocalDateTime dt = LocalDateTime.now();
//                // 获取当月第一天和最后一天
//                com.duogesi.Utils.Date date=new com.duogesi.Utils.Date();
//                String start_data=date.getdate(dt);
                    // 根据柜号获取ship对象
                    Ship ship = shipMapper.get_method(item_id);
                    //获取目的港,包税渠道
                    List<price_include> price_include = new ArrayList<>();

                    order orders = chehangMapper.get_chaigui_addition(id);
                    //获取附加费
                    addition addition = get_addition(orders.getOrder_details().getCategory(), user_id);
                    if (addition == null) {
                        addition.setPrice(0);
                    }
                    List<price_haika> price_haikas = new ArrayList<>();
                    if (ship.getMethod().equals("美森")) {
                        price_include = priceMapper.get_price_include(user_id, "2", orders.getOrder_details().getChaigui(), String.valueOf(ship.getEtd()),null);
                        set_0(price_include);
                        //更新价格
                        if (update_price(ship.getMethod(), data.getCtn(), data.getWeight(), data.getVolume(), price_include.get(0), id, addition)) {
                            //更新仓位
                            shipMapper.update_data_byid(order_details);
                        }
                    } else if (ship.getMethod().equals("海派")) {
                        price_include = priceMapper.get_price_include(user_id, "1", orders.getOrder_details().getChaigui(), String.valueOf(ship.getEtd()),null);
                        set_0(price_include);
                        //更新价格
                        if (update_price(ship.getMethod(), data.getCtn(), data.getWeight(), data.getVolume(), price_include.get(0), id, addition)) {
                            //更新仓位
                            shipMapper.update_data_byid(order_details);
                        }
                    } else if (ship.getMethod().equals("空派")) {
                        price_include = priceMapper.get_price_include(user_id, "0", orders.getOrder_details().getChaigui(), String.valueOf(ship.getEtd()),null);
                        set_0(price_include);
                        //更新价格
                        if (update_price(ship.getMethod(), data.getCtn(), data.getWeight(), data.getVolume(), price_include.get(0), id, addition)) {
                            //更新仓位
                            shipMapper.update_data_byid(order_details);
                        }
                    } else if (ship.getMethod().equals("空派(直飞)")) {
                        price_include = priceMapper.get_price_include(user_id, "3", orders.getOrder_details().getChaigui(), String.valueOf(ship.getEtd()),null);
                        set_0(price_include);
                        //更新价格
                        if (update_price(ship.getMethod(), data.getCtn(), data.getWeight(), data.getVolume(), price_include.get(0), id, addition)) {
                            //更新仓位
                            shipMapper.update_data_byid(order_details);
                        }
                    } else if (ship.getMethod().equals("空派(带电)")) {
                        price_include = priceMapper.get_price_include(user_id, "4", orders.getOrder_details().getChaigui(), String.valueOf(ship.getEtd()),null);
                        //更新价格
                        if (update_price(ship.getMethod(), data.getCtn(), data.getWeight(), data.getVolume(), price_include.get(0), id, addition)) {
                            //更新仓位
                            shipMapper.update_data_byid(order_details);
                        }
                    } else if (ship.getMethod().equals("海卡")) {
                        order o = chehangMapper.get_mudigang_haika(id);
                        price_haikas = priceMapper.get_price_haika(user_id, o.getDest(), ship.getQiyungang(), String.valueOf(ship.getEtd()),null);
                        if (price_haikas.size() == 0) {
                            price_haikas.get(0).setPrice(0);
                        }
                        //更新价格
                        if (update_price_haika(ship.getMethod(), data.getCtn(), data.getWeight(), data.getVolume(), price_haikas.get(0), id)) {
                            //更新仓位
                            shipMapper.update_data_byid(order_details);
                        }
                    }
//                更新数据库,并删除缓存
                    redisUtil.del(number);
                    //取消线程
                    timer.cancel();
                }
            }
        },180000);//24小时 86400000

    }

    private void set_0(List<price_include> price_include) {
        if (price_include.size()==0){
            price_include.get(0).setOne(0);
            price_include.get(0).setFive(0);
            price_include.get(0).setThree(0);
            price_include.get(0).setTen(0);
        }
    }

    public addition get_addition(String category,int user_id){
        addition addition=additionMapper.get_price_category(category,user_id);
        if (addition==null){
            addition addition1=new addition();
            addition1.setPrice(0);
            return addition1;
        }else return addition;
    }

    //获取所有附加费
    public List<addition> get_all_price(int user_id){
        return additionMapper.get_price(user_id);
    }
    //新增附加费
    public int add_price(addition addition,int user_id){
        if (additionMapper.get_price_category(addition.getCategory(),user_id)==null) {
            addition.setUser_id(user_id);
            return additionMapper.add_price(addition);
        }else return 2;
    }
    //删除附加费
    public int delete_price(int addition_id){
        return additionMapper.delete_price(addition_id);
    }



    //删除船次订单
    public Boolean delete_order(String number,int id){
     if(shipMapper.check_before_delete(id).size()==0){
         if(shipMapper.delete_by_shipid(number)==1){
             if (number.startsWith("SP")){
                 redisUtil.del(String.valueOf(id));
             }
             return true;
         }else return false;
     }else return false;
    }

    private void swtich2(List<price_include> price_include) {
        for (com.duogesi.entities.huodai.price_include my:price_include
        ) {
            switch (my.getArea()){
                case "west":
                    my.setArea("美西");
                    break;
                case "east":
                    my.setArea("美东");
                    break;
                case "middle":
                    my.setArea("美中");
                    break;
                case "YVR":
                    my.setArea("温哥华");
                    break;
                case "YYC":
                    my.setArea("卡尔加里");
                break;
                case "YYZ":
                    my.setArea("多伦多");
                break;
                case "YOW":
                    my.setArea("渥太华");
                    break;
                case "zone1":
                    my.setArea("一号地区");
                break;
                case "zone2":
                    my.setArea("二号地区");
                break;
                case "zone3":
                    my.setArea("三号地区");
                break;
                case "zone4":
                    my.setArea("四号地区");
                break;
                case "Japan":
                    my.setArea("日本");
                break;
            }
            switch (my.getWay()){
                case "0":
                    my.setWay("空派");
                    break;
                case "1":
                    my.setWay("海派");
                    break;
                case "2":
                    my.setWay("美森");
                    break;
                case "3":
                    my.setWay("空派(直飞)");
                    break;
                case "4":
                    my.setWay("空派(带电)");
                    break;
            }
        }
    }
    private Boolean copy(MultipartFile multipartFile, String realPath, String picName) {
        return getaBoolean(multipartFile, realPath, picName);
    }
    public static Boolean getaBoolean(MultipartFile multipartFile, String realPath, String picName) {
        try {
            File dir = new File(realPath);
            //如果文件目录不存在，创建文件目录
            if (!dir.exists()) {
                dir.mkdir();
                System.out.println("创建文件目录成功：" + realPath);
            }
            File file = new File(realPath, picName);
            multipartFile.transferTo(file);
            System.out.println("添加图片成功！");
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        } catch (IllegalStateException e) {
            e.printStackTrace();
            return false;
        }
    }

    //更新价格的方法
    private Boolean update_price(String method, int ctn, float weight, float volume, price_include price_include, int id,addition addition){
        BigDecimal price= BigDecimal.valueOf(0);
        int xiangshu=ctn*10;
        float tijizhong= volume*167;
        float danjia =0;
        if (method.equals("海派")){
            if(get_danjai(xiangshu,weight, id, price_include, xiangshu, danjia,addition)){
                return true;
            }else return false;
        }else if(method.equals("美森")){
            if(get_danjai(xiangshu,weight, id, price_include, xiangshu, danjia,addition)){
                return true;
            }else return false;
        } else if(method.equals("空派")) {
            if(get_danjai(xiangshu,weight, id, price_include, tijizhong, danjia,addition)){
                return true;
            }else return false;
        }else if(method.equals("空派(直飞)")) {
            if(get_danjai(xiangshu,weight, id, price_include, tijizhong, danjia,addition)){
                return true;
            }else return false;
        }else if(method.equals("空派(带电)")) {
            if(get_danjai(xiangshu,weight, id, price_include, tijizhong, danjia,addition)){
                return true;
            }else return false;
        }else return false;
    }
    //更新价格的方法,渠道增加要更改海卡
    private Boolean update_price_haika(String method, int ctn, float weight, float volume, price_haika price_haika, int id) {
        if (method.equals("海卡")) {
            if (volume<=2){
                volume=2;
            }
            if (amountMapper.update_price(BigDecimal.valueOf(volume * price_haika.getPrice()), id) == 1) {
                return true;
            } else return false;
        }else return false;
    }
    //获取单价，并更新价格
    private Boolean get_danjai(int xiangshu,float weight, int id, price_include price_include, float paozhong, float danjia,addition addition) {
        float maozhong=0;
        if(xiangshu>weight){
            maozhong=xiangshu;
        }else{
            maozhong=weight;
        }
        if (paozhong>=maozhong){
            if (paozhong<=100) {
                danjia=price_include.getOne()+addition.getPrice();
            } else if (paozhong-100>0&&paozhong-300<= 0) {
                danjia=price_include.getThree()+addition.getPrice();
            } else if (paozhong-300>0&&paozhong-500<= 0) {
                danjia=price_include.getFive()+addition.getPrice();
            } else if (500-paozhong<0) {
                danjia=price_include.getTen()+addition.getPrice();
            }
            if(amountMapper.update_price(BigDecimal.valueOf(paozhong*danjia),id)==1){
                return true;
            }else return false;
        }else {
            if (maozhong<=100) {
                danjia=price_include.getOne()+addition.getPrice();
            } else if (maozhong-100>0&&maozhong-300<= 0) {
                danjia=price_include.getThree()+addition.getPrice();
            } else if (maozhong-300>0&&maozhong-500<= 0) {
                danjia=price_include.getFive()+addition.getPrice();
            } else if (500-maozhong<0) {
                danjia=price_include.getTen()+addition.getPrice();

            }
            if(amountMapper.update_price(BigDecimal.valueOf(maozhong*danjia),id)==1){
                return true;
            }else return false;

        }
    }
    //限时秒杀存入
    public int add_redis(Ship ship,details details, String killed_start , String killed_end) {
        //时间换算
        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat sdf1= new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date time1 = null;
        java.util.Date time2 = null;
        try {
            String str=":00";
            time1 = sdf.parse(killed_start.replace("T"," ")+str);
            time2 = sdf.parse(killed_end.replace("T"," ")+str);
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        details.setKill_start(time1);
        details.setKill_end(time2);
        LocalDateTime localDateTime = LocalDateTime.now();
        Date date1 = new Date();
        String result = date1.getdate(localDateTime);
        if (result.equals(sdf1.format(time1))&&result.equals(sdf1.format(time2))&&details.getKill_end().before(details.getCut_time())){
        //下单
        Date date = new Date();
        String middle = date.date(localDateTime);
        int i = (int) (Math.random() * 900 + 100);
        String myStr = Integer.toString(i);
        StringBuilder stringBuilder = new StringBuilder();
        String s = String.valueOf(stringBuilder.append("SP" + middle + myStr));
        ship.setNumber(s);
        if (ship.getEtd().before(ship.getEta()) && details.getCut_time().before(details.getCut_end()) && details.getCut_end().equals(ship.getEtd())) {
            if (shipMapper.insert_schdule(ship) == 1) {
                details.setShip_id(ship.getId());
                Map map=new HashMap();
                map.put("item_id",ship.getId());
                map.put("weight",details.getWeight());
                map.put("volume",details.getVolume());
                redisUtil.hmset(String.valueOf(ship.getId()),map);
            }
            if (shipMapper.insert_schdule_details(details) == 1) {
                return 1;
            } else return 4;
        }else return 2;
        }else return 3;
    }

}
