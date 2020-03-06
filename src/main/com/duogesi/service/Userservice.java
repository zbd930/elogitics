package com.duogesi.service;

import com.duogesi.entities.User;
import com.duogesi.entities.company.subscriber_address;
import com.duogesi.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Userservice {

    @Autowired
    private UserMapper userMapper;


    public User get_user(String name,String password){
       return userMapper.get_user(name,password);
    }

    public int update_user(String password,String username){
        return userMapper.update_user(password,username);
    }

    public subscriber_address getaddress(int id){
        return userMapper.get_emial(id);
    }
}
