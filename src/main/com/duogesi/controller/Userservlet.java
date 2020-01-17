package com.duogesi.controller;

import com.duogesi.Utils.MD5Utils;
import com.duogesi.entities.User;
import com.duogesi.service.Userservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/User/")
public class Userservlet {

    @Autowired
    private Userservice userservice;
    @Autowired
    private MD5Utils md5Utils;

    @RequestMapping(value = "login.do",method = RequestMethod.POST)
    public ModelAndView login(String name, String password, ModelAndView modelAndView, HttpSession session){
        User user=userservice.get_user(name,md5Utils.toMD5(password));
        if(user!=null) {
            user.setPassword(user.getPassword());
            modelAndView.setViewName("menu");
            session.setAttribute("user", user);
            return modelAndView;
        }else {
            modelAndView.setViewName("../index");
            modelAndView.addObject("the_result","登录账号密码错误");
            return modelAndView;
        }
    }

    //    退出登陆
    @RequestMapping("Menuservlet_exit.do")
    public void Menuservlet_exit(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        session.removeAttribute("user");
        response.sendRedirect(request.getContextPath()+"/index.jsp");
    }
}
