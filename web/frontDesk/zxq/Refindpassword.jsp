<%--
  Created by IntelliJ IDEA.
  User: zengxiongqiang
  Date: 2019/10/27
  Time: 14:09
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="http://code.jquery.com/jquery-1.12.3.min.js"></script>

    <script src="ajax.js"></script>
    <style>
        html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video, select{margin: 0;padding: 0;border: 0;}

        table{ border-collapse:collapse;}

        body{font-size:12px;color:#333; font-family:"Microsoft Yahei"; overflow-x:hidden; background:#f7f7f7;}

        .bodybg{ background:url(../images/bodybg.jpg) right 160px no-repeat;}

        img,a{border:0; text-decoration:none;}

        ol, ul {list-style: none; }

        a{color:#333;-webkit-transition: all .3s ease-out;-moz-transition: all .3s ease-out;transition: all .3s ease-out;}

        a:hover{color:#005b9e;-webkit-transition: all .3s ease-out;-moz-transition: all .3s ease-out;transition: all .3s ease-out;}

        img{ max-width:100%; height:auto;}

        .web-width{width:1200px;margin:0 auto;}

        .fl{float:left;}

        .fr{float:right;}





    /*    _____________________________________________*/
        .clears{clear:both}
        .for-liucheng{width:640px;margin:30px auto;height:50px;padding:20px 0 0 0;position:relative}
        .liulist{float:left;width:25%;height:7px;background:#ccc}
        .liutextbox{position:absolute;width:100%;left:0;top:10px}
        .liutextbox .liutext{float:left;width:25%;text-align:center}
        .liutextbox .liutext em{display:inline-block;width:24px;height:24px;-moz-border-radius:24px;-webkit-border-radius:24px;border-radius:24px;background:#ccc;text-align:center;font-size:14px;line-height:24px;font-style:normal;font-weight:bold;color:#fff}
        .liutextbox .liutext strong{display:inline-block;height:26px;line-height:26px;font-weight:400}
        .liulist.for-cur{background:#77b852}
        .liutextbox .for-cur em{background:#77b852}
        .liutextbox .for-cur strong{color:#77b852}
        .forget-pwd{width:500px;margin:20px auto;min-height:400px}
        .forget-pwd input,.forget-pwd select,.forget-pwd button{border:0;margin:0;padding:0;background:0}
        .forget-pwd dl{margin-bottom:20px}
        .forget-pwd dt{float:left;padding-right:10px;width:100px;height:30px;line-height:30px;text-align:right;font-size:14px}
        .forget-pwd dd{float:left;width:380px;height:30px;position:relative}
        .forget-pwd dd input{width:190px;height:28px;border:#ccc 1px solid}
        .forget-pwd dd select{width:190px;height:30px;border:#ccc 1px solid}
        .forget-pwd dd button{width:120px;height:30px;line-height:30px;border:#ddd 1px solid;background:#f1f1f1;text-align:center;cursor:pointer;font-size:14px;color:#666}
        .forget-pwd .yanzma{position:absolute;left:200px;top:2px;height:30px;line-height:30px;width:180px}
        .subtijiao{padding:0 0 0 110px}
        .subtijiao input{width:85px;height:32px;background:#f60;color:#fff;font-size:14px;cursor:pointer}
        .successs{text-align:center;padding:20px 0 60px 0}
        .successs h3{padding:20px;font-size:25px;color:#a0cd4e}
    </style>
</head>
<body>


<div class="content">

    <div class="web-width">

        <div class="for-liucheng">

            <div class="liulist for-cur"></div>

            <div class="liulist"></div>

            <div class="liulist"></div>

            <div class="liulist"></div>

            <div class="liutextbox">

                <div class="liutext for-cur"><em>1</em><br />

                    <strong>填写账户名</strong></div>

                <div class="liutext"><em>2</em><br />

                    <strong>验证身份</strong></div>

                <div class="liutext"><em>3</em><br />

                    <strong>设置新密码</strong></div>

                <div class="liutext"><em>4</em><br />

                    <strong>完成</strong></div>

            </div>

        </div>

        <form action="findpassword.user" method="post" class="registerForm">

            <table  width="80%" align="center" border="2" cellpadding="0"
                    cellspacing="0" height="50">

                <tr>
                    <td>账户名：</td>
                    <td><input type="text" name="name"></td>

                </tr>
                <tr></tr>
                <%--获取的验证操作----------------------------------------------------------------%>

                <tr id="choose2">
                    <td> 获取验证码：</td>
                    <td> <label><input type="radio" name="choose" id="choose1" value="yes">使用已保存的邮箱</label></td>
                    <td>  <label><input type="radio" name="choose" id="choose"  value="no">另用新的邮箱</label></td>
                </tr>

<%--                //获得Email--%>
                <tr id="newemail" style="display: none">
                    <td>
                        邮箱账号
                    </td>
                    <td>
                        <input type="text" name="email">
                    </td>

                </tr>

                <tr id="submitemail" style="display: none">
                    <td>
                       <a href="javascrpt: emailsubmit()">获取验证码</a>
                    </td>
                </tr>
<%--进行验证操作----------------------------------------------------------------%>
                <tr id="yanzheng" style="display: none">
                    <td>
                        请输入验证码：
                    </td>
                    <td>
                        <input type="text" name="yanzheng">
                    </td>
                </tr>
                
                <tr id="yanzheng" style="display: none">
                    <td>
                        <a href="javascrpt: yanzheng()">进行验证*****</a>
                    </td>

                </tr>

<%--                重置密码--%>
                <tr id="pass" style="display: none">
                    <td >登陆密码</td>
                    <td ><input id="password" name="password" type="password"  placeholder="设置你的登陆密码" > </td>
                </tr>
                <tr id="pass" style="display: none">
                    <td >密码确认</td>
                    <td ><input id="repeatpassword" type="password"   placeholder="请再次输入你的密码" > </td>
                </tr>

                <tr>
                    <td>
                        <input type="submit" value="提交">
                    </td>
                </tr>
            </table>

        </form>

<script>
    $(function () {
        //获取、提交Email账号
        $("#choose").click(function () {

            $("#newemail").css("display","block");
            $("#submitemail").css("display","block");
        })

        $("#choose1").click(function () {

            $("#submitemail").css("display","block");
        })
        //-----------------------检查两次密码是否一样-----------------------------------------
        $(".registerForm").submit(function(){

            if($("#password").val() !=$("#repeatpassword").val()){
                alert("重复密码不一致");
                // $("span.errorMessage").html("");
                // $("div.registerErrorMessageDiv").css("visibility","visible");
                return false;
            }

            return true;
        });
    });

</script>
<script>
    function emailsubmit() {
        var choose = ${choose}
       $ajax({
           url:"sendemail.user",
           type:"post",
           data:{
               choose:${choose},
               email:${email},
           },
           success:function (data) {
               alert("验证码已发送！");
               $("#newemail").css("display","none");
               $("#submitemail").css("display","none");
               $("#choose2").css("display","none");
               
               
               $("#yanzheng").css("display","block");

           },
           error:function (error) {
               alert("error");

           }
       })
    }
    
    function yanzheng() {
        $ajax({
            url:"yanzheng.user",
            type:"post",
            data:{
                yanzheng:${yanzheng}
            },
            success:function (data) {
                if (data.eq("no")) {
                    alert("验证码不正确");
                }else{
                    alert("验证成功，请设置新的密码");
                    $("#yanzheng").css("display","none");
                    $("#pass").css("display","block");

                }

            },
            error:function (error) {
                alert(error);

            }
        })

        
    }
    
    
</script>
      

    </div>

</div>

</body>
</html>
