<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%String path = request.getContextPath();%>

<%--
  Created by IntelliJ IDEA.
  User: jemmy
  Date: 2019/10/16
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>e跨境通</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/foundation/5.5.3/js/foundation.min.js"></script>
    <script src="https://cdn.staticfile.org/foundation/5.5.3/js/vendor/modernizr.js"></script>
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
        #table{
            width: 100%;
        }

    </style>
    <script type="text/javascript">
        function openDialog1(){
            document.getElementById('light').style.display='block';
            document.getElementById('fade').style.display='block'
        }
        function closeDialog1(){
            document.getElementById('light').style.display='none';
            document.getElementById('fade').style.display='none'
        }
        $(document).ready(function () {
            var result="<%=request.getParameter("insert")%>";
            if(result!="null"){
                alert(result)
            }
        })
        function swich1(){
            $("#middle1").show(100);
            $("#middle2").hide(100);
            $("#middle3").hide(100);
            $("#middle4").hide(100);
        }
        function swich2(){
            $("#middle1").hide(100);
            $("#middle2").show(100);
            $("#middle3").hide(100);
            $("#middle4").hide(100);
        }
        function swich3(){
            $("#middle1").hide(100);
            $("#middle2").hide(100);
            $("#middle3").show(100);
            $("#middle4").hide(100);
        }
        function swich4(){
            $("#middle1").hide(100);
            $("#middle2").hide(100);
            $("#middle3").hide(100);
            $("#middle4").show(100);
        }
    </script>
</head>
<body>
        <jsp:include page="../items/top.jsp" flush="true"/>
        <jsp:include page="../items/left.jsp" flush="true"/>

        <div class="main">
            <div class="menu-top">
                <h1 style="padding-left: 3%;">价格查看</h1>
            </div>
            <ul id="layoutTarget" class="layout">
                <li style="display: inline;cursor: pointer" onclick="swich1()"><strong>1. </strong>美线</li>
                <%--<li style="display: inline;cursor: pointer" onclick="swich2()"><strong>2. </strong>加拿大线</li>--%>
                <%--<li style="display: inline;cursor: pointer" onclick="swich3()"><strong>3. </strong>欧线</li>--%>
                <%--<li style="display: inline;cursor: pointer" onclick="swich4()"><strong>4. </strong>日本线</li>--%>
            </ul>
            <div class="middle" id="middle1" style="height: 600px;overflow: scroll">
<%--                美国--%>
                    <table class="table">海卡&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<p onclick="openDialog1()"style="cursor: pointer;display: inline">添加价格</p>
                        <tr class="menu_tr" bgcolor="#CCFFFF">
                            <td>启运港</td>
                            <td>目的港</td>
                            <td>国家</td>
                            <td>价格</td>
                            <td>有效期起始</td>
                            <td>有效期终止</td>
                            <td>选项</td>
                        </tr>
                            <c:forEach items="${haika}" var="d">
                            <tr >
                                <td>${d.qiyungang}</td>
                                <td>${d.mudigang}</td>
                                <td>${d.country}</td>
                                <td>${d.price}</td>
                                <td>${d.valid_date_start}</td>
                                <td>${d.valid_date_end}</td>
                                <td><a onclick="return confirm('确认删除?')" href="<%=path%>/huodai/delete_price_haika.do?id=${d.id}">点击删除</a>&nbsp;</td>
                             </tr>
                        </c:forEach>

                    </table>
            </div>
            <%--<div class="middle" id="middle2" style="height: 600px;overflow: scroll">--%>
                <%--&lt;%&ndash;                加拿大&ndash;%&gt;--%>
                <%--<table class="table">海卡&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<p onclick="openDialog1()"style="cursor: pointer;display: inline">添加价格</p>--%>
                    <%--<tr class="menu_tr" bgcolor="#CCFFFF">--%>
                        <%--<td>启运港</td>--%>
                        <%--<td>目的港</td>--%>
                        <%--<td>国家</td>--%>
                        <%--<td>价格</td>--%>
                        <%--<td>有效期起始</td>--%>
                        <%--<td>有效期终止</td>--%>
                        <%--<td>选项</td>--%>
                    <%--</tr>--%>
                    <%--<c:forEach items="${canada_haika}" var="d">--%>
                        <%--<tr >--%>
                            <%--<td>${d.qiyungang}</td>--%>
                            <%--<td>${d.mudigang}</td>--%>
                            <%--<td>${d.country}</td>--%>
                            <%--<td>${d.price}</td>--%>
                            <%--<td>${d.valid_date_start}</td>--%>
                            <%--<td>${d.valid_date_end}</td>--%>
                            <%--<td><a onclick="return confirm('确认删除?')" href="<%=path%>/huodai/delete_price_haika.do?id=${d.id}">点击删除</a>&nbsp;</td>--%>
                        <%--</tr>--%>
                    <%--</c:forEach>--%>

                <%--</table>--%>
            <%--</div>--%>
            <%--<div class="middle" id="middle3" style="height: 600px;overflow: scroll">--%>
                <%--&lt;%&ndash;                欧线&ndash;%&gt;--%>
                <%--<table class="table">海卡&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<p onclick="openDialog1()"style="cursor: pointer;display: inline">添加价格</p>--%>
                    <%--<tr class="menu_tr" bgcolor="#CCFFFF">--%>
                        <%--<td>启运港</td>--%>
                        <%--<td>目的港</td>--%>
                        <%--<td>国家</td>--%>
                        <%--<td>价格</td>--%>
                        <%--<td>有效期起始</td>--%>
                        <%--<td>有效期终止</td>--%>
                        <%--<td>选项</td>--%>
                    <%--</tr>--%>
                    <%--<c:forEach items="${europe_haika}" var="d">--%>
                        <%--<tr >--%>
                            <%--<td>${d.qiyungang}</td>--%>
                            <%--<td>${d.mudigang}</td>--%>
                            <%--<td>${d.country}</td>--%>
                            <%--<td>${d.price}</td>--%>
                            <%--<td>${d.valid_date_start}</td>--%>
                            <%--<td>${d.valid_date_end}</td>--%>
                            <%--<td><a onclick="return confirm('确认删除?')" href="<%=path%>/huodai/delete_price_haika.do?id=${d.id}">点击删除</a>&nbsp;</td>--%>
                        <%--</tr>--%>
                    <%--</c:forEach>--%>
                <%--</table>--%>
            <%--</div>--%>
            <%--<div class="middle" id="middle4" style="height: 600px;overflow: scroll">--%>
                <%--&lt;%&ndash;                日本&ndash;%&gt;--%>
                <%--<table class="table">海卡&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<p onclick="openDialog1()"style="cursor: pointer;display: inline">添加价格</p>--%>
                    <%--<tr class="menu_tr" bgcolor="#CCFFFF">--%>
                        <%--<td>启运港</td>--%>
                        <%--<td>目的港</td>--%>
                        <%--<td>国家</td>--%>
                        <%--<td>价格</td>--%>
                        <%--<td>有效期起始</td>--%>
                        <%--<td>有效期终止</td>--%>
                        <%--<td>选项</td>--%>
                    <%--</tr>--%>
                    <%--<c:forEach items="${japan_haika}" var="d">--%>
                        <%--<tr >--%>
                            <%--<td>${d.qiyungang}</td>--%>
                            <%--<td>${d.mudigang}</td>--%>
                            <%--<td>${d.country}</td>--%>
                            <%--<td>${d.price}</td>--%>
                            <%--<td>${d.valid_date_start}</td>--%>
                            <%--<td>${d.valid_date_end}</td>--%>
                            <%--<td><a onclick="return confirm('确认删除?')" href="<%=path%>/huodai/delete_price_haika.do?id=${d.id}">点击删除</a>&nbsp;</td>--%>
                        <%--</tr>--%>
                    <%--</c:forEach>--%>

                <%--</table>--%>
            <%--</div>--%>
            <%--弹窗--%>
            <div id="light" class="white_content" >
                <img src="<%=path%>/image/close.png" style="width: 20px;height: 20px;position: absolute;right: 10px;top:0px;cursor: pointer" onclick = "closeDialog1()">
                <form action="<%=path%>/huodai/add_price_haika.do" style="text-align: center" method="POST"  enctype="multipart/form-data">
                    <select name="qiyungang">
                        <option value="深圳">深圳</option>
                        <option value="广州">广州</option>
                        <option value="宁波">宁波</option>
                        <option value="义乌">义乌</option>
                        <option value="上海">上海</option>
                    </select>
                    <input type="text" name="mudigang" placeholder="目的仓库">
                    <input type="number" name="price" placeholder="价格">
                    <input type="date" name="valid_date_start" placeholder="有效期起(含)">
                    <input type="date" name="valid_date_end" placeholder="有效期起终">
                    <select name="country">
                        <option value="American">美国</option>
                        <%--<option value="Europe">欧洲</option>--%>
                        <%--<option value="Canada">加拿大</option>--%>
                        <%--<option value="Japan">日本</option>--%>
                    </select>
                    <button style="display: block;margin-left:45%" onclick="return confirm('确认提交?')" >提交</button>
                </form>
            </div>
            <div id="fade" class="black_overlay"></div>
        </div>
</body>
</html>
