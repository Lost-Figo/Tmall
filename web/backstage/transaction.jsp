<%@ page import="brackground.dao.OrderManagementDao" %>
<%@ page import="brackground.dao.Imp.OrderManagementImp" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/10/22
  Time: 19:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/style.css"/>
    <link rel="stylesheet" href="assets/css/font-awesome.min.css" />
    <link href="assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="font/css/font-awesome.min.css" />
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
    <![endif]-->
    <!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
    <![endif]-->
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
    <![endif]-->
    <script src="assets/js/ace-extra.min.js"></script>
    <!--[if lt IE 9]>
    <script src="assets/js/html5shiv.js"></script>
    <script src="assets/js/respond.min.js"></script>
    <![endif]-->
    <!--[if !IE]> -->
    <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <!-- <![endif]-->
    <script src="assets/dist/echarts.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <title>交易 - 素材牛模板演示</title>
</head>

<body>
<div class=" page-content clearfix">
    <%OrderManagementDao orderManagementDao = new OrderManagementImp();%>
    <div class="transaction_style">
        <ul class="state-overview clearfix">
            <li class="Info">
                <span class="symbol red"><i class="fa fa-jpy"></i></span>
                <span class="value"><h4>交易金额</h4><p class="Quantity color_red"><%=orderManagementDao.findamount()%></p></span>
            </li>
            <li class="Info">
                <span class="symbol  blue"><i class="fa fa-shopping-cart"></i></span>
                <span class="value"><h4>订单数量</h4><p class="Quantity color_red"><%=orderManagementDao.ordernum()%></p></span>
            </li>
            <li class="Info">
                <span class="symbol terques"><i class="fa fa-shopping-cart"></i></span>
                <span class="value"><h4>交易成功</h4><p class="Quantity color_red"><%=orderManagementDao.successorder()%></p></span>
            </li>
            <li class="Info">
                <span class="symbol yellow"><i class="fa fa-shopping-cart"></i></span>
                <span class="value"><h4>交易失败</h4><p class="Quantity color_red"><%=orderManagementDao.failorder()%></p></span>
            </li>
            <li class="Info">
                <span class="symbol darkblue"><i class="fa fa-jpy"></i></span>
                <span class="value"><h4>退款金额</h4><p class="Quantity color_red"><%=orderManagementDao.tobackmoney()%></p></span>
            </li>
        </ul>

    </div>
    <div class="t_Record">
        <div id="main" style="height:400px; overflow:hidden; width:100%; overflow:auto" ></div>
    </div>
</div>
</body>
</html>
<%
    int[] a = new int[12];
    int[] b = new int[12];
    int[] c = new int[12];
    int[] d = new int[12];
    for(int i=0;i<12;i++){
        a[i] = orderManagementDao.ordernumbymonth(i+1);
        b[i] = orderManagementDao.ordernopaybymonth(i+1);
        c[i] = orderManagementDao.orderpaidbymonth(i+1);
        d[i] = orderManagementDao.ordersendedbymonth(i+1);
    }
%>
<script type="text/javascript">
    $(document).ready(function(){

        $(".t_Record").width($(window).width()-60);
        //当文档窗口发生改变时 触发
        $(window).resize(function(){
            $(".t_Record").width($(window).width()-60);
        });
    });


    require.config({
        paths: {
            echarts: './assets/dist'
        }
    });
    require(
        [
            'echarts',
            'echarts/theme/macarons',
            'echarts/chart/line',   // 按需加载所需图表，如需动态类型切换功能，别忘了同时加载相应图表
            'echarts/chart/bar'
        ],
        function (ec,theme) {
            var myChart = ec.init(document.getElementById('main'),theme);
            option = {
                title : {
                    text: '月购买订单交易记录',
                    subtext: '实时获取用户订单购买记录'
                },
                tooltip : {
                    trigger: 'axis'
                },
                legend: {
                    data:['所有订单','待付款','已付款','已发货']
                },
                toolbox: {
                    show : true,
                    feature : {
                        mark : {show: true},
                        dataView : {show: true, readOnly: false},
                        magicType : {show: true, type: ['line', 'bar']},
                        restore : {show: true},
                        saveAsImage : {show: true}
                    }
                },
                calculable : true,
                xAxis : [
                    {
                        type : 'category',
                        data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
                    }
                ],
                yAxis : [
                    {
                        type : 'value'
                    }
                ],
                series : [
                    {
                        name:'所有订单',
                        type:'bar',
                        data:[<%=a[0]%>,<%=a[1]%>,<%=a[2]%>,<%=a[3]%>,<%=a[4]%>,<%=a[5]%>,<%=a[6]%>,<%=a[7]%>,<%=a[8]%>,<%=a[9]%>,<%=a[10]%>,<%=a[11]%>],
                        markPoint : {
                            data : [
                                {type : 'max', name: '最大值'},
                                {type : 'min', name: '最小值'}
                            ]
                        }
                    },
                    {
                        name:'待付款',
                        type:'bar',
                        data:[<%=b[0]%>,<%=b[1]%>,<%=b[2]%>,<%=b[3]%>,<%=b[4]%>,<%=b[5]%>,<%=b[6]%>,<%=b[7]%>,<%=b[8]%>,<%=b[9]%>,<%=b[10]%>,<%=b[11]%>],
                        markPoint : {
                            data : [
                                {name : '年最高', value : 1182, xAxis: 7, yAxis: 1182, symbolSize:18},
                                {name : '年最低', value : 23, xAxis: 11, yAxis: 3}
                            ]
                        },


                    }
                    , {
                        name:'已付款',
                        type:'bar',
                        data:[<%=c[0]%>,<%=c[1]%>,<%=c[2]%>,<%=c[3]%>,<%=c[4]%>,<%=c[5]%>,<%=c[6]%>,<%=c[7]%>,<%=c[8]%>,<%=c[9]%>,<%=c[10]%>,<%=c[11]%>],
                        markPoint : {
                            data : [
                                {name : '年最高', value : 172, xAxis: 7, yAxis: 172, symbolSize:18},
                                {name : '年最低', value : 23, xAxis: 11, yAxis: 3}
                            ]
                        },

                    }
                    , {
                        name:'待发货',
                        type:'bar',
                        data:[<%=d[0]%>,<%=d[1]%>,<%=d[2]%>,<%=d[3]%>,<%=d[4]%>,<%=d[5]%>,<%=d[6]%>,<%=d[7]%>,<%=d[8]%>,<%=d[9]%>,<%=d[10]%>,<%=d[11]%>],
                        markPoint : {
                            data : [
                                {name : '年最高', value : 1072, xAxis: 7, yAxis: 1072, symbolSize:18},
                                {name : '年最低', value : 22, xAxis: 11, yAxis: 3}
                            ]
                        },

                    }
                ]
            };

            myChart.setOption(option);
        }
    );
</script>
