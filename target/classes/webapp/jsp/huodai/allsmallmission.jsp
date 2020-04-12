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
<!DOCTYPE>
<html>
<head>
    <title>e跨境通</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/foundation/5.5.3/js/foundation.min.js"></script>
    <script src="https://cdn.staticfile.org/foundation/5.5.3/js/vendor/modernizr.js"></script>
    <script type="text/javascript">
        function validate(form)
        {
            var page = form.page.value;
            if(page>${pagebean.totalPage})
            {
                alert("你输入的页数大于最大页数，页面将跳转到首页！");

                window.document.location.href = "<%=path%>/huodai/allmission.do?page=1";
                return false;
            }

            return true;
        }
        $(document).ready(function () {
            var result="<%=request.getParameter("final")%>";
            if(result!="null"){
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
            <h1 style="padding-left: 3%;">任务查看</h1>
        </div>
        <div class="middle">
            <table class="table">
                <tr class="menu_tr" bgcolor="#CCFFFF">
                    <td>订单编号</td>
                    <td>方式</td>
                    <td>目的国</td>
                    <td>重量</td>
                    <td>体积</td>
                    <td>提货日期</td>
                    <td>状态</td>
                </tr>
                <c:forEach items="${pagebean.list}" var="o" >
                    <tr >
                        <td>${o.numbers}</td>
                        <td>${o.order_details.category}</td>
                        <td>${o.dest}</td>
                        <td>${o.order_details.weight}</td>
                        <td>${o.order_details.volume}</td>
                        <td>${o.picking}</td>
                        <td>${o.statu}</td>
                    </tr>
                </c:forEach>
                </table>
            </div>
        <div>
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
                    <a href="<%=path%>/huodai/chakanrenwu_xiaobao.do/?page=1">首页</a>
                    &nbsp;&nbsp;&nbsp;
                    <a href="<%=path%>/huodai/chakanrenwu_xiaobao.do?page=<c:out value="${pagebean.currentPage-1}" /> ">上一页</a>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${pagebean.currentPage==pagebean.totalPage}">
                    下一页&nbsp;&nbsp;&nbsp;尾页
                </c:when>
                <c:otherwise>
                    <a href="<%=path%>/huodai/chakanrenwu_xiaobao.do?page=<c:out value="${pagebean.currentPage+1}" />">下一页</a>
                    &nbsp;&nbsp;&nbsp;
                    <a href="<%=path%>/huodai/chakanrenwu_xiaobao.do?page=${pagebean.totalPage}">尾页</a>
                </c:otherwise>
            </c:choose>
            <p style="display: inline-block;">
            <form action="<%=path%>/huodai/chakanrenwu_xiaobao.do?" size="2" onclick="return validate(this)">
                跳转到&nbsp;<input type="text" name="page" style="width:40px;height: 20px;display: inline-block">&nbsp;页面
                <input type="submit" value="go" style="display: inline-block" onclick="return validate(this)">
            </form>
            </p>
        </div>
    </div>
</body>
</html>
