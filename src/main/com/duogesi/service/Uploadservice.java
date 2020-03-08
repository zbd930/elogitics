package com.duogesi.service;

import com.duogesi.Mail.Mymail;
import com.duogesi.entities.company.subscriber_address;
import com.duogesi.entities.huodai.copy_email;
import com.duogesi.mapper.UserMapper;
import com.duogesi.mapper.amountMapper;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.UUID;

import static com.duogesi.service.Huodaiservice.getaBoolean;

@Service
public class Uploadservice {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private Mymail mymail;
    @Autowired
    private amountMapper amountMapper;

    public Boolean send_shuidan(int id,int address_id, MultipartFile image,String numbers, HttpServletRequest req,String mycontext,String tax,String customer,String inspect){
        //先判断是否有附件
        String filename = image.getOriginalFilename();//获取上传时的文件名称
        System.out.println(filename);
        if (filename==null||filename.equals("")) {
            //判断有没有抄送邮件
            subscriber_address subscriber_address =new subscriber_address();
            if(userMapper.check_cc_if_null(address_id)!=null) {
                subscriber_address=userMapper.get_emial(address_id);
            }else {
                subscriber_address=userMapper.get_emial_no_cc(address_id);
            }
            String email = subscriber_address.getEmail();
            //获取抄送的邮件
            List<copy_email> cc=userMapper.get_cc_email(subscriber_address.getId());
            StringBuilder neirong = new StringBuilder();
            neirong.append("您的货物：" + numbers + " 。更新其他费用如下：<br/>报关费：" + customer + ",关税：" + tax + ",杂费" + inspect + ",明细如下：" + mycontext + "<br/>如有疑问请在改票货物收到的第一封税单确认邮件收到后的3个自然日内向客服提出，过期将默认。");
            try {
                //将杂费保存数据库
                amountMapper.updata_local(tax, customer, inspect, id);
                mymail.send(email, String.valueOf(neirong),"【杂费确认】",cc);
                return true;
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
        }
        else{
            //获取到上传的文件数据
            String contentType = image.getContentType();
            //判断上传文件是否为图片
            if (contentType == null || !contentType.startsWith("image/")) {
                System.out.println("===不属于图片类型...===");
                return false;
            }
            //动态获取上传文件夹的路径
            ServletContext context = req.getServletContext();
            String realPath = context.getRealPath("/upload/");//获取本地存储位置的绝对路径
            filename = UUID.randomUUID().toString() + "&numbers=" + numbers + "." + FilenameUtils.getExtension(filename);//创建一个新的文件名称    getExtension(name):获取文件后缀名
            //存储税单
            if (copy(image, realPath, filename)) {
                //判断有没有抄送邮件
                subscriber_address subscriber_address =new subscriber_address();
                if(userMapper.check_cc_if_null(address_id)!=null) {
                    subscriber_address=userMapper.get_emial(address_id);
                }else {
                    subscriber_address=userMapper.get_emial_no_cc(address_id);
                }
                String email = subscriber_address.getEmail();
                StringBuilder neirong = new StringBuilder();
                neirong.append("您的货物：" + numbers + "。更新其他费用如下：<br/>报关费：" + customer + ",关税：" + tax + ",杂费" + inspect + ",明细如下：" + mycontext + "<br/>如有疑问请在改票货物收到的第一封税单确认邮件收到后的3个自然日内向客服提出，过期将默认。");
                try {
                    //将杂费保存数据库
                    amountMapper.updata_local(tax, customer, inspect, id);
                    //发送邮件
                    mymail.sendMail3(realPath + "/" + filename, email, String.valueOf(neirong), "【杂费确认】",filename);

                } catch (Exception e) {
                    e.printStackTrace();
                    return false;
                }

            }//将上传的文件存储到指定位置
            return true;
        }
    }

    private Boolean copy(MultipartFile multipartFile, String realPath, String picName) {
        return getaBoolean(multipartFile, realPath, picName);

    }
}
