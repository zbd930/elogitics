package com.duogesi.mapper;

import com.duogesi.entities.User;
import com.duogesi.entities.company.subscriber_address;
import org.apache.ibatis.annotations.Param;


public interface UserMapper {

    User get_user(@Param("username") String username, @Param("password") String password);
    int update_user(@Param("password") String password,@Param("username") String username);
    subscriber_address get_emial(int id);
}
