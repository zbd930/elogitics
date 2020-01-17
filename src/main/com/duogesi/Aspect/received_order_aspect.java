package com.duogesi.Aspect;

import com.duogesi.Mail.Mymail;
import com.duogesi.entities.chehang.order;
import com.duogesi.entities.company.subscriber_address;
import com.duogesi.mapper.*;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;

@Aspect    //该标签把LoggerAspect类声明为一个切面
@Component //该标签把LoggerAspect类放到IOC容器中
public class received_order_aspect {

    @Autowired
    private ShipMapper shipMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private Mymail mymail;

    /**
     * 通过注解@Pointcut定义切点，conference()只是一个标识，无所谓是什么，
     * 方法中内容本身也是空的，使用该切点的地方直接通过标识conference()引用切点表达式。
     */
    @Pointcut("execution(public * com.duogesi.service.Huodaiservice.change_status(..)) ")
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
    public int aroundMethod(ProceedingJoinPoint point) {
        int result = 0;
        String methodName = point.getSignature().getName();
        List<Object> args = Arrays.asList(point.getArgs());
        //获取切点方法的参数
        int id = (int) args.get(0);
        int address_id = (int) args.get(1);
        String numbers = (String) args.get(2);
        int stauts = (int) args.get(3);
        if(stauts!=4){
            order order = shipMapper.get_car_info(id);
        if (order.getCar_id()!= 0&&order.getDriver_id() != 0) {
            try {
                //前置通知
                System.out.println("The method " + methodName + " start. param<" + Arrays.asList(point.getArgs()) + ">");
                //返回通知
                System.out.println("The method " + methodName + " end. result<" + result + ">");
            } catch (Throwable e) {
                //异常通知
                System.out.println("this method " + methodName + " end.ex message<" + e + ">");
                throw new RuntimeException(e);
            }
            //后置通知
            System.out.println("The method " + methodName + " end.");
            StringBuilder stringBuilder=new StringBuilder();
            stringBuilder.append("您的订单" + numbers + " 已经货到仓库。<br>如有问题请及时联系客服，感谢您的使用！");
            subscriber_address subscriber_address = userMapper.get_emial(address_id);
            try {
                mymail.send(subscriber_address.getEmail(), String.valueOf(stringBuilder), "【您的货物状态更新了】");
                point.proceed();
            } catch (Exception e) {
                e.printStackTrace();
            } catch (Throwable throwable) {
                throwable.printStackTrace();
            }
            result = 1;
            return result;
        }else return 0;
    }else {
            try {
                //前置通知
                System.out.println("The method " + methodName + " start. param<" + Arrays.asList(point.getArgs()) + ">");
                //返回通知
                System.out.println("The method " + methodName + " end. result<" + result + ">");
            } catch (Throwable e) {
                //异常通知
                System.out.println("this method " + methodName + " end.ex message<" + e + ">");
                throw new RuntimeException(e);
            }
            //后置通知
            System.out.println("The method " + methodName + " end.");
            String context = "您的订单" + numbers + " 已经货到仓库。感谢您的关注";
            subscriber_address subscriber_address = userMapper.get_emial(address_id);
            try {
                mymail.send(subscriber_address.getEmail(), context, "【您的货物状态更新了】");
            } catch (Exception e) {
                e.printStackTrace();
            } catch (Throwable throwable) {
                throwable.printStackTrace();
            }
            try {
                point.proceed();
            } catch (Throwable throwable) {
                throwable.printStackTrace();
            }
            result = 1;
            return result;
        }
    }
}
