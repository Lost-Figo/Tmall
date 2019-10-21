<%--
  Created by IntelliJ IDEA.
  User: Lost-Figo
  Date: 2019/10/20
  Time: 14:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>天猫购物商城</title>
    <link rel="stylesheet" type="text/css" href="F:\IDEAworkplace\Tmall\web\frontDesk\css\cssreset-min.css">
    <link rel="stylesheet" type="text/css" href="F:\IDEAworkplace\Tmall\web\frontDesk\css\tm.css"/>
    <link rel="stylesheet" type="text/css" href="F:\IDEAworkplace\Tmall\web\frontDesk\css\iconfont.css">

    <script src="js/jquery-2.1.0.js" type="text/javascript" charset="utf-8"></script>
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="js/tm.js" type="text/javascript" charset="utf-8"></script>

</head>
<body>
<!--左侧弹出导航-->
<div class="fldh-wai" id="fldh-wai">
    <div id="fldh-nr">
        <dl class="fldh-dl">
            <dt>导航</dt>
            <dd><div>美丽人生</div></dd>
            <dd><div>潮店酷玩</div></dd>
            <dd><div>居家生活</div></dd>
            <dd><div>打造爱巢</div></dd>
            <dd><div>户外出行</div></dd>
            <dd><div>亲子时光</div></dd>
            <dd><div>猜你喜欢</div></dd>
        </dl>
        <div class="h-ding"><i class="iconfont">&#xe66c;</i>顶部</div>
    </div>
</div>
<!--左侧弹出导航结束-->
<!--右侧固定栏 s-->
<div class="yout">
    <div class="yout-1">
        <div>
            <img src="img/aaa.png"/>
            <div class="you-tan">会员权益<div class="sanjiao">◆</div></div>
        </div>
        <div class="gouwu"><i class="iconfont">&#xe607;</i><p>购物车</p></div>
        <div><img src="img/dddddddd.png"/><div class="you-tan">会员权益<div class="sanjiao">◆</div></div></div>
        <div><img src="img/eeeeeeeee.png"/><div class="you-tan">会员权益<div class="sanjiao">◆</div></div></div>
        <div><img src="img/ffffffff.png"/><div class="you-tan">会员权益<div class="sanjiao">◆</div></div></div>
        <div><img src="img/gggggggggg.png"/><div class="you-tan">会员权益<div class="sanjiao">◆</div></div></div>
        <div><img src="img/cccccccc.png"/><div class="you-tan">会员权益<div class="sanjiao">◆</div></div></div>
    </div>
</div>
<!--右侧固定栏 e-->
<!--顶部弹出的搜索框 s-->
<div class="hong-sou">
    <div class="ss-div qingchu">
        <form class="qingchu" id="sss2">
            <label for="ssk" style="color: rgb(102,102,102);">不会买错的化妆品</label>
            <input type="text" name="ssk" id="ssk2" onchange="change()" placeholder=" "/>
            <button type="submit">搜索</button>
        </form>
    </div>
</div>
<!--顶部弹出的搜索框 e-->
<div class="toubu">
    <!--活动顶部入口s-->
    <div class="" style="min-width:1260px;height:80px;background:#354b3e;text-align: center;">
        <a href=""><img src="img/TB1188XQVXXXXX2XVXXSutbFXXX.jpg"/></a>
    </div>
    <!--活动顶部入口e-->
    <!-- 头部顶部导航 s -->
    <div class="top">
        <div class="w1230 top1 qingchu">
            <div class="left"><!--字体偏右 因为原网页块定位左移动15px -->
                <em>喵，欢迎来天猫</em>
                <a href="">请登录</a>
                <a href="">免费注册</a>
            </div>
            <div class="right">
                <ul class="top-r">
                    <li class="" id="xl1">
                        <a href="">我的淘宝</a><i class="jt"></i>
                        <div class="wdtb-x yck">
                            <a href="">已买到的宝贝</a>
                            <a href="">已卖出的宝贝</a>
                        </div>
                    </li>
                    <li><i class="iconfont top-i-color">&#xe62b;</i><a href="">我关注的品牌</a></li>
                    <li class="hbg"><i class="iconfont top-i-color">&#xf0179;</i><a href="">购物车<em id="gwc">0</em>件</a></li>
                    <li class="" id="xl2">
                        <a href="">收藏夹</a><i class="jt"></i>
                        <div class="wdtb-x yck" style="width: 62px;">
                            <a href="">收藏的宝贝</a>
                            <a href="">收藏的店铺</a>
                        </div>
                    </li>
                    <li class="shu"></li>
                    <li id="">
                        <i class="iconfont top-i-color">&#xe620;</i>
                        <a href="">手机版</a>
                        <div class="sjb yck">
                            <!--<img src="img/215.png"/>-->
                        </div>
                    </li>
                    <li><a href="">淘宝网</a></li>
                    <li><a href="">企业购</a></li>
                    <li class="" id="xl3">
                        <a href="">商家支持</a><i class="jt"></i>
                        <div class="yck sjzc">
                            <dl class="qingchu">
                                <dt><h3>商家:</h3></dt>
                                <dd><a href="">商家中心</a></dd>
                                <dd><a href="">商家入驻</a></dd>
                                <dd><a href="">运营服务</a></dd>
                                <dd><a href="">商家品控</a></dd>
                                <dd><a href="">商家工具</a></dd>
                                <dd><a href="">商家规则</a></dd>
                                <dd><a href="">天猫智库</a></dd>
                                <dd><a href="">喵言喵语</a></dd>
                            </dl>
                            <dl class="qingchu padd-t">
                                <dt><h3>帮助:</h3></dt>
                                <dd><a href="">帮助中心</a></dd>
                            </dl>
                        </div>
                    </li>
                    <li class="" id="xl4">
                        <i class="iconfont top-i-color">&#xe501;</i>
                        <a href="">网站导航</a><i class="jt"></i>
                        <div class="yck wzdh qingchu">
                            <div class="wzdh-div1">	<!-- 作用是包含dl 让dl可以设置margin =  - 20px； -->
                                <dl>
                                    <dt class="qingchu"><h2>热点推荐</h2><h2>Hot</h2></dt>
                                    <dd><a href="">天猫超市</a></dd>
                                    <dd><a href="">喵鲜生</a></dd>
                                    <dd><a href="">科技新品</a></dd>
                                    <dd><a href="">女装新品</a></dd>
                                    <dd><a href="">酷玩街</a></dd>
                                    <dd><a href="">内衣新品</a></dd>
                                    <dd><a href="">试美妆</a></dd>
                                    <dd><a href="">运动新品</a></dd>
                                    <dd><a href="">时尚先生</a></dd>
                                    <dd><a href="">精明妈咪</a></dd>
                                    <dd><a href="">吃乐会</a></dd>
                                    <dd><a href="">企业采购</a></dd>
                                    <dd><a href="">会员积分</a></dd>
                                    <dd><a href="">天猫国际</a></dd>
                                </dl>
                            </div>
                            <div class="wzdh-div2">
                                <dl>
                                    <dt class="qingchu"><h2>行业市场</h2><h2>Market</h2></dt>
                                    <dd><a href="">美妆</a></dd>
                                    <dd><a href="">电器</a></dd>
                                    <dd><a href="">女装</a></dd>
                                    <dd><a href="">男装</a></dd>
                                    <dd><a href="">女鞋</a></dd>
                                    <dd><a href="">男鞋</a></dd>
                                    <dd><a href="">内衣</a></dd>
                                    <dd><a href="">箱包</a></dd>
                                    <dd><a href="">运动</a></dd>
                                    <dd><a href="">母婴</a></dd>
                                    <dd><a href="">家装</a></dd>
                                    <dd><a href="">医药</a></dd>
                                    <dd><a href="">食品</a></dd>
                                    <dd><a href="">配饰</a></dd>
                                    <dd><a href="">汽车</a></dd>
                                </dl>
                            </div>
                            <div class="wzdh-div3" >
                                <dl>
                                    <dt class="qingchu"><h2>品牌风尚</h2><h2>Brand</h2></dt>
                                    <dd><a href="">尚天猫</a></dd>
                                    <dd><a href="">大牌街</a></dd>
                                    <dd><a href="">潮牌街</a></dd>
                                    <dd><a href="">天猫原创</a></dd>
                                    <dd><a href="">什么牌子好</a></dd>
                                </dl>
                            </div>
                            <div class="wzdh-div4">
                                <dl>
                                    <dt class="qingchu"><h2>服务指南</h2><h2>Help</h2></dt>
                                    <dd><a href="">帮助中心</a></dd>
                                    <dd><a href="">品质保障</a></dd>
                                    <dd><a href="">特色服务</a></dd>
                                    <dd><a href="">7天退换货</a></dd>
                                </dl>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- 头部顶部导航部分  e-->
</body>
</html>
