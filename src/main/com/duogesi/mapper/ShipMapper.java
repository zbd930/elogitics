package com.duogesi.mapper;

import com.duogesi.entities.chehang.order;
import com.duogesi.entities.chehang.order_details;
import com.duogesi.entities.huodai.details;
import com.duogesi.entities.huodai.Ship;
import org.apache.ibatis.annotations.Param;

import java.sql.Date;
import java.util.List;

public interface ShipMapper {

    //    获取货代全部订单
    List<Ship> get_orders(@Param("user_id") int user_id);
    //    获取货代全部订单
    List<Ship> get_order(@Param("currIndex") int currIndex, @Param("pageSize") int pageSize, @Param("user_id") int user_id);

    //    添加任务_航次
    int insert_schdule(Ship ship);
    //    添加任务_航次对应的详细信息
    int insert_schdule_details(details details);

//    获得最新状态
    Ship get_status(@Param("user_id") int user_id, @Param("number") String number);

//    更新最新状态
    int update_status(@Param("status") int status, @Param("number") String number);
//更改最新状态前获取id对应的user_id
    int update_status_user_id(String numbers);
//    <!--当大订单结束时确认小订单已经完成-->
    int update_xiaoorders_status(String number);
    //更改小订单为3
    int update_xiaoorders_status_1(String number);

    //获取小订单信息byid
    List<order> get_mydetails(@Param("numbers")String numbers);
    //获取小订单信息byid
    //List<order> get_mydetails_date(@Param("date") String date,@Param("number") String number);

    //确认到货
    int change_status(int id);

    //确认到货前确认状态
    int check_staus(int id);

//    获取大订单的details
    details get_dadetails(int ship_id);

    //     <!--获取schdule对应的所有order-->
    List<order> get_schdule_orders(int items_id);

    //    修改订单号
   int set_ups(@Param("id") int id,@Param("ups") String ups);
//       <!--根据orders的numbers查询schdule_id-->
    int check_schdule_id(String numbers);
//    更改价格前确认是否有状态还是拼柜的柜子
    List<Ship> get_before_update_rate(@Param("country")String country,@Param("start_date") Date start_date, @Param("end_date") Date end_date,@Param("user_id") int user_id,@Param("method")String method );
    //    更改价格前确认是否有状态还是拼柜的海卡柜子
    List<Ship> get_before_update_rate_haika(@Param("start_date") Date start_date, @Param("end_date") Date end_date,@Param("user_id") int user_id,@Param("country")String country);
    //从redis取出数据更新到数据库
    int update_data_byid(order_details order_details);

    //删除订单
    int delete_by_shipid(String number);
    //删除订单前确认有拼柜票数
    List<order> check_before_delete(int id);

    //更新状态前获取前一阶段的状态
    Ship get_staus_before_change(String number);

    //确认到货前保证已经安排司机提货
    order get_car_info(int id);
    //判断方法
    Ship get_method(int item_id);

    //获取id
    int get_id(String number);
}
