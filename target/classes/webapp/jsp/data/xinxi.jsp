<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.duogesi.entities.User" %><%--
  Created by IntelliJ IDEA.
  User: jemmy
  Date: 2019/9/25
  Time: 20:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%String path=request.getContextPath();%>
<html>
<head>
    <title>e跨境通</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <style>
        .black_overlay{
            display: none;
            position: absolute;
            top: 0%;
            left: 0%;
            width: 100%;
            height: 100%;
            background-color: black;
            z-index:1001;
            -moz-opacity: 0.8;
            opacity:.80;
            filter: alpha(opacity=88);
        }
        .white_content {
            display: none;
            position: absolute;
            top: 25%;
            left: 25%;
            width: 45%;
            height: 55%;
            padding: 20px;
            background-color: white;
            z-index:1002;
            overflow: auto;
        }
    </style>
    <script type="text/javascript">

        $(function(){
        })
        function openDialog(){
            document.getElementById('light').style.display='block';
            document.getElementById('fade').style.display='block'
        }
        function closeDialog(){
            document.getElementById('light').style.display='none';
            document.getElementById('fade').style.display='none'
        }
    </script>
</head>
<body>
        <jsp:include page="/jsp/items/top.jsp" flush="true"/>
        <jsp:include page="/jsp/items/left.jsp" flush="true"/>
        <div class="main">
            <div class="menu-top">
                <h1 style="padding-left: 3%;">信息查看</h1>
            </div>
            <div class="middle" style="height: 600px;overflow: scroll">
            <c:forEach items="${company}" var="company" >
                <div>
                    <p>公司名：${company.company_name}</p>
                    <p>联系人电话：${company.contact_phone}</p><p>联系人：${company.contact_name}</p><p>邮箱：${company.contact_mail}</p><p>地址：${company.contact_address}</p>
                </div><hr>

            </c:forEach>

            </div>
<%--            <a href = "JavaScript:void(0)" onclick = "openDialog()">点击更改</a>--%>

<%--            &lt;%&ndash;弹窗&ndash;%&gt;--%>
<%--            <div id="light" class="white_content">--%>
<%--                <img src="<%=path%>/image/close.png" style="width: 20px;height: 20px;position: absolute;right: 10px;cursor: pointer" onclick = "closeDialog()">--%>
<%--                <form action="<%=path%>/xinxi/update.do" >--%>
<%--                    <input style="display: none" name="user_id" value="<% User user=(User)session.getAttribute("user");System.out.println(user.getId());%>">--%>
<%--                    <span style="display: block"><input  style="width: 150px" name="contact_name" placeholder="联系人 必填"></span>--%>
<%--                    <span style="display: block"><input  style="width: 150px" name="contact_phone" placeholder="联系人电话 必填"></span>--%>
<%--                    <span style="display: block"><input  style="width: 200px" name="contact_mail" placeholder="联系人邮箱 必填"></span>--%>
<%--                    <span style="display: block"><input  style="width: 300px" name="contact_address" placeholder="联系地址 必填"></span>--%>
<%--                    <input type="submit" width="50px">--%>
<%--                </form>--%>

<%--                <a href = "javascript:void(0)" onclick = "closeDialog()">点这里关闭本窗口</a>--%>
<%--            </div>--%>
<%--            <div id="fade" class="black_overlay"></div>--%>
        </div>
</body>
</html>
