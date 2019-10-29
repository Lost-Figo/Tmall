<%--
  Created by IntelliJ IDEA.
  User: Lost-Figo
  Date: 2019/10/26
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script>
    var deleteOrderItem = false;
    var deleteOrderItemid = 0;
    $(function(){

        $("a.deleteOrderItem").click(function(){

            var oiid = $(this).attr("oiid")
            deleteOrderItemid = oiid;
            var r=confirm("确定删除？");
            page = "deleteOrderItem";
            if (r==true){
                    $.post(
                        page,
                        {"oiid":deleteOrderItemid},
                        function(result){
                            if("success"==result){
                                $("tr.cartProductItemTR[oiid="+deleteOrderItemid+"]").hide();
                                deleteOrderItem = true;
                            }
                            else{
                                location.href="index.jsp";
                            }
                        }
                    );

                }
                else{

                }
        })

        $("img.cartProductItemIfSelected").click(function(){
            var selectit = $(this).attr("selectit")
            if("selectit"==selectit){
                $(this).attr("src","<%=basePath %>img/img/site/cartNotSelected.png");
                $(this).attr("selectit","false")
                $(this).parents("tr.cartProductItemTR").css("background-color","#fff");
            }
            else{
                $(this).attr("src","<%=basePath %>img/img/site/cartSelected.png");
                $(this).attr("selectit","selectit")
                $(this).parents("tr.cartProductItemTR").css("background-color","#FFF8E1");
            }
            syncSelect();
            syncCreateOrderButton();
            calcCartSumPriceAndNumber();
        });
        $("img.selectAllItem").click(function(){
            var selectit = $(this).attr("selectit")
            if("selectit"==selectit){
                $("img.selectAllItem").attr("src","<%=basePath %>img/img/site/cartNotSelected.png");
                $("img.selectAllItem").attr("selectit","false")
                $(".cartProductItemIfSelected").each(function(){
                    $(this).attr("src","<%=basePath %>img/img/site/cartNotSelected.png");
                    $(this).attr("selectit","false");
                    $(this).parents("tr.cartProductItemTR").css("background-color","#fff");
                });
            }
            else{
                $("img.selectAllItem").attr("src","<%=basePath %>img/img/site/cartSelected.png");
                $("img.selectAllItem").attr("selectit","selectit")
                $(".cartProductItemIfSelected").each(function(){
                    $(this).attr("src","<%=basePath %>img/img/site/cartSelected.png");
                    $(this).attr("selectit","selectit");
                    $(this).parents("tr.cartProductItemTR").css("background-color","#FFF8E1");
                });
            }
            syncCreateOrderButton();
            calcCartSumPriceAndNumber();


        });

        $(".orderItemNumberSetting").keyup(function(){
            var pid=$(this).attr("pid");
            var stock= $("span.orderItemStock[pid="+pid+"]").text();
            var price= $("span.orderItemPromotePrice[pid="+pid+"]").text();

            var num= $(".orderItemNumberSetting[pid="+pid+"]").val();
            num = parseInt(num);
            if(isNaN(num))
                num= 1;
            if(num<=0)
                num = 1;
            if(num>stock)
                num = stock;

            syncPrice(pid,num,price);
        });

        $(".numberPlus").click(function(){

            var pid=$(this).attr("pid");
            var stock= $("span.orderItemStock[pid="+pid+"]").text();
            var price= $("span.orderItemPromotePrice[pid="+pid+"]").text();
            var num= $(".orderItemNumberSetting[pid="+pid+"]").val();

            num++;
            if(num>stock)
                num = stock;
            syncPrice(pid,num,price);
        });
        $(".numberMinus").click(function(){
            var pid=$(this).attr("pid");
            var stock= $("span.orderItemStock[pid="+pid+"]").text();
            var price= $("span.orderItemPromotePrice[pid="+pid+"]").text();

            var num= $(".orderItemNumberSetting[pid="+pid+"]").val();
            --num;
            if(num<=0)
                num=1;
            syncPrice(pid,num,price);
        });

        $("button.createOrderButton").click(function(){
            var params = "";
            $(".cartProductItemIfSelected").each(function(){
                if("selectit"==$(this).attr("selectit")){
                    var oiid = $(this).attr("oiid");
                    params += "&oiid="+oiid;
                }
            });
            params = params.substring(1);
            location.href="buy?"+params;
        });



    })

    function syncCreateOrderButton(){
        var selectAny = false;
        $(".cartProductItemIfSelected").each(function(){
            if("selectit"==$(this).attr("selectit")){
                selectAny = true;
            }
        });

        if(selectAny){
            $("button.createOrderButton").css("background-color","#C40000");
            $("button.createOrderButton").removeAttr("disabled");
        }
        else{
            $("button.createOrderButton").css("background-color","#AAAAAA");
            $("button.createOrderButton").attr("disabled","disabled");
        }

    }
    function syncSelect(){
        var selectAll = true;
        $(".cartProductItemIfSelected").each(function(){
            if("false"==$(this).attr("selectit")){
                selectAll = false;
            }
        });

        if(selectAll)
            $("img.selectAllItem").attr("src","<%=basePath %>img/img/site/cartSelected.png");
        else
            $("img.selectAllItem").attr("src","<%=basePath %>img/img/site/cartNotSelected.png");



    }
    function calcCartSumPriceAndNumber(){
        var sum = 0;
        var totalNumber = 0;
        $("img.cartProductItemIfSelected[selectit='selectit']").each(function(){
            var oiid = $(this).attr("oiid");
            var price =$(".cartProductItemSmallSumPrice[oiid="+oiid+"]").text();
            price = price.replace(/,/g, "");
            price = price.replace(/￥/g, "");
            sum += new Number(price);

            var num =$(".orderItemNumberSetting[oiid="+oiid+"]").val();
            totalNumber += new Number(num);

        });

        $("span.cartSumPrice").html("￥"+formatMoney(sum));
        $("span.cartTitlePrice").html("￥"+formatMoney(sum));
        $("span.cartSumNumber").html(totalNumber);
    }
    function syncPrice(pid,num,price){
        $(".orderItemNumberSetting[pid="+pid+"]").val(num);
        var cartProductItemSmallSumPrice = formatMoney(num*price);
        $(".cartProductItemSmallSumPrice[pid="+pid+"]").html("￥"+cartProductItemSmallSumPrice);
        calcCartSumPriceAndNumber();

        var page = "changeOrderItem";
        $.post(
            page,
            {"pid":pid,"number":num},
            function(result){
                if("success"!=result){
                    location.href="login.jsp";
                }
            }
        );

    }
</script>


<div class="cartDiv">
    <div class="cartTitle pull-right">
        <span>已选商品  (不含运费)</span>
        <span class="cartTitlePrice">￥0.00</span>
        <button class="createOrderButton" disabled="disabled" style="background-color: rgb(170, 170, 170);">结 算</button>
    </div>


    <div class="cartProductList">
        <table class="cartProductTable">
            <thead>
            <tr>
                <th class="selectAndImage">
                    <img selectit="false" class="selectAllItem" src="<%=basePath %>img/img/site/cartNotSelected.png">
                    全选

                </th>
                <th>商品信息</th>
                <th>单价</th>
                <th>数量</th>
                <th width="120px">金额</th>
                <th class="operation">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${sessionScope.carts}" var="cartline">
            <tr oiid="${cartline.orderItem.oiid}" class="cartProductItemTR" style="background-color: rgb(255, 255, 255);">
                <td>
                    <img selectit="false" oiid="${cartline.orderItem.oiid}" class="cartProductItemIfSelected" src="<%=basePath %>img/img/site/cartNotSelected.png">
                    <a style="display:none" href="#nowhere"><img src="<%=basePath %>img/img/site/cartSelected.png"></a>
                    <img class="cartProductImg" src="<%=basePath %>img/img/productSingle_middle/${cartline.productImag}.jpg">
                </td>
                <td>
                    <div class="cartProductLinkOutDiv">
                        <a href="foreproduct?pid=89" class="cartProductLink">${cartline.product.name}</a>
                        <div class="cartProductLinkInnerDiv">
                            <img src="<%=basePath %>img/img/site/creditcard.png" title="支持信用卡支付">
                            <img src="<%=basePath %>img/img/site/7day.png" title="消费者保障服务,承诺7天退货">
                            <img src="<%=basePath %>img/img/site/promise.png" title="消费者保障服务,承诺如实描述">
                        </div>
                    </div>

                </td>
                <td>
                    <span class="cartProductItemOringalPrice">￥${cartline.product.originPrice}</span>
                    <span class="cartProductItemPromotionPrice">￥${cartline.product.promotePrice}</span>

                </td>
                <td>

                    <div class="cartProductChangeNumberDiv">
                        <span class="hidden orderItemStock " pid="${cartline.product.pdid}">${cartline.product.pdid}</span>
                        <span class="hidden orderItemPromotePrice " pid="${cartline.product.pdid}">${cartline.product.promotePrice}</span>
                        <a pid="${cartline.product.pdid}" class="numberMinus" href="#nowhere">-</a>
                        <input pid="${cartline.product.pdid}" oiid="${cartline.orderItem.oiid}" class="orderItemNumberSetting" autocomplete="off" value="${cartline.orderItem.count}">
<%--                        TODO 库存--%>
                        <a stock="82" pid="${cartline.product.pdid}" class="numberPlus" href="#nowhere">+</a>
                    </div>

                </td>
                <td>
                    <span class="cartProductItemSmallSumPrice" oiid="${cartline.orderItem.oiid}" pid="${cartline.product.pdid}">￥${cartline.product.promotePrice * cartline.orderItem.count}</span>

                </td>
                <td>
                    <a class="deleteOrderItem" oiid="${cartline.orderItem.oiid}" href="#nowhere">删除</a>
                </td>
            </tr>
            </c:forEach>
            </tbody>

        </table>
    </div>

    <div class="cartFoot">
        <img selectit="false" class="selectAllItem" src="<%=basePath %>img/img/site/cartNotSelected.png">
        <span>全选</span>
        <!-- 		<a href="#">删除</a> -->

        <div class="pull-right">
            <span>已选商品 <span class="cartSumNumber">0</span> 件</span>

            <span>合计 (不含运费): </span>
            <span class="cartSumPrice">￥0.00</span>
            <button class="createOrderButton" disabled="disabled" style="background-color: rgb(170, 170, 170);">结  算</button>
        </div>

    </div>

</div>
