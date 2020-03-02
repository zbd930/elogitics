<%@ page import="com.duogesi.entities.User" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: jemmy
  Date: 2019/6/15
  Time: 13:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<%User user= (User) session.getAttribute("user");%>

<html>
<head>
    <title>e跨境通</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script type="text/javascript">

        function display(id) {
            var traget = document.getElementById(id);
            if (traget.style.display == "none") {
                traget.style.display = "";
            } else {
                traget.style.display = "none";
            }
        }
    </script>
</head>
<!-- 左边导航栏 开始-->
<div id="menu">
    <!--显示菜单-->
    <div id="open">
        <div class="navBox">
            <ul id="topchehang">
                <li >
                    <p class="obtain"  onclick="display('lb')"><i>拖车任务</i></p>
                    <div id="lb" style="display:none">
                        <a href="<%=path%>/chehang/chakanrenwu.do?page=1">
                            <p style="font-size: 16px;">任务查看</p></a>
                        <a href="<%=path%>/chehang/get_uncompleted.do">
                            <p style="font-size: 16px;">待完成任务</p></a>
                        <a href="<%=path%>/chehang/get_all_mission.do?page=1">
                            <p style="font-size: 16px;">全部任务</p></a>
                    </div>
                </li>
                <li>
                    <p class="obtain"  onclick="display('lb1')"><i>拖车信息</i></p>
                    <div id="lb1" style="display:none">
                        <a href="<%=path%>/chehang/sijixinxi.do?page=1">
                            <p style="font-size: 16px;"></p>司机信息</a>
                        <a href="<%=path%>/chehang/car.do?page=1">
                            <p style="font-size: 16px;"></p>车辆信息</a>
                    </div>
                </li>
            </ul>
            <ul id="huodai" >
                <li>
                    <p class="obtain"  onclick="display('lb2')"><i>订单管理</i></p>
                    <div id="lb2" style="display:none">
                        <a href="<%=path%>/huodai/allmission.do?page=1">
                            <p style="font-size: 16px;">所有任务</p></a>
                        <a href="<%=path%>/huodai/jump.do">
                            <p style="font-size: 16px;">新增任务</p></a>
                        <a href="<%=path%>/huodai/jump3.do">
                            <p style="font-size: 16px;">任务跟踪</p></a>
                        <a href="<%=path%>/huodai/jump2.do">
                            <p style="font-size: 16px;">到货计划</p></a>
                        <%--<a href="<%=path%>/huodai/jump4.do">--%>
                            <%--<p style="font-size: 16px;">限时秒杀</p></a>--%>
                    </div>
                </li>
                <li>
                    <p class="obtain"  onclick="display('lb5')"><i>金额管理</i></p>
                    <div id="lb5" style="display:none">
                            <a href="<%=path%>/huodai/haipai.do">
                                <p style="font-size: 16px;">海运价格</p></a>
                        <a href="<%=path%>/huodai/kongpai.do">
                            <p style="font-size: 16px;">空运价格</p></a>
                        <a href="<%=path%>/huodai/haika.do">
                            <p style="font-size: 16px;">海卡价格</p></a>
                        <a href="<%=path%>/huodai/get_price.do">
                            <p style="font-size: 16px;">附加费</p></a>
                        <a href="<%=path%>/huodai/zhuangdan1.do">
                            <p style="font-size: 16px;">月账单</p></a>
                    </div>
                </li>
            </ul>
            <ul>
                <li>
                    <p class="obtain"  onclick="display('lb3')"><i>信息管理</i></p>
                    <div id="lb3" style="display:none">
                        <a href="<%=path%>/xinxi/xinxi.do">
                            <p style="font-size: 16px;">联系方式</p></a>
                        <a href="<%=path%>/xinxi/warehouse.do">
                            <p style="font-size: 16px;">亚马逊仓库信息</p></a>
                    </div>
                </li>

            </ul>
            <ul>
                <li>
                    <p class="obtain"  onclick="display('lb4')"><i>系统设置</i></p>
                    <div id="lb4" style="display:none">
                        <a href="<%=path%>/system/system.do">
                            <p style="font-size: 16px;">系统设置</p></a>
                    </div>
                </li>

            </ul>
        </div>
    </div>
</div>
</body>
</html>
