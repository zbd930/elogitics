<%--
  Created by IntelliJ IDEA.
  User: jemmy
  Date: 2019/11/14
  Time: 19:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%String path = request.getContextPath();%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>e跨境通</title>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/foundation/5.5.3/js/foundation.min.js"></script>
    <script src="https://cdn.staticfile.org/foundation/5.5.3/js/vendor/modernizr.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
    </script>
</head>
<body>
        <jsp:include page="../items/top.jsp" flush="true"/>
        <jsp:include page="../items/left.jsp" flush="true"/>
        <div class="main">
            <div class="menu-top">
                <h1 style="padding-left: 3%;">月账单</h1>
            </div>
            <div class="middle" style="height: 550px;overflow: scroll">
                <span style="display: block">本月总金额为：${amount.total}</span>
                <span>
                <form action="<%=path%>/huodai/zhuangdan.do" style="display: inline-block;" >
                    <input type="date" name="start" style="width: 150px;display: inline-block;">
                    <input type="date"  name="end" style="width: 150px;display: inline-block;">
                    <input  name="number" style="width: 150px;display: inline-block;" placeholder="请输入单号">
                    <button>提交</button>
                </form>

                </span>
                <table  class="table">
                    <tr class="menu_tr" bgcolor="#CCFFFF">
                        <td>订单编号</td>
                        <td>船次编号</td>
                        <td>目的地</td>
                        <td>方式</td>
                        <td>总费用</td>
                        <td>基础运费</td>
                        <td>关税</td>
                        <td>报关费</td>
                        <td>查验费</td>
                    </tr>
                    <c:forEach items="${order}" var="o" >
                    <tr >
                        <td>${o.order.numbers}</td>
                        <td>${o.ship.id}</td>
                        <td>${o.order.dest}</td>
                        <td>${o.ship.method}</td>
                        <td>${o.all}</td>
                        <td>${o.total}</td>
                        <td>${o.tax}</td>
                        <td>${o.customer}</td>
                        <td>${o.inspect}</td>
                    </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
</body>
</html>
