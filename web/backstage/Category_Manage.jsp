<%--
  Created by IntelliJ IDEA.
  User: Hasee
  Date: 2019/10/26
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://"
                + request.getServerName() + ":" + request.getServerPort()
                + path + "/"+"backstage/";
    %>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="<%=basePath %>css/style.css"/>
    <link href="<%=basePath %>assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=basePath %>assets/css/ace.min.css" />
    <link rel="stylesheet" href="<%=basePath %>Widget/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" href="<%=basePath %>assets/css/font-awesome.min.css" />

    <!--[if IE 7]>
    <link rel="stylesheet" href="<%=basePath %>assets/css/font-awesome-ie7.min.css" />
    <![endif]-->
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="<%=basePath %>assets/css/ace-ie.min.css" />
    <![endif]-->
    <script src="<%=basePath %>assets/js/jquery.min.js"></script>
    <!-- <![endif]-->
    <!--[if IE]>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <![endif]-->
    <!--[if !IE]> -->
    <script type="text/javascript">
        window.jQuery || document.write("&lt;script src='assets/js/jquery-2.0.3.min.js'>"+"&lt;"+"/script>");
    </script>
    <!-- <![endif]-->
    <!--[if IE]>
    <script type="text/javascript">
        window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
    </script>
    <![endif]-->
    <script src="<%=basePath %>assets/js/ace-elements.min.js"></script>
    <script src="<%=basePath %>assets/js/ace.min.js"></script>
    <script src="<%=basePath %>assets/js/bootstrap.min.js"></script>
    <script src="<%=basePath %>assets/js/typeahead-bs2.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script>
    <script src="<%=basePath %>js/lrtk.js" type="text/javascript" ></script>
    <script src="<%=basePath %>js/ajax.js"></script>
    <title>分类管理 - 素材牛模板演示</title>
</head>

<body>
<div class=" clearfix">
    <div id="category">
        <div id="scrollsidebar" class="left_Treeview">
            <div class="show_btn" id="rightArrow"><span></span></div>
            <div class="widget-box side_content" >
                <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
                <div class="side_list">
                    <div class="widget-header header-color-green2">
                        <h4 class="lighter smaller">产品类型列表</h4>
                    </div>
                    <div class="widget-body">
                        <div class="widget-main padding-8">
                            <div  id="treeDemo" class="ztree"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!---->
        <iframe ID="testIframe" Name="testIframe" FRAMEBORDER=0 SCROLLING=AUTO  SRC="product-category-add.jsp" class="page_right_style"></iframe>
    </div>
</div>
<p id="p11" style="display: none"></p>
</body>
</html>
<script type="text/javascript">
    $(function() {
        $("#category").fix({
            float : 'left',
            //minStatue : true,
            skin : 'green',
            durationTime :false
        });
    });
</script>
<script type="text/javascript">
    //初始化宽度、高度
    $(".widget-box").height($(window).height());
    $(".page_right_style").width($(window).width()-220);
    //当文档窗口发生改变时 触发
    $(window).resize(function(){
        $(".widget-box").height($(window).height());
        $(".page_right_style").width($(window).width()-220);
    })

    /**************/
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
            onClick : chooseNode2
        }
    };
    function chooseNode2(event,treeId,name,treeNode){
        var zTree = $.fn.zTree.getZTreeObj("tree");
        if (treeNode.isParent) {
            sessionStorage.setItem("treeitemname",name.name);
            demoIframe.attr("src","product-category-add.jsp");
            return false;
        } else {

            sessionStorage.setItem("treeitemname",name.name+"");
            demoIframe.attr("src","product-category-change.jsp");
            return true;
        }
    }
    $ajax({
        url:"category.pd",
        type:"get",
        data:{
        },
        success:function(data){
            $("#p11").text(JSON.stringify(data));
        },
        error:function(error){
            alert(error);
        }
    });

    var code;

    function showCode(str) {
        if (!code) code = $("#code");
        code.empty();
        code.append("&lt;li>"+str+"</li>");
    }

    $(document).ready(function(){
        setTimeout(function () {
            var t = $("#treeDemo");
            t = $.fn.zTree.init(t, setting, JSON.parse($("#p11").text()));
            demoIframe = $("#testIframe");
            demoIframe.bind("load", loadReady);
            var zTree = $.fn.zTree.getZTreeObj("tree");
            zTree.selectNode(zTree.getNodeByParam("id",'11'));
        },10);

    });
</script>
