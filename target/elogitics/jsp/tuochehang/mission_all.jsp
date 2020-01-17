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
    <script>
        function validate(form)
        {
            var page = form.page.value;
            if(page>${pagebean.totalPage})
            {
                alert("你输入的页数大于最大页数，页面将跳转到首页！");

                window.document.location.href = "<%=path%>/chehang/get_all_mission.do?page=1";
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
<jsp:include page="../items/top.jsp" flush="true"/>
<jsp:include page="../items/left.jsp" flush="true"/>
<div class="main">
    <div class="menu-top">
        <h1 style="padding-left: 3%;">全部</h1>
    </div>
    <div class="middle">
        <span style="text-align: center">我的所有订单如下：</span>
        <form action="<%=path%>/chehang/search.do" style="margin-left: 20%">
            <input placeholder="请输入单号" name="numbers" style="width: 100px;display: inline">
            <button style="display: inline">查询</button>
        </form>
        <table class="table">
            <tr class="menu_tr" bgcolor="#CCFFFF">
                <td>订单编号</td>
                <td>箱数</td>
                <td>重量</td>
                <td>体积</td>
                <td>送货地址</td>
                <td>送货时间</td>
                <td>送货司机</td>
                <td>送货车辆</td>
                <td>状态</td>
            </tr>
            <c:forEach items="${pagebean.list}" var="o" >
                <tr >
                    <td>${o.numbers}</td>
                    <td>${o.order_details.ctn}</td>
                    <td>${o.order_details.weight}</td>
                    <td>${o.order_details.volume}</td>
                    <td>${o.songhuo}</td>
                    <td>${o.picking}</td>
                    <td>${o.driver.name}</td>
                    <td>${o.car.car_number}</td>
                    <td>${o.statu}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div style="position: relative;margin-left: 65% " >

        <font size="2">共<font color="red"><c:out value="${pagebean.allRows}"></c:out></font>条记录</font><br><br>
        <font size="2">共<font color="red"><c:out value="${pagebean.totalPage}"></c:out></font>页 </font>
        <font size="2">当前<font color="red"><c:out value="${pagebean.currentPage}"></c:out></font>页 </font>&nbsp;&nbsp;
        <c:choose>
            <c:when test="${pagebean.currentPage==1} ">
                首页&nbsp;&nbsp;&nbsp;上一页
            </c:when>
            <c:otherwise>
                <a href="<%=path%>/chehang/get_all_mission.do?page=1">首页</a>
                &nbsp;&nbsp;&nbsp;
                <a href="<%=path%>/chehang/get_all_mission.do?page=<c:out value="${pagebean.currentPage-1}" /> ">上一页</a>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${pagebean.currentPage==pagebean.totalPage}">
                下一页&nbsp;&nbsp;&nbsp;尾页
            </c:when>
            <c:otherwise>
                <a href="<%=path%>/chehang/get_all_mission.do?page=<c:out value="${pagebean.currentPage+1}" />">下一页</a>
                &nbsp;&nbsp;&nbsp;
                <a href="<%=path%>/chehang/get_all_mission.do?page=${pagebean.totalPage}">尾页</a>
            </c:otherwise>
        </c:choose>
        <p style="display: inline-block;">
        <form action="<%=path%>/chehang/get_all_mission.do?" size="2" onsubmit="return validate(this)">
            跳转到&nbsp;<input type="text" name="page" style="width:40px;height: 20px;display: inline-block">&nbsp;页面
            <input type="submit" value="go" style="display: inline-block">
        </form>
        </p>
    </div>
</div>
</body>
</html>
