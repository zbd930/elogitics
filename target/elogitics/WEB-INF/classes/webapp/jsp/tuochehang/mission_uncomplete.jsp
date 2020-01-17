<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: jemmy
  Date: 2019/9/21
  Time: 14:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>

<html>
<head>
    <title>e跨境通</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
        <jsp:include page="../items/top.jsp" flush="true"/>
        <jsp:include page="../items/left.jsp" flush="true"/>
        <div class="main">
            <div class="menu-top">
                <h1 style="padding-left: 3%;">待完成</h1>
            </div>
            <div class="middle">
                <table class="table">
                    <tr class="menu_tr" bgcolor="#CCFFFF">
                        <td>订单编号</td>
                        <td>箱数</td>
                        <td>重量</td>
                        <td>体积</td>
                        <td>提货电话</td>
                        <td>提货地址</td>
                        <td>送货地址</td>
                        <td>送货时间</td>
                        <td>送货司机</td>
                        <td>送货车牌号</td>
                        <td>备注</td>

                    </tr>
                    <c:forEach items="${list}" var="o">
                        <tr >
                            <td>${o.numbers}</td>
                            <td>${o.order_details.ctn}</td>
                            <td>${o.order_details.weight}</td>
                            <td>${o.order_details.volume}</td>
                            <td>${o.subscriber_address.phone}</td>
                            <td>${o.subscriber_address.address}</td>
                            <td>${o.songhuo}</td>
                            <td>${o.picking}</td>
                            <td>${o.driver.name}</td>
                            <td>${o.car.car_number}</td>
                            <td>${o.order_details.beizhu}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>

        </div>
</body>
</html>
