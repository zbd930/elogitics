<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%String path = request.getContextPath();%>
<%--
  Created by IntelliJ IDEA.
  User: jemmy
  Date: 2019/9/28
  Time: 17:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>e跨境通</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            var result="${error2}";
            if(result!=""){
                alert(result)
            }
            var result1="${update}";
            if(result1!=""){
                alert(result1)
            }
        })
    </script>
</head>
<body>
<jsp:include page="../items/top.jsp" flush="true"/>
<jsp:include page="../items/left.jsp" flush="true"/>
<div class="main">
    <div class="menu-top">
        <h1 style="padding-left: 3%;">到货计划</h1>
    </div>
    <div class="middle">
<%--        <div>--%>
<%--            <span>请根据时间查询:</span>--%>
<%--            <form action="<%=path%>/huodai/xiaodan.do" method="post">--%>
<%--                <input name="id" style="width: 150px;display: none" value="0" >--%>
<%--                <input name="number" style="width: 150px" placeholder="航次订单号">--%>
<%--                <input name="date" style="width: 150px" type="date" placeholder="提货日期">--%>
<%--                <input type="submit">--%>
<%--            </form>--%>
<%--        </div>--%>

        <div>
            <span>请根据订单ID查询:</span>
            <form action="<%=path%>/huodai/xiaodan.do" method="post">
                <input name="numbers" style="width: 150px" placeholder="车行订单号">
                <input type="submit">
            </form>
        </div>
        <div>
                <table class="table">
                <tr class="menu_tr" bgcolor="#CCFFFF">
                    <td>订单编号</td>
                    <td>箱数</td>
                    <td>重量</td>
                    <td>体积</td>
                    <td>状态</td>
                    <td>备注</td>
                    <td>提货时间</td>
                    <td>选项</td>
                </tr>
                    <c:forEach items="${order}" var="o">
                        <tr>
                            <td>${o.numbers}</td>
                            <td>${o.order_details.ctn}</td>
                            <td>${o.order_details.weight}</td>
                            <td>${o.order_details.volume}</td>
                            <td>${o.statu}</td>
                            <td>${o.order_details.beizhu}</td>
                            <td>${o.picking}</td>
                            <td><a onclick="return confirm('确认到货?')"  href="<%=path%>/huodai/change_status.do?id=${o.id}&&address_id=${o.address_id}&&numbers=${o.numbers}&&status=${o.status}" methods="get">确认到接货</a></td>
                        </tr>
                    </c:forEach>
            </table>
            <text>1.点击确认到货前，请确认箱单和发票已经上传成功，否则将无法更改</text>
        </div>
    </div>
</body>
</html>
