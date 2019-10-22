<%--
  Created by IntelliJ IDEA.
  User: Lost-Figo
  Date: 2019/10/21
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title>天猫首页</title>

    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://"
                + request.getServerName() + ":" + request.getServerPort()
                + path + "/frontDesk/yfg/";
    %>



    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/cssreset-min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/tm.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/iconfont.css">

    <script src="<%=basePath %>js/jquery-2.1.0.js" type="text/javascript" charset="utf-8"></script>
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="<%=basePath %>js/tm.js" type="text/javascript" charset="utf-8"></script>
    <script>
        window.onload = function(){
            lb();//轮播图程序
            //xlb();//小轮播图程序
            tcdhl();//弹出导航 左侧的
            xllb("xl1");//顶条下拉列表1234
            xllb("xl2");
            xllb("xl3");
            xllb("xl4");
            cllb("cedh");//侧拉导航内容程序
            ssk("sss","ssk");//搜索框程序1 2
            ssk("sss2","ssk2");
        }
        // function xllb(id){
        //     var oId = document.getElementById(id);
        //     var oDdd = oId.getElementsByTagName("div")[0];
        //     oId.onmouseenter = function(){
        //         oId.className = "libg";
        //         oDdd.style.display = "block";
        //         oDdd.style.zIndex = "99";
        //     }
        //     oId.onmouseleave = function(){
        //         oId.className = " ";
        //         oDdd.style.display = "none";
        //         oDdd.style.zIndex = "0";
        //     }
        // }
    </script>
</head>

<body>
