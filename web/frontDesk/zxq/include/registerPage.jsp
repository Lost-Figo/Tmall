<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<script src="http://code.jquery.com/jquery-1.12.3.min.js"></script>
<!-- 引入封装了failback的接口--initGeetest -->
<script src="gt.js"></script>



<script>


$(function(){
	
	<c:if test="${!empty msg}">
	$("span.errorMessage").html("${msg}");
	$("div.registerErrorMessageDiv").css("visibility","visible");		
	</c:if>
	
	$(".registerForm").submit(function(){
		if(0==$("#name").val().length){
			$("span.errorMessage").html("请输入用户名");
			$("div.registerErrorMessageDiv").css("visibility","visible");			
			return false;
		}		
		if(0==$("#password").val().length){
			$("span.errorMessage").html("请输入密码");
			$("div.registerErrorMessageDiv").css("visibility","visible");			
			return false;
		}		
		if(0==$("#repeatpassword").val().length){
			$("span.errorMessage").html("请输入重复密码");
			$("div.registerErrorMessageDiv").css("visibility","visible");			
			return false;
		}		
		if($("#password").val() !=$("#repeatpassword").val()){
			$("span.errorMessage").html("重复密码不一致");
			$("div.registerErrorMessageDiv").css("visibility","visible");			
			return false;
		}		

		return true;
	});
})
	//ajax验证用户名是否已存在
	function checkname( name) {
	$ajax({
		url:"checkname.user",
		type:"get",
		data:{
			name:name
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


//	图形验证码，防止机器恶意注册
</script>



<form method="post" action="reg.user" class="registerForm">


<div class="registerDiv">
	<div class="registerErrorMessageDiv">
		<div class="alert alert-danger" role="alert">
		  <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
		  	<span class="errorMessage"></span>
		</div>
	</div>


	<table class="registerTable" align="center">

		<tr>
			<td class="registerTableLeftTD">登陆名</td>
			<td  class="registerTableRightTD"><input id="name" name="name" onblur="checkname(this.value)" placeholder="会员名一旦设置成功，无法修改" > </td>
		</tr>
		<tr>
			<td class="registerTableLeftTD">登陆密码</td>
			<td class="registerTableRightTD"><input id="password" name="password" type="password"  placeholder="设置你的登陆密码" > </td>
		</tr>
		<tr>
			<td class="registerTableLeftTD">密码确认</td>
			<td class="registerTableRightTD"><input id="repeatpassword" type="password"   placeholder="请再次输入你的密码" > </td>
		</tr>

		<tr>
			<td colspan="2" class="registerButtonTD">
<%--				<a href="../registerSuccess.jsp"><button>提   交</button></a>--%>
	<input class="btn" id="popup-submit" type="submit" value="提交">
			</td>
		</tr>
	</table>
</div>
</form>



