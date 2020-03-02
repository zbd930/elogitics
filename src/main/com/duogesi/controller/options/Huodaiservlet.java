package com.duogesi.controller.options;


import com.duogesi.Utils.PageBean;
import com.duogesi.entities.User;
import com.duogesi.entities.amount;
import com.duogesi.entities.chehang.order;
import com.duogesi.entities.chehang.temple_data;
import com.duogesi.entities.huodai.*;
import com.duogesi.service.Huodaiservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/huodai/")
public class Huodaiservlet {
    @Autowired
    private Huodaiservice huodaiservice;
   @Autowired
   private HttpServletRequest request;
   @Autowired
   private HttpSession session;
//    private final static  String realPath1 = "elogitics/";  //要更改
//    private final static  String realPath = "";  //要更改/usr/local/apache-tomcat-7.0.68/webapps
    private final static  String realPath3 = "/usr/local/apache-tomcat-7.0.68/webapps/elogistic/";  //要更改s


    //货代所有订单
    @RequestMapping("allmission.do")
    public ModelAndView allmission(ModelAndView modelAndView, int page) throws Exception{
            User user=(User)session.getAttribute("user");
           PageBean pageBean =new PageBean();
            try {
                pageBean=huodaiservice.get_orders(10,page,user.getId());
            }catch (Exception e){
                e.printStackTrace();
            }
            modelAndView.addObject("pagebean",pageBean);
            modelAndView.setViewName("huodai/allmission");
            return modelAndView;
    }
    //货代所有订单的详细信息
    @RequestMapping("thedetails.do")
    public ModelAndView thedetails(ModelAndView mv,int id,String number) throws Exception{
        //详细信息
        details details=huodaiservice.getdadetails(id);
        //所有订单
        List<order> list=huodaiservice.get_schdule_orders(id);
        mv.addObject("details",details);
        mv.addObject("list",list);
        mv.addObject("number",number);
        mv.setViewName("huodai/details");
        return mv;
    }
    //根据orders的numbers查询id
    @RequestMapping(value = "check_schdule_id.do",method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView check_id(ModelAndView mv,String numbers) {
        int id=0;
        User user=(User)session.getAttribute("user");
        try{
            id=huodaiservice.check_schdule_id(numbers,user.getId());
        }catch (Exception e){
            e.printStackTrace();
        }
        if (id!=0) {
            mv.setViewName("redirect:/huodai/thedetails.do?id=" + id);
        }else {
            mv.setViewName("redirect:/huodai/allmission.do?page=1");
            mv.addObject("the","查询错误");
        }
        return mv;
    }
    //修改ups单号
    @RequestMapping(value = "updateups.do",method = RequestMethod.POST)
    public String  thedetails(int id,String ups){
        //更新
        try {
            huodaiservice.update_ups(id, ups);
        }catch (Exception e){
            e.printStackTrace();
        }
//       return  "redirect: elogitics/huodai/allmission.do?page=1";
        return  "redirect:/huodai/allmission.do?page=1";
    }
    /**
     * 新增任务
     * */
    @RequestMapping(value = "insert.do",method = RequestMethod.POST)
    public ModelAndView insert_mission(ModelAndView mv, Ship ship, details details) throws Exception{
        User user=(User)session.getAttribute("user");
        ship.setUser_id(user.getId());
        mv.setViewName("huodai/insert_mission");
        try {
            if (huodaiservice.insert_mission(ship, details)) {
                mv.addObject("result", "添加成功");
            }   else {
                mv.addObject("result", "添加失败");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
           finally {
            return mv;
        }

    }
    /**
     *任务跟踪,获取航次订单状态
     * */
    @RequestMapping(value = "chaxun.do",method = RequestMethod.GET,produces = "application/json; charset=utf-8")
    public ModelAndView chaxun(String num,ModelAndView mv) throws Exception{
        User user=(User)session.getAttribute("user");
        Ship ship =huodaiservice.get_status(user.getId(),num);
        if(ship!=null) {
            mv.setViewName("huodai/track_mission");
            mv.addObject("item", ship);
            return mv;
        }else {
            mv.setViewName("huodai/track_mission");
            Ship ship1=new Ship();
            ship1.setId(0);
            ship1.setStatu("请重新输入");
            mv.addObject("item", ship1);
            return mv;
        }
    }
    /**
     *任务跟踪,更新航次状态
     * */
    @RequestMapping(value = "genzhong.do",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
    public ModelAndView genzhong(ModelAndView mv, int status, String number) throws Exception{
        User user=(User)session.getAttribute("user");
        mv.setViewName("huodai/track_mission");
        Boolean ture=false;
        try {
            ture=huodaiservice.update_status(status,number,user.getId());
        }catch (Exception e){
            e.printStackTrace();
        }
        if(ture) {
            mv.addObject("my_result","成功");
        } else {
            mv.addObject("my_result","提交错误");
        }
        return mv;
    }
    //获取拖车订单
    @RequestMapping("xiaodan.do")
    public  ModelAndView get_mydetails(ModelAndView mv,String numbers) throws Exception{
        try {
            List<order> order=huodaiservice.get_mydetails(numbers,((User) session.getAttribute("user")).getId());
            mv.addObject("order", order);
        }
        catch (Exception e){
            e.printStackTrace();
            mv.addObject("error2","查询出错");
        }
        mv.setViewName("huodai/mission_details");
        return mv;
    }
    //确认到货
    @RequestMapping(value = "change_status.do",method = RequestMethod.GET)
    public  ModelAndView change_status(ModelAndView mv,int id,int address_id,String numbers,int status) throws Exception{
        int i=0;
        try {
            i=huodaiservice.change_status(id,address_id,numbers,status);
        }catch (Exception e){
            e.printStackTrace();
        }
        mv.setViewName("huodai/mission_details");
        if (i==1){
            mv.addObject("update","success");
            return mv;
        } else {
            mv.addObject("update","fail");
            return mv;
        }
    }
    //空派页面
    @RequestMapping(value = "kongpai.do")
    public  ModelAndView kongpai(ModelAndView mv) throws Exception{
        User user=(User)session.getAttribute("user");
        List<price_include> kongpai=huodaiservice.get_price_kongpai(user.getId(),"American");
        List<price_include> direct=huodaiservice.get_price_kongpai_direct(user.getId(),"American");
        List<price_include> mingan=huodaiservice.get_price_kongpai_mingan(user.getId(),"American");
        List<price_include> Canda_kongpai=huodaiservice.get_price_kongpai(user.getId(),"Canada");
        List<price_include> Canda_direct=huodaiservice.get_price_kongpai_direct(user.getId(),"Canada");
        List<price_include> Canda_mingan=huodaiservice.get_price_kongpai_mingan(user.getId(),"Canada");
        List<price_include> Eurpor_kongpai=huodaiservice.get_price_kongpai(user.getId(),"Eurpor");
        List<price_include> Eurpor_direct=huodaiservice.get_price_kongpai_direct(user.getId(),"Eurpor");
        List<price_include> Eurpor_mingan=huodaiservice.get_price_kongpai_mingan(user.getId(),"Eurpor");
        List<price_include> Japan_kongpai=huodaiservice.get_price_kongpai(user.getId(),"Japan");
        List<price_include> Japan_direct=huodaiservice.get_price_kongpai_direct(user.getId(),"Japan");
        List<price_include> Japan_mingan=huodaiservice.get_price_kongpai_mingan(user.getId(),"Japan");
        mv.addObject("kongpai",kongpai);
        mv.addObject("direct",direct);
        mv.addObject("mingan",mingan);
        mv.addObject("Canda_kongpai",Canda_kongpai);
        mv.addObject("Canda_direct",Canda_direct);
        mv.addObject("Canda_mingan",Canda_mingan);
        mv.addObject("Eurpor_kongpai",Eurpor_kongpai);
        mv.addObject("Eurpor_direct",Eurpor_direct);
        mv.addObject("Eurpor_mingan",Eurpor_mingan);
        mv.addObject("Japan_direct",Japan_direct);
        mv.addObject("Japan_mingan",Japan_mingan);
        mv.addObject("Japan_kongpai",Japan_kongpai);
        mv.setViewName("huodai/add_price_includetax_kong");
        return mv;
    }

    //海派页面
    @RequestMapping(value = "haipai.do")
    public  ModelAndView haipai(ModelAndView mv) throws Exception{
        User user=(User)session.getAttribute("user");
        List<price_include> haipai=huodaiservice.get_price_haipai(user.getId(),"American");
        List<price_include> meiseng=huodaiservice.get_price_meiseng(user.getId(),"American");
        List<price_include> Canda_normal=huodaiservice.get_price_haipai(user.getId(),"Canada");
        List<price_include> Canda_fast=huodaiservice.get_price_meiseng(user.getId(),"Canada");
        List<price_include> Eurpor_normal=huodaiservice.get_price_haipai(user.getId(),"Europe");
        List<price_include> Eurpor_fast=huodaiservice.get_price_meiseng(user.getId(),"Europe");
        List<price_include> Japan_normal=huodaiservice.get_price_haipai(user.getId(),"Japan");
        List<price_include> Japan_fast=huodaiservice.get_price_meiseng(user.getId(),"Japan");
        mv.addObject("haipai",haipai);
        mv.addObject("meiseng",meiseng);
        mv.addObject("Canda_normal",Canda_normal);
        mv.addObject("Canda_fast",Canda_fast);
        mv.addObject("Eurpor_normal",Eurpor_normal);
        mv.addObject("Eurpor_fast",Eurpor_fast);
        mv.addObject("Japan_normal",Japan_normal);
        mv.addObject("Japan_fast",Japan_fast);
        mv.setViewName("huodai/add_price_includetax_hai");
       return mv;
    }

    //海卡页面
    @RequestMapping(value = "haika.do",method = RequestMethod.GET)
    public  ModelAndView haika(ModelAndView mv) throws Exception{
        User user=(User)session.getAttribute("user");
        List<price_haika> haika=huodaiservice.get_price_haika(user.getId());
        List<price_haika> canada_haika=huodaiservice.get_price_haika_canada(user.getId());
        List<price_haika> europe_haika=huodaiservice.get_price_haika_europe(user.getId());
        List<price_haika> japan_haika=huodaiservice.get_price_haika_japan(user.getId());

        mv.addObject("haika",haika);
        mv.addObject("canada_haika",canada_haika);
        mv.addObject("europe_haika",europe_haika);
        mv.addObject("japan_haika",japan_haika);

        mv.setViewName("huodai/add_price_nottax");
        return mv;
    }

    //删除海卡
    @RequestMapping(value = "delete_price_haika")
    public String delete_haika(int id){
        int result=huodaiservice.delete_haika(id);
        if(result==1){
            return "redirect:/huodai/haika.do";
        }else return null;
    }
    //新增海卡
    @RequestMapping(value = "add_price_haika.do",method = RequestMethod.POST)
    public ModelAndView add_haipai(ModelAndView mv, price_haika price_haika){
        User user=(User)session.getAttribute("user");
        price_haika.setUser_id(user.getId());
        mv.setViewName("redirect:/huodai/haika.do");
        int result=0;
        try {
            result=huodaiservice.insert_haika(price_haika,user.getId());
        }catch (Exception e){
            e.printStackTrace();
        }
        if(result==1){
            mv.addObject("insert","success");
        }
        else if(result==2)
            mv.addObject("insert","fail");
        else if(result==3)
            mv.addObject("insert","fail");
        return mv;
    }

    //新增包税
    @RequestMapping(value = "add_price.do",method = RequestMethod.POST)
    public ModelAndView add_price(ModelAndView mv, price_include price_include){
        User user=(User)session.getAttribute("user");
        price_include.setUser_id(user.getId());
        String way= price_include.getWay();
        if (way.equals("1")||way.equals("2")) {
            mv.setViewName("redirect:/huodai/haipai.do");
        }else {
            mv.setViewName("redirect:/huodai/kongpai.do");
        }
        int result=huodaiservice.insert_price(price_include);
        if(result==1){
            mv.addObject("insert","success");
        }
        else if(result==2)
            mv.addObject("insert","fail");
        else if(result==3)
            mv.addObject("insert","fail");
        return mv;
    }
    //删除海派
    @RequestMapping(value = "delete_price")
    public String delete_price(int id,int method){
        int result=huodaiservice.delete_haipai(id);
        if(result==1&&method!=1){
            return"redirect:/huodai/haipai.do";
        }else if(result==1&&method==1){
            return"redirect:/huodai/kongpai.do";
        }else return null;
    }
    //跳转资料页面
    @RequestMapping("data.do")
    public String data(int id,int address_id,String numbers){
        request.setAttribute("id",id);
        request.setAttribute("address_id",address_id);
        request.setAttribute("numbers",numbers);
        return "huodai/data";
    }
    //下载发票
    @RequestMapping("downloadfapiao/{fileName}.{suffix}.do")
    public void downloadfapiao(@PathVariable("fileName") String fileName,
                                @PathVariable("suffix") String suffix,
                                HttpServletResponse response){
        System.out.println("发票");
        // 设置下载的响应头信息
        response.setHeader("Content-Disposition",
                "attachment;fileName=" + "fapiao"+fileName+".jpg");
        File imgFile = new File(  realPath3+"fapiao/"+fileName + "." + suffix);
        try {
            responseFile(response, imgFile);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    //下载箱单
    @RequestMapping("downloadxiangdan/{fileName}.{suffix}.do")
    public void downloadxiangdan(@PathVariable("fileName") String fileName,
                               @PathVariable("suffix") String suffix,
                               HttpServletResponse response){
        response.setHeader("Content-Disposition",
                "attachment;fileName=" + "xiangdan"+fileName+".jpg");
        File imgFile = new File(  realPath3+"xiangdan/"+fileName + "." + suffix);
        try {
            responseFile(response, imgFile);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    //下载报关单
    @RequestMapping("downloadbaoguan/{fileName}.{suffix}.do")
    public void downloadbaoguan(@PathVariable("fileName") String fileName,
                               @PathVariable("suffix") String suffix,
                               HttpServletResponse response){
        response.setHeader("Content-Disposition",
                "attachment;fileName=" + "baoguandan"+fileName+".jpg");
        File imgFile = new File(  realPath3+"baoguan/"+fileName + "." + suffix);
        try {
            responseFile(response, imgFile);
        }catch (Exception e){
            e.printStackTrace();
        }

    }
    //下载合同
    @RequestMapping("downloadhetong/{fileName}.{suffix}.do")
    public void downloadhetong(@PathVariable("fileName") String fileName,
                               @PathVariable("suffix") String suffix,
                               HttpServletResponse response){
        // 设置下载的响应头信息
        response.setHeader("Content-Disposition",
                "attachment;fileName=" + "hetong"+fileName+".jpg");
        File imgFile = new File(  realPath3+"hetong/"+fileName + "." + suffix);
        try {
            responseFile(response, imgFile);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    //获取本月金额
    @RequestMapping("zhuangdan.do")
    public ModelAndView zhuangdan(String start,String end,String number,ModelAndView mv){
        User user=(User)session.getAttribute("user");
        int user_id=user.getId();
        mv.setViewName("huodai/amount");
        //获取总金额
        amount amount=huodaiservice.get_total_byhuodai(user_id);
        mv.addObject("amount",amount);
        //获取总金额
         List<amount> amount1 = huodaiservice.get_order_amount(start, end,number,user_id);
         mv.addObject("order",amount1);
        return mv;
    }
    //获取本月金额
    @RequestMapping("zhuangdan1.do")
    public String zhangdan1(){
        return "huodai/amount";
    }
    //更新到仓的数据
    @RequestMapping(value = "daocang.do",method = RequestMethod.POST)
    public ModelAndView daocang(ModelAndView mv, temple_data data, int id, int item_id, String email, @RequestParam("image") MultipartFile[] image, HttpServletRequest request, String numbers){
        mv.setViewName("redirect:/huodai/allmission.do?page=1");
        User user =(User)session.getAttribute("user");
        Boolean result=false;
        //如果输入框为0
        if(id==0||data==null){
            mv.addObject("final", "fail");
            return mv;
        }
        try {
            result=huodaiservice.daocang(id, data, email, numbers, image, request,item_id,user.getId());
           if(result) {
               mv.addObject("final", "success");
           }else {
               mv.addObject("final", "fail");
           }
        }catch (Exception e){
            e.printStackTrace();
        }
        return mv;
    }
    //删除航次订单
    @RequestMapping("delete_order.do")
    public ModelAndView delete_order(String number,int id,ModelAndView mv){
        mv.setViewName("redirect:/huodai/allmission.do?page=1");
        if(huodaiservice.delete_order(number,id)){
            mv.addObject("delete","success");
        }else {
            mv.addObject("delete","fail");
        }
        return mv;
    }

    //获取所有附加费
    @RequestMapping("get_price.do")
    public ModelAndView get_price(ModelAndView mv){
        mv.setViewName("/huodai/addition");
        User user=(User)session.getAttribute("user");
        List<addition> list=new ArrayList<>();
        try {
            list=huodaiservice.get_all_price(user.getId());
        }catch (Exception e){
            e.printStackTrace();
        }
        mv.addObject("list",list);
        return mv;
    }

    //添加附加费
    @RequestMapping("add_addion_price.do")
    public  ModelAndView add_price(ModelAndView mv,addition addition){
        User user=(User)session.getAttribute("user");
        mv.setViewName("redirect:/huodai/get_price.do");
        int result=0;
        try {
            result=huodaiservice.add_price(addition,user.getId());
        }catch (Exception e){
            e.printStackTrace();
        }
        if (result==1){
            mv.addObject("add","添加成功");
        }else if(result==2) {
            mv.addObject("add","已有数据");
        }else {
            mv.addObject("add","添加失败");
        }
        return mv;

    }
    //删除附加费
    @RequestMapping("delete_addion_price.do")
    public  ModelAndView delete_price(ModelAndView mv,int addition_id){
        mv.setViewName("redirect:/huodai/get_price.do");
        int result=0;
        try {
            result=huodaiservice.delete_price(addition_id);
        }catch (Exception e){
            e.printStackTrace();
        }
        return mv;

    }

    //跳转页面
    @RequestMapping("jump.do")
    public String jump(){


        return "huodai/insert_mission";
    }
    //跳转页面
    @RequestMapping("jump2.do")
    public String jump2(){


        return "huodai/mission_details";
    }
    //跳转页面
    @RequestMapping("jump3.do")
    public String jump3(){
        return "huodai/track_mission";
    }
    //跳转页面
    @RequestMapping("jump4.do")
    public String jump4(){
        return "huodai/insert_mission_limit";
    }
    private void responseFile(HttpServletResponse response, File imgFile) {
        try(InputStream is = new FileInputStream(imgFile);
            OutputStream os = response.getOutputStream();){
            byte [] buffer = new byte[1024]; // 图片文件流缓存池
            while(is.read(buffer) != -1){
                os.write(buffer);
            }
            os.flush();
        } catch (IOException ioe){
            ioe.printStackTrace();
        }
    }

    //限时秒杀
    @RequestMapping("insert_limit.do")
    public ModelAndView insert_limit(Ship ship,details details,ModelAndView mv, String killed_start , String killed_end){
        int i=0;
        mv.setViewName("huodai/insert_mission_limit");
        try {
            User user=(User)session.getAttribute("user");
            ship.setUser_id(user.getId());
            i=huodaiservice.add_redis(ship,details,killed_start,killed_end);
        }catch (Exception e){
            e.printStackTrace();
        }
        if(i==1){
            mv.addObject("result","成功");
        }
        else if(i==2)
        {
            mv.addObject("result","添加时间有误");
        }
        else if(i==3){
            mv.addObject("result","抢购时间应为当天且早于截关时间");
        }
        else {
            mv.addObject("result","失败");
        }
        return mv;
    }

}
