<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jemmy
  Date: 2019/9/29
  Time: 20:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%String path = request.getContextPath();%>

<html>
<head>
    <title>e跨境通</title>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/foundation/5.5.3/js/foundation.min.js"></script>
    <script src="https://cdn.staticfile.org/foundation/5.5.3/js/vendor/modernizr.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <style>
        .black_overlay{
            display: none;
            position: absolute;
            top: 0%;
            left: 0%;
            width: 100%;
            height: 700px;
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
    <script>
        function jump() {
            window.location.href="<%=path%>/huodai/jump3.do";
        }
        function openDialog(id){
            $("#id").val(id);
            document.getElementById('light').style.display='block';
            document.getElementById('fade').style.display='block'
        }
        function closeDialog(){
            document.getElementById('light').style.display='none';
            document.getElementById('fade').style.display='none'
        }
        function openDialog1(id,email,numbers){
            $("#id1").val(id);
            $("#id2").val(email);
            $("#id3").val(numbers);
            document.getElementById('light1').style.display='block';
            document.getElementById('fade1').style.display='block'
        }
        function closeDialog1(){
            document.getElementById('light1').style.display='none';
            document.getElementById('fade1').style.display='none'
        }
    </script>
</head>
<body>
<jsp:include page="../items/top.jsp" flush="true"/>
<jsp:include page="../items/left.jsp" flush="true"/>

<div class="main">
    <div class="menu-top">
        <h1 style="padding-left: 3%;">任务查看</h1>
    </div>
    <div class="middle" style="height: 650px;overflow: scroll">
        <span style="display: block">相关信息如下：</span>
        <span style="display: block">航次单号:${number} </span>
        <span style="display: block">剩余体积:${details.volume} CBM&nbsp;剩余重量:${details.weight} KG</span>
        <span style="display: block">截关时间:${details.cut_time}&nbsp;</span>
        <span style="display: block">开船时间:${details.cut_end}&nbsp;</span>
        <span style="display: block">抢购开始:${details.kill_start}&nbsp;抢购结束:${details.kill_end}</span>
        <span style="display: block;margin-top: 10px;">该航次的所有订单信息如下：</span>
        <table  class="table">
            <tr class="menu_tr" bgcolor="#CCFFFF">
                <td>订单编号</td>
                <td>目的地</td>
                <td>箱数</td>
                <td>重量</td>
                <td>体积</td>
                <td>送货时间</td>
                <td>品名</td>
                <td>状态</td>
                <td>备注</td>
                <td>UPS单号</td>
                <td>选项</td>
                <td>资料</td>
            </tr>
            <c:forEach items="${list}" var="o" >
                <tr >
                    <td>${o.numbers}</td>
                    <td>${o.dest}</td>
                    <td>${o.order_details.ctn}</td>
                    <td>${o.order_details.weight}</td>
                    <td>${o.order_details.volume}</td>
                    <td>${o.picking}</td>
                    <td>${o.order_details.category}</td>
                    <td>${o.statu}</td>
                    <td>${o.order_details.beizhu}</td>
                    <td>${o.order_details.ups}</td>
                    <td><a href = "JavaScript:void(0)" onclick = "openDialog(${o.id})">修改UPS</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href = "JavaScript:void(0)" onclick = "openDialog1(${o.id},'${o.subscriber_address.email}','${o.numbers}')">更新数据</a></td>
                    <td><a href="<%=path%>/huodai/data.do?id=${o.id}&&numbers=${o.numbers}&&address_id=${o.address_id}&&dest=${o.dest}">查看资料</a> </td>
                    </tr>
                </c:forEach>
            <%--弹窗--%>
            <div id="light" class="white_content" >
                <img src="<%=path%>/image/close.png" style="width: 20px;height: 20px;position: absolute;right: 10px;cursor: pointer" onclick = "closeDialog()">
                <form action="<%=path%>/huodai/updateups.do" style="text-align: center" method="POST">
                    <input type="hidden" name="id" id="id" >
                    <input type="text" name="ups" placeholder="请输入ups单号" style="width: 60%" >
                    <button style="display: block;margin-left:45%">提交</button>
                </form>
            </div>
            <div id="fade" class="black_overlay"></div>
            <%--弹窗--%>
            <div id="light1" class="white_content" >
                <img src="<%=path%>/image/close.png" style="width: 20px;height: 20px;position: absolute;right: 10px;cursor: pointer" onclick = "closeDialog1()">
                <form action="<%=path%>/huodai/daocang.do" style="text-align: center" method="POST"  enctype="multipart/form-data">
                    <input type="number" name="id" id="id1"  style="display: none;">
                    <input type="text" name="email" id="id2"  style="display: none;">
                    <input type="text" name="numbers" id="id3"  style="display: none;">
                    <input type="number" name="item_id"  value="${details.ship_id}"  style="display: none;">
                    <input type="number"  name="ctn" placeholder="请输入箱数" style="width: 60%" >
                    <input type="number" step="0.01" name="weight" placeholder="请输入重量" style="width: 60%" >
                    <input type="number" step="0.01" name="volume" placeholder="请输入体积" style="width: 60%" >
                    <input type="file" name="image" multiple="multiple" >
                    <p>最多支持上传4张图片,总数不超过5KB</p>
<%--                    <c:forEach items="${request.filePath}" var="o">--%>
<%--                        <img src="<%=path%>/o.jpg">--%>
<%--                    </c:forEach>--%>
                    <button style="display: block;margin-left:45%" onclick="return confirm('确认提交?')">提交</button>
                </form>
            </div>
            <div id="fade1" class="black_overlay"></div>
        </table>
            <span onclick="jump()" style="cursor: pointer;margin-left:40%;">更新状态</span>
    </div>
</div>
</body>
</html>
