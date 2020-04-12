package com.duogesi.service;

import com.duogesi.Utils.PageBean;
import com.duogesi.Utils.Swtich;
import com.duogesi.entities.chehang.order;
import com.duogesi.mapper.VehicleMapper;
import com.duogesi.mapper.chehangMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Chehangservice {
    @Autowired
    private com.duogesi.mapper.chehangMapper chehangMapper;
    @Autowired
    private VehicleMapper vehicleMapper;

    // 任务查看
    public PageBean get_all(int user_id,int pageSize, int page){
        PageBean pageBean=new PageBean();
        Swtich swtich=new Swtich();
        if(page==0){
            page=1;
        }
        List<order> list= chehangMapper.get_orders(user_id,(page-1)*10,pageSize);

        for (order order: list
        ) {
            synchronized (order){
                swtich.swtich_order(order);
        }
        }
        int allRows = chehangMapper.get_order_all(user_id).size();
        int totalPage = pageBean.getTotalPages(pageSize, allRows);
        int currentPage = pageBean.getCurPage(page);
        pageBean.setList(list);
        pageBean.setAllRows(allRows);
        pageBean.setCurrentPage(currentPage);
        pageBean.setTotalPage(totalPage);
        return pageBean;
    }

    //    车行获取所有未执行完的
    public List<order> get_orders_uncompleted(int user_id){

        return chehangMapper.get_orders_uncompleted(user_id);
    }
    //    全部任务
    public PageBean get_all_mission(int pageSize, int page,int user_id){
        if(page==0){
            page=1;
        }
        Swtich swtich=new Swtich();
        List<order> list= chehangMapper.get_all_mission((page-1)*10,pageSize,user_id);
        for (order order: list
        ) {
            synchronized (order) {
                swtich.swtich_order(order);
            }
        }
        PageBean pageBean = new PageBean();
        int allRows = chehangMapper.get_all_mission2(user_id).size();
        int totalPage = pageBean.getTotalPages(pageSize, allRows);
        int currentPage = pageBean.getCurPage(page);
        pageBean.setList(list);
        pageBean.setAllRows(allRows);
        pageBean.setCurrentPage(currentPage);
        pageBean.setTotalPage(totalPage);
        return pageBean;
    }
    //    车行确认接单
    public int update_order(int address_id, int id,int driver_id,int car_id,String numbers) {
        if (chehangMapper.update_order(id,driver_id,car_id)==1) {
            return 1;
        } else  return 0;
    }
    //    车行全部页面ID查找
    public PageBean get(int user_id,String numbers){
        List<order> list= chehangMapper.get_by_id(user_id,numbers);
        Swtich swtich=new Swtich();
        for (order order: list
             ) {
            swtich.swtich_order(order);
        }
        PageBean pageBean = new PageBean();
        int allRows = list.size();
        int totalPage = pageBean.getTotalPages(10, allRows);
        int currentPage = pageBean.getCurPage(0);
        pageBean.setList(list);
        pageBean.setAllRows(allRows);
        pageBean.setCurrentPage(currentPage);
        pageBean.setTotalPage(totalPage);
        return pageBean;
    }

    //删除司机
    public int delete_car(int id){
       return vehicleMapper.delete_car(id);
    }
    //删除车辆
    public int delete_driver(int id){
        return vehicleMapper.delete_driver(id);
    }

}
