<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: sxf84
  Date: 2019/9/3
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="js/echarts.min.js"></script>
</head>
<body>
<jsp:include page="top.jsp"/>
<div id="main" style="width: 600px; height: 400px;"></div>
<script type="text/javascript">
    var myChart = echarts.init(document.getElementById('main'));

    // 3.初始化，默认显示标题，图例汗xy空坐标轴
    myChart.setOption({
        title : {
            text : '近' + 30 + '天内会议室使用情况',
            left : 'center'
        },
        tooltip : {
            position : 'top'
            // 可以增加标注显示
        },
        animation : false,
        gird : {
            height : '50%', //调整图表高度
            y : '10%'//调整图表位置(x)
        },
        xAxis : {
            type : 'category',
            data : [],
            splitArea : {
                show : true
            }
        },
        yAxis : {
            type : 'category',
            splitArea : {
                show : true
            }
        },
        visualMap: {
            min: 0,
            max: 4,
            calculable: true,
            orient: 'horizontal',
            left: 'center'
        },
        series : [ {
            name : '使用次数',
            type : 'heatmap',
            data : [],
            label : {
                normal : {
                    show : true
                }
            },
            itemStyle : {
                emphsis : {
                    shadowBlur : 10,
                    shadowColor : 'rgba(0, 0, 0, 0.5)'
                }
            }
        } ]
    });

    // 4.设置加载动画
    myChart.showLoading();

    // 5.定义数据存放数组(动态变)
    var days = []; // x轴坐标
    var roomNames = []; // y轴坐标
    var allData = [];

    $.ajax({
        type : "post",
        async : "true",
        url : "/meeting/GetStatisticData",
        data : {},
        dataType : "json",

        success : function(result) {
            console.log(result);

            if (result) {
                for (var i = 0; i < 30; i++) {
                    days.push(i);
                }
                $.each(result, function (i, curRoom) {
                    roomNames.push(curRoom.roomName);
                    $.each(curRoom['frequencyList'], function (j, frequency) {
                        allData.push([j, i, frequency]);
                        allData = allData.map(function (item) {
                            return [item[0], item[1], item[2] || '-']
                        });
                    })
                })
                myChart.hideLoading(); //隐藏加载动画

                //9.覆盖操作-根据数据加载数据图表
                myChart.setOption({
                    xAxis : {
                        data : days
                    },
                    yAxis : {
                        data : roomNames
                    },
                    series : [ {
                        name : '日期/使用次数',
                        type : 'heatmap',
                        data : allData,
                        label : {
                            normal : {
                                show : true
                            }
                        },
                        itemStyle : {
                            emphasis : {
                                shadowBlur : 10,
                                shadowColor : 'rgba(0, 0, 0, 0.5)'
                            }
                        }
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
