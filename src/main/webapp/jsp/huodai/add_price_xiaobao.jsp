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
<html>
<head>
    <title>e跨境通</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/foundation/5.5.3/js/foundation.min.js"></script>
    <script src="https://cdn.staticfile.org/foundation/5.5.3/js/vendor/modernizr.js"></script>
    <script type="text/javascript">
        function dakai(){
            document.getElementById('light').style.display='block';
            document.getElementById('fade').style.display='block'
        };
        function guanbi(){
            document.getElementById('light').style.display='none';
            document.getElementById('fade').style.display='none'
        };
        $(document).ready(function () {
            var result="${add}";
            if(result!=""){
                alert(result)
            }
        })
        <%--function validate1(form)--%>
        <%--{--%>
        <%--    var page = form.page.value;--%>
        <%--    if(page>${pagebean.totalPage})--%>
        <%--    {--%>
        <%--        alert("你输入的页数大于最大页数，页面将跳转到首页！");--%>

        <%--        window.document.location.href = "<%=path%>/chehang/get_xiaobao.do?page=1";--%>
        <%--        return false;--%>
        <%--    }--%>

        <%--    return true;--%>
        <%--}--%>
    </script>
</head>
<body>
    <jsp:include page="../items/top.jsp" flush="true"/>
    <jsp:include page="../items/left.jsp" flush="true"/>
    <div class="main">
        <div class="menu-top">
            <h1 style="padding-left: 3%;">价格查看</h1>
        </div>
        <div class="middle" >
            <p onclick="dakai()" style="cursor: pointer;display: inline">添加</p>
            <table class="table">
                <tr class="menu_tr" bgcolor="#CCFFFF">
                    <td>渠道描述</td>
                    <td>目的国家</td>
                    <td>时效</td>
                    <td>描述</td>
                    <td>更多</td>
                    <td>删除</td>
                </tr>
                <c:forEach items="${PageBean.list}" var="o" >
                    <tr >
                        <td>${o.desc}</td>
                        <td>${o.country}</td>
                        <td>${o.timetable}</td>
                        <td>${o.detail}</td>
                        <td><a href="../huodai/price_xiaobao_get.do?id=${o.xiaobao_id}&&timetable=${o.timetable}">更多</a></td>
                        <td><a onclick="return confirm('确认删除?')" href="<%=path%>/huodai/xiaobao_delete.do?id=${o.xiaobao_id}">删除</a></td>
                    </tr>
                </c:forEach>
            </table>
            <div style="position: relative;margin-left: 65% " >

                <font size="2">共<font color="red"><c:out value="${PageBean.allRows}"></c:out></font>条记录</font><br><br>
                <font size="2">共<font color="red"><c:out value="${PageBean.totalPage}"></c:out></font>页 </font>
                <font size="2">当前<font color="red"><c:out value="${PageBean.currentPage}"></c:out></font>页 </font>&nbsp;&nbsp;
                <c:choose>
                    <c:when test="${PageBean.currentPage==1} ">
                        首页&nbsp;&nbsp;&nbsp;上一页
                    </c:when>
                    <c:otherwise>
                        <a href="<%=path%>/huodai/get_xiaobao.do?page=1">首页</a>
                        &nbsp;&nbsp;&nbsp;
                        <a href="<%=path%>/huodai/get_xiaobao.do?page=<c:out value="${PageBean.currentPage-1}" /> ">上一页</a>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${PageBean.currentPage==PageBean.totalPage}">
                        下一页&nbsp;&nbsp;&nbsp;尾页
                    </c:when>
                    <c:otherwise>
                        <a href="<%=path%>/huodai/get_xiaobao.do?page=<c:out value="${PageBean.currentPage+1}" />">下一页</a>
                        &nbsp;&nbsp;&nbsp;
                        <a href="<%=path%>/huodai/get_xiaobao.do?page=${PageBean.totalPage}">尾页</a>
                    </c:otherwise>
                </c:choose>
                <p style="display: inline-block;">
<%--                <form action="<%=path%>/huodai/get_xiaobao.do?" size="2" onclick="return validate1(this)">--%>
<%--                    跳转到&nbsp;<input type="text" name="page" style="width:40px;height: 20px;display: inline-block">&nbsp;页面--%>
<%--                    <input type="submit" value="go" style="display: inline-block" onclick="return validate1(this)">--%>
<%--                </form>--%>
                </p>
            </div>
            <div id="light" class="white_content" >
                 <img src="<%=path%>/image/close.png" style="width: 20px;height: 20px;position: absolute;right: 10px;cursor: pointer"  onclick = "guanbi()">
                <form action="<%=path%>/huodai/add_xiaobao.do" style="margin-top:5rem" method="POST">
                    <input type="text" name="desc" placeholder="描述" >
                    <select name="country">
                        <option value="">目的国</option>
                        <option value="American">美国</option>
                        <option value="England">英国</option>
                        <option value="Russia">俄罗斯</option>
                        <option value="Korea">韩国</option>
                        <option value="Netherland">荷兰</option>
                        <option value="Ukraine">乌克兰</option>
                        <option value="Canada">加拿大</option>
                        <option value="Germany">德国</option>
                    </select>
                    <input type="text" name="timetable" placeholder="时效">
                    <textarea cols="2" rows="3" name="detail" placeholder="详情描述"></textarea>
                    <button style="display: block;margin-left:45%" onclick="return confirm('确认提交?')">提交</button>
                </form>
            </div>
            <div id="fade" class="black_overlay"></div>
        </div>
    </div>
</body>
</html>
