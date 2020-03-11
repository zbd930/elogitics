package com.duogesi.Filter;

import com.duogesi.entities.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class sessionFilter implements Filter{
    public void destroy() {

        // TODO Auto-generated method stub

    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession();
        User user=(User)session.getAttribute("user");
        String loginUrl = httpRequest.getContextPath() + "/index.jsp";
        String url= String.valueOf(httpRequest.getRequestURI());
        if (user==null&&!url.equals("/elogitics_war/User/login.do")){
            String str = "<script language='javascript'>alert('会话过期,请重新登录');"
                    + "window.top.location.href='"
                    + loginUrl
                    + "';</script>";
            response.setContentType("text/html;charset=UTF-8");// 解决中文乱码
            try {
                PrintWriter writer = response.getWriter();
                writer.write(str);
                writer.flush();
                writer.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else {
            chain.doFilter(request, response);
        }
    }


    public void init(FilterConfig arg0) throws ServletException {

        // TODO Auto-generated method stub

    }


}
