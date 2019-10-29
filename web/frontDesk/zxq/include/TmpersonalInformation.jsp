<%--
  Created by IntelliJ IDEA.
  User: zengxiongqiang
  Date: 2019/10/25
  Time: 19:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>


<script>
    $(function(){

        <c:if test="${!empty msg}">
        $("span.errorMessage").html("${msg}");
        $("div.registerErrorMessageDiv").css("visibility","visible");
        </c:if>

        $(".registerForm").submit(function(){
            if(0==$("#name").val().length){
                $("span.errorMessage").html("请输入昵称");
                $("div.registerErrorMessageDiv").css("visibility","visible");
                return false;
            }
            if(0==$("#email").val().length){
                $("span.errorMessage").html("请输入email账号");
                $("div.registerErrorMessageDiv").css("visibility","visible");
                return false;
            }
            if(0==$("#phone").val().length){
                $("span.errorMessage").html("请输电话号码");
                $("div.registerErrorMessageDiv").css("visibility","visible");
                return false;
            }
            // if($("#password").val() !=$("#repeatpassword").val()){
            //     $("span.errorMessage").html("重复密码不一致");
            //     $("div.registerErrorMessageDiv").css("visibility","visible");
            //     return false;
            // }

            return true;
        });
    })
    //ajax验证用户名是否已存在
    function checkname( name) {
        $ajax({
            url:"checkname.user",
            type:"get",
            data:{
                username:name
            },
            success:function(data){
                document.getElementById("name").innerText = data.substring(3,data.length);
            },
            error:function(error){
                $("span.errorMessage").html(error);
                $("div.registerErrorMessageDiv").css("visibility","visible");

            }
        });
    }
</script>

<form action="addInfo.Info" method="post"  class="registerForm">


    <table style="border: 1px;margin: 0 auto;background: snow" width="50%" cellpadding="5" cellspacing="0" >
<%--        <tr>头像--%>
<%--            <td>--%>
<%--                <input type="text" name="headimg">--%>
<%--            </td>--%>
<%--        </tr>--%>

        <tr>

            <td style="background: salmon">昵称</td>

            <td><input name="name" id="name" type="text" style="width:95%"></td>

            <td>性别</td>

            <td><select id="sex" name="sex" style="width: 96%">

                <option value="男">男</option>

                <option value="女">女</option>

            </select></td>

        </tr>

        <tr>

            <td>手机号码</td>

            <td><input name="phone" id="phone" type="tel" style="width:95%"></td>

            <td>电子邮箱</td>

            <td><input name="email" id="email" type="email" style="width:95%"></td>

        </tr>


        <tr>

            <td>个性签名</td>

            <td colspan="3"><input name="signature" type="text" style="width: 98%; " ></td>

        </tr>

        <tr>

            <td>特长</td>

            <td colspan="3"><input name="kind" type="text" style="width: 98%; " ></td>

        </tr>

        <tr>

            <td>家庭住址</td>

            <td colspan="3"><input name="homedress" type="text" style="width: 98%; " ></td>

        </tr>


        <tr>

            <td colspan="4" align="center">

                <input type="submit" value="提交">

            </td>

        </tr>


    </table>



</form>



