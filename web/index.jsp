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
    <script src="../resources/js/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="../resources/js/echarts-all.js" type="text/javascript"></script>
</head>
<body>
1
<c:forEach items="${arr}" var="arr">
    <th>${arr}</th>
</c:forEach>
<a href="${context}/one/two.do">W3School</a>
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

    var data = [];
    var now = +new Date(1997, 9, 3);
    var oneDay = 24 * 3600 * 1000;
    var value = Math.random() * 1000;
    for (var i = 0; i < 1000; i++) {
        data.push(randomData());
    }

    option = {
        title: {
            text: '动态数据 + 时间坐标轴'
        },
        tooltip: {
            trigger: 'axis',
            formatter: function (params) {
                params = params[0];
                var date = new Date(params.name);
                return ${arr}+ '/'+date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear() + ' : ' + params.value[1];
            },
            axisPointer: {
                animation: false
            }
        },
        xAxis: {
            type: 'time',
            splitLine: {
                show: false
            }
        },
        yAxis: {
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

//    app.timeTicket =setInterval(function () {
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
    setInterval(myChart.setOption(option),1000);



</script>



</body>
</html>
