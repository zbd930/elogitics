package com.duogesi.mapper;

import com.duogesi.entities.huodai.price_xiaobao;
import com.duogesi.entities.huodai.xiaobao;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface xiaobaoMapper {
    //添加小包任务
    int put_mission_(xiaobao xiaobao);

    //获取所有小包任务
    List<xiaobao> pull_mission(@Param("user_id") int user_id,@Param("page") int page,@Param("pagesize") int pagesize);

    //删除小包任务
    int delete_mission(int xiaobao_id);

    //获取小包价格
    List<price_xiaobao> get_small_mission(int xiaobao_id);
    //添加小包价格
    int add_price_xiaobao(price_xiaobao price_xiaobao);

    //修改有效期
    int update_timetable(@Param("timetable")String timetable,@Param("xiaobao_id")int xiaobao_id);
    //删除小包价格
    int delete_xiaobao_price(int delete_xiaobao_price);

}
