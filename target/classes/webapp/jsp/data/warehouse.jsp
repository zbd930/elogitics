<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%String path = request.getContextPath();%>
<%--
  Created by IntelliJ IDEA.
  User: jemmy
  Date: 2019/8/19
  Time: 19:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE>
<html >
<head>
    <meta charset="UTF-8">
    <title>e跨境通</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="https://cdn.staticfile.org/foundation/5.5.3/css/foundation.min.css">
    <link rel="stylesheet" type="text/css" href="https://www.duogesi.cn/elogitics/static/all.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/foundation/5.5.3/js/foundation.min.js"></script>
    <script src="https://cdn.staticfile.org/foundation/5.5.3/js/vendor/modernizr.js"></script>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
</head>
<body>
<jsp:include page="/jsp/items/top.jsp" flush="true"/>
<jsp:include page="/jsp/items/left.jsp" flush="true"/>
    <div class="main">
        <div style="background-color: white;padding: 2%;height: 100%;overflow: scroll ">
            <h1 style="border-bottom: #555251 2px solid">仓库信息</h1>
            <table class="table">
                <tbody>
                <tr class="menu_tr" bgcolor="#CCFFFF">
                    <td style="width: 120px; text-align: center;"><span style="font-size:14px;">仓库代码</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">仓库地址</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">城市</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">洲名</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">邮编</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">PHX3</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">6835 West Buckeye Road</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Phoenix</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">AZ</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">85043</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">PHX5</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">16920 W Commerce Drive</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Goodyear</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">AZ</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">85338</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">PHX6</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">4750 West Mohave St</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Phoenix</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">AZ</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">85043</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">PHX7</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">800 N 75th Ave</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Phoenix</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">AZ</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">85043</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">ONT2</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">1910 E Central Ave</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">San Bernardino</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">CA</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">92408</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">ONT6</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">24208 San Michele Rd</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Moreno Valley</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">CA</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">92551</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">ONT8</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">24300 Nandina Ave    Moreno</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Valley</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">CA</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">92551</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">OAK4</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">1555 N. Chrisman Rd</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Tracy</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">CA</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">95376</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">OAK3</td>
                    <td style="width:400px;text-align:center;">255 Park Center Drive</td>
                    <td style="width:150px;text-align:center;">Patterson</td>
                    <td style="width:140px;text-align:center;">CA</td>
                    <td style="width:120px;text-align:center;">95363</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">ONT9</td>
                    <td style="width:400px;text-align:center;">2125 W. San Bernandino Ave    </td>
                    <td style="width:150px;text-align:center;">Redlands</td>
                    <td style="width:140px;text-align:center;">CA</td>
                    <td style="width:120px;text-align:center;">92374</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">XUSD</td>
                    <td style="width:400px;text-align:center;">1909 Zephyr St</td>
                    <td style="width:150px;text-align:center;">Stockton</td>
                    <td style="width:140px;text-align:center;">CA</td>
                    <td style="width:120px;text-align:center;">95206</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">SNA4</td>
                    <td style="width:400px;text-align:center;"> 2496 W Walnut Ave</td>
                    <td style="width:150px;text-align:center;">Rialto</td>
                    <td style="width:140px;text-align:center;">CA</td>
                    <td style="width:120px;text-align:center;">92376-3009</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">SJC7</td>
                    <td style="width:400px;text-align:center;">188 Mountain House Parkway</td>
                    <td style="width:150px;text-align:center;">Tracy</td>
                    <td style="width:140px;text-align:center;">CA</td>
                    <td style="width:120px;text-align:center;">95391</td>
                </tr><tr><td style="width:120px;text-align:center;">SLC1</td><td style="width:400px;text-align:center;">777 N 5600 W&nbsp;</td><td style="width:150px;text-align:center;">Salt Lake&nbsp;</td><td style="width:140px;text-align:center;">UT</td><td style="width:120px;text-align:center;">84116</td></tr>
                <tr>
                    <td style="width:120px;text-align:center;">LGB8</td>
                    <td style="width:400px;text-align:center;">1568 N Linden Ave</td>
                    <td style="width:150px;text-align:center;">Rialto</td>
                    <td style="width:140px;text-align:center;">CA</td>
                    <td style="width:120px;text-align:center;">92376</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">LGB6</td>
                    <td style="width:400px;text-align:center;">20901 Krameria Ave</td>
                    <td style="width:150px;text-align:center;">Riverside</td>
                    <td style="width:140px;text-align:center;">CA</td>
                    <td style="width:120px;text-align:center;">92518-1513</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">LGB4</td>
                    <td style="width:400px;text-align:center;">27517 Pioneer Avenue </td>
                    <td style="width:150px;text-align:center;">Redlands</td>
                    <td style="width:140px;text-align:center;">CA</td>
                    <td style="width:120px;text-align:center;">92374</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">LGB3</td>
                    <td style="width:400px;text-align:center;">4950 Goodman Way</td>
                    <td style="width:150px;text-align:center;">Eastvale</td>
                    <td style="width:140px;text-align:center;">CA</td>
                    <td style="width:120px;text-align:center;">91752</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">SMF1</td>
                    <td style="width:400px;text-align:center;">4900 W Elkhorn Blvd</td>
                    <td style="width:150px;text-align:center;">Sacramento</td>
                    <td style="width:140px;text-align:center;">CA</td>
                    <td style="width:120px;text-align:center;">95837</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">BDL1</td>
                    <td style="width:400px;text-align:center;">801 Day Hill Rd.</td>
                    <td style="width:150px;text-align:center;">Windsor</td>
                    <td style="width:140px;text-align:center;">CT</td>
                    <td style="width:120px;text-align:center;">6095</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">PHL1</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">1 Centerpoint Blvd.</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">New Castle</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">DE</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">19720</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">PHL3</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">1600 Johnson Way</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">New Castle</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">DE</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">19720</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">PHL7</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">560 Merrimac Ave</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Middletown</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">DE</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">19709</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">PHL8</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">727 N Broad St</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Middletown</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">DE</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">19709</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">TPA1</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">3350 Laurel Ridge Ave.</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Ruskin</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">FL</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">33570</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">TPA2</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">1760 County Line Rd</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Lakeland</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">FL</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">33811</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">MIA1</td>
                    <td style="width:400px;text-align:center;">1900 NW 132nd Place Doral</td>
                    <td style="width:150px;text-align:center;">Miami</td>
                    <td style="width:140px;text-align:center;">FL</td>
                    <td style="width:120px;text-align:center;">33182</td>
                </tr><tr><td style="width:120px;text-align:center;">MIA1-33054</td><td style="width:400px;text-align:center;">14000 NW 37th Avenue</td><td style="width:150px;text-align:center;">Opa-Locka</td><td style="width:140px;text-align:center;">FL</td><td style="width:120px;text-align:center;">33054</td></tr>
                <tr>
                    <td style="width:120px;text-align:center;">JAX3</td>
                    <td style="width:400px;text-align:center;">13333 103rd Street</td>
                    <td style="width:150px;text-align:center;">Jacksonville</td>
                    <td style="width:140px;text-align:center;">FL</td>
                    <td style="width:120px;text-align:center;">32210-8686</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">XUSE</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">5100 S Indianapolis Rd</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Whitestown</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">IN</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">46075</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">IND1</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">4255 Anson Blvd</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Whitestown</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">IN</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">46075</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">IND2</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">715 Airtech Pkwy</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Plainfield</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">IN</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">46168</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">IND3</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">715 Airtech Pkwy Suite 195</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Plainfield</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">IN</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">46168</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">IND4</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">710 S. Girls School Rd</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Indianapolis</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">IN</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">46231</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">IND5</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">800 Perry Road</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Plainfield</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">IN</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">46168</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">IND6</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">1453 E 10th St</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Jeffersonville</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">IN</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">47130</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">SDF8</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">900 Patrol Rd</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Jeffersonville</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">IN</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">47130</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">TUL1</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">2654 North Highway 169</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Coffeyville</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">KS</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">67337</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">MCI1</td>
                    <td style="width:400px;text-align:center;">113th St &amp; Renner Blvd.    </td>
                    <td style="width:150px;text-align:center;">Lenexa</td>
                    <td style="width:140px;text-align:center;">KS</td>
                    <td style="text-align: center;">66219</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">MKC4</td>
                    <td style="width:400px;text-align:center;">19645 Waverly Rd</td>
                    <td style="width:150px;text-align:center;">   Edgerton</td>
                    <td style="width:140px;text-align:center;">KS</td>
                    <td style="width:120px;text-align:center;">66021-9588</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">MKC6</td>
                    <td style="width:400px;text-align:center;">6925 Riverview Avenue</td>
                    <td style="width:150px;text-align:center;">Kansas City</td>
                    <td style="width:140px;text-align:center;">KX</td>
                    <td style="width:120px;text-align:center;">66102</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">LEX1</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">1850 Mercer RD</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Lexington</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">KY</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">40511</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">LEX2</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">172 Trade St.</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Lexington</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">KY</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">40511</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">SDF1</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">1050 South Columbia</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Campbellsville</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">KY</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">42718</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">SDF2</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">4360 Robards Ln</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Watterson Park</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">KY</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">40218</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">SDF4</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">376 Zappos.com Blvd</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Shepherdsville</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">KY</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">40165</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">SDF6</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">271 Omega Pkwy</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Shepherdsville</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">KY</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">40165</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">CVG1</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">1155 Worldwide Blvd</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Hebron</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">KY</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">41048</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">CVG2</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">1600 Worldwide Blvd</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Hebron</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">KY</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">41048</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">CVG3</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">3680 Langley Dr.</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Hebron</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">KY</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">41048</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">CVG5</td>
                    <td style="width:400px;text-align:center;">2285 Litton Lane</td>
                    <td style="width:150px;text-align:center;">Hebron</td>
                    <td style="width:140px;text-align:center;">KY</td>
                    <td style="width:120px;text-align:center;">41048</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">SDF7</td>
                    <td style="width:400px;text-align:center;">300 Omicron Court</td>
                    <td style="width:150px;text-align:center;">Shepherdsville</td>
                    <td style="width:140px;text-align:center;">KY</td>
                    <td style="width:120px;text-align:center;">40165</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">SDF9</td>
                    <td style="width:400px;text-align:center;">100 W. Thomas P. Echols Lane</td>
                    <td style="width:150px;text-align:center;">Shepherdsville</td>
                    <td style="width:140px;text-align:center;">KY</td>
                    <td style="width:120px;text-align:center;">40165</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">EWR4</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">50 New Canton Way</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Robbinsville</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">NJ</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">08691</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">EWR5</td>
                    <td style="width:400px;text-align:center;">301 Blair Rd.</td>
                    <td style="width:150px;text-align:center;">Avenel</td>
                    <td style="width:140px;text-align:center;">NJ</td>
                    <td style="width:120px;text-align:center;">7001</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">EWR7</td>
                    <td style="width:400px;text-align:center;">301 Blair Rd.</td>
                    <td style="width:150px;text-align:center;">Avenel</td>
                    <td style="width:140px;text-align:center;">NJ</td>
                    <td style="width:120px;text-align:center;">07001</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">EWR9</td>
                    <td style="width:400px;text-align:center;">8003 Industrial Parkway</td>
                    <td style="width:150px;text-align:center;">Carteret</td>
                    <td style="width:140px;text-align:center;">NJ</td>
                    <td style="width:120px;text-align:center;">07008</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">ABE8-401</td>
                    <td style="width:400px;text-align:center;">401 Independence Road</td>
                    <td style="width:150px;text-align:center;">Florence</td>
                    <td style="width:140px;text-align:center;"><span style="text-align: center;">NJ</span>
                    </td>
                    <td style="width:120px;text-align:center;">08518</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">ABE8-309</td>
                    <td style="width:400px;text-align:center;">309 Cedar Lane</td>
                    <td style="width:150px;text-align:center;">Florence</td>
                    <td style="width:140px;text-align:center;">NJ</td>
                    <td style="width:120px;text-align:center;">08518-2802</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">TEB3</td>
                    <td style="width:400px;text-align:center;">2651 Oldmans Creek Rd</td>
                    <td style="width:150px;text-align:center;">Logan Township</td>
                    <td style="width:140px;text-align:center;">NJ</td>
                    <td style="width:120px;text-align:center;">8085</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">TEB6</td>
                    <td style="width:400px;text-align:center;">22 Hightstown Cranbury State Road</td>
                    <td style="width:150px;text-align:center;">Cranbury</td>
                    <td style="width:140px;text-align:center;">NJ</td>
                    <td style="width:120px;text-align:center;">8512</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">RNO1</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">1600 East Newlands RD</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Fernley</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">NV</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">89408</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">LAS1</td>
                    <td style="width:400px;text-align:center;">4550 Nexus Way</td>
                    <td style="width:150px;text-align:center;">Las Vegas</td>
                    <td style="width:140px;text-align:center;">NV</td>
                    <td style="width:120px;text-align:center;">89115</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">LAS2</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">3837 Bay Lake Trail, Suite 111 North</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Las Vegas</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">NV</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">89030</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">RNO2</td>
                    <td style="width:400px;text-align:center;">8000 North Virginia Street</td>
                    <td style="width:150px;text-align:center;">Reno</td>
                    <td style="width:140px;text-align:center;">NV</td>
                    <td style="width:120px;text-align:center;">85906</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">RNO4</td>
                    <td style="width:400px;text-align:center;">Amazon.com.NVDC Inc. 8000 North Virginia Street</td>
                    <td style="width:150px;text-align:center;">Reno</td>
                    <td style="width:140px;text-align:center;">NV</td>
                    <td style="width:120px;text-align:center;">89506</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">BOS1</td>
                    <td style="width:400px;text-align:center;">10 State St.</td>
                    <td style="width:150px;text-align:center;">Nashua</td>
                    <td style="width:140px;text-align:center;">NH</td>
                    <td style="width:120px;text-align:center;">03063</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">BWI1</td>
                    <td style="width:400px;text-align:center;">2010 Broening Highway   </td>
                    <td style="width:150px;text-align:center;">Baltimore</td>
                    <td style="width:140px;text-align:center;">MD</td>
                    <td style="width:120px;text-align:center;">21224</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">BWI2</td>
                    <td style="width:400px;text-align:center;">5001 Holbird  Ave.</td>
                    <td style="width:150px;text-align:center;">Baltimore</td>
                    <td style="width:140px;text-align:center;">MD</td>
                    <td style="width:120px;text-align:center;">21224</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">CMH2</td>
                    <td style="width:400px;text-align:center;">6050 Gateway Court
                        <br>Groveport
                    </td>
                    <td style="width:150px;text-align:center;">COLUMBUS</td>
                    <td style="width:140px;text-align:center;">OH</td>
                    <td style="width:120px;text-align:center;">43125-9016</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">CMH1</td>
                    <td style="width:400px;text-align:center;">11903 National Road SW </td>
                    <td style="width:150px;text-align:center;">Etna</td>
                    <td style="width:140px;text-align:center;">OH</td>
                    <td style="width:120px;text-align:center;">43062-7793</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">MDT1</td>
                    <td style="width:400px;text-align:center;">2 Ames Drive</td>
                    <td style="width:150px;text-align:center;">Carlisle</td>
                    <td style="width:140px;text-align:center;">PA</td>
                    <td style="width:120px;text-align:center;">17015</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">ABE2</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">705 Boulder Drive</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Breinigsville</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">PA</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">18031</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">ABE3</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">650 Boulder Drive</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Breinigsville</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">PA</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">18031</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">PHL4</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">21 Roadway Dr</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Carlisle</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">PA</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">17015</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">PHL5</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">500 McCarthy Dr</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Lewisberry</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">PA</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">17339</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">PHL6</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">675 Allen Rd.</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Carlisle</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">PA</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">17015</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">AVP1</span>
                    </td>
                    <td style="width:400px;text-align:center;">550 Oak Ridge Road</td>
                    <td style="width:150px;text-align:center;">Hazle Township</td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">PA</span>
                    </td>
                    <td style="width:120px;text-align:center;">18202-9361</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">AVP3</td>
                    <td style="width:400px;text-align:center;"> 298 1ST AVE</td>
                    <td style="width:150px;text-align:center;">GOULDSBORO</td>
                    <td style="width:140px;text-align:center;">PA</td>
                    <td style="width:120px;text-align:center;">18424-9492</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">ABE5</td>
                    <td style="width:400px;text-align:center;">6455 Allentown Boulevard</td>
                    <td style="width:150px;text-align:center;">Harrisburg</td>
                    <td style="width:140px;text-align:center;">PA</td>
                    <td style="width:120px;text-align:center;">17112</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">MDT1</td>
                    <td style="width:400px;text-align:center;">2Ames Drive,Building#2 </td>
                    <td style="width:150px;text-align:center;">Carlisle</td>
                    <td style="width:140px;text-align:center;">PA</td>
                    <td style="width:120px;text-align:center;">17015</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">PIT1</td>
                    <td style="width:400px;text-align:center;">2250 Roswell Drive</td>
                    <td style="width:150px;text-align:center;">Pittsburgh</td>
                    <td style="width:140px;text-align:center;">PA</td>
                    <td style="width:120px;text-align:center;">15205</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">VUBA</td>
                    <td style="width:400px;text-align:center;">1000 Keystone Industrial Park </td>
                    <td style="width:150px;text-align:center;">Scranton</td>
                    <td style="width:140px;text-align:center;">PA</td>
                    <td style="width:120px;text-align:center;">18512</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">VUGA</td>
                    <td style="width:400px;text-align:center;">508 Delaware Avenue West   </td>
                    <td style="width:150px;text-align:center;">Pittston </td>
                    <td style="width:140px;text-align:center;">PA</td>
                    <td style="width:120px;text-align:center;">18643</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">XUSC</td>
                    <td style="width:400px;text-align:center;">40 Logistics Drive </td>
                    <td style="width:150px;text-align:center;">Carlisle</td>
                    <td style="width:140px;text-align:center;">PA</td>
                    <td style="width:120px;text-align:center;">17013</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">CAE1</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">4400 12 Street Extension</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">West Columbia</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">SC</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">29172</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">GSP1</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">402 John Dodd Rd</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Spartanburg</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">SC</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">29303</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">CHA1</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">7200 Discovery Drive</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Chattanooga</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">TN</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">37416</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">CHA2</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">225 Infinity Dr NW</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Charleston</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">TN</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">37310</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">BNA1</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">14840 Central Pike Suite 190</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Lebanon</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">TN</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">37090</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">BNA2</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">500 Duke DR</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Franklin</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">TN</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">37067</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">BNA3</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">Joe B Jackson Pkwy</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Murfreesboro</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">TN</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">37127</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">BNA4</td>
                    <td style="width:400px;text-align:center;">50 airways Blvd </td>
                    <td style="width:150px;text-align:center;">Nashville</td>
                    <td style="width:140px;text-align:center;">TN</td>
                    <td style="width:120px;text-align:center;">37217</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">DFW6</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">940 W Bethel Road</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Coppell</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">TX</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">75019</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">SAT1</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">6000 Enterprise Avenue</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">   Schertz</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">TX</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">78154-1461</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">DFW7</td>
                    <td style="width:400px;text-align:center;">700 Westport Parkway </td>
                    <td style="width:150px;text-align:center;">Haslet</td>
                    <td style="width:140px;text-align:center;"><span style="font-size: 14px; text-align: center;">TX</span>
                    </td>
                    <td style="width:120px;text-align:center;">76177</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">DFW8</td>
                    <td style="width:400px;text-align:center;">2700 Regent Blvd </td>
                    <td style="width:150px;text-align:center;">DFW Airport</td>
                    <td style="width:140px;text-align:center;"><span style="font-size: 14px; text-align: center;">TX</span>
                    </td>
                    <td style="width:120px;text-align:center;">75261</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">HOU1</td>
                    <td style="width:400px;text-align:center;">8120 Humble Westfield Rd</td>
                    <td style="width:150px;text-align:center;">Humble</td>
                    <td style="width:140px;text-align:center;"><span style="font-size: 14px; text-align: center;">TX</span>
                    </td>
                    <td style="width:120px;text-align:center;">77338</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">HOU2</td>
                    <td style="width:400px;text-align:center;">10550 Ella Blvd.</td>
                    <td style="width:150px;text-align:center;">Houston</td>
                    <td style="width:140px;text-align:center;">TX</td>
                    <td style="width:120px;text-align:center;">77038-2324</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">HOU3</td>
                    <td style="width:400px;text-align:center;">31555 Highway 90 E</td>
                    <td style="width:150px;text-align:center;">Brookshire</td>
                    <td style="width:140px;text-align:center;">TX</td>
                    <td style="width:120px;text-align:center;">77423</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">XUSB</td>
                    <td style="width:400px;text-align:center;">14900 Frye Rd.</td>
                    <td style="width:150px;text-align:center;">Fort Worth</td>
                    <td style="width:140px;text-align:center;"><span style="font-size: 14px; text-align: center;">TX</span>
                    </td>
                    <td style="width:120px;text-align:center;">76155</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">FTW1</td>
                    <td style="width:400px;text-align:center;"> 33333 LBJ FWY </td>
                    <td style="width:150px;text-align:center;">Dallas </td>
                    <td style="width:140px;text-align:center;"><span style="font-size: 14px; text-align: center;">TX</span>
                    </td>
                    <td style="width:120px;text-align:center;">75241</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">FTW2</td>
                    <td style="width:400px;text-align:center;">2701 West Bethel Road</td>
                    <td style="width:150px;text-align:center;">Coppell</td>
                    <td style="width:140px;text-align:center;"><span style="font-size: 14px; text-align: center;">TX</span>
                    </td>
                    <td style="width:120px;text-align:center;">75019</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">RIC1</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">5000 Commerce Way</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Petersburg</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">VA</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">23803</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">RIC2</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">1901 Meadowville Technology Pkwy</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Chester</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">VA</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">23836</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">RIC3</td>
                    <td style="width:400px;text-align:center;">across the street fm 1901 Meadowville Technology Parkway </td>
                    <td style="width:150px;text-align:center;">Chester</td>
                    <td style="width:140px;text-align:center;">VA </td>
                    <td style="width:120px;text-align:center;">23836</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;"><span style="font-size:14px;">BFI1</span>
                    </td>
                    <td style="width:400px;text-align:center;"><span style="font-size:14px;">1800 140th Avenue E.</span>
                    </td>
                    <td style="width:150px;text-align:center;"><span style="font-size:14px;">Sumner</span>
                    </td>
                    <td style="width:140px;text-align:center;"><span style="font-size:14px;">WA</span>
                    </td>
                    <td style="width:120px;text-align:center;"><span style="font-size:12px;">98390</span>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">BFI3</td>
                    <td style="width:400px;text-align:center;">2700 Center Drive</td>
                    <td style="width:150px;text-align:center;">Dupont</td>
                    <td style="width:140px;text-align:center;">WA</td>
                    <td style="width:120px;text-align:center;">98327-9607</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">BFI4</td>
                    <td style="width:400px;text-align:center;">20529 59th Place South,Kent,WA 98032 United States</td>
                    <td style="width:150px;text-align:center;">Kent</td>
                    <td style="width:140px;text-align:center;">WA</td>
                    <td style="width:120px;text-align:center;">98032</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">BFI5</td>
                    <td style="width:400px;text-align:center;">20526 59th Place South,Kent</td>
                    <td style="width:150px;text-align:center;">King County</td>
                    <td style="width:140px;text-align:center;">WA</td>
                    <td style="width:120px;text-align:center;">98032</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">BFI7</td>
                    <td style="width:400px;text-align:center;">1901 140th Ave E</td>
                    <td style="width:150px;text-align:center;"> Sumner</td>
                    <td style="width:140px;text-align:center;">WA</td>
                    <td style="width:120px;text-align:center;">98390</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">SEA6</td>
                    <td style="width:400px;text-align:center;">2646 Rainier Ave.</td>
                    <td style="width:150px;text-align:center;">South Seattle </td>
                    <td style="width:140px;text-align:center;">WA</td>
                    <td style="width:120px;text-align:center;">98144</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">SEA8</td>
                    <td style="width:400px;text-align:center;">1475 124th Avenue</td>
                    <td style="width:150px;text-align:center;">Northeast Bellevue</td>
                    <td style="width:140px;text-align:center;">WA</td>
                    <td style="width:120px;text-align:center;">98005</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">MKE1</td>
                    <td style="width:400px;text-align:center;">3501 120th Ave,Kenosha,WI 53144</td>
                    <td style="width:150px;text-align:center;">Kenosha</td>
                    <td style="width:140px;text-align:center;">WI</td>
                    <td style="width:120px;text-align:center;">53144</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">ATL6</td>
                    <td style="width:400px;text-align:center;">4200 North Commerce</td>
                    <td style="width:150px;text-align:center;"> East Point</td>
                    <td style="width:140px;text-align:center;">GA</td>
                    <td style="width:120px;text-align:center;">30344</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">MGE3</td>
                    <td style="width:400px;text-align:center;">808 Hog Mountain Road</td>
                    <td style="width:150px;text-align:center;">Jefferson</td>
                    <td style="width:140px;text-align:center;">GA</td>
                    <td style="width:120px;text-align:center;">30549</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">MDW2</td>
                    <td style="width:400px;text-align:center;">250 Emerald</td>
                    <td style="width:150px;text-align:center;">Joliet</td>
                    <td style="width:140px;text-align:center;">IL</td>
                    <td style="width:120px;text-align:center;">60433-3280</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">MDW6</td>
                    <td style="width:400px;text-align:center;">1125 W REMINGTON BLVD ROMEOVILLE</td>
                    <td style="width:150px;text-align:center;">ROMEOVILLE</td>
                    <td style="width:140px;text-align:center;">IL</td>
                    <td style="text-align: center;">60446-6529</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">MDW7</td>
                    <td style="width:400px;text-align:center;">6605 Monee Manhattan Road</td>
                    <td style="width:150px;text-align:center;">Monee</td>
                    <td style="width:140px;text-align:center;">IL</td>
                    <td style="text-align: center;">60449</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">MDW8</td>
                    <td style="width:400px;text-align:center;">1750 Bridge Drive  </td>
                    <td style="width:150px;text-align:center;">Waukegan</td>
                    <td style="width:140px;text-align:center;"><span style="text-align: center;">IL</span>
                    </td>
                    <td style="text-align: center;">60085</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">MDW9</td>
                    <td style="width:400px;text-align:center;">2865 Duke Parkway </td>
                    <td style="width:150px;text-align:center;">Aurora</td>
                    <td style="width:140px;text-align:center;"><span style="text-align: center;">IL</span>
                    </td>
                    <td style="text-align: center;">60502</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">ORD6</td>
                    <td style="width:400px;text-align:center;">1250 N Mittel Blvd</td>
                    <td style="width:150px;text-align:center;">Wood Dale</td>
                    <td style="width:140px;text-align:center;"><span style="text-align: center;">IL</span>
                    </td>
                    <td style="text-align: center;">60191</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">STL4</td>
                    <td style="width:400px;text-align:center;">3050 GATEWAY COMMERCE CENTER DR S</td>
                    <td style="width:150px;text-align:center;">Edwardsville</td>
                    <td style="width:140px;text-align:center;">IL</td>
                    <td style="text-align: center;"> 62025-2815</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">BOS2</td>
                    <td style="width:400px;text-align:center;">1000 Tech Centre</td>
                    <td style="width:150px;text-align:center;">Drive Stoughton </td>
                    <td style="width:140px;text-align:center;">MA</td>
                    <td style="text-align: center;">2072</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">BOS7</td>
                    <td style="width:400px;text-align:center;">1180 Innovation Way</td>
                    <td style="width:150px;text-align:center;">Fall River</td>
                    <td style="width:140px;text-align:center;">MA</td>
                    <td style="text-align: center;">02720</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">CLT2</td>
                    <td style="width:400px;text-align:center;">Am azon.com .dedc LLC 10240 O ld D owd Rd Charlotte, N C 28214-8082 U nited States</td>
                    <td style="width:150px;text-align:center;">Charlotte</td>
                    <td style="width:140px;text-align:center;">NC</td>
                    <td style="text-align: center;">28214-8082</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">MSP1</td>
                    <td style="width:400px;text-align:center;">2601 4th Avenue East </td>
                    <td style="width:150px;text-align:center;">Shakopee</td>
                    <td style="width:140px;text-align:center;">MN</td>
                    <td style="text-align: center;">55379</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">IVSA</td>
                    <td style="width:400px;text-align:center;">4620 Olympic Blvd </td>
                    <td style="width:150px;text-align:center;">Erlanger</td>
                    <td style="width:140px;text-align:center;"> KY</td>
                    <td style="text-align: center;">41018</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">IVSB</td>
                    <td style="width:400px;text-align:center;">3521 POINT PLEASANT RD</td>
                    <td style="width:150px;text-align:center;">HEBRON</td>
                    <td style="width:140px;text-align:center;">KY</td>
                    <td style="text-align: center;">41048</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">BDL2</td>
                    <td style="width:400px;text-align:center;">200 Old Iron Ore Rd</td>
                    <td style="width:150px;text-align:center;">Windsor</td>
                    <td style="width:140px;text-align:center;">CT</td>
                    <td style="text-align: center;">06095-2144</td>
                </tr>
                <tr>
                    <td style="width:120px;text-align:center;">DET1</td>
                    <td style="width:400px;text-align:center;">39000 Amrhein Road </td>
                    <td style="width:150px;text-align:center;">Livonia</td>
                    <td style="width:140px;text-align:center;">MI</td>
                    <td style="text-align: center;">48150</td>
                </tr><tr><td style="width:120px;text-align:center;">ONT7</td><td style="width:400px;text-align:center;">2125 W. San Bernandino Ave.Redlands, CA 92374， Uni</td><td style="width:150px;text-align:center;">Redlands</td><td style="width:140px;text-align:center;">CA</td><td style="text-align: center;">92374</td></tr><tr><td style="width:120px;text-align:center;">LAL1</td><td style="width:400px;text-align:center;">1760 County Line Rd.Lakeland, Florida 33811， Unite</td><td style="width:150px;text-align:center;">Lakeland</td><td style="width:140px;text-align:center;">FL</td><td style="text-align: center;">33811</td></tr><tr><td style="width:120px;text-align:center;">MDW2-250</td><td style="width:400px;text-align:center;">250 Emerald Drive Joliet,IL 60433-3280 United Stat</td><td style="width:150px;text-align:center;">Joliet</td><td style="width:140px;text-align:center;">IL</td><td style="text-align: center;">60433</td></tr><tr><td style="width:120px;text-align:center;">ABE4</td><td style="width:400px;text-align:center;">1610 Van Buren Road, Easton, PA, United States, 18</td><td style="width:150px;text-align:center;">Easton</td><td style="width:140px;text-align:center;">PA</td><td style="text-align: center;">18045</td></tr><tr><td style="width:120px;text-align:center;">SAT2</td><td style="width:400px;text-align:center;">1401 E McCarty Lane San Marcos TX 78666-8969 Unite</td><td style="width:150px;text-align:center;">San Marcos</td><td style="width:140px;text-align:center;">TX</td><td style="text-align: center;">78666</td></tr><tr><td style="width:120px;text-align:center;">LAS6</td><td style="width:400px;text-align:center;">4550 Nexus Way Las Vegas NV 89115,United States</td><td style="width:150px;text-align:center;">Las Vegas</td><td style="width:140px;text-align:center;">NV</td><td style="text-align: center;">89115</td></tr><tr><td style="width:120px;text-align:center;">MDT2</td><td style="width:400px;text-align:center;">600 Principio Parkway West North East, MD 21901-29</td><td style="width:150px;text-align:center;">West North East</td><td style="width:140px;text-align:center;">MD</td><td style="text-align: center;">21901</td></tr><tr><td style="width:120px;text-align:center;">MDW4</td><td style="width:400px;text-align:center;">250 Emetald Drive Joliet, IL 60433-9642 United Sta</td><td style="width:150px;text-align:center;">Joliet</td><td style="width:140px;text-align:center;">IL</td><td style="text-align: center;">60433</td></tr><tr><td style="width:120px;text-align:center;">DEN2</td><td style="width:400px;text-align:center;">22205 East 19th Ave Aurora CO 80019 United States</td><td style="width:150px;text-align:center;">Aurora</td><td style="width:140px;text-align:center;">CO</td><td style="text-align: center;">80019</td></tr><tr><td style="width:120px;text-align:center;">DEN3</td><td style="width:400px;text-align:center;">14601 Grant Street</td><td style="width:150px;text-align:center;">Thornton</td><td style="width:140px;text-align:center;">CO</td><td style="text-align: center;">80023</td></tr><tr><td style="width:120px;text-align:center;">ATL8</td><td style="width:400px;text-align:center;">2201 Thornton Road Lithia Springs GA 30122-3895 Un</td><td style="width:150px;text-align:center;">Lithia Springs</td><td style="width:140px;text-align:center;">GA</td><td style="text-align: center;">30122</td></tr><tr><td style="width:120px;text-align:center;">MDW2-402</td><td style="width:400px;text-align:center;">402 Emerald Drive Joliet,IL 60433-3279 United Stat</td><td style="width:150px;text-align:center;">Joliet</td><td style="width:140px;text-align:center;">IL</td><td style="text-align: center;">60433</td></tr><tr><td style="width:120px;text-align:center;">FTW6</td><td style="width:400px;text-align:center;">2601 W Bethel Road Dallas, TX 75261 United States</td><td style="width:150px;text-align:center;">Dallas</td><td style="width:140px;text-align:center;">TX</td><td style="text-align: center;">75261</td></tr><tr><td style="width:120px;text-align:center;">JAX2</td><td style="width:400px;text-align:center;">12900 Pecan Park Road Jacksonville, FL 32218 Unite</td><td style="width:150px;text-align:center;">Jacksonville</td><td style="width:140px;text-align:center;">FL</td><td style="text-align: center;">32218</td></tr><tr><td style="width:120px;text-align:center;">BWI4</td><td style="width:400px;text-align:center;">165 Business Blvd Clear Brook VA 22624-1568 United</td><td style="width:150px;text-align:center;">Clear Brook</td><td style="width:140px;text-align:center;">VA</td><td style="text-align: center;">22624</td></tr><tr><td style="width:120px;text-align:center;">IVSC</td><td style="width:400px;text-align:center;">Uno - West Deptford 1225 Forest Parkway West Deptf</td><td style="width:150px;text-align:center;">West Deptford</td><td style="width:140px;text-align:center;">NJ</td><td style="text-align: center;">08066</td></tr><tr><td style="width:120px;text-align:center;">IVSD</td><td style="width:400px;text-align:center;">UNO - Swedesboro NJ 800 Arlington Blvd Swedesboro,</td><td style="width:150px;text-align:center;">Swedesboro</td><td style="width:140px;text-align:center;">NJ</td><td style="text-align: center;">08085</td></tr><tr><td style="width:120px;text-align:center;">IVSE</td><td style="width:400px;text-align:center;">2951 MARION DR UNIT 101 LAS VEGAS, NV 89115-3467 United States</td><td style="width:150px;text-align:center;">LAS VEGAS</td><td style="width:140px;text-align:center;">NV</td><td style="text-align: center;">89115</td></tr><tr><td style="width:120px;text-align:center;">IVSF</td><td style="width:400px;text-align:center;">2821 MARION DR STE 109</td><td style="width:150px;text-align:center;">LAS VEGAS</td><td style="width:140px;text-align:center;">NV</td><td style="text-align: center;">89115</td></tr><tr><td style="width:120px;text-align:center;">SMF3</td><td style="width:400px;text-align:center;">&nbsp;SMF3 3923 S B ST Stockton, CA 95206-8202 US&nbsp;</td><td style="width:150px;text-align:center;">Stockton&nbsp;</td><td style="width:140px;text-align:center;">CA</td><td style="text-align: center;">95206-8202</td></tr><tr><td style="width:120px;text-align:center;">ITX1</td><td style="width:400px;text-align:center;">9851 Fallbrook Pines Drive Suite 100 Houston, TX 77064-3329</td><td style="width:150px;text-align:center;">Houston</td><td style="width:140px;text-align:center;">TX</td><td style="text-align: center;">77064</td></tr><tr><td style="width:120px;text-align:center;">ITX2</td><td style="width:400px;text-align:center;">6911 FAIRBANKS N HOUSTON RD SUITE 160 Houston, TX 77040-1437 United States</td><td style="width:150px;text-align:center;">Houston</td><td style="width:140px;text-align:center;">TX</td><td style="text-align: center;">77040</td></tr><tr><td style="width:120px;text-align:center;">DTW1</td><td style="width:400px;text-align:center;">32801 Ecorse Road,Romulus,48174 MI,United States</td><td style="width:150px;text-align:center;">Romulus</td><td style="width:140px;text-align:center;">MI</td><td style="text-align: center;">48174</td></tr><tr><td style="width:120px;text-align:center;">CMH1-11999</td><td style="width:400px;text-align:center;">11999 National Road SW Etna, OH 43062-7793 United States</td><td style="width:150px;text-align:center;">Etna</td><td style="width:140px;text-align:center;">OH</td><td style="text-align: center;">43062</td></tr><tr><td style="width:120px;text-align:center;">FAT1</td><td style="width:400px;text-align:center;">3575 S. Orange Ave.Fresno, CA 93725-9588 United States</td><td style="width:150px;text-align:center;">Fresno</td><td style="width:140px;text-align:center;">CA</td><td style="text-align: center;">93725</td></tr><tr><td style="width:120px;text-align:center;">PDX9</td><td style="width:400px;text-align:center;">1250 NW Swigert Way Troutdale, OR 97060 United States</td><td style="width:150px;text-align:center;">Troutdale</td><td style="width:140px;text-align:center;">OR</td><td style="text-align: center;">97060</td></tr><tr><td style="width:120px;text-align:center;">CLT3</td><td style="width:400px;text-align:center;">6500 Davidson Hwy Concord NC 28027-7995 United States</td><td style="width:150px;text-align:center;">Concord</td><td style="width:140px;text-align:center;">NC</td><td style="text-align: center;">28027</td></tr><tr><td style="width:120px;text-align:center;">ACY1</td><td style="width:400px;text-align:center;">240 Mantua Grove Road</td><td style="width:150px;text-align:center;">West Deptford</td><td style="width:140px;text-align:center;">NJ</td><td style="text-align: center;">08066</td></tr><tr><td style="width:120px;text-align:center;">JFK8</td><td style="width:400px;text-align:center;">546 Gulf Avenue</td><td style="width:150px;text-align:center;">Staten Island</td><td style="width:140px;text-align:center;">NY</td><td style="text-align: center;">10314</td></tr><tr><td style="width:120px;text-align:center;">LGA9</td><td style="width:400px;text-align:center;">2170 Route 27</td><td style="width:150px;text-align:center;">Edison</td><td style="width:140px;text-align:center;">NJ</td><td style="text-align: center;">08817</td></tr><tr><td style="width:120px;text-align:center;">MCO1</td><td style="width:400px;text-align:center;">12340 Boggy Creek Rd</td><td style="width:150px;text-align:center;">Orlando</td><td style="width:140px;text-align:center;">FL</td><td style="text-align: center;">32824</td></tr><tr><td style="width:120px;text-align:center;">MEM1</td><td style="width:400px;text-align:center;">3292 E Holmes Rd</td><td style="width:150px;text-align:center;">Memphis</td><td style="width:140px;text-align:center;">TN</td><td style="text-align: center;">38118</td></tr><tr><td style="width:120px;text-align:center;">DCA1</td><td style="width:400px;text-align:center;">1700 Sparrows Point Boulevard</td><td style="width:150px;text-align:center;">Sparrows Point</td><td style="width:140px;text-align:center;">MD</td><td style="text-align: center;">21219</td></tr><tr><td style="width:120px;text-align:center;">SJC8</td><td style="width:400px;text-align:center;">46724 Lakeview Blvd</td><td style="width:150px;text-align:center;">Fremont&nbsp;</td><td style="width:140px;text-align:center;">CA</td><td style="text-align: center;">94538</td></tr><tr><td style="width:120px;text-align:center;">DET2</td><td style="width:400px;text-align:center;">50500 M ound Rd</td><td style="width:150px;text-align:center;">Shelby Township</td><td style="width:140px;text-align:center;">MI</td><td style="text-align: center;">48317-1318</td></tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>