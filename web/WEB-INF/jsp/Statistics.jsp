<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>统计</title>
    <meta charset="utf-8">
    <script src="../resources/js/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="../resources/js/echarts-all.js" type="text/javascript"></script>
</head>
<body>
12345
<c:forEach items="${arr}" var="arr">
    <th>${arr}</th>
</c:forEach>
<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
<div id="main" style="width: 600px;height:400px;">123</div>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: 'ECharts 入门示例'
        },
        tooltip: {},
        legend: {
            data:['销量']
        },
        xAxis: {
            data: ["CPU","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
        },
        yAxis: {},
        series: [{
            name: '销量',
            type: 'bar',
            data: [${arr[0]}, 20, 36, 10, 10, 20]
        }]
    };

    // 使用刚指定的配置项和数据显示图表。
//    myChart.setOption(option);
    function aaa() {
        $.ajax({
            type: "GET",
            url: "test.json",
            data: {username:$("#username").val(), content:$("#content").val()},
            dataType: "json",
            success: function(data){
                $('#resText').empty();   //清空resText里面的所有内容
                var html = '';
                $.each(data, function(commentIndex, comment){
                    html += '<div class="comment"><h6>' + comment['username']
                            + ':</h6><p class="para"' + comment['content']
                            + '</p></div>';
                });
                $('#resText').html(html);
            }
        });

    }

    setInterval($.ajax({
        type: "GET",
        url: "test.json",
        data: {username:$("#username").val(), content:$("#content").val()},
        dataType: "json",
        success: function(){
            myChart.setOption(option)
        }
    }),1000);
</script>
</body>
</html>
