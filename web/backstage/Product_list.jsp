<%--
  Created by IntelliJ IDEA.
  User: Hasee
  Date: 2019/10/22
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://"
                + request.getServerName() + ":" + request.getServerPort()
                + path + "/"+"backstage/";
    %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="<%=basePath %>assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="<%=basePath %>css/style.css"/>
<link rel="stylesheet" href="<%=basePath %>assets/css/ace.min.css" />
<link rel="stylesheet" href="<%=basePath %>assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="<%=basePath %>Widget/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<link href="<%=basePath %>Widget/icheck/icheck.css" rel="stylesheet" type="text/css" />
<!--[if IE 7]>
<link rel="stylesheet" href="<%=basePath %>assets/css/font-awesome-ie7.min.css" />
<![endif]-->
<!--[if lte IE 8]>
<link rel="stylesheet" href="<%=basePath %>assets/css/ace-ie.min.css" />
<![endif]-->
<script src="<%=basePath %>js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath %>assets/js/bootstrap.min.js"></script>
<script src="<%=basePath %>assets/js/typeahead-bs2.min.js"></script>
<!-- page specific plugin scripts -->
<script src="<%=basePath %>assets/js/jquery.dataTables.min.js"></script>
<script src="<%=basePath %>assets/js/jquery.dataTables.bootstrap.js"></script>
<script type="text/javascript" src="<%=basePath %>js/H-ui.js"></script>
<script type="text/javascript" src="<%=basePath %>js/H-ui.admin.js"></script>
<script src="<%=basePath %>assets/layer/layer.js" type="text/javascript" ></script>
<script src="<%=basePath %>assets/laydate/laydate.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath %>Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script>
<script src="<%=basePath %>js/lrtk.js" type="text/javascript" ></script>
    <script src="<%=basePath %>js/ajax.js"></script>
<script>
        $ajax({
            url:"product.pd",
            type:"get",
            data:{
            },
            success:function(data){
                var html = "<table class=\"table table-striped table-bordered table-hover\" id=\"data-table-test\">\n" +
                    "                    <thead>\n" +
                    "                    <tr>\n" +
                    "                        <th width=\"25px\"><label><input type=\"checkbox\" class=\"ace\"><span class=\"lbl\"></span></label></th>\n" +
                    "                        <th width=\"80px\">产品编号</th>\n" +
                    "                        <th width=\"250px\">产品名称</th>\n" +
                    "                        <th width=\"100px\">原价格</th>\n" +
                    "                        <th width=\"100px\">现价</th>\n" +
                    "                        <th width=\"100px\">所属地区/国家</th>\n" +
                    "                        <th width=\"180px\">加入时间</th>\n" +
                    "                        <th width=\"80px\">审核状态</th>\n" +
                    "                        <th width=\"70px\">状态</th>\n" +
                    "                        <th width=\"200px\">操作</th>\n" +
                    "                    </tr>\n" +
                    "                    </thead>\n" +
                    "                    <tbody>";
                for (var pd in data){
                    html += "<tr>";
                    html += "<td width=\"25px\"><label><input type=\"checkbox\" class=\"ace\" ><span class=\"lbl\"></span></label></td>";
                    html += "<td width=\"80px\">"+data[pd].pdid+"</td>";
                    html += "<td width=\"250px\"><u style=\"cursor:pointer\" class=\"text-primary\" onclick=\"\">"+data[pd].name+"</u></td>";
                    html += "<td width=\"100px\">"+data[pd].originPrice+"</td>";
                    html += "<td width=\"100px\">"+data[pd].promotePrice+"</td>";
                    html += "                        <td width=\"100px\">中国</td>" +
                        "                        <td width=\"180px\">2014-6-11 11:11:42</td>";
                    html += "<td class=\"text-l\">通过</td>\n" +
                        "                        <td class=\"td-status\"><span class=\"label label-success radius\">已启用</span></td>" +
                        "                        <td class=\"td-manage\">" +
                        "                            <a onClick=\"member_stop(this,'10001')\"  href=\"javascript:;\" title=\"停用\"  class=\"btn btn-xs btn-success\"><i class=\"icon-ok bigger-120\"></i></a>" +
                        "                            <a title=\"编辑\" onclick=\"member_edit('编辑','member-change.jsp','4','','510',"+data[pd].pdid+")\" href=\"javascript:;\"  class=\"btn btn-xs btn-info\" ><i class=\"icon-edit bigger-120\"></i></a>" +
                        "                            <a title=\"添加图片\" onclick=\"member_edit('编辑','img-change.jsp','4','','510',"+data[pd].pdid+")\" href=\"javascript:;\"  class=\"btn btn-xs btn-info\" ><i class=\"icon-edit bigger-120\"></i></a>" +
                        "                            <a title=\"删除\" href=\"javascript:;\"  onclick=\"member_del(this,'1')\" class=\"btn btn-xs btn-warning\" ><i class=\"icon-trash  bigger-120\"></i></a>" +
                        "                        </td>";
                }
                html +="</tbody>\n" +
                    "                </table>";
                $("#testIframe").append(html);
                $('#data-table-test').DataTable();
            },
            error:function(error){
                alert(error);
            }
        });
</script>
<title>产品列表 - 素材牛模板演示</title>
</head>
<body>
<div class=" page-content clearfix">
    <div id="products_style" style="left: 0px;">
        <div class="search_style">

            <ul class="search_content clearfix">
                <li><label class="l_f">产品名称</label><input name="" type="text"  class="text_add" placeholder="输入品牌名称"  style=" width:250px"/></li>
                <li><label class="l_f">添加时间</label><input class="inline laydate-icon" id="start" style=" margin-left:10px;"></li>
                <li style="width:90px;"><button type="button" class="btn_search"><i class="icon-search"></i>查询</button></li>
            </ul>
        </div>
        <div class="border clearfix">
       <span class="l_f">
        <a href="product-add.jsp" title="添加商品" class="btn btn-warning Order_form"><i class="icon-plus"></i>添加商品</a>
        <a href="javascript:ovid()" class="btn btn-danger"><i class="icon-trash"></i>批量删除</a>
       </span>
            <span class="r_f">共：<b>2334</b>件商品</span>
        </div>
        <!--产品列表展示-->
        <div class="h_products_list clearfix" id="products_list">
            <div id="scrollsidebar" class="left_Treeview">
                <div class="show_btn" id="rightArrow"><span></span></div>
                <div class="widget-box side_content" style="height: 339px;width: 220px;" >
                    <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
                    <div class="side_list"><div class="widget-header header-color-green2"><h4 class="lighter smaller">产品类型列表</h4></div>
                        <div class="widget-body">
                            <div class="widget-main padding-8"><div id="treeDemo" class="ztree"></div></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="table_menu_list" id="testIframe" style="width: 1470px; height: 339px;">
            </div>
        </div>
    </div>
</div>
<p id="p11" style="display: none"></p>
</body>
</html>
<script>
    jQuery(function($) {
        var oTable1 = $('#sample-table').dataTable( {
            "aaSorting": [[ 1, "desc" ]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable":false,"aTargets":[0,2,3,4,5,8,9]}// 制定列不参与排序
            ] } );


        $('table th input:checkbox').on('click' , function(){
            var that = this;
            $(this).closest('table').find('tr > td:first-child input:checkbox')
                .each(function(){
                    this.checked = that.checked;
                    $(this).closest('tr').toggleClass('selected');
                });

        });


        $('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
        function tooltip_placement(context, source) {
            var $source = $(source);
            var $parent = $source.closest('table')
            var off1 = $parent.offset();
            var w1 = $parent.width();

            var off2 = $source.offset();
            var w2 = $source.width();

            if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
            return 'left';
        }
    });
    laydate({
        elem: '#start',
        event: 'focus'
    });
    $(function() {
        $("#products_style").fix({
            float : 'left',
            //minStatue : true,
            skin : 'green',
            durationTime :false,
            spacingw:30,//设置隐藏时的距离
            spacingh:260,//设置显示时间距
        });
    });
</script>
<script type="text/javascript">

    //初始化宽度、高度
    $(".widget-box").height($(window).height()-215);
    $(".table_menu_list").width($(window).width()-260);
    $(".table_menu_list").height($(window).height()-215);
    //当文档窗口发生改变时 触发
    $(window).resize(function(){
        $(".widget-box").height($(window).height()-215);
        $(".table_menu_list").width($(window).width()-260);
        $(".table_menu_list").height($(window).height()-215);
    })

    /*******树状图*******/
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
            onClick : chooseNode
        }
    };
    
    function chooseNode(event,treeId,name,treeNode) {
        $ajax({
            url:"treename.pd",
            type:"get",
            data:{
                treename:name.name
            },
            success:function(data){
                $("#testIframe").html("");
                var html = "<table class=\"table table-striped table-bordered table-hover\" id=\"data-table-test\">\n" +
                    "                    <thead>\n" +
                    "                    <tr>\n" +
                    "                        <th width=\"25px\"><label><input type=\"checkbox\" class=\"ace\"><span class=\"lbl\"></span></label></th>\n" +
                    "                        <th width=\"80px\">产品编号</th>\n" +
                    "                        <th width=\"250px\">产品名称</th>\n" +
                    "                        <th width=\"100px\">原价格</th>\n" +
                    "                        <th width=\"100px\">现价</th>\n" +
                    "                        <th width=\"100px\">所属地区/国家</th>\n" +
                    "                        <th width=\"180px\">加入时间</th>\n" +
                    "                        <th width=\"80px\">审核状态</th>\n" +
                    "                        <th width=\"70px\">状态</th>\n" +
                    "                        <th width=\"200px\">操作</th>\n" +
                    "                    </tr>\n" +
                    "                    </thead>\n" +
                    "                    <tbody>";
                for (var pd in data){
                    html += "<tr>";
                    html += "<td width=\"25px\"><label><input type=\"checkbox\" class=\"ace\" ><span class=\"lbl\"></label></td>";
                    html += "<td width=\"80px\">"+data[pd].pdid+"</td>";
                    html += "<td width=\"250px\"><u style=\"cursor:pointer\" class=\"text-primary\" onclick=\"\">"+data[pd].name+"</u></td>";
                    html += "<td width=\"100px\">"+data[pd].originPrice+"</td>";
                    html += "<td width=\"100px\">"+data[pd].promotePrice+"</td>";
                    html += "                        <td width=\"100px\">中国</td>" +
                        "                        <td width=\"180px\">2014-6-11 11:11:42</td>";
                    html += "<td class=\"text-l\">通过</td>\n" +
                        "                        <td class=\"td-status\"><span class=\"label label-success radius\">已启用</span></td>" +
                        "                        <td class=\"td-manage\">" +
                        "                            <a onClick=\"member_stop(this,'10001')\"  href=\"javascript:;\" title=\"停用\"  class=\"btn btn-xs btn-success\"><i class=\"icon-ok bigger-120\"></i></a>" +
                        "                            <a title=\"编辑\" onclick=\"member_edit('编辑','member-add.html','4','','510',"+data[pd].pdid+")\" href=\"javascript:;\"  class=\"btn btn-xs btn-info\" ><i class=\"icon-edit bigger-120\"></i></a>" +
                        "                            <a title=\"添加图片\" onclick=\"member_edit('编辑','img-change.jsp','4','','510',"+data[pd].pdid+")\" href=\"javascript:;\"  class=\"btn btn-xs btn-info\" ><i class=\"icon-edit bigger-120\"></i></a>" +
                        "                            <a title=\"删除\" href=\"javascript:;\"  onclick=\"member_del(this,'1')\" class=\"btn btn-xs btn-warning\" ><i class=\"icon-trash  bigger-120\"></i></a>" +
                        "                        </td>";
                }
                html +="</tbody>\n" +
                    "                </table>";
                $("#testIframe").append(html);
                $('#data-table-test').DataTable();
            },
            error:function(error){
                alert(error);
            }
        });
        return false;
    }

    var zNodes;
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

    // var zNodes =[
    //     { id:111, pId:11, name:"蔬菜"},
    //     { id:112, pId:11, name:"苹果"},
    //     { id:113, pId:11, name:"大蒜"},
    //     { id:114, pId:11, name:"白菜"},
    //     { id:115, pId:11, name:"青菜"},
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
            t = $.fn.zTree.init(t, setting, JSON.parse($("#p11").text()));
            demoIframe = $("#testIframe");
            demoIframe.bind("load", loadReady);
            var zTree = $.fn.zTree.getZTreeObj("tree");
            zTree.selectNode(zTree.getNodeByParam("id",'11'));
        },10);


    });
    /*产品-停用*/
    function member_stop(obj,id){
        layer.confirm('确认要停用吗？',function(index){
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="icon-ok bigger-120"></i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
            $(obj).remove();
            layer.msg('已停用!',{icon: 5,time:1000});
        });
    }

    /*产品-启用*/
    function member_start(obj,id){
        layer.confirm('确认要启用吗？',function(index){
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="icon-ok bigger-120"></i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
            $(obj).remove();
            layer.msg('已启用!',{icon: 6,time:1000});
        });
    }
    /*产品-编辑*/
    function member_edit(title,url,id,w,h,obj){
        sessionStorage.setItem("productid",obj);
        layer_show(title,url,w,h);
    }

    /*产品-删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
        });
    }
    //面包屑返回值
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.iframeAuto(index);
    $('.Order_form').on('click', function(){
        var cname = $(this).attr("title");
        var chref = $(this).attr("href");
        var cnames = parent.$('.Current_page').html();
        var herf = parent.$("#iframe").attr("src");
        parent.$('#parentIframe').html(cname);
        parent.$('#iframe').attr("src",chref).ready();;
        parent.$('#parentIframe').css("display","inline-block");
        parent.$('.Current_page').attr({"name":herf,"href":"javascript:void(0)"}).css({"color":"#4c8fbd","cursor":"pointer"});
        parent.layer.close(index);
    });
</script>
