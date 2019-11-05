<%--
  Created by IntelliJ IDEA.
  User: Lost-Figo
  Date: 2019/10/26
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: Lost-Figo
  Date: 2019/10/24
  Time: 21:45
  To change this template use File | Settings | File Templates.
--%>


<%--产品详情--%>

<div class="productReviewDiv" >
    <div class="productReviewTopPart">
        <a  href="#nowhere" class="productReviewTopPartSelectedLink">商品详情</a>
        <a  href="#nowhere" class="selected">累计评价 <span class="productReviewTopReviewLinkNumber">${productReview.size()}</span> </a>
    </div>


    <div class="productReviewContentPart">
        <c:forEach items="${productReview}" var="r">
            <div class="productReviewItem">

                <div class="productReviewItemDesc">
                    <div class="productReviewItemContent">
                            ${r.content }
                    </div>
                    <div class="productReviewItemDate"><fmt:formatDate value="${r.createDate}" pattern="yyyy-MM-dd"/></div>
                </div>
                <div class="productReviewItemUserInfo">

                        ${r.tmuid}<span class="userInfoGrayPart">（匿名）</span>
                </div>

                <div style="clear:both"></div>

            </div>
        </c:forEach>
    </div>

</div>

<%--产品详情结束--%>



