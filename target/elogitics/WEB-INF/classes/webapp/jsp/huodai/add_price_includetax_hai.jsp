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
        function add(){
            if($("#items").css("display")=="none"){
                $("#items").show(100);
            }else{
                $("#items").hide(100);
            }
        }
        function add1(){
            if($("#items1").css("display")=="none"){
                $("#items1").show(100);
            }else{
                $("#items1").hide(100);
            }
        }
        function add2(){
            if($("#items2").css("display")=="none"){
                $("#items2").show(100);
            }else{
                $("#items2").hide(100);
            }
        }
        function show(id){
            if($(id).css("display")=="none"){
                $(id).show(100);
            }else{
                $(id).hide(100);
            }
        }
        function swich1(){
            $("#table1").show(100);
            $("#table2").hide(100);
            $("#table3").hide(100);
            $("#table4").hide(100);
        }
        function swich2(){
            $("#table1").hide(100);
            $("#table2").show(100);
            $("#table3").hide(100);
            $("#table4").hide(100);
        }
        function swich3(){
            $("#table1").hide(100);
            $("#table2").hide(100);
            $("#table3").show(100);
            $("#table4").hide(100);
        }
        function swich4(){
            $("#table1").hide(100);
            $("#table2").hide(100);
            $("#table3").hide(100);
            $("#table4").show(100);
        }
        $(document).ready(function () {
            var result="<%=request.getParameter("insert")%>";
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
                <h1 style="padding-left: 3%;">价格查看</h1>
            </div>
            <div class="middle" style="height: 600px;overflow:scroll;">
                <ul id="layoutTarget" class="layout">
                    <li style="display: inline;cursor: pointer" onclick="swich1()"><strong>1. </strong>美线</li>
                    <li style="display: inline;cursor: pointer" onclick="swich2()"><strong>2. </strong>加拿大线</li>
                    <li style="display: inline;cursor: pointer" onclick="swich3()"><strong>3. </strong>欧线</li>
                    <li style="display: inline;cursor: pointer" onclick="swich4()"><strong>4. </strong>日本线</li>
                </ul>
               <div style="white-space: nowrap;">
<%--                   //美线--%>
                   <div style="display: block" id="table1">
                       美线<br>
                       <table class="table" >   海派&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<p onclick="add()"style="cursor: pointer;display: inline">添加价格</p>
                           <tr class="menu_tr" bgcolor="#CCFFFF">
                               <td>地区</td>
                               <td>方式</td>
                               <td>100KG以下</td>
                               <td>100KG-300KG</td>
                               <td>300KG-500KG</td>
                               <td>500KG-1000KG</td>
                               <td>有效期起始</td>
                               <td>有效期终止</td>
                               <td>备注</td>
                           </tr>
                           <c:forEach items="${haipai}" var="d">
                               <tr >
                                   <td>${d.area}</td>
                                   <td>${d.way}</td>
                                   <td>${d.one}</td>
                                   <td>${d.three}</td>
                                   <td>${d.five}</td>
                                   <td>${d.ten}</td>
                                   <td>${d.valid_date_start}</td>
                                   <td>${d.valid_date_end}</td>
                                   <td><a onclick="return confirm('确认删除?')" href="<%=path%>/huodai/delete_price.do?id=${d.id}&&method=0">点击删除</a> </td>
                               </tr>
                           </c:forEach>
                           <form action="<%=path%>/huodai/add_price.do"  method="post" >
                               <tr bgcolor="#CCFFFF"  id="items" style="display: none">
                                   <th><select name="area">
                                       <option value="west">美西</option>
                                       <option value="middle">美中</option>
                                       <option value="east">美东</option>
                                   </select></th>
                                   <th><select name="way">
                                       <option value="1">海派</option>
                                   </select></th>
                                   <input type="text" name="country" value="American" style="display: none">
                                   <th><input max = "40"  min = "1"  step = "0.1" type="number" name="one"></th>
                                   <th><input max = "40"  min = "1"  step = "0.1" type="number" name="three"></th>
                                   <th><input max = "40"  min = "1"  step = "0.1" type="number" name="five"></th>
                                   <th><input max = "40"  min = "1"  step = "0.1" type="number" name="ten"></th>
                                   <th><input type="date" name="valid_date_start"></th>
                                   <th><input type="date" name="valid_date_end"></th>
                                   <th><input type="submit" onclick="return confirm('确认提交?')"></th>
                               </tr>
                           </form>
                       </table>
                       <table class="table">   美森&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; <p onclick="add2()"style="cursor: pointer;display: inline">添加价格</p>
                           <tr class="menu_tr" bgcolor="#CCFFFF">
                               <td>地区</td>
                               <td>方式</td>
                               <td>100KG以下</td>
                               <td>100KG-300KG</td>
                               <td>300KG-500KG</td>
                               <td>500KG-1000KG</td>
                               <td>有效期起始</td>
                               <td>有效期终止</td>
                               <td>备注</td>
                           </tr>
                           <c:forEach items="${meiseng}" var="d">
                               <tr >
                                   <td>${d.area}</td>
                                   <td>${d.way}</td>
                                   <td>${d.one}</td>
                                   <td>${d.three}</td>
                                   <td>${d.five}</td>
                                   <td>${d.ten}</td>
                                   <td>${d.valid_date_start}</td>
                                   <td>${d.valid_date_end}</td>
                                   <td><a onclick="return confirm('确认删除?')" href="<%=path%>/huodai/delete_price.do?id=${d.id}&&method=0">点击删除</a> </td>
                               </tr>
                           </c:forEach>
                           <form action="<%=path%>/huodai/add_price.do"  method="post" >
                               <tr bgcolor="#CCFFFF"  id="items2" style="display: none">
                                   <th><select name="area">
                                       <option value="west">美西</option>
                                       <option value="middle">美中</option>
                                       <option value="east">美东</option>
                                   </select></th>
                                   <th><select name="way">
                                       <option value="2">美森</option>
                                   </select></th>
                                   <input type="text" name="country" value="American" style="display: none">
                                   <th><input max = "40"  min = "1"  step = "0.1" type="number" name="one"></th>
                                   <th><input max = "40"  min = "1"  step = "0.1" type="number" name="three"></th>
                                   <th><input max = "40"  min = "1"  step = "0.1" type="number" name="five"></th>
                                   <th><input max = "40"  min = "1"  step = "0.1" type="number" name="ten"></th>
                                   <th><input type="date" name="valid_date_start"></th>
                                   <th><input type="date" name="valid_date_end"></th>
                                   <th><input type="submit" onclick="return confirm('确认提交?')"></th>
                               </tr>
                           </form>
                       </table>

                   </div>
    <%--                   //加拿大--%>
                   <div style="display: none" id="table2">
                       加拿大线<br>
                       <table class="table" >   海运&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<p onclick="show('#jianada1')"style="cursor: pointer;display: inline">添加价格</p>
                           <tr class="menu_tr" bgcolor="#CCFFFF">
                               <td>地区</td>
                               <td>方式</td>
                               <td>100KG以下</td>
                               <td>100KG-300KG</td>
                               <td>300KG-500KG</td>
                               <td>500KG-1000KG</td>
                               <td>有效期起始</td>
                               <td>有效期终止</td>
                               <td>备注</td>
                           </tr>
                           <c:forEach items="${Canda_normal}" var="d">
                               <tr >
                                   <td>${d.area}</td>
                                   <td>${d.way}</td>
                                   <td>${d.one}</td>
                                   <td>${d.three}</td>
                                   <td>${d.five}</td>
                                   <td>${d.ten}</td>
                                   <td>${d.valid_date_start}</td>
                                   <td>${d.valid_date_end}</td>
                                   <td><a onclick="return confirm('确认删除?')" href="<%=path%>/huodai/delete_price.do?id=${d.id}&&method=0">点击删除</a> </td>
                               </tr>
                           </c:forEach>
                           <form action="<%=path%>/huodai/add_price.do"  method="post" >
                               <tr bgcolor="#CCFFFF"  id="jianada1" style="display: none">
                                   <th><select name="area">
                                       <option value="YVR">温哥华</option>
                                       <option value="YYC">卡尔加里</option>
                                       <option value="YYZ">多伦多</option>
                                       <option value="YOW">渥太华</option>
                                   </select></th>
                                   <th><select name="way">
                                       <option value="1">海运</option>
                                   </select></th>
                                   <input type="text" name="country" value="Canada" style="display: none">
                                   <th><input max = "40"  min = "1"  step = "0.1" type="number" name="one"></th>
                                   <th><input max = "40"  min = "1"  step = "0.1" type="number" name="three"></th>
                                   <th><input max = "40"  min = "1"  step = "0.1" type="number" name="five"></th>
                                   <th><input max = "40"  min = "1"  step = "0.1" type="number" name="ten"></th>
                                   <th><input type="date" name="valid_date_start"></th>
                                   <th><input type="date" name="valid_date_end"></th>
                                   <th><input type="submit" onclick="return confirm('确认提交?')"></th>
                               </tr>
                           </form>
                       </table>
                       <table class="table">   海运快船&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; <p onclick="show('#jianada2')"style="cursor: pointer;display: inline">添加价格</p>
                           <tr class="menu_tr" bgcolor="#CCFFFF">
                               <td>地区</td>
                               <td>方式</td>
                               <td>100KG以下</td>
                               <td>100KG-300KG</td>
                               <td>300KG-500KG</td>
                               <td>500KG-1000KG</td>
                               <td>有效期起始</td>
                               <td>有效期终止</td>
                               <td>备注</td>
                           </tr>
                           <c:forEach items="${Canda_fast}" var="d">
                               <tr >
                                   <td>${d.area}</td>
                                   <td>${d.way}</td>
                                   <td>${d.one}</td>
                                   <td>${d.three}</td>
                                   <td>${d.five}</td>
                                   <td>${d.ten}</td>
                                   <td>${d.valid_date_start}</td>
                                   <td>${d.valid_date_end}</td>
                                   <td><a onclick="return confirm('确认删除?')" href="<%=path%>/huodai/delete_price.do?id=${d.id}&&method=0">点击删除</a> </td>
                               </tr>
                           </c:forEach>
                           <form action="<%=path%>/huodai/add_price.do"  method="post" >
                               <tr bgcolor="#CCFFFF"  id="jianada2" style="display: none">
                                   <th><select name="area">
                                       <option value="YVR">温哥华</option>
                                       <option value="YYC">卡尔加里</option>
                                       <option value="YYZ">多伦多</option>
                                       <option value="YOW">渥太华</option>
                                   </select></th>
                                   <th><select name="way">
                                       <option value="2">海运快船</option>
                                   </select></th>
                                   <input type="text" name="country" value="Canada" style="display: none">
                                   <th><input max = "40"  min = "1"  step = "0.1" type="number" name="one"></th>
                                   <th><input max = "40"  min = "1"  step = "0.1" type="number" name="three"></th>
                                   <th><input max = "40"  min = "1"  step = "0.1" type="number" name="five"></th>
                                   <th><input max = "40"  min = "1"  step = "0.1" type="number" name="ten"></th>
                                   <th><input type="date" name="valid_date_start"></th>
                                   <th><input type="date" name="valid_date_end"></th>
                                   <th><input type="submit" onclick="return confirm('确认提交?')"></th>
                               </tr>
                           </form>
                       </table>

                   </div>
    <%--                   //欧线--%>
                    <div style="display: none" id="table3">
                        欧线<br>
                                       <table class="table" >   海运&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<p onclick="show('#ouzhou1')"style="cursor: pointer;display: inline">添加价格</p>
                                           <tr class="menu_tr" bgcolor="#CCFFFF">
                                               <td>地区</td>
                                               <td>方式</td>
                                               <td>100KG以下</td>
                                               <td>100KG-300KG</td>
                                               <td>300KG-500KG</td>
                                               <td>500KG-1000KG</td>
                                               <td>有效期起始</td>
                                               <td>有效期终止</td>
                                               <td>备注</td>
                                           </tr>
                                           <c:forEach items="${Eurpor_normal}" var="d">
                                               <tr >
                                                   <td>${d.area}</td>
                                                   <td>${d.way}</td>
                                                   <td>${d.one}</td>
                                                   <td>${d.three}</td>
                                                   <td>${d.five}</td>
                                                   <td>${d.ten}</td>
                                                   <td>${d.valid_date_start}</td>
                                                   <td>${d.valid_date_end}</td>
                                                   <td><a onclick="return confirm('确认删除?')" href="<%=path%>/huodai/delete_price.do?id=${d.id}&&method=0">点击删除</a> </td>
                                               </tr>
                                           </c:forEach>
                                           <form action="<%=path%>/huodai/add_price.do"  method="post" >
                                               <tr bgcolor="#CCFFFF"  id="ouzhou1" style="display: none">
                                                   <th><select name="area">
                                                       <option value="zone1">一号地区</option>
                                                       <option value="zone2">二号地区</option>
                                                       <option value="zone3">三号地区</option>
                                                       <option value="zone4">四号地区</option>
                                                   </select></th>
                                                   <th><select name="way">
                                                       <option value="1">海运</option>
                                                   </select></th>
                                                   <input type="text" name="country" value="Europe" style="display: none">
                                                   <th><input max = "40"  min = "1"  step = "0.1" type="number" name="one"></th>
                                                   <th><input max = "40"  min = "1"  step = "0.1" type="number" name="three"></th>
                                                   <th><input max = "40"  min = "1"  step = "0.1" type="number" name="five"></th>
                                                   <th><input max = "40"  min = "1"  step = "0.1" type="number" name="ten"></th>
                                                   <th><input type="date" name="valid_date_start"></th>
                                                   <th><input type="date" name="valid_date_end"></th>
                                                   <th><input type="submit" onclick="return confirm('确认提交?')"></th>
                                               </tr>
                                           </form>
                                       </table>
                                       <table class="table">   海运快船&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; <p onclick="show('#ouzhou2')"style="cursor: pointer;display: inline">添加价格</p>
                                           <tr class="menu_tr" bgcolor="#CCFFFF">
                                               <td>地区</td>
                                               <td>方式</td>
                                               <td>100KG以下</td>
                                               <td>100KG-300KG</td>
                                               <td>300KG-500KG</td>
                                               <td>500KG-1000KG</td>
                                               <td>有效期起始</td>
                                               <td>有效期终止</td>
                                               <td>备注</td>
                                           </tr>
                                           <c:forEach items="${Eurpor_fast}" var="d">
                                               <tr >
                                                   <td>${d.area}</td>
                                                   <td>${d.way}</td>
                                                   <td>${d.one}</td>
                                                   <td>${d.three}</td>
                                                   <td>${d.five}</td>
                                                   <td>${d.ten}</td>
                                                   <td>${d.valid_date_start}</td>
                                                   <td>${d.valid_date_end}</td>
                                                   <td><a onclick="return confirm('确认删除?')" href="<%=path%>/huodai/delete_price.do?id=${d.id}&&method=0">点击删除</a> </td>
                                               </tr>
                                           </c:forEach>
                                           <form action="<%=path%>/huodai/add_price.do"  method="post" >
                                               <tr bgcolor="#CCFFFF"  id="ouzhou2" style="display: none">
                                                   <th><select name="area">
                                                       <option value="zone1">一号地区</option>
                                                       <option value="zone2">二号地区</option>
                                                       <option value="zone3">三号地区</option>
                                                       <option value="zone4">四号地区</option>
                                                   </select></th>
                                                   <th><select name="way">
                                                       <option value="2">海运快船</option>
                                                   </select></th>
                                                   <input type="text" name="country" value="Europe" style="display: none">
                                                   <th><input max = "40"  min = "1"  step = "0.1" type="number" name="one"></th>
                                                   <th><input max = "40"  min = "1"  step = "0.1" type="number" name="three"></th>
                                                   <th><input max = "40"  min = "1"  step = "0.1" type="number" name="five"></th>
                                                   <th><input max = "40"  min = "1"  step = "0.1" type="number" name="ten"></th>
                                                   <th><input type="date" name="valid_date_start"></th>
                                                   <th><input type="date" name="valid_date_end"></th>
                                                   <th><input type="submit" onclick="return confirm('确认提交?')"></th>
                                               </tr>
                                           </form>
                                       </table>

                                   </div>
    <%--                   //日本线--%>
                    <div style="display: none" id="table4">
                        日本线<br>
                                       <table class="table" >   海运&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<p onclick="show('#riben1')"style="cursor: pointer;display: inline">添加价格</p>
                                           <tr class="menu_tr" bgcolor="#CCFFFF">
                                               <td>地区</td>
                                               <td>方式</td>
                                               <td>100KG以下</td>
                                               <td>100KG-300KG</td>
                                               <td>300KG-500KG</td>
                                               <td>500KG-1000KG</td>
                                               <td>有效期起始</td>
                                               <td>有效期终止</td>
                                               <td>备注</td>
                                           </tr>
                                           <c:forEach items="${Japan_normal}" var="d">
                                               <tr >
                                                   <td>${d.area}</td>
                                                   <td>${d.way}</td>
                                                   <td>${d.one}</td>
                                                   <td>${d.three}</td>
                                                   <td>${d.five}</td>
                                                   <td>${d.ten}</td>
                                                   <td>${d.valid_date_start}</td>
                                                   <td>${d.valid_date_end}</td>
                                                   <td><a onclick="return confirm('确认删除?')" href="<%=path%>/huodai/delete_price.do?id=${d.id}&&method=0">点击删除</a> </td>
                                               </tr>
                                           </c:forEach>
                                           <form action="<%=path%>/huodai/add_price.do"  method="post" >
                                               <tr bgcolor="#CCFFFF"  id="riben1" style="display: none">
                                                   <th><select name="area">
                                                       <option value="Japan">日本</option>
                                                   </select></th>
                                                   <th><select name="way">
                                                       <option value="1">海运</option>
                                                   </select></th>
                                                   <input type="text" name="country" value="Japan" style="display: none">
                                                   <th><input max = "40"  min = "1"  step = "0.1" type="number" name="one"></th>
                                                   <th><input max = "40"  min = "1"  step = "0.1" type="number" name="three"></th>
                                                   <th><input max = "40"  min = "1"  step = "0.1" type="number" name="five"></th>
                                                   <th><input max = "40"  min = "1"  step = "0.1" type="number" name="ten"></th>
                                                   <th><input type="date" name="valid_date_start"></th>
                                                   <th><input type="date" name="valid_date_end"></th>
                                                   <th><input type="submit" onclick="return confirm('确认提交?')"></th>
                                               </tr>
                                           </form>
                                       </table>
                                       <table class="table">   海运快船&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; <p onclick="show('#riben2')"style="cursor: pointer;display: inline">添加价格</p>
                                           <tr class="menu_tr" bgcolor="#CCFFFF">
                                               <td>地区</td>
                                               <td>方式</td>
                                               <td>100KG以下</td>
                                               <td>100KG-300KG</td>
                                               <td>300KG-500KG</td>
                                               <td>500KG-1000KG</td>
                                               <td>有效期起始</td>
                                               <td>有效期终止</td>
                                               <td>备注</td>
                                           </tr>
                                           <c:forEach items="${Japan_fast}" var="d">
                                               <tr >
                                                   <td>${d.area}</td>
                                                   <td>${d.way}</td>
                                                   <td>${d.one}</td>
                                                   <td>${d.three}</td>
                                                   <td>${d.five}</td>
                                                   <td>${d.ten}</td>
                                                   <td>${d.valid_date_start}</td>
                                                   <td>${d.valid_date_end}</td>
                                                   <td><a onclick="return confirm('确认删除?')" href="<%=path%>/huodai/delete_price.do?id=${d.id}&&method=0">点击删除</a> </td>
                                               </tr>
                                           </c:forEach>
                                           <form action="<%=path%>/huodai/add_price.do"  method="post" >
                                               <tr bgcolor="#CCFFFF"  id="riben2" style="display: none">
                                                   <th><select name="area">
                                                       <option value="Japan">日本</option>
                                                   </select></th>
                                                   <th><select name="way">
                                                       <option value="2">海运快船</option>
                                                   </select></th>
                                                   <input type="text" name="country" value="Japan" style="display: none">
                                                   <th><input max = "40"  min = "1"  step = "0.1" type="number" name="one"></th>
                                                   <th><input max = "40"  min = "1"  step = "0.1" type="number" name="three"></th>
                                                   <th><input max = "40"  min = "1"  step = "0.1" type="number" name="five"></th>
                                                   <th><input max = "40"  min = "1"  step = "0.1" type="number" name="ten"></th>
                                                   <th><input type="date" name="valid_date_start"></th>
                                                   <th><input type="date" name="valid_date_end"></th>
                                                   <th><input type="submit" onclick="return confirm('确认提交?')"></th>
                                               </tr>
                                           </form>
                                       </table>

                                   </div>
               </div>
            </div>
          </div>
</body>
</html>
