
<%--
  Created by IntelliJ IDEA.
  User: Lost-Figo
  Date: 2019/10/23
  Time: 19:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:forEach items="${productByCid}" var="category">
    <!--分类展示产品 s-->
    <div class="cnxh nr-bg qingchu">
        <h2><span class="cnxh-text"><i class="iconfont">&#xe64b;</i> ${category.categoryName}</span></h2>
<%--        判断类别下是否有产品，有则展示--%>

        <div class="cpzs qingchu"><!--产品展示-->
            <ul>
                <c:if test="${!empty category.lists}">
                    <c:forEach items="${category.lists}" var="product" varStatus="st" >
                        <c:if test="${st.count <4}">
                            <li class="cpzs-1">
                                <div class="kuang">
                                    <a href="Product.prod?pdid=${ product.getPdid()}">
                                        <div class="cp-img">
                                            <img src="<%=basePath %>img/TB19REsKVXXXXb_apXXXXXXXXXX_!!0-item_pic.jpg_400x400q60.jpg" alt="" />
                                        </div>
                                        <div class="cp-text">
                                            <p><em>[热销]${fn:substring(product.getName(),0,25)}...</em></p>
                                            <div><i>¥</i> <span>${product.getPromotePrice()}</span> </div>
                                        </div>
                                    </a>
                                </div>
                            </li>
                        </c:if>
                    </c:forEach>
                </c:if>
            </ul>
        </div>

        <div class="nr-end"></div>
        <div class="both"></div>
    </div>
    <!--猜你喜欢 e-->

</c:forEach>
