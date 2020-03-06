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
        function add(){
            document.getElementById('light').style.display='block';
            document.getElementById('fade').style.display='block'
        }
        function closeDialog(){
            document.getElementById('light').style.display='none';
            document.getElementById('fade').style.display='none'
        }
        $(document).ready(function () {
            var result="<%=request.getParameter("add")%>";
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
                <h1 style="padding-left: 3%;">附加费</h1>
            </div>
            <div class="middle" style="height: 550px;overflow: scroll">
                &nbsp; <p onclick="add()"style="cursor: pointer;display: inline">添加附加费</p>
                <table  class="table">
                    <tr class="menu_tr" bgcolor="#CCFFFF">
                        <td>品名</td>
                        <td>附加费</td>
                        <td>备注</td>
                    </tr>
                    <c:forEach items="${list}" var="o" >
                    <tr >
                        <td>${o.category}</td>
                        <td>${o.price} /KG</td>
                        <td><a onclick="return confirm('确认删除?')" href="<%=path%>/huodai/delete_addion_price.do?addition_id=${o.addition_id}">删除</a></td>
                    </tr>
                    </c:forEach>
                </table>
                    <%--弹窗--%>
                    <div id="light" class="white_content" >
                        <img src="<%=path%>/image/close.png" style="margin-bottom: 80px;width: 20px;height: 20px;position: absolute;right: 5px;cursor: pointer" onclick = "closeDialog()">
                        <form action="<%=path%>/huodai/add_addion_price.do" style="text-align: center;margin-top:20px;" method="POST">
                            <select name="category">
                                <option value="箱包">箱包</option>
                                <option value="鞋子">鞋子</option>
                                <option value="服饰">服饰</option>
                                <option value="成人用品">成人用品</option>
                                <option value="车载电子">车载电子</option>
                                <option value="平板">平板</option>
                                <option value="手表">手表</option>
                                <option value="机顶盒">机顶盒</option>
                                <option value="3C类电子">3C类电子</option>
                            </select>
                            <input type="number" name="price" style="width: 100px">/KG
                            <select name="country">
                                <option value="American">美线</option>
                                <option value="Europe">欧线</option>
                                <option value="Japan">日本线</option>
                                <option value="Canda">加拿大线</option>
                            </select>
                            <button style="display: block;margin-left:45%">提交</button>
                        </form>
                    </div>
                    <div id="fade" class="black_overlay"></div>
            </div>
        </div>
</body>
</html>
