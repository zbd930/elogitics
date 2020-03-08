package com.duogesi.Aspect;

import com.duogesi.Mail.Mymail;
import com.duogesi.entities.company.subscriber_address;
import com.duogesi.entities.chehang.car;
import com.duogesi.entities.chehang.driver;
import com.duogesi.mapper.VehicleMapper;
import com.duogesi.mapper.UserMapper;

import com.duogesi.mapper.chehangMapper;
import com.duogesi.xiaoxi.xiaoxi;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;

@Aspect    //该标签把LoggerAspect类声明为一个切面
@Component //该标签把LoggerAspect类放到IOC容器中
public class Register_order_aspect {

    @Autowired
    private com.duogesi.mapper.chehangMapper chehangMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private VehicleMapper vehicleMapper;
    @Autowired
    private Mymail mymail;
    @Autowired
    private xiaoxi xiaoxi;

    /**
     * 通过注解@Pointcut定义切点，conference()只是一个标识，无所谓是什么，
     * 方法中内容本身也是空的，使用该切点的地方直接通过标识conference()引用切点表达式。
     */
    @Pointcut("execution(public * com.duogesi.service.Chehangservice.update_order(..))) ")
    public void conference() {}


    /**
     * 前置通知
     * @param joinPoint
     * 2代表 更新仓位信息成功，3代表失败，4代表仓位不够
     */
    @Before("conference()")
    public void beforMethod(JoinPoint joinPoint){
        String methodName = joinPoint.getSignature().getName();
        List<Object> args = Arrays.asList(joinPoint.getArgs());
        System.out.println("this method "+methodName+" begin. param<"+ args+">");
    }
    /**
     * 后置通知（无论方法是否发生异常都会执行,所以访问不到方法的返回值）
     * @param joinPoint
     */
    @After("conference()")
    public void afterMethod(JoinPoint joinPoint){
        String methodName = joinPoint.getSignature().getName();
        System.out.println("this method "+methodName+" end.");
    }
    /**
     * 返回通知（在方法正常结束执行的代码）
     * 返回通知可以访问到方法的返回值！
     * @param joinPoint
     */
    public void afterReturnMethod(JoinPoint joinPoint,Object result){
        String methodName = joinPoint.getSignature().getName();
        System.out.println("this method "+methodName+" end.result<"+result+">");
    }
    /**
     * 异常通知（方法发生异常执行的代码）
     * 可以访问到异常对象；且可以指定在出现特定异常时执行的代码
     * @param joinPoint
     * @param ex
     */

    public void afterThrowingMethod(JoinPoint joinPoint,Exception ex){
        String methodName = joinPoint.getSignature().getName();
        System.out.println("this method "+methodName+" end.ex message<"+ex+">");
    }
    /**
     * 环绕通知(需要携带类型为ProceedingJoinPoint类型的参数)
     * 环绕通知包含前置、后置、返回、异常通知；ProceedingJoinPoin 类型的参数可以决定是否执行目标方法
     * 且环绕通知必须有返回值，返回值即目标方法的返回值
     * @param point
     * 2是更新仓位情况有误，3是仓位不够,4是更新ship_schdule状态有误
     */
    @Around("conference()")
    public int aroundMethod(ProceedingJoinPoint point){
        int result = 0;
        String methodName = point.getSignature().getName();
        List<Object> args = Arrays.asList(point.getArgs());
        //获取切点方法的参数
        int address_id= (int) args.get(0);
        int id= (int) args.get(1);
        int  driver_id= (int) args.get(2);
        int  car_id= (int) args.get(3);
        String  numbers= (String) args.get(4);
        try {
            //前置通知
            System.out.println("The method "+ methodName+" start. param<"+ Arrays.asList(point.getArgs())+">");
                    //获取车辆
                    car car = vehicleMapper.get_car_byid(car_id);
                    //获取司机
                    driver driver = vehicleMapper.get_driver_byid(driver_id);
                    //判断有没有抄送邮件
                    subscriber_address address =new subscriber_address();
                    if(userMapper.check_cc_if_null(address_id)!=null) {
                        address=userMapper.get_emial(address_id);
                    }else {
                        address=userMapper.get_emial_no_cc(address_id);
                    }
                    StringBuilder stringBuilder=new StringBuilder();
                    stringBuilder.append("您的订单号:"+numbers+"已被接受。<br> 收货司机名称是"+driver.getName()+"; 电话是"+driver.getPhone()+"; 车牌号是"+car.getCar_number()+";<br>后续进程将会以邮件通知，请记得查收。");
            try {
                        //发送邮件
                System.out.println(address.getCcmails().toString());
                        mymail.send(address.getEmail(), String.valueOf(stringBuilder),"【您的货物状态更新了】",address.getCcmails());
                        result = 1;
                    }catch (Exception e){
                        result = 3;
                    }
                    finally {
                        point.proceed();
                    }

            //返回通知
            System.out.println("The method "+ methodName+" end. result<"+ result+">");
        } catch (Throwable e) {
            //异常通知
            System.out.println("this method "+methodName+" end.ex message<"+e+">");
            throw new RuntimeException(e);
        }
        //后置通知
        System.out.println("The method "+ methodName+" end.");
        return result;
    }
}
