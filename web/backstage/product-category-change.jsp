<%--
  Created by IntelliJ IDEA.
  User: Hasee
  Date: 2019/10/26
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://"
                + request.getServerName() + ":" + request.getServerPort()
                + path + "/"+"backstage/";
    %>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <style>
        /*价格搜索input框*/
        input, button {
            border: none;
            outline: none;
        }
        .ant-btn {
            line-height: 1.499;
            position: relative;
            display: inline-block;
            font-weight: 400;
            white-space: nowrap;
            text-align: center;
            background-image: none;
            border: 1px solid transparent;
            -webkit-box-shadow: 0 2px 0 rgba(0,0,0,0.015);
            box-shadow: 0 2px 0 rgba(0,0,0,0.015);
            cursor: pointer;
            -webkit-transition: all .3s cubic-bezier(.645, .045, .355, 1);
            transition: all .3s cubic-bezier(.645, .045, .355, 1);
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            -ms-touch-action: manipulation;
            touch-action: manipulation;
            height: 32px;
            padding: 0 15px;
            font-size: 14px;
            border-radius: 4px;
            color: rgba(0,0,0,0.65);
            background-color: #fff;
            border-color: #d9d9d9;
        }
        .ant-btn-red {
            color: #fff;
            background-color: greenyellow;
            border-color: greenyellow;
            text-shadow: 0 -1px 0 rgba(0,0,0,0.12);
            -webkit-box-shadow: 0 2px 0 rgba(0,0,0,0.045);
            box-shadow: 0 2px 0 rgba(0,0,0,0.045);
        }
    </style>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="<%=basePath %>css/style.css"/>
    <link rel="stylesheet" href="<%=basePath %>assets/css/ace.min.css" />
    <link rel="stylesheet" href="<%=basePath %>assets/css/font-awesome.min.css" />
    <link href="<%=basePath %>Widget/icheck/icheck.css" rel="stylesheet" type="text/css" />
    <!--[if IE 7]>
    <link rel="stylesheet" href="<%=basePath %>assets/css/font-awesome-ie7.min.css" />
    <![endif]-->
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="<%=basePath %>assets/css/ace-ie.min.css" />
    <![endif]-->
    <script src="<%=basePath %>js/jquery-1.9.1.min.js"></script>
    <script src="<%=basePath %>assets/js/bootstrap.min.js"></script>
    <script src="<%=basePath %>js/ajax.js"></script>
    <title>添加产品分类 - 素材牛模板演示</title>
</head>
<script>
    function changeshuxingname(e){
        $ajax({
            url:"shuxingname.pd",
            type:"get",
            data:{
                shuxingname : $(e).prev().val(),
                pid : $(e).prev().attr("id")
            },
            success:function(data){
                if(data.indexOf("yes")>=0){
                    alert("修改成功");
                }else{
                    alert("种类名重复")
                }
            },
            error:function(error){
                alert(error);
            }
        });
    }
    $(function () {
            $("#user-name").val($(sessionStorage.getItem("treeitemname")).selector);
            $ajax({
                url:"catechange.pd",
                type:"get",
                data:{
                    catename : $(sessionStorage.getItem("treeitemname")).selector
                },
                success:function(data){
                    var html = "";
                    for(var i in data){
                        html += "<div class='shuxing'>属性名：<input id='"+data[i].pid+"' type=\"text\" name=\"shuxingname\" value='"+data[i].name+"'  />" +
                        "<input type='button' value='改变属性名' onclick='changeshuxingname(this)'></div>";
                    }
                    $("#shuxingadd").append(html);
                },
                error:function(error){
                    alert(error);
                }
            });
    })
</script>
<body>
<div class="type_style">
    <div class="type_title">产品类型信息</div>
    <div class="type_content">
        <h3>产品种类修改</h3>
        <div class="Operate_btn">
            <a href="javascript:ovid()" class="btn  btn-danger"><i class="icon-trash   align-top bigger-125"></i>删除该类型</a>
        </div>
        <form action="addcate.pd" method="post" class="form form-horizontal" id="form-user-add" onsubmit="return check()">
            <div class="Operate_cont clearfix">
                <label class="form-label"><span class="c-red">*</span>分类名称：</label>
                <div class="formControls ">
                    <input type="text" class="input-text" id="user-name" name="product-category-name" onblur="checkname()" value=""><p id="checkcatename" style="color: red"></p>
                </div>
            </div>
            <div id="shuxingadd">
                <script>
                    function addText()
                    {
                        var html = "<div class='shuxing'>属性名：<input type=\"text\" name=\"shuxingname\" /></div>";
                        $("#shuxingadd").append(html);
                    }
                    function remove(obj){
                        var test = obj.lastElementChild;
                        if(test.className=='shuxing'){
                            test.remove();
                        }
                    }
                </script>
                <input type="button" class="ant-btn ant-btn-red" name="btn1" value="添加属性" onclick="addText();" />

                <br>
                <br>
            </div>
            <br>
            <div class="">
                <div class="" style=" text-align:center">
                    <input class="btn btn-primary radius" type="submit" value="提交">
                </div>
            </div>
        </form>
    </div>
</div>
</div>
<script type="text/javascript" src="<%=basePath %>Widget/icheck/jquery.icheck.min.js"></script>
<script type="text/javascript" src="<%=basePath %>Widget/Validform/5.3.2/Validform.min.js"></script>
<script type="text/javascript" src="<%=basePath %>assets/layer/layer.js"></script>
<script type="text/javascript" src="<%=basePath %>js/H-ui.js"></script>
<script type="text/javascript" src="<%=basePath %>js/H-ui.admin.js"></script>
</body>
</html>
<script>
    function checkname() {
        var name = $("#user-name");
        $ajax({
            url:"catenamecheck.pd",
            type:"get",
            data:{
                name : name.val()
            },
            success:function(data){
                if(data.indexOf("no")>=0){
                    $("#checkcatename").html("该种类名不可用");
                }else{
                    $("#checkcatename").html("");
                }
            },
            error:function(error){
                alert(error);
            }
        });

    }
    function check() {
        if($("#checkcatename").html()!=""){
            alert("该种类名不可用");
            return false;
        }else{
            return true;
        }
    }
</script>
