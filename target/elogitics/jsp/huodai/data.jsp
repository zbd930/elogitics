<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%String path = request.getContextPath();%>
<%--
  Created by IntelliJ IDEA.
  User: jemmy
  Date: 2019/9/26
  Time: 23:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: jemmy
  Date: 2019/11/8
  Time: 22:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>e跨境通</title>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/foundation/5.5.3/js/foundation.min.js"></script>
    <script src="https://cdn.staticfile.org/foundation/5.5.3/js/vendor/modernizr.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <style>
        span{
            width:100%;
        }
        img{
            width:100px;
            height:100px;
        }
    </style>
    <script>
        $(document).ready(function () {
            var result="${so}";
            if(result!=""){
                alert(result)
            }
        })
    </script>
</head>
<body>
<jsp:include page="../items/top.jsp" flush="true"/>
        <jsp:include page="../items/left.jsp" flush="true"/>
        <div class="main">
                <div class="menu-top">
                    <h1 style="padding-left: 3%;">资料</h1>
                </div>
                <div class="middle">
                        <div style="display: inline-block;width: 100%;margin-left: 50px;">
                            <span>发票: </span>
                            <span><img src="https://www.yikuajing.cn/elogistic/fapiao/<%=request.getParameter("numbers")%>.jpg" alt=""><a href="<%=path%>/huodai/downloadfapiao/<%=request.getParameter("numbers")%>.jpg.do">下载发票</a></span>
                            <span style="margin-left: 20px;">报关单: </span>
                            <span><img src="https://www.yikuajing.cn/elogistic/baoguan/<%=request.getParameter("numbers")%>.jpg" alt=""><a href="<%=path%>/huodai/downloadbaoguan/<%=request.getParameter("numbers")%>.jpg.do">下载报关单</a></span>
                           <span style="margin-left: 20px;">箱单:</span>
                           <span><img src="https://www.yikuajing.cn/elogistic/xiangdan/<%=request.getParameter("numbers")%>.jpg" alt=""> <a href="<%=path%>/huodai/downloadxiangdan/<%=request.getParameter("numbers")%>.jpg.do">下载箱单</a></span>
                            <span style="margin-left: 20px;">合同: </span>
                            <span><img src="https://www.yikuajing.cn/elogistic/hetong/<%=request.getParameter("numbers")%>.jpg" alt=""> <a href="<%=path%>/huodai/downloadhetong/<%=request.getParameter("numbers")%>.jpg.do">下载合同</a></span>
                        </div>
                </div>
                <div style="margin-left: 10%;margin-right: 10%;margin-top:30px">
                    <form  action="<%=path%>/up/upload.do" method="post" enctype="multipart/form-data">
                        <div style="width: 100%;display: block">
                            <input type="number" name="tax"  step = "0.1"  placeholder="关税"  style="width: 100px;margin-left: 10px;display:inline">
                            <input type="number" name="customer"  step = "0.1"  placeholder="报关费" style="width: 100px;margin-bottom: 10px;display: inline">
                            <input type="number" name="inspect"  step = "0.1" placeholder="杂费" style="width: 100px;margin-bottom: 10px;display: inline">
                            <input type="text" name="id" value="<%=request.getParameter("id")%>" style="display: none">
                            <input type="text" name="numbers" value="<%=request.getParameter("numbers")%>" style="display: none">
                            <input type="text" name="address_id" value="<%=request.getParameter("address_id")%>" style="display: none">
                        </div>
                        <textarea cols="1" rows="3"  style="resize:none" placeholder="请输入杂费相对应的项目" name="context" style="width: 100px"> </textarea>
                        税单上传：<input type="file" name="image" ><br/>
                        <input type="submit"  style="display: inline-block">
                    </form>
                    <p style="display: block">1.只能上传图片（pdf格式除外），大小为5MB以内</p>
                    <p style="display: block">2.点击上传后，将发送到用户邮箱并无法修改。请谨慎选择</p>
                </div>
            </div>
        </div>
</body>
</html>
