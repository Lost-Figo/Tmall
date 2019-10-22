<%@ page import="entity.TmCategory" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Lost-Figo
  Date: 2019/10/22
  Time: 21:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<dl class="cedh" id="cedh" style="z-index: 9;">
    <dt><i class="iconfont">&#xe501;</i><span>商品分类</span></dt>
    <c:forEach var = "category" items="${categorys}">

    <dd class="se-1">
        <p><i class="iconfont">&#xe628;</i><a name="${category.name}" href="">${category.name} </a></p>
        <div class="cedh-nr">
            <div class="cenr-l">
                <dl class="qingchu">
                    <dt>当季流行</dt>
                    <dd>
                        <a href="" class="hot-a">2017春季新品</a>
                        <a href="" class="hot-a">商场同款</a>
                        <a href="">气质连衣裙</a>
                        <a href="">衬衫</a>
                        <a href="">牛仔单品</a>
                        <a href="">百搭休闲裤</a>
                        <a href="">无痕文胸</a>
                        <a href="" class="hot-a">运动文胸</a>
                        <a href="">超柔内裤</a>
                        <a href="" class="hot-a">潮流家居服</a>
                        <a href="">百搭船袜</a>
                    </dd>
                </dl>
                <dl class="qingchu">
                    <dt>精选上装</dt>
                    <dd>
                        <a href="" class="hot-a">针织衫</a>
                        <a href="" class="hot-a">T恤</a>
                        <a href="">毛衣</a>
                        <a href="">衬衫</a>
                        <a href="">风衣</a>
                        <a href="">短外套</a>
                        <a href="">卫衣</a>
                        <a href="">小西装</a>
                    </dd>
                </dl>
                <dl class="qingchu">
                    <dt>当季流行</dt>
                    <dd>
                        <a href="" class="hot-a">2017春季新品</a>
                        <a href="" class="hot-a">商场同款</a>
                        <a href="">气质连衣裙</a>
                        <a href="">衬衫</a>
                        <a href="">牛仔单品</a>
                        <a href="">百搭休闲裤</a>
                        <a href="">无痕文胸</a>
                        <a href="" class="hot-a">运动文胸</a>
                        <a href="">超柔内裤</a>
                        <a href="" class="hot-a">潮流家居服</a>
                        <a href="">百搭船袜</a>
                    </dd>
                </dl>
                <dl class="qingchu">
                    <dt>精选上装</dt>
                    <dd>
                        <a href="" class="hot-a">针织衫</a>
                        <a href="" class="hot-a">T恤</a>
                        <a href="">毛衣</a>
                        <a href="">衬衫</a>
                        <a href="">风衣</a>
                        <a href="">短外套</a>
                        <a href="">卫衣</a>
                        <a href="">小西装</a>
                    </dd>
                </dl>
                <dl class="qingchu">
                    <dt>当季流行</dt>
                    <dd>
                        <a href="" class="hot-a">2017春季新品</a>
                        <a href="" class="hot-a">商场同款</a>
                        <a href="">气质连衣裙</a>
                        <a href="">衬衫</a>
                        <a href="">牛仔单品</a>
                        <a href="">百搭休闲裤</a>
                        <a href="">无痕文胸</a>
                        <a href="" class="hot-a">运动文胸</a>
                        <a href="">超柔内裤</a>
                        <a href="" class="hot-a">潮流家居服</a>
                        <a href="">百搭船袜</a>
                    </dd>
                </dl>
                <dl class="qingchu">
                    <dt>精选上装</dt>
                    <dd>
                        <a href="" class="hot-a">针织衫</a>
                        <a href="" class="hot-a">T恤</a>
                        <a href="">毛衣</a>
                        <a href="">衬衫</a>
                        <a href="">风衣</a>
                        <a href="">短外套</a>
                        <a href="">卫衣</a>
                        <a href="">小西装</a>
                    </dd>
                </dl>
                <dl class="qingchu">
                    <dt>当季流行</dt>
                    <dd>
                        <a href="" class="hot-a">2017春季新品</a>
                        <a href="" class="hot-a">商场同款</a>
                        <a href="">气质连衣裙</a>
                        <a href="">衬衫</a>
                        <a href="">牛仔单品</a>
                        <a href="">百搭休闲裤</a>
                        <a href="">无痕文胸</a>
                        <a href="" class="hot-a">运动文胸</a>
                        <a href="">超柔内裤</a>
                        <a href="" class="hot-a">潮流家居服</a>
                        <a href="">百搭船袜</a>
                    </dd>
                </dl>
                <dl class="qingchu">
                    <dt>精选上装</dt>
                    <dd>
                        <a href="" class="hot-a">针织衫</a>
                        <a href="" class="hot-a">T恤</a>
                        <a href="">毛衣</a>
                        <a href="">衬衫</a>
                        <a href="">风衣</a>
                        <a href="">短外套</a>
                        <a href="">卫衣</a>
                        <a href="">小西装</a>
                    </dd>
                </dl>
                <dl class="qingchu">
                    <dt>精选上装</dt>
                    <dd style="border: none;">
                        <a href="" class="hot-a">针织衫</a>
                        <a href="" class="hot-a">T恤</a>
                        <a href="">毛衣</a>
                        <a href="">衬衫</a>
                        <a href="">风衣</a>
                        <a href="">短外套</a>
                        <a href="">卫衣</a>
                        <a href="">小西装</a>
                    </dd>
                </dl>
            </div>
            <div class="cenr-r">
                <a href=""><img src=" <%=basePath %>img/30.jpg"/></a>
                <a href=""><img src=" <%=basePath %>img/30.jpg"/></a>
                <a href=""><img src=" <%=basePath %>img/30.jpg"/></a>
                <a href=""><img src=" <%=basePath %>img/30.jpg"/></a>
                <a href=""><img src=" <%=basePath %>img/30.jpg"/></a>
                <a href=""><img src=" <%=basePath %>img/30.jpg"/></a>
                <a href=""><img src=" <%=basePath %>img/30.jpg"/></a>
                <a href=""><img src=" <%=basePath %>img/30.jpg"/></a>
                <a href=""><img src=" <%=basePath %>img/30.jpg"/></a>
                <a href=""><img src=" <%=basePath %>img/30.jpg"/></a>
                <a href=""><img src=" <%=basePath %>img/30.jpg"/></a>
                <a href=""><img src=" <%=basePath %>img/30.jpg"/></a>
                <a href=""><img src=" <%=basePath %>img/30.jpg"/></a>
                <a href=""><img src=" <%=basePath %>img/30.jpg"/></a>
                <a href=""><img src=" <%=basePath %>img/30.jpg"/></a>
                <a href=""><img src=" <%=basePath %>img/30.jpg"/></a>
                <div class="cenr-r-bottom qingchu">
                    <a href=""><img src="https://img.alicdn.com/tps/TB1xnkQKVXXXXaJXXXXXXXXXXXX-378-174.jpg"></a>
                </div>
            </div>
        </div>
    </dd>
    </c:forEach>
</dl>