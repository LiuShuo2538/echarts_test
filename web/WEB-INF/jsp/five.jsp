<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>55555</title>

</head>
<body>
<div id="main" style="height:400px"></div>
<%--<script src="../resources/js/echarts-2.2.7/build/dist/echarts.js" type="text/javascript"></script>--%>
<script src="../resources/js/jquery-1.9.0.min.js" type="text/javascript"></script>
<script src="../resources/js/echarts.js" type="text/javascript"></script>
<script type="text/javascript">

    var myChart = echarts.init(document.getElementById('main'));

    function randomData() {
        now = new Date(+now + oneDay);
        value = value + Math.random() * 21 - 10;
        $.ajax({
            url: "${context}/one/cpu.do",
            type: "get",
            data: {},
            dataType: "text",
            async: false,
            success: function (data, status, xhr) {
                console.log(data);
                value = data;
            }
        });
        return {
            name: now.toString(),
            value: [
                [now.toLocaleTimeString().replace(/^\D*/,'')].join('/'),
                value
            ]
        }
    }
    var app = {};
    var data = [];
    var data1 = [,,,,,,,,,,];

    var now = +new Date(1997, 9, 3);
    var oneDay = 24 * 3600 * 1000;
    var value = Math.random() * 1000;


//    data.push(randomData());

    timerId = setInterval(function () {
        function randomData() {
            now = new Date(+now + oneDay);
            value = value + Math.random() * 21 - 10;
            $.ajax({
                url: "${context}/one/cpu.do",
                type: "get",
                data: {},
                dataType: "text",
                async: false,
                success: function (data, status, xhr) {
                    value = data;
                    data1.push(data);
                }
            });
            return {
                name: now.toString(),
                value: [
                    now.getTime(),
                    value
                ]
            }
        }
        if(data1.length>15){
            data1.shift();
        }
        data.push(randomData());

        myChart.setOption({ title: {
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
//            xAxis: {
//                type: 'time',
//                splitLine: {
//                    show: false
//                }
//            },
            xAxis : {

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
            yAxis: {
                type: 'value',
                boundaryGap: [0, '100%'],
                splitLine: {
                    show: false
                },
                max:"1"
            },
            series: [{
                name: '模拟数据',
                type: 'line',
                showSymbol: false,
                hoverAnimation: false,
                areaStyle: {normal: {color:"blue"}},
                data: data1
            }]});
    }, 1000);

//    alert( now.toLocaleTimeString().replace(/^\D*/,''))

</script>
</body>
</html>