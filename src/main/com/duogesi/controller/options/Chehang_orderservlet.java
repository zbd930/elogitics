package com.duogesi.controller.options;

import com.duogesi.Utils.PageBean;
import com.duogesi.entities.User;
import com.duogesi.entities.chehang.car;
import com.duogesi.entities.chehang.driver;
import com.duogesi.entities.chehang.order;
import com.duogesi.service.Carservice;
import com.duogesi.service.Chehangservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/chehang/")
public class Chehang_orderservlet {
    @Autowired
    private Chehangservice chehangservice;
    @Autowired
    private Carservice carservice;
    @Autowired
    private HttpSession session;
//    private final static  String realPath1 = "elogitics/";  //要更改
//    private final static  String realPath = "";  //要更改

    // 任务查看
    @RequestMapping("chakanrenwu.do")
    public ModelAndView chakanrenwu(int page){
        User user= (User) session.getAttribute("user");
        PageBean pageBean =chehangservice.get_all(user.getId(),10,page);
        ModelAndView mv=new ModelAndView("tuochehang/look_mission");
        mv.addObject("pagebean",pageBean);
//        获取司机
        List<driver> list=carservice.select_driver_all(user.getId());
        mv.addObject("select",list);
//        获取车辆
        List<car> list1=carservice.select_car_all(user.getId());
        mv.addObject("select1",list1);
        return mv;
    }

    //车行待完成任务
    @RequestMapping(value = "get_uncompleted.do")
    public ModelAndView get_uncompleted( ModelAndView mv)throws Exception{
        User user= (User) session.getAttribute("user");
        List<order> list=new ArrayList<>();
        try {
            list=chehangservice.get_orders_uncompleted(user.getId());
        }catch (Exception e){
            e.printStackTrace();
        }
        mv.addObject("list",list);
        mv.setViewName("tuochehang/mission_uncomplete");
        return mv;
    }
    //    全部任务
    @RequestMapping("get_all_mission.do")
    public ModelAndView get_all_mission(int page) throws Exception{
        User user= (User) session.getAttribute("user");
        int user_id=user.getId();
        System.out.println(user_id);
        PageBean pageBean =chehangservice.get_all_mission(10,page,user_id);
        ModelAndView mv=new ModelAndView("tuochehang/mission_all");
        mv.addObject("pagebean",pageBean);
        return mv;
    }
//    接单
    @RequestMapping(value = "update.do",produces = "application/json; charset=utf-8",method = RequestMethod.POST)
    public ModelAndView update(int id, ModelAndView modelAndView,int driver_id,int car_id,int address_id,String numbers) throws Exception{
        User user= (User) session.getAttribute("user");
        modelAndView.setViewName("redirect:/chehang/chakanrenwu.do?page=1");
        int result=chehangservice.update_order(address_id,id,driver_id,car_id,numbers);
        if (result==1){
            modelAndView.addObject("result1","success");
            return modelAndView;
        }else if(result==3) {
            modelAndView.addObject("result1","send email fail");
            return modelAndView;
        }
        else  {
            modelAndView.addObject("result2","fail");
            return modelAndView;
        }
    }
    //    车行全部页面ID查找
    @RequestMapping("search.do")
    public ModelAndView search(ModelAndView mv,String numbers) throws Exception{
        User user= (User) session.getAttribute("user");
        PageBean pageBean =chehangservice.get(user.getId(),numbers);
        mv.setViewName("tuochehang/mission_all");
        mv.addObject("pagebean",pageBean);
        return mv;
    }
    //    车辆信息
    @RequestMapping("car.do")
    public ModelAndView get_car( ModelAndView mv,int page) throws Exception{
        User user= (User) session.getAttribute("user");
        PageBean pageBean=carservice.get_car(user.getId(),10,page);
        mv.setViewName("tuochehang/car");
        mv.addObject("pagebean",pageBean);
        return mv;
    }
    //司机信息
    @RequestMapping("sijixinxi.do")
    public ModelAndView sijixinxi( ModelAndView mv,int page) throws Exception{
        User user= (User) session.getAttribute("user");
        PageBean pageBean=carservice.get_driver(user.getId(),10,page);
        mv.setViewName("tuochehang/sijixinxi");
        mv.addObject("pagebean",pageBean);
        return mv;
    }
//    添加司机
    @RequestMapping("insert_driver.do")
    public String insert_driver(driver driver) throws Exception{
        User user=(User) session.getAttribute("user");
        driver.setUser_id(user.getId());
        if(carservice.insert_driver(driver)==1){
            return "redirect:/chehang/sijixinxi.do?page=1";
        }else return null;
    }
    //    添加车辆
    @RequestMapping("insert_car.do")
    public String insert_car(car car){
        User user=(User) session.getAttribute("user");
        car.setUser_id(user.getId());
        if(carservice.insert_car(car)==1){
            return"redirect:/chehang/car.do?page=1";
        }else return null;
    }

    @RequestMapping("delete_car.do")
    public ModelAndView delete_car(ModelAndView mv,int id){
        int result=0;
        mv.setViewName("redirect:/chehang/car.do?page=1");
        try {
            result=chehangservice.delete_car(id);
        }catch (Exception e){
            e.printStackTrace();
        }
        if (result==1){
            mv.addObject("tianjia","成功");
        }else {
            mv.addObject("tianjia","失败");
        }
        return mv;
    }
    @RequestMapping("delete_driver.do")
    public ModelAndView delete_driver(ModelAndView mv,int id){
        int result=0;
        mv.setViewName("redirect:/chehang/sijixinxi.do?page=1");
        try {
            result=chehangservice.delete_driver(id);
        }catch (Exception e){
            e.printStackTrace();
        }
        if (result==1){
            mv.addObject("tianjia","成功");
        }else {
            mv.addObject("tianjia","失败");
        }
        return mv;
    }
}
