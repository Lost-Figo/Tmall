<%--
  Created by IntelliJ IDEA.
  User: Lost-Figo
  Date: 2019/10/26
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--产品详情--%>

<div class="productDetailDiv" >
    <div class="productDetailTopPart">
        <a href="#nowhere" class="productDetailTopPartSelectedLink selected">商品详情</a>
        <a href="#nowhere" class="productDetailTopReviewLink">累计评价 <span class="productDetailTopReviewLinkNumber">${p.reviewCount}</span> </a>
    </div>


    <div class="productParamterPart">
        <div class="productParamter">产品参数：</div>

        <div class="productParamterList">
            <c:forEach items="${productAttibute}" var="pv">
                <span>${pv.propertyName}:  ${pv.propertyValueName} </span>
            </c:forEach>
        </div>
        <div style="clear:both"></div>
    </div>

    <div class="productDetailImagesPart">
        <c:forEach items="${productAttiImg}" var="pi">
            <img src="<%=basePath %>product/img/productDetail/${pi.piid}.jpg">
        </c:forEach>
    </div>
</div>



