package com.duogesi.controller;


import com.alibaba.fastjson.JSONObject;
import com.duogesi.Utils.MD5Utils;
import com.duogesi.entities.User;
import com.duogesi.service.Userservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/system/")
public class systemservlet {

    @Autowired
    private Userservice userservice;
    @Autowired
    private MD5Utils md5Utils;

    @RequestMapping("system.do")
    public String system(){
        return "system/system";
    }

//    更新个人信息
    @RequestMapping(value = "change.do",produces = "application/json; charset=utf-8")
    @ResponseBody
    public Object change(@RequestBody String[] list, HttpSession session){
        User user=(User) session.getAttribute("user");
        System.out.println(md5Utils.toMD5(list[1])+"===="+user.getPassword());
        if(md5Utils.toMD5(list[1]).equals(user.getPassword())) {
            userservice.update_user(md5Utils.toMD5(list[0]),user.getUsername());
            return JSONObject.parse("{'code':'成功'}");
        }else  return JSONObject.parse("{'code':'原密码错误'}");
    }
}
