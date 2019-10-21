<%--
  Created by IntelliJ IDEA.
  User: Hasee
  Date: 2019/10/19
  Time: 18:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://unpkg.com/ionicons@4.2.2/dist/ionicons.js"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div class="container" id="container">
    <div class="form-container sign-up-container">
        <form action="reg.tm">
            <h1>注册</h1>
            <input type="text" placeholder="用户名">
            <input type="password" placeholder="密码">
            <button onclick="">注册</button>
        </form>
    </div>
    <div class="form-container sign-in-container">
        <form action="login.tm">
            <h1>登录</h1>
            <input type="text" placeholder="用户名" name="logname">
            <input type="password" placeholder="密码" name="logpassword">
            <button>登录</button>
        </form>
    </div>
    <div class="overlay-container">
        <div class="overlay">
            <div class="overlay-panel overlay-left">
                <h1>欢迎回来</h1>
                <p>与我们保持联系请登录您的个人信息</p>
                <button class="ghost" id="signIn">登录</button>
            </div>
            <div class="overlay-panel overlay-right">
                <h1>欢迎光临</h1>
                <p>输入您的个人资料，并与我们一起开始旅程</p>
                <button class="ghost" id="signUp">注册</button>
            </div>
        </div>
    </div>
</div>
<script  src="css/script.js"></script>
</body>
</html>
