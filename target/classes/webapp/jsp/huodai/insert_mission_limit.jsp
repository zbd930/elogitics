<%--
  Created by IntelliJ IDEA.
  User: jemmy
  Date: 2019/6/15
  Time: 18:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>e跨境通</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            var jieguo="${result}";
            if (jieguo!=""){
                alert(jieguo);
            }
        })
        function checkboxOnclick(checkbox){
            var traget = document.getElementById("set");
            var target = document.getElementById("set1");
            if ( checkbox.checked == true){
                traget.innerHTML="<input id=\"set1\" name=\"compensate\" value=\"1\" style=\"display: none\">\n" +
                    "                        <p style=\"display: inline-block\">赔付时间： <input id=\"dead_date\" name=\"dead_date\" type=\"date\"  class=\"insert_input\" STYLE=\"width: 140px;margin-left:10px\"></p>\n" +
                    "                        <p style=\"display: inline-block\">赔付方式：<input id=\"money\" name=\"money\" type=\"number\" style=\"width: 140px;\"  placeholder=\"公斤或立方\"> </p>";
            }else{
                target.value="0";
                traget.innerHTML=""

//Action for not checked

            }

        }
    </script>
</head>
<body>
        <jsp:include page="../items/top.jsp" flush="true"/>
        <jsp:include page="../items/left.jsp" flush="true"/>

        <div class="main">
            <div class="menu-top">
                <h1 style="padding-left: 3%;">限时秒杀</h1>
            </div>
            <div class="middle">
                <form action="<%=path%>/huodai/insert_limit.do" method="POST">
                <div style="width:40%;border-radius: 10px;border:1px solid black;margin-left:5%;padding:1%;height:500px;float: left">
                    <span style="display: block;margin-left: 40%;">航次:</span>
                    <span style="width: 100%">
                        <p style="display: inline-block">秒杀开始:<input name="killed_start" type="datetime-local"  STYLE="width: 200px"></p>
                       <p style="display: inline-block">秒杀结束：<input name="killed_end" type="datetime-local" STYLE="width: 200px"> </p>
                    </span>
                    <span style="width: 100%;display: block">
                        <p style="display: inline-block">起运港：
                          <select name="qiyungang" style="width: 60px">
                            <option value="深圳">深圳</option>
                            <option value="上海">上海</option>
                            <option value="义乌">义乌</option>
                              <option value="宁波">宁波</option>
                            <option value="广州">广州</option>
                        </select>
                        </p>
                        <p  style="display: inline-block">拆柜地：<select name="mudigang" style="width: 60px">
                                    <option value="west">美西</option>
                                    <option value="east">美东</option>
                                    <option value="middle">美中</option>
                                 </select>
                        </p>
                    </span>
                    <span style="width: 100%;display: block">
                        <p style="display: inline-block">
                        计划到达:<input name="eta" type="date" class="insert_input" STYLE="width: 150px;display: inline-block">
                        </p>
                        <p style="display: inline-block">
                        计划出发：<input name="etd" type="date" STYLE="width: 150px;display: inline-block">
                        </p>
                    </span>
                    <p style="display: inline">运输方式：
                        <select name="method" style="width: 100px">
                            <%--<option value="海卡">海卡</option>--%>
                            <option value="海派">海派</option>
                            <option value="空派">空派</option>
                            <option value="空派(直飞)">空派(直飞)</option>
                            <option value="空派(带电)">空派(带电)</option>
                            <option value="美森">美森</option>
                        </select></p>
                    <p style="width: 150px">描述：<input name="desc" style="width: 200px"> </textarea>
                    </p>
                    <p>降价幅度<input name="discount" type="number" min="1" placeholder="单价" style="width: 100px;"></p>
                </div>
                <div style="width:40%;border-radius: 10px;border:1px solid black;padding-left:2%;height: 500px;margin-left:55%;">
                    <span style="display: block;margin-left: 45%;">详细信息:</span>
                    <div  style="display: block;">
                        <p style="display: inline-block">体积：<input name="volume" type="number" style="width:60px;display: inline-block" max="70"> CBM&nbsp;&nbsp;<p style="display: inline">重量：<input name="weight" type="number" style="width:100px;display: inline-block" max="15000" > KG</p> </p>
                    </div>
                    <p style="display: inline">截止收货:<input name="cut_time" type="date" class="insert_input" STYLE="width: 150px"> </p>
                    <p style="display: inline">出发时间:<input name="cut_end" type="date" class="insert_input" STYLE="width: 150px"> </p>
                    <p><input type="checkbox"  onclick="checkboxOnclick(this)">慢必赔</p>
                    <div id="set" >
                        <input id="set1" name="compensate" value="0" style="display: none">
                        <p style="display: inline-block">赔付时间： <input id="dead_date" name="dead_date" type="date"  class="insert_input" STYLE="width: 140px;margin-left:10px"></p>
                        <p style="display: inline-block">金额单价：<input id="money" name="money" type="number" style="width: 140px;"  placeholder="公斤或立方"> </p>
                    </div>
                    <button type="submit" class="add_submit" onclick="sendAuthMessage();" >提交</button>
                </div>
                </form>
            </div>
        </div>
</body>
</html>
