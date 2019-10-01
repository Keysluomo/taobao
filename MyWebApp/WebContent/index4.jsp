<%@ page language="java" import="dbtaobao.connDb,java.util.*" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    ArrayList<String[]> list = connDb.index_4();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>ECharts 可视化分析淘宝双11</title>
    <link href="./css/style.css" type='text/css' rel="stylesheet"/>
    <script src="./js/echarts.min.js"></script>
</head>
<body>
<div class="bgi">
<div class='header'>
    <p>ECharts 可视化分析淘宝双11</p>
</div>
<div class="content">
    <div class="nav">
        <ul>
            <li><a href="./index.jsp">所有买家各消费行为对比</a></li>
            <li><a href="./index1.jsp">男女买家交易对比</a></li>
            <li><a href="./index2.jsp">男女买家各个年龄段交易对比</a></li>
            <li><a href="./index3.jsp">商品类别交易额对比</a></li>
            <li class="current"><a href="#">各省份的总成交量对比</a></li>
        </ul>
    </div>
    <div class="container">
        <div class="title">各省份的总成交量对比</div>
        <div class="show" >
            <div class='chart-type'>地图</div>
            <div class ="main3">
            <div id="main" style="width: 600px;height:400px;left: 0px;background-color: aliceblue;">

                <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
                <script type="text/javascript" src="js/echarts.min.js"></script>
                <script type="text/javascript" src="js/china.js"></script>

                <script>


                    var myChart = echarts.init(document.getElementById('main'));

                    var mydata = [];
                    <%
                    for(String[] a:list){
                        %>
                    mydata.push({
                        'name': "<%=a[0]%>",
                        'value': <%=a[1]%>,
                    });
                    <%
                }
                %>

                    option = {
                        title : {
                            text: '订单量',
                            subtext: '纯属虚构',
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
                                {start: 310, end: 899},
                                {start: 200, end: 309},
                                {start: 10, end: 199,},
                                {end: 10}
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
                                data:mydata
                            }
                        ]
                    };

                    // 使用刚指定的配置项和数据显示图表。
                    myChart.setOption(option);

                </script>
            </div>
            </div>
        </div>
    </div>
</div>

</div>
</body>
</html>