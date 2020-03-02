package com.duogesi.controller;

import com.duogesi.entities.User;
import com.duogesi.entities.company.supplier_company;
import com.duogesi.service.Xinxiservice;
import com.sun.scenario.effect.impl.prism.PrImage;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.lang.reflect.InvocationTargetException;

@Controller
@RequestMapping("/xinxi/")
public class xinxiservlet {
    @Autowired
    private Xinxiservice xinxiservice;
    @Autowired
    private HttpSession session;
//跳转
    @RequestMapping("xinxi.do")
    public ModelAndView xinxi(ModelAndView mv ){
        User u =(User)session.getAttribute("user");
        mv.setViewName("data/xinxi");
        mv.addObject("company",xinxiservice.get_byid(u.getId()));
        return mv;
    }

//更改信息
    @RequestMapping("update.do")
    public String updata(supplier_company supplier_company)  {
        User user=(User)session.getAttribute("user");
        supplier_company.setUser_id(user.getId());
        if(xinxiservice.update_company(supplier_company)==1){
            return "redirect:/xinxi/xinxi.do";
        }
        else return null;
    }


    //跳转
    @RequestMapping("warehouse.do")

    public String warehouse(){

        return "data/warehouse";
    }

}
