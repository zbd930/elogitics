package com.duogesi.mapper;

import com.duogesi.entities.chehang.car;
import com.duogesi.entities.chehang.driver;
import org.apache.ibatis.annotations.Param;

import java.util.Collection;
import java.util.List;

public interface VehicleMapper {

    List<driver> select_driver(@Param("user_id")int user_id,@Param("currIndex") int currIndex, @Param("pageSize") int pageSize);
    List<car> select_car(@Param("user_id")int user_id,@Param("currIndex") int currIndex, @Param("pageSize") int pageSize);
    int insert_car(car car);
    int insert_driver(driver driver);

//    获取司机
    List<driver> select_driver_all(int user_id);
//    获取车辆
    List<car> select_car_all(int user_id);

//    根据ID获取司机
    driver get_driver_byid(int id);
    //    根据ID获取车辆
    car  get_car_byid(int id);

    //删除司机
    int delete_driver(int id);
      //删除车辆
    int delete_car(int id);
}
