package com.duogesi.controller;

import com.duogesi.Mail.Mymail;
import com.duogesi.service.Uploadservice;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
@RequestMapping("/up/")
public class UploadController {
    @Autowired
    private Uploadservice uploadservice;

    @RequestMapping(value="/upload.do",method= RequestMethod.POST,produces = "application/json; charset=utf-8")
    public ModelAndView upload(int id,int address_id,String numbers, MultipartFile image, HttpServletRequest req,ModelAndView mv,String context,String tax,String customer,String inspect) throws Exception, IOException {
        mv.setViewName("../huodai/data.do?id="+id);
        if(uploadservice.send_shuidan(id,address_id,image,numbers,req,context,tax,customer,inspect)){
            mv.addObject("so","上传成功");
        }else {
            mv.addObject("so","上传失败");
        }
        return mv;
    }
}
