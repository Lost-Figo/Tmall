<%@ page import="brackground.dao.OrderManagementDao" %>
<%@ page import="brackground.dao.Imp.OrderManagementImp" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/10/23
  Time: 19:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>订单 - 素材牛模板演示</title>
    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="assets/dist/echarts.js"></script>
</head>

<body>
<%
    OrderManagementDao orderManagementDao = new OrderManagementImp();
    int[] ordernumbyprovince = new int[34];
    ordernumbyprovince[0] = orderManagementDao.ordernumbyprovince("%北京%");
    ordernumbyprovince[1] = orderManagementDao.ordernumbyprovince("%天津%");
    ordernumbyprovince[2] = orderManagementDao.ordernumbyprovince("%上海%");
    ordernumbyprovince[3] = orderManagementDao.ordernumbyprovince("%重庆%");
    ordernumbyprovince[4] = orderManagementDao.ordernumbyprovince("%河北%");
    ordernumbyprovince[5] = orderManagementDao.ordernumbyprovince("%河南%");
    ordernumbyprovince[6] = orderManagementDao.ordernumbyprovince("%云南%");
    ordernumbyprovince[7] = orderManagementDao.ordernumbyprovince("%辽宁%");
    ordernumbyprovince[8] = orderManagementDao.ordernumbyprovince("%黑龙江%");
    ordernumbyprovince[9] = orderManagementDao.ordernumbyprovince("%湖南%");
    ordernumbyprovince[10] = orderManagementDao.ordernumbyprovince("%安徽%");
    ordernumbyprovince[11] = orderManagementDao.ordernumbyprovince("%山东%");
    ordernumbyprovince[12] = orderManagementDao.ordernumbyprovince("%新疆%");
    ordernumbyprovince[13] = orderManagementDao.ordernumbyprovince("%江苏%");
    ordernumbyprovince[14] = orderManagementDao.ordernumbyprovince("%浙江%");
    ordernumbyprovince[15] = orderManagementDao.ordernumbyprovince("%江西%");
    ordernumbyprovince[16] = orderManagementDao.ordernumbyprovince("%湖北%");
    ordernumbyprovince[17] = orderManagementDao.ordernumbyprovince("%广西%");
    ordernumbyprovince[18] = orderManagementDao.ordernumbyprovince("%甘肃%");
    ordernumbyprovince[19] = orderManagementDao.ordernumbyprovince("%山西%");
    ordernumbyprovince[20] = orderManagementDao.ordernumbyprovince("%内蒙古%");
    ordernumbyprovince[21] = orderManagementDao.ordernumbyprovince("%陕西%");
    ordernumbyprovince[22] = orderManagementDao.ordernumbyprovince("%吉林%");
    ordernumbyprovince[23] = orderManagementDao.ordernumbyprovince("%福建%");
    ordernumbyprovince[24] = orderManagementDao.ordernumbyprovince("%贵州%");
    ordernumbyprovince[25] = orderManagementDao.ordernumbyprovince("%广东%");
    ordernumbyprovince[26] = orderManagementDao.ordernumbyprovince("%青海%");
    ordernumbyprovince[27] = orderManagementDao.ordernumbyprovince("%西藏%");
    ordernumbyprovince[28] = orderManagementDao.ordernumbyprovince("%四川%");
    ordernumbyprovince[29] = orderManagementDao.ordernumbyprovince("%宁夏%");
    ordernumbyprovince[30] = orderManagementDao.ordernumbyprovince("%海南%");
    ordernumbyprovince[31] = orderManagementDao.ordernumbyprovince("%台湾%");
    ordernumbyprovince[32] = orderManagementDao.ordernumbyprovince("%香港%");
    ordernumbyprovince[33] = orderManagementDao.ordernumbyprovince("%澳门%");
%>
<div id="map" style="width:100%; overflow:auto; overflow:hidden";></div>
</body>
</html>
<script>
    //初始化宽度、高度
    $("#map").height($(window).height()-20);

    //当文档窗口发生改变时 触发
    $(window).resize(function(){
        $("#map").height($(window).height()-20);
    });
    //统计
    require.config({
        paths: {
            echarts: './assets/dist'
        }
    });
    require(
        [
            'echarts',
            'echarts/theme/macarons',
            'echarts/chart/map',   // 按需加载所需图表，如需动态类型切换功能，别忘了同时加载相应图表
            //'echarts/chart/bar'
        ],
        function (ec,theme) {
            var myChart = ec.init(document.getElementById('map'),theme);

            option = {
                title : {
                    text: '订单量',
                    x:'center'
                },
                tooltip : {
                    trigger: 'item'
                },
                legend: {
                    orient: 'vertical',
                    x:'left',
                    data:['订单量']
                },
                dataRange: {
                    x: 'left',
                    y: 'bottom',
                    splitList: [
                        {start: 1500},
                        {start: 900, end: 1500},
                        {start: 310, end: 1000},
                        {start: 5, end: 300},
                        {start: 3, end: 4, label: '3 到 4'},
                        {start: 2, end: 2, label: '2', color: 'black'},
                        {end: 1}
                    ],
                    color: ['#E0022B', '#E09107', '#A3E00B']
                },
                toolbox: {
                    show: true,
                    orient : 'vertical',
                    x: 'right',
                    y: 'center',
                    feature : {
                        mark : {show: true},
                        dataView : {show: true, readOnly: false},
                        restore : {show: true},
                        saveAsImage : {show: true}
                    }
                },
                roamController: {
                    show: true,
                    x: 'right',
                    mapTypeControl: {
                        'china': true
                    }
                },
                series : [
                    {
                        name: '订单量',
                        type: 'map',
                        mapType: 'china',
                        roam: false,
                        itemStyle:{
                            normal:{
                                label:{
                                    show:true,
                                    textStyle: {
                                        color: "rgb(249, 249, 249)"
                                    }
                                }
                            },
                            emphasis:{label:{show:true}}
                        },
                        data:[
                            {name: '北京',value: <%=ordernumbyprovince[0]%>},
                            {name: '天津',value: <%=ordernumbyprovince[1]%>},
                            {name: '上海',value: <%=ordernumbyprovince[2]%>},
                            {name: '重庆',value: <%=ordernumbyprovince[3]%>},
                            {name: '河北',value: <%=ordernumbyprovince[4]%>},
                            {name: '河南',value: <%=ordernumbyprovince[5]%>},
                            {name: '云南',value: <%=ordernumbyprovince[6]%>},
                            {name: '辽宁',value: <%=ordernumbyprovince[7]%>},
                            {name: '黑龙江',value: <%=ordernumbyprovince[8]%>},
                            {name: '湖南',value: <%=ordernumbyprovince[9]%>},
                            {name: '安徽',value: <%=ordernumbyprovince[10]%>},
                            {name: '山东',value: <%=ordernumbyprovince[11]%>},
                            {name: '新疆',value: <%=ordernumbyprovince[12]%>},
                            {name: '江苏',value: <%=ordernumbyprovince[13]%>},
                            {name: '浙江',value: <%=ordernumbyprovince[14]%>},
                            {name: '江西',value: <%=ordernumbyprovince[15]%>},
                            {name: '湖北',value: <%=ordernumbyprovince[16]%>},
                            {name: '广西',value: <%=ordernumbyprovince[17]%>},
                            {name: '甘肃',value: <%=ordernumbyprovince[18]%>},
                            {name: '山西',value: <%=ordernumbyprovince[19]%>},
                            {name: '内蒙古',value: <%=ordernumbyprovince[20]%>},
                            {name: '陕西',value: <%=ordernumbyprovince[21]%>},
                            {name: '吉林',value: <%=ordernumbyprovince[22]%>},
                            {name: '福建',value: <%=ordernumbyprovince[23]%>},
                            {name: '贵州',value: <%=ordernumbyprovince[24]%>},
                            {name: '广东',value: <%=ordernumbyprovince[25]%>},
                            {name: '青海',value: <%=ordernumbyprovince[26]%>},
                            {name: '西藏',value: <%=ordernumbyprovince[27]%>},
                            {name: '四川',value: <%=ordernumbyprovince[28]%>},
                            {name: '宁夏',value: <%=ordernumbyprovince[29]%>},
                            {name: '海南',value: <%=ordernumbyprovince[30]%>},
                            {name: '台湾',value: <%=ordernumbyprovince[31]%>},
                            {name: '香港',value: <%=ordernumbyprovince[32]%>},
                            {name: '澳门',value: <%=ordernumbyprovince[33]%>}
                        ]
                    }
                ]
            };



            myChart.setOption(option);
        })
</script>

