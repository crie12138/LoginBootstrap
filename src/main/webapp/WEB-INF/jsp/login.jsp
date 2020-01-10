<%--
  Created by IntelliJ IDEA.
  User: Luo Shijie
  Date: 2019/12/29
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<base href="<%=basePath%>"/>
<html>
<head>
<%--    <meta charset="UTF-8">--%>
    <title>登录</title>
<%--    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">--%>
    <link rel="stylesheet" href="../../static/css/login.css">

    <script src="../../static/js/jquery-3.4.1.min.js"></script>
    <script src="../../static/js/login.js"></script>
</head>
<body>
<div class="contain">
    <!--        头部-->
    <div class="logintop">

    </div>

    <!--            中部-->
    <div class="loginmid">
        <div class="logindiv">
            <form id="loginform" name="loginform" class="loginform" method="post">
                <ul>
                    <li>
                        <input name="username" type="text" class="loginuser" value="" placeholder="输入账号" maxlength="100" id="username">
<%--                        <span id="nameReg"></span>--%>
                    </li>
                    <li>
                        <input name="password" type="password" class="loginpwd" value="" placeholder="输入密码" id="password">
<%--                        <span id="passReg"></span>--%>
                    </li>
                    <li>
<%--                        <button class="loginbtn"  id="btnRtSubmit" onclick="index()">登录</button>--%>
                        <input name="btnRtSubmit" type="submit" class="loginbtn" id="btnRtSubmit" value="登录">
                    </li>
                </ul>
            </form>
        </div>
    </div>

    <!--        底部-->
    <div class="loginbot">
        版权所有
    </div>
</div>

</body>
</html>
