<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="description" content="ECharts">

    <title>CPU page</title>
    <%--<script type="text/javascript" src="js/jquery-1.8.3.js"></script>--%>
    <%--<script src="../resources/js/echarts-2.2.7/build/dist/echarts-all.js" type="text/javascript"></script>--%>
    <%--<script type="text/javascript" src="js/echarts2/echarts-original.js"></script>--%>
    <script src="../resources/js/jquery-1.9.0.min.js" type="text/javascript"></script>
    <%--<script src="http://echarts.baidu.com/build/dist/echarts.js"></script>--%>
    <%--<script src="../resources/js/echarts-all.js" type="text/javascript"></script>--%>
</head>

<body>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="height:450px ; width: 95%;"></div>
<script src="../resources/js/echarts-2.2.7/build/dist/echarts-all.js" type="text/javascript"></script>
<script type="text/javascript" >
    var myChart = echarts.init(document.getElementById('main'));
    option = {
        title : {
            text: '动态数据',
            subtext: '纯属虚构'
        },
        tooltip : {
            trigger: 'axis'
        },
        legend: {
            data:['最新成交价', '预购队列']
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
        dataZoom : {
            show : false,
            start : 0,
            end : 100
        },
        xAxis : [
            {
                type : 'category',
                boundaryGap : true,
                data : (function (){
                    var now = new Date();
                    var res = [];
                    var len = 10;
                    while (len--) {
                        res.unshift(now.toLocaleTimeString().replace(/^\D*/,''));
                        now = new Date(now - 2000);
                    }
                    return res;
                })()
            },
            {
                type : 'category',
                boundaryGap : true,
                data : (function (){
                    var res = [];
                    var len = 10;
                    while (len--) {
                        res.push(len + 1);
                    }
                    return res;
                })()
            }
        ],
        yAxis : [
            {
                type : 'value',
                scale: true,
                name : '价格',
                boundaryGap: [0.2, 0.2]
            },
            {
                type : 'value',
                scale: true,
                name : '预购量',
                boundaryGap: [0.2, 0.2]
            }
        ],
        series : [
            {
                name:'预购队列',
                type:'bar',
                xAxisIndex: 1,
                yAxisIndex: 1,
                data:(function (){
                    var res = [];
                    var len = 10;
                    while (len--) {
                        res.push(Math.round(Math.random() * 1000));
                    }
                    return res;
                })()
            },
            {
                name:'最新成交价',
                type:'line',
                data:(function (){
                    var res = [];
                    var len = 10;
                    while (len--) {
                        res.push((Math.random()*10 + 5).toFixed(1) - 0);
                    }
                    return res;
                })()
            }
        ]
    };
    var lastData = 11;
    var axisData;
    clearInterval(timeTicket);
    timeTicket = setInterval(function (){
        lastData += Math.random() * ((Math.round(Math.random() * 10) % 2) == 0 ? 1 : -1);
        lastData = lastData.toFixed(1) - 0;
        axisData = (new Date()).toLocaleTimeString().replace(/^\D*/,'');

        // 动态数据接口 addData
        myChart.addData([
            [
                0,        // 系列索引
                Math.round(Math.random() * 1000), // 新增数据
                true,     // 新增数据是否从队列头部插入
                false     // 是否增加队列长度，false则自定删除原有数据，队头插入删队尾，队尾插入删队头
            ],
            [
                1,        // 系列索引
                lastData, // 新增数据
                false,    // 新增数据是否从队列头部插入
                false,    // 是否增加队列长度，false则自定删除原有数据，队头插入删队尾，队尾插入删队头
                axisData  // 坐标轴标签
            ]
        ]);
    }, 2100);

</script>
</body>
</html>