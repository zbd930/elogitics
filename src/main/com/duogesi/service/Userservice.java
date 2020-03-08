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
        //判断有没有抄送邮件
        subscriber_address subscriber_address =new subscriber_address();
        if(userMapper.check_cc_if_null(id)!=null) {
            subscriber_address=userMapper.get_emial(id);
        }else {
            subscriber_address=userMapper.get_emial_no_cc(id);
        }
        return subscriber_address;
    }
}
