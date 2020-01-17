package com.duogesi.service;

import com.duogesi.Utils.PageBean;
import com.duogesi.entities.chehang.car;
import com.duogesi.entities.chehang.driver;
import com.duogesi.mapper.VehicleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Carservice {

    @Autowired
    private VehicleMapper vehicleMapper;


    public PageBean get_driver(int user_id, int pageSize, int page) {
        if(page==0){
            page=1;
        }
        List<driver> list = vehicleMapper.select_driver(user_id, (page-1)*10, pageSize);
        PageBean pageBean = new PageBean();
        int allRows = vehicleMapper.select_driver_all(user_id).size();
        int totalPage = pageBean.getTotalPages(pageSize, allRows);
        int currentPage = pageBean.getCurPage(page);
        pageBean.setList(list);
        pageBean.setAllRows(allRows);
        pageBean.setCurrentPage(currentPage);
        pageBean.setTotalPage(totalPage);
        return pageBean;
    }

    public PageBean get_car(int user_id, int pageSize, int page) {
        if(page==0){
            page=1;
        }
        List<car> list = vehicleMapper.select_car(user_id, (page-1)*10, pageSize);
        PageBean pageBean = new PageBean();
        int allRows = vehicleMapper.select_car_all(user_id).size();
        int totalPage = pageBean.getTotalPages(pageSize, allRows);
        int currentPage = pageBean.getCurPage(page);
        pageBean.setList(list);
        pageBean.setAllRows(allRows);
        pageBean.setCurrentPage(currentPage);
        pageBean.setTotalPage(totalPage);
        return pageBean;
    }

    //    查看车辆
    public List<car> select_car_all(int id) {
        return vehicleMapper.select_car_all(id);
    }

    //    查看司机
    public List<driver> select_driver_all(int id) {
        return vehicleMapper.select_driver_all(id);
    }

    //    添加车辆
    public int insert_car(car car) {
        return vehicleMapper.insert_car(car);
    }

    //    添加司机
    public int insert_driver(driver driver) {
        return vehicleMapper.insert_driver(driver);
    }
}
