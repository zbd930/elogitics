package com.duogesi.mapper;

import com.duogesi.entities.User;
import com.duogesi.entities.company.subscriber_address;
import com.duogesi.entities.huodai.copy_email;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface UserMapper {

    User get_user(@Param("username") String username, @Param("password") String password);
    int update_user(@Param("password") String password,@Param("username") String username);
    subscriber_address get_emial(int id);
//    获取CC邮箱
    List<copy_email> get_cc_email(int subscriber_id);
}
