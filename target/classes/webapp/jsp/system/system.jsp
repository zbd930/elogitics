<%@ page import="com.duogesi.entities.User" %><%--
  Created by IntelliJ IDEA.
  User: jemmy
  Date: 2019/9/28
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%String path = request.getContextPath();%>

<%
    User user=(User)session.getAttribute("user");
    String type="";
    if(user.getType()==1){
        type="车行";
    }else {
        type="货代公司";
    }
    String name=user.getUsername();
    String password=user.getPassword();
%>

<html>
<head>
    <title>e跨境通</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script>
        function change() {
            var status=document.getElementById('change').style.display;
            if(status=='block'){
                document.getElementById('change').style.display='none'
            }else if(status=='none'){
                document.getElementById('change').style.display='block'
            }
            // document.getElementById('light').style.display='block';
            // document.getElementById('fade').style.display='block'
        }
        function tijiao() {
            var list=[];
            list.push($('#new').val());
            list.push($('#old').val());
            reg=/^(?![0-9]+$)(?![a-z]+$)(?![A-Z]+$)(?!([^(0-9a-zA-Z)])+$)^.{8,16}$/;
            if (reg.test($('#new').val())){
                if ($('#new').val()==$('#yanzheng').val()&&$('#old').val()!="") {
                    $.ajax({
                        //请求方式
                        type : "POST",
                        //请求的媒体类型
                        contentType: "application/json;charset=UTF-8",
                        // dataType:"json",
                        //请求地址
                        url : "<%=path%>/system/change.do",
                        //数据，json字符串
                        data : JSON.stringify(list),
                        //请求成功
                        success : function(result) {
                            // window.globalLoading.hide();
                            alert(result.code)
                            window.location.href="<%=path%>/system/system.do" //要修改的
                            // console.log(result);
                        },
                        //请求失败，包含具体的错误信息
                        error : function(e){
                            console.log(e)
                            // alert(e.responseText)
                            // console.log(e.status);
                            // console.log(e.responseText);
                        },
                    })

                }else {
                    alert("两次输入不一致，请重新输入")
                }
            }
            else {
                alert("格式错误")
            }





        }
    </script>
</head>
<body>
        <jsp:include page="../items/top.jsp" flush="true"/>
        <jsp:include page="../items/left.jsp" flush="true"/>
        <div class="main">
            <div class="menu-top">
                <h1 style="padding-left: 3%;">系统设置</h1>
            </div>
            <div class="middle">
                <div style="text-align: center">
                    <span style="display: block">用户类别*：<%=type%></span>
                    <span style="display: block">用户名*： <%=name%></span>
                    <span style="display: block" style="display: block">密码*：****** &nbsp;&nbsp;&nbsp;&nbsp;<p onclick="change()" style="cursor: pointer">点击修改</p></span>
                    <div id="change" style="text-align: center;display: none">
                        <span style="width: 100%;height: 30px"><input type="password" placeholder="原密码" id="old" style="width: 150px;margin-left:35%"><p style="font-size: 10px;position: relative;text-align: center">密码必须为数字 字母 特殊符号中最少两种,长度为8-16</p></span>
                        <span style="width: 100%;height: 30px"><input type="password" placeholder="新密码" id="new" style="width: 150px;margin-left:35%"></span>
                        <span style="width: 100%;height: 30px"><input type="password" placeholder="验证密码" id="yanzheng" style=";width: 150px;margin-left:35%"></span>
                        <input type="submit" onclick="tijiao()">
                    </div>
                </div>


            </div>
        </div>
</body>
</html>
