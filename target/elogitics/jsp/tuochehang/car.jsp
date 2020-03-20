<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<%--
  Created by IntelliJ IDEA.
  User: jemmy
  Date: 2019/9/21
  Time: 14:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<html>
<head>
    <title>e跨境通</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script type="text/javascript">
        function validate(form)
        {
            var page = form.page.value;
            if(page>${pagebean.totalPage})
            {
                alert("你输入的页数大于最大页数，页面将跳转到首页！");
                window.document.location.href = "<%=path%>/chehang/car.do?page=1";
                return false;
            }

            return true;
        }
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
<jsp:include page="../items/top.jsp" flush="true"/>
<jsp:include page="../items/left.jsp" flush="true"/>
<div class="main">
    <div class="menu-top">
        <h1 style="padding-left: 3%;">车辆</h1>
    </div>
    <p><a href = "JavaScript:void(0)" onclick = "openDialog()">点击添加车辆信息</a></p>
    <div id="light" class="white_content">

        <img src="<%=path%>/image/close.png" style="width: 20px;height: 20px;position: absolute;right: 10px;top: 0px;cursor: pointer" onclick = "closeDialog()">

        <form action="<%=path%>/chehang/insert_car.do" style="text-align: center;margin-top: 10px method="post">
            <span>请添加车辆信息</span>
            <input name="car_number" style="width: 30%;margin-left: 35%" placeholder="请输入车牌号" type="text">
            <button>提交</button>
        </form>

        <%--<a href = "javascript:void(0)" onclick = "closeDialog()">点这里关闭本窗口</a>--%>

    </div>
    <div id="fade" class="black_overlay"></div>
    <div class="middle">
        <table class="table">
            <tr class="menu_tr" bgcolor="#CCFFFF">
                <td>车牌号</td>
                <td>备注</td>
            </tr>
            <c:forEach items="${pagebean.list}" var="o" >
                <tr >
                    <td>${o.car_number}</td>
                    <td><a onclick="return confirm('确认删除?')" href = "<%=path%>/chehang/delete_car.do?id=${o.id}">删除</a></td>
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
                <a href="<%=path%>/chehang/car.do?page=1">首页</a>
                &nbsp;&nbsp;&nbsp;
                <a href="<%=path%>/chehang/car.do?page=<c:out value="${pagebean.currentPage-1}" /> ">上一页</a>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${pagebean.currentPage==pagebean.totalPage}">
                下一页&nbsp;&nbsp;&nbsp;尾页
            </c:when>
            <c:otherwise>
                <a href="<%=path%>/chehang/car.do?page=<c:out value="${pagebean.currentPage+1}" />">下一页</a>
                &nbsp;&nbsp;&nbsp;
                <a href="<%=path%>/chehang/car.do?page=${pagebean.totalPage}">尾页</a>
            </c:otherwise>
        </c:choose>
        <p style="display: inline-block;">
        <form action="<%=path%>/chehang/car.do?" size="2" onsubmit="return validate(this)">
            跳转到&nbsp;<input type="text" name="page" style="width:40px;height: 20px;display: inline-block">&nbsp;页面
            <input type="submit" value="go" style="display: inline-block">
        </form>
        </p>
    </div>
</div>
</body>
</html>
