package com.duogesi.Aspect;

import com.duogesi.entities.huodai.Ship;
import com.duogesi.entities.huodai.price_include;
import com.duogesi.mapper.ShipMapper;
import com.duogesi.Utils.Swtich;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.sql.Date;
import java.util.Arrays;
import java.util.List;

@Aspect    //该标签把LoggerAspect类声明为一个切面
@Component //该标签把LoggerAspect类放到IOC容器中
public class update_price_aspect {

    @Autowired
    private ShipMapper shipMapper;
    @Autowired
    private com.duogesi.mapper.priceMapper priceMapper;
    @Autowired
    private Swtich aSwitch;

    /**
     * 通过注解@Pointcut定义切点，conference()只是一个标识，无所谓是什么，
     * 方法中内容本身也是空的，使用该切点的地方直接通过标识conference()引用切点表达式。
     */
    @Pointcut("execution(public * com.duogesi.service.Huodaiservice.insert_price(..)) ")
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
        price_include price_include = (price_include) args.get(0);

        try {
            //前置通知
            System.out.println("The method " + methodName + " start. param<" + Arrays.asList(point.getArgs()) + ">");
            //返回通知
//            System.out.println("The method "+ methodName+" end. result<"+ result+">");
        } catch (Throwable e) {
            //异常通知
            System.out.println("this method " + methodName + " end.ex message<" + e + ">");
            throw new RuntimeException(e);
        }
        //后置通知
        System.out.println("The method " + methodName + " end.");
        if (price_include.getValid_date_start().before(price_include.getValid_date_end())) {
            try {
                Boolean res = true;
                List<price_include> prices = priceMapper.check_ship_includetax(price_include.getArea(), price_include.getWay(), price_include.getUser_id());
                for (price_include p : prices
                ) {
                    Date end = p.getValid_date_end();
                    Date start = p.getValid_date_start();
                    Date valid_end = price_include.getValid_date_end();
                    Date valid_start = price_include.getValid_date_start();
                    if ((valid_start.getTime() >= start.getTime() && valid_start.getTime() <= end.getTime()) || (valid_end.getTime() >= start.getTime() && valid_end.getTime() <= end.getTime())) {
                        res = false;
                    }
                }
                //确认输入的有效期内是否还有未拼柜的货
                List<Ship> list = shipMapper.get_before_update_rate(price_include.getCountry(),price_include.getValid_date_start(), price_include.getValid_date_end(), price_include.getUser_id(), aSwitch.switch_way(Integer.parseInt(price_include.getWay())));
                System.out.println(list);
                if (list.size() == 0 && res) {
                    point.proceed();
                    return 1;
                } else return 3;
            } catch (Exception e) {
                e.printStackTrace();
            } catch (Throwable throwable) {
                throwable.printStackTrace();
            }
            return 2;
        }else return 2;
    }
}
