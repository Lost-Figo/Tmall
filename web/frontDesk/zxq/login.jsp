<%--
  Created by IntelliJ IDEA.
  User: zengxiongqiang
  Date: 2019/10/20
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <title>Title</title>

    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    <link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="../../js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href="css/fore/style.css" rel="stylesheet">
    <script>

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


<script>
    $(function(){

        <c:if test="${!empty msg}">
        $("span.errorMessage").html("${msg}");
        $("div.loginErrorMessageDiv").show();
        </c:if>

        $("form.loginForm").submit(function(){
            if(0==$("#name").val().length||0==$("#password").val().length){
                $("span.errorMessage").html("请输入账号密码");
                $("div.loginErrorMessageDiv").show();
                return false;
            }
            return true;
        });

        $("form.loginForm input").keyup(function(){
            $("div.loginErrorMessageDiv").hide();
        });



        var left = window.innerWidth/2+162;
        $("div.loginSmallDiv").css("left",left);
    })
</script>


<div id="loginDiv" style="position: relative">

    <div class="simpleLogo">
        <a href="${contextPath}"><img src="img/site/simpleLogo.png"></a>
    </div>


    <img id="loginBackgroundImg" class="loginBackgroundImg" src="img/site/loginBackground.png">

    <form class="loginForm" action="login.user" method="post">
        <div id="loginSmallDiv" class="loginSmallDiv">
            <div class="loginErrorMessageDiv">
                <div class="alert alert-danger" >
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
                    <span class="errorMessage"></span>
                </div>
            </div>

            <div class="login_acount_text">账户登录</div>
            <div class="loginInput " >
				<span class="loginInputIcon ">
					<span class=" glyphicon glyphicon-user"></span>
				</span>
                <input id="name" name="name" placeholder="手机/会员名/邮箱" type="text">
            </div>

            <div class="loginInput " >
				<span class="loginInputIcon ">
					<span class=" glyphicon glyphicon-lock"></span>
				</span>
                <input id="password" name="password" type="password" placeholder="密码" type="text">
            </div>
            <span class="text-danger">不要输入真实的天猫账号密码</span><br><br>


            <div>
                <a class="notImplementLink" href="Refindpassword.jsp">忘记登录密码</a>
                <a href="register.jsp" class="pull-right">免费注册</a>
            </div>
            <div style="margin-top:20px">
                <button class="btn btn-block redButton" type="submit">登录</button>
            </div>
        </div>
    </form>


</div>
<%--********************************************************************************************************--%>
<div class="modal " id="loginModal" tabindex="-1" role="dialog" >
    <div class="modal-dialog loginDivInProductPageModalDiv">
        <div class="modal-content">
            <div class="loginDivInProductPage">
                <div class="loginErrorMessageDiv">
                    <div class="alert alert-danger" >
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
                        <span class="errorMessage"></span>
                    </div>
                </div>

                <div class="login_acount_text">账户登录</div>
                <div class="loginInput " >
							<span class="loginInputIcon ">
								<span class=" glyphicon glyphicon-user"></span>
							</span>
                    <input id="name" name="name" placeholder="手机/会员名/邮箱" type="text">
                </div>

                <div class="loginInput " >
							<span class="loginInputIcon ">
								<span class=" glyphicon glyphicon-lock"></span>
							</span>
                    <input id="password" name="password"  type="password" placeholder="密码" type="text">
                </div>
                <span class="text-danger">不要输入真实的天猫账号密码</span><br><br>
                <div>
                    <a href="#nowhere">忘记登录密码</a>
                    <a href="register.jsp" class="pull-right">免费注册</a>
                </div>
                <div style="margin-top:20px">
                    <button class="btn btn-block redButton loginSubmitButton" type="submit">登录</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="deleteConfirmModal" tabindex="-1" role="dialog" >
    <div class="modal-dialog deleteConfirmModalDiv">
        <div class="modal-content">
            <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">确认删除？</h4>
            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
                <button class="btn btn-primary deleteConfirmButton" id="submit" type="button">确认</button>
            </div>
        </div>
    </div>
</div>
</div>
<%--************************************************************************************************--%>
<div id="footer"  class="footer" style="display: block;">

    <div id="footer_ensure" class="footer_ensure">
        <a href="#nowhere">
            <img src="img/site/ensure.png">
        </a>
    </div>

    <div id="footer_desc" class="footer_desc">
        <div class="descColumn">
            <span class="descColumnTitle">购物指南</span>
            <a href="#nowhere" >免费注册</a>
            <a href="#nowhere" >开通支付宝</a>
            <a href="#nowhere" >支付宝充值</a>
        </div>
        <div class="descColumn">
            <span class="descColumnTitle">天猫保障</span>
            <a href="#nowhere" >发票保障</a>
            <a href="#nowhere" >售后规则</a>
            <a href="#nowhere" >缺货赔付</a>
        </div>
        <div class="descColumn">
            <span class="descColumnTitle">支付方式</span>
            <a href="#nowhere" >快捷支付</a>
            <a href="#nowhere" >信用卡</a>
            <a href="#nowhere" >蚂蚁花呗</a>
            <a href="#nowhere" >货到付款</a>
        </div>
        <div class="descColumn">
            <span class="descColumnTitle">商家服务</span>
            <a href="#nowhere" >商家入驻</a>
            <a href="#nowhere" >商家中心</a>
            <a href="#nowhere" >天猫智库</a>
            <a href="#nowhere" >天猫规则</a>
            <a href="#nowhere" >物流服务</a>
            <a href="#nowhere" >喵言喵语</a>
            <a href="#nowhere" >运营服务</a>
        </div>
        <div class="descColumn">
            <span class="descColumnTitle">手机天猫</span>
            <a href="#nowhere" ><img src="img/site/ma.png"></a>
        </div>

    </div>

    <div style="clear:both"></div>

    <img id="cateye" class="cateye" src="img/site/cateye.png">

    <div id="copyright" class="copyright">
        <div class="white_link" >
            <a href="#nowhere" >关于天猫</a>
            <a href="#nowhere" > 帮助中心</a>
            <a href="#nowhere" >开放平台</a>
            <a href="#nowhere" >  诚聘英才</a>
            <a href="#nowhere" >联系我们</a>
            <a href="#nowhere" >网站合作</a>
            <a href="#nowhere" >法律声明</a>
            <a href="#nowhere" >知识产权</a>
            <a href="#nowhere" >  廉正举报	</a>
        </div>
        <div class="white_link" >
            <a href="#nowhere" > 阿里巴巴集团</a><span class="slash">|</span>
            <a href="#nowhere" > 淘宝网</a><span class="slash">|</span>
            <a href="#nowhere" >天猫 </a><span class="slash">|</span>
            <a href="#nowhere" >  聚划算</a><span class="slash">|</span>
            <a href="#nowhere" >全球速卖通</a><span class="slash">|</span>
            <a href="#nowhere" >阿里巴巴国际交易市场</a><span class="slash">|</span>
            <a href="#nowhere" >1688</a><span class="slash">|</span>
            <a href="#nowhere" >阿里妈妈</a><span class="slash">|</span>
            <a href="#nowhere" >  阿里旅行·去啊	</a><span class="slash">|</span>
            <a href="#nowhere" >  阿里云计算	</a><span class="slash">|</span>
            <a href="#nowhere" >  阿里通信 	</a><span class="slash">|</span>
            <a href="#nowhere" >  YunOS	</a><span class="slash">|</span>
            <a href="#nowhere" >  阿里旅行·去啊	</a><span class="slash">|</span>
            <a href="#nowhere" >   万网	</a><span class="slash">|</span>
            <a href="#nowhere" >  高德	</a><span class="slash">|</span>
            <a href="#nowhere" > 优视 	</a><span class="slash">|</span>
            <a href="#nowhere" >  友盟	</a><span class="slash">|</span>
            <a href="#nowhere" >  虾米	</a><span class="slash">|</span>
            <a href="#nowhere" >  天天动听	</a><span class="slash">|</span>
            <a href="#nowhere" >  来往	</a><span class="slash">|</span>
            <a href="#nowhere" >  钉钉	</a><span class="slash">|</span>
            <a href="#nowhere" >  支付宝 		</a>
        </div>

        <div class="license">
            <span>增值电信业务经营许可证： 浙B2-20110446</span>
            <span>网络文化经营许可证：浙网文[2015]0295-065号</span>
            <span>互联网医疗保健信息服务 审核同意书 浙卫网审【2014】6号 </span>
            <span>互联网药品信息服务资质证书编号：浙-（经营性）-2012-0005</span>
            <div class="copyRightYear">&copy; 2003-2016 TMALL.COM 版权所有</div>
            <div>
                <img src="img/site/copyRight1.jpg">
                <img src="img/site/copyRight2.jpg">
            </div>
        </div>
    </div>
</div>

</body>
</html>
