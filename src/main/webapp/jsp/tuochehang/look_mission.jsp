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
<%String value=request.getParameter("result1");%>

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
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            var result="<%=value%>";
            if(result!="null"){
                alert(result)
            }
        })
        function openDialog(id,address_id,numbers){
            $("#id").val(id);
            $("#address_id").val(address_id);
            $("#numbers").val(numbers);
            document.getElementById('light').style.display='block';
            document.getElementById('fade').style.display='block'
        }
        function closeDialog(){
            document.getElementById('light').style.display='none';
            document.getElementById('fade').style.display='none'
        }
        function validate(form)
        {
            var page = form.page.value;
            if(page>${pagebean.totalPage})
            {
                alert("你输入的页数大于最大页数，页面将跳转到首页！");

                window.document.location.href = "<%=path%>/chehang/chakanrenwu.do?page=1";
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
            <h1 style="padding-left: 3%;">任务查看</h1>
        </div>
        <div class="middle">
            <p style="text-align: center">全部已发布的任务如下：</p>
            <table class="table">
                <tr class="menu_tr" bgcolor="#CCFFFF">
                    <td>车行订单编号</td>
                    <td>箱数</td>
                    <td>重量</td>
                    <td>体积</td>
                    <td>提货地址</td>
                    <td>送货地址</td>
                    <td>送货时间</td>
                    <td>备注</td>
                    <td>接单</td>
                </tr>
                <c:forEach items="${pagebean.list}" var="o" >
                    <tr >
                        <td>${o.numbers}</td>
                        <td>${o.order_details.ctn}</td>
                        <td>${o.order_details.weight}</td>
                        <td>${o.order_details.volume}</td>
                        <td>${o.subscriber_address.address}</td>
                        <td>${o.songhuo}</td>
                        <td>${o.picking}</td>
                        <td>${o.order_details.beizhu}</td>
                        <td><a href = "JavaScript:void(0)" onclick = "openDialog(${o.id},${o.address_id},'${o.numbers}')">点击接单</a></td>
                    </tr>
                </c:forEach>
                <%--弹窗--%>
                <div id="light" class="white_content">
                    <img src="<%=path%>/image/close.png" style="width: 20px;height: 20px;position: absolute;right: 10px;cursor: pointer" onclick = "closeDialog()">
                    <form action="<%=path%>/chehang/update.do" style="text-align: center" method="POST">
                        <input type="hidden" name="id" id="id" >
                        <input type="hidden" name="address_id" id="address_id" >
                        <input type="hidden" name="numbers" id="numbers" >
                        <span style="display: block">请选择司机信息</span>
                            <select id="TYPE_ID" name="driver_id" style="width: 20%">
                        <option>请选择</option>
                              <c:forEach items="${select}" var="s">
                        <option value="${s.id}" >${s.name}</option>
                    </c:forEach>
                           </select>
                        <span style="display: block">请选择车辆信息</span>
                            <select id="TYPE_ID1" name="car_id" style="width: 20%">
                        <option>请选择</option>
                              <c:forEach items="${select1}" var="s">
                        <option value="${s.id}" >${s.car_number}</option>
                    </c:forEach>
                           </select>
                        <button style="display: block;margin-left:45%">提交</button>
                    </form>
                </div>
                <div id="fade" class="black_overlay"></div>
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
                    <a href="<%=path%>/chehang/chakanrenwu.do?page=1">首页</a>
                    &nbsp;&nbsp;&nbsp;
                    <a href="<%=path%>/chehang/chakanrenwu.do?page=<c:out value="${pagebean.currentPage-1}" /> ">上一页</a>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${pagebean.currentPage==pagebean.totalPage}">
                    下一页&nbsp;&nbsp;&nbsp;尾页
                </c:when>
                <c:otherwise>
                    <a href="<%=path%>/chehang/chakanrenwu.do?page=<c:out value="${pagebean.currentPage+1}" />">下一页</a>
                    &nbsp;&nbsp;&nbsp;
                    <a href="<%=path%>/chehang/chakanrenwu.do?page=${pagebean.totalPage}">尾页</a>
                </c:otherwise>
            </c:choose>
            <p style="display: inline-block;">
            <form action="<%=path%>/chehang/chakanrenwu.do?" size="2" onsubmit="return validate(this)">
                跳转到&nbsp;<input type="text" name="page" style="width:40px;height: 20px;display: inline-block">&nbsp;页面
                <input type="submit" value="go" style="display: inline-block">
            </form>
            </p>
        </div>
    </div>
</body>
</html>
