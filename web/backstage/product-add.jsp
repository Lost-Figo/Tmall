<%--
  Created by IntelliJ IDEA.
  User: Hasee
  Date: 2019/10/25
  Time: 21:12
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
    <!--[if lt IE 9]>
    <script type="text/javascript" src="<%=basePath %>js/html5.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/respond.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/PIE_IE678.js"></script>

    <![endif]-->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="<%=basePath %>css/style.css"/>
    <link href="<%=basePath %>assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=basePath %>assets/css/ace.min.css" />
    <link rel="stylesheet" href="<%=basePath %>Widget/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" href="<%=basePath %>assets/css/font-awesome.min.css" />
    <!--[if IE 7]>
    <link rel="stylesheet" href="<%=basePath %>assets/css/font-awesome-ie7.min.css" />
    <![endif]-->
    <link href="<%=basePath %>Widget/icheck/icheck.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath %>Widget/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
    <script src="<%=basePath %>js/ajax.js"></script>
    <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <title>新增图片 - 素材牛模板演示</title>
</head>
<body>
<div class="clearfix" id="add_picture">
    <div id="scrollsidebar" class="left_Treeview">
        <div class="show_btn" id="rightArrow"><span></span></div>
        <div class="widget-box side_content" >
            <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
            <div class="side_list">
                <div class="widget-header header-color-green2">
                    <h4 class="lighter smaller">选择产品类型</h4>
                </div>
                <div class="widget-body">
                    <div class="widget-main padding-8">
                        <div  id="treeDemo" class="ztree"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="page_right_style">
        <div class="type_title">添加商品</div>
        <form action="createpro.pd" method="post" class="form form-horizontal" id="form-article-add">
            <div class="clearfix cl">
                <label class="form-label col-2"><span class="c-red">*</span>产品标题：</label>
                <div class="formControls col-10"><input type="text" class="input-text" value="" placeholder=""  name="zhuname"></div>
            </div>
            <div class=" clearfix cl">
                <label class="form-label col-2">简略标题：</label>
                <div class="formControls col-10"><input type="text" class="input-text" value="" placeholder=""  name="funame"></div>
            </div>
            <div class=" clearfix cl">
                <div class="Add_p_s">
                    <label class="form-label col-2">展示价格：</label>
                    <div class="formControls col-2"><input type="text" class="input-text" value="" placeholder=""  name="zuxiao" >元</div>
                </div>
                <div class="Add_p_s">
                    <label class="form-label col-2">市场价格：</label>
                    <div class="formControls col-2"><input type="text" class="input-text" value="" placeholder=""  name="yuanjia" >元</div>
                </div>
            </div>

            <div class="clearfix cl">
                <div class="Button_operation">
                    <input type="submit" onClick="return checkcatename();" class="btn btn-primary radius" value="保存并提交审核">
<%--                    <button onClick="return checkcatename();" class="btn btn-primary radius" type="submit"><i class="icon-save "></i>保存并提交审核</button>--%>
                    <button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
                </div>
            </div>
            <input type="text" id="p13" name="zhongleiname" style="display: none">
        </form>
    </div>
</div>
</div>
<script>
    function checkcatename() {
        if ($("#p13").val()=="all"||$("#p13").val()=="") {
            alert("请选择产品种类!");
            return false;
        }else{
            sessionStorage.setItem("zhongleiname",$("#p13").val());
            return true;
        }
    }
</script>
<script src="js/jquery-1.9.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/typeahead-bs2.min.js"></script>
<script src="assets/layer/layer.js" type="text/javascript" ></script>
<script src="assets/laydate/laydate.js" type="text/javascript"></script>
<script type="text/javascript" src="Widget/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="Widget/icheck/jquery.icheck.min.js"></script>
<script type="text/javascript" src="Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="Widget/Validform/5.3.2/Validform.min.js"></script>
<script type="text/javascript" src="Widget/webuploader/0.1.5/webuploader.min.js"></script>
<script type="text/javascript" src="Widget/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript" src="Widget/ueditor/1.4.3/ueditor.all.min.js"> </script>
<script type="text/javascript" src="Widget/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script src="js/lrtk.js" type="text/javascript" ></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<p id="p12" style="display: none"></p>

</body>
</html>
<script>
    $(function() {
        $("#add_picture").fix({
            float : 'left',
            skin : 'green',
            durationTime :false,
            stylewidth:'220',
            spacingw:0,
            spacingh:260,
        });
    });
    $( document).ready(function(){
//初始化宽度、高度

        $(".widget-box").height($(window).height());
        $(".page_right_style").height($(window).height());
        $(".page_right_style").width($(window).width()-220);
        //当文档窗口发生改变时 触发
        $(window).resize(function(){

            $(".widget-box").height($(window).height());
            $(".page_right_style").height($(window).height());
            $(".page_right_style").width($(window).width()-220);
        });
    });
    $(function(){
        var ue = UE.getEditor('editor');
    });
    /******树状图********/
    var setting = {
        view: {
            dblClickExpand: false,
            showLine: false,
            selectedMulti: false
        },
        data: {
            simpleData: {
                enable:true,
                idKey: "id",
                pIdKey: "pId",
                rootPId: ""
            }
        },
        callback: {
            onClick : chooseNode1
        }
    };
    function chooseNode1(event,treeId,name,treeNode){
        $("#p13").val("");
        $("#p13").val(name.name);
        return false;
    }
    $ajax({
        async:false,
        url:"category.pd",
        type:"get",
        data:{
        },
        success:function(data){
            $("#p12").text(JSON.stringify(data));
        },
        error:function(error){
            alert(error);
        }
    });
    // var zNodes =[
    //     { id:1, pId:0, name:"商城分类列表", open:true},
    //     { id:11, pId:1, name:"蔬菜水果"},
    //     { id:111, pId:11, name:"蔬菜"},
    //     { id:112, pId:11, name:"苹果"},
    // ];

    var code;

    function showCode(str) {
        if (!code) code = $("#code");
        code.empty();
        code.append("<li>"+str+"</li>");
    }
    $(document).ready(function(){
        setTimeout(function () {
            var t = $("#treeDemo");
            t = $.fn.zTree.init(t, setting,JSON.parse($("#p12").text()));
            demoIframe = $("#testIframe");
            demoIframe.bind("load", loadReady);
            var zTree = $.fn.zTree.getZTreeObj("tree");
            zTree.selectNode(zTree.getNodeByParam("id",'11'));
            window.location.reload();
        },10);

    });
</script>


