<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%String path = request.getContextPath();%>
<%--
  Created by IntelliJ IDEA.
  User: jemmy
  Date: 2019/10/16
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-04-07
  Time: 上午 11:00
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
    <script type="text/javascript">
        $(document).ready(function () {
            var result="${results}";
            if(result!=""){
                alert(result)
            }
        })
        function dakai(id){
            $("#id").val(id);
            document.getElementById('light').style.display='block';
            document.getElementById('fade').style.display='block'
        };
        function guanbi(){
            document.getElementById('light').style.display='none';
            document.getElementById('fade').style.display='none'
        };
        function modify(id){
            $("#id1").val(id);
            document.getElementById('light1').style.display='block';
            document.getElementById('fade1').style.display='block'
        };
        function close(){
            document.getElementById('light1').style.display='none';
            document.getElementById('fade1').style.display='none'
        };

    </script>
</head>
<body>
    <jsp:include page="../items/top.jsp" flush="true"/>
    <jsp:include page="../items/left.jsp" flush="true"/>
    <div class="main">
        <div class="menu-top">
            <h1 style="padding-left: 3%;">详细信息</h1>
        </div>
        <div class="middle">
            <text><a onclick="dakai(${id})">添加价格</a></text>
            <table>
                <tr>
                    <td>重量</td>
                    <td>价格</td>
                    <td>删除</td>
                </tr>
                <c:forEach items="${xiaobao}" var="o" >
                    <tr >
                        <td>${o.weight}</td>
                        <td>${o.amount}</td>
                        <td><a onclick="return confirm('确认删除？')" href="../huodai/delete_xiaobao_price.do?id=${o.price_id}&&xiaobao_id=${o.xiaobao_id}">删除</a></td>
                    </tr>
                </c:forEach>
            </table>
            <text>本渠道有效期:${timetable}天  <p onclick="modify(${id})" style="cursor: pointer">点击修改</p></text>
            <div id="light1" class="white_content" >
                <img src="<%=path%>/image/close.png" style="width: 20px;height: 20px;position: absolute;right: 10px;cursor: pointer"  onclick = "close()">
                <form action="<%=path%>/huodai/timetable.do" style="margin-top:5rem" method="POST">
                    <input type="text" name="timetable" placeholder="有效期">
                    <input type="text" name="misson_id" style="display: none" id="id1">
                    <button style="display: block;margin-left:45%" onclick="return confirm('确认提交?')">提交</button>
                </form>
            </div>
            <div id="fade1" class="black_overlay"></div>
            <div id="light" class="white_content" >
                <img src="<%=path%>/image/close.png" style="width: 20px;height: 20px;position: absolute;right: 10px;cursor: pointer"  onclick = "guanbi()">
                <form action="<%=path%>/huodai/add_price_xiaobao.do" style="margin-top:5rem" method="POST">
                    <input type="text" name="id" style="display: none" id="id">
                    <input type="text" name="weight" placeholder="重量（KG）">
                    <input type="text" name="amount" placeholder="价格（RMB）">
                    <button style="display: block;margin-left:45%" onclick="return confirm('确认提交?')">提交</button>
                </form>
            </div>
            <div id="fade" class="black_overlay"></div>
        </div>
    </div>
</body>
</html>
