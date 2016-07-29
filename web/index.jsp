<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 7/25/2016
  Time: 5:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>E_charts</title>
    <meta charset="utf-8">
    <script src="resources/js/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="resources/js/echarts.js" type="text/javascript"></script>
</head>
<body>
1
<c:forEach items="${arr}" var="arr">
    <th>${arr}</th>
</c:forEach>
<a href="${context}/one/two.do">W3School</a>
<a href="${context}/one/four.do">222222</a>
<a href="${context}/one/five.do">555555</a>

<div id="main" style="width: 600px;height:400px;">123</div>
<script type="text/javascript">

    var myChart = echarts.init(document.getElementById('main'));


    function randomData() {
        now = new Date(+now + oneDay);
        value = value + Math.random() * 21 - 10;
        return {
            name: now.toString(),
            value: [
                [now.getFullYear(), now.getMonth() + 1, now.getDate()].join('/'),
                Math.round(value)
            ]
        }
    }
    var app = {};
    var data = [];
    var now = +new Date();
    var oneDay = 1000;
    var value = Math.random() * 1000;



    option = {
        grid:{
            borderColor:'red'
        },

        title: {
            text: '动态数据 + 时间坐标轴'
        },
        tooltip: {
            trigger: 'axis',
            formatter: function (params) {
                params = params[0];
                var date = new Date(params.name);
                return  date.toLocaleTimeString().replace(/^\D*/,'') + ' : ' + params.value[1];
            },
            axisPointer: {
                animation: false
            }
        },
        xAxis: {

            type: 'category',
            splitLine: {
                show: false
            },
            data:(function (){
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
        yAxis: {
            name:'纵',
//            show:false,
            type: 'value',
            boundaryGap: [0, '100%'],
            splitLine: {
                show: false
            }
        },
        series: [{
            name: '模拟数据',
            type: 'line',
            showSymbol: false,
            hoverAnimation: false,
            data: data
        }]
    };
    for (var i = 0; i < 1000; i++) {
        data.push(randomData());
    }
//    app.timeTicket = setInterval(function () {
//
//        for (var i = 0; i < 5; i++) {
//            data.shift();
//            data.push(randomData());
//        }
//        myChart.setOption({
//            series: [{
//                data: data
//            }]
//        });
//    }, 1000);
    timerId = setInterval(function () {
        for (var i = 0; i < 5; i++) {
            data.shift();
            data.push(randomData());
        }

        myChart.setOption(option);
        myChart.setOption({
            series: [{
                data: data
            }]
        });
//        alert(data)
    }, 1000);

</script>


</body>
</html>
