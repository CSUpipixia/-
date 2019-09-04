<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 16198
  Date: 2019/9/1
  Time: 18:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="js/echarts.min.js"></script>
    <%--<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>//导入jquery包xxxx--%>
</head>
<body>
<jsp:include page="top.jsp"/>
<div style="text-align: center;">
    <h2>欢迎访问jsp+servlet+echarts动态网页</h2>
</div>
<!-- 2.为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="width: 600px; height: 400px;"></div>

<script type="text/javascript">
        var myChart = echarts.init(document.getElementById('main'));

        //3.初始化，默认显示标题，图例和xy空坐标轴
        myChart.setOption({

            title : {
                text : '会议室使用次数'
            },
            tooltip : {},

            legend : {

                data : [ '使用次数' ]
            },
            xAxis : {
                data : []
            },
            yAxis : {},
            series : [ {
                name : '使用次数',
                type : 'bar',
                data : []
            } ]
        });

        //4.设置加载动画(非必须)
        myChart.showLoading(); //数据加载完之前先显示一段简单的loading动画

        //5.定义数据存放数组(动态变)
        var names = []; //建立一个类别数组（实际用来盛放X轴坐标值）
        var nums = []; //建立一个销量数组（实际用来盛放Y坐标值）

        //6.ajax发起数据请求
        $.ajax({
            type : "post",
            async : true, //异步请求（同步请求将会锁住浏览器，其他操作须等请求完成才可执行）
            url :"/meeting/chart", //请求发送到MyChartServlet
            data : {},
            dataType : "json", //返回数据形式为json

            //7.请求成功后接收数据name+num两组数据
            success : function(result) {
                //result为服务器返回的json对象
                if (result) {
                    //8.取出数据存入数组
                    for (var i = 0; i < result.length; i++) {
                        names.push(result[i].roomname); //迭代取出类别数据并填入类别数组
                        nums.push(result[i].count);     //取出销量并填入销量数组
                    }

                    myChart.hideLoading(); //隐藏加载动画

                    //9.覆盖操作-根据数据加载数据图表
                    myChart.setOption({
                        xAxis : {
                            data : names
                        },
                        series : [ {
                            // 根据名字对应到相应的数据
                            name : '使用次数',
                            data : nums
                        } ]
                    });
                }
            },
            error : function(errorMsg) {
                console.log(errorMsg);
                myChart.hideLoading();
            }
    })
</script>

</body>
</html>
