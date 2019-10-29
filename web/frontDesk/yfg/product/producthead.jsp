<%--
  Created by IntelliJ IDEA.
  User: Lost-Figo
  Date: 2019/10/26
  Time: 16:20
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

    <script src="<%=basePath %>js/jquery/2.0.0/jquery.min.js"></script>
    <link href="<%=basePath %>css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="<%=basePath %>js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href="<%=basePath %>css/fore/style.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/cssreset-min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/tm.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/iconfont.css">

    <script src="<%=basePath %>js/jquery-2.1.0.js" type="text/javascript" charset="utf-8"></script>
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="<%=basePath %>js/tm.js" type="text/javascript" charset="utf-8"></script>
    <script>
        window.onload = function(){
            //lb();//轮播图程序
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

        function formatMoney(num){
            num = num.toString().replace(/\$|\,/g,'');
            if(isNaN(num))
                num = "0";
            sign = (num == (num = Math.abs(num)));
            num = Math.floor(num*100+0.50000000001);
            cents = num%100;
            num = Math.floor(num/100).toString();
            if(cents<10)
                cents = "0" + cents;
            for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
                num = num.substring(0,num.length-(4*i+3))+','+
                    num.substring(num.length-(4*i+3));
            return (((sign)?'':'-') + num + '.' + cents);
        }
        function checkEmpty(id, name){
            var value = $("#"+id).val();
            if(value.length==0){

                $("#"+id)[0].focus();
                return false;
            }
            return true;
        }


        $(function(){


            $("a.productDetailTopReviewLink").click(function(){
                $("div.productReviewDiv").show();
                $("div.productDetailDiv").hide();
            });
            $("a.productReviewTopPartSelectedLink").click(function(){
                $("div.productReviewDiv").hide();
                $("div.productDetailDiv").show();
            });

            $("span.leaveMessageTextareaSpan").hide();
            $("img.leaveMessageImg").click(function(){

                $(this).hide();
                $("span.leaveMessageTextareaSpan").show();
                $("div.orderItemSumDiv").css("height","100px");
            });

            $("div#footer a[href$=#nowhere]").click(function(){
                alert("模仿天猫的连接，并没有跳转到实际的页面");
            });


            $("a.wangwanglink").click(function(){
                alert("模仿旺旺的图标，并不会打开旺旺");
            });
            $("a.notImplementLink").click(function(){
                alert("这个功能没做，蛤蛤~");
            });


        });

    </script>
</head>

<body>

