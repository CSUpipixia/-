<%--
  Created by IntelliJ IDEA.
  User: sxf84
  Date: 2019/9/4
  Time: 16:05
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



    var testData = [
        {value:335, name:'直接访问'},
        {value:310, name:'邮件营销'},
        {value:274, name:'联盟广告'},
        {value:235, name:'视频广告'},
        {value:400, name:'搜索引擎'}
    ];

    myChart.setOption({
        title: {
            text: '扣分统计',
            left: 'center',
            top: 20,
            textStyle: {
                color: '#000'
            }
        },

        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },

        // visualMap: {
        //     show: false,
        //     min: 0,
        //     max: 20,
        //     inRange: {
        //         colorLightness: [0.5, 1]
        //     }
        // },
        series : [
            {
                name:'扣分统计',
                type:'pie',
                radius : '50%',
                center: ['50%', '50%'],
                data:[],
                label: {
                    normal: {
                        textStyle: {
                            color: 'rgba(0, 0, 0, 0.3)'
                        }
                    }
                },
                labelLine: {
                    normal: {
                        lineStyle: {
                            color: 'rgba(0, 0, 0, 0.3)'
                        },
                        smooth: 0,
                        length: 10,
                        length2: 20
                    }
                },
                itemStyle: {
                    normal: {
                        // color: '#c23531',
                        shadowBlur: 200,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                },

                animationType: 'scale',
                animationEasing: 'elasticOut',
                animationDelay: function (idx) {
                    return Math.random() * 200;
                }
            }
        ]
    })

    myChart.showLoading();

    var allData = [];

    $.ajax({
        type : "post",
        async : true,
        url : "/meeting/GetDeductStatisticData",
        data : {},
        dataType : "json",

        success : function(result) {
            if (result) {
                // console.log(result);
                allData.push({value : result[0], name : '未被扣分'});
                allData.push({value : result[1], name : '被扣分'});
                console.log(allData);
                console.log(testData);

                myChart.hideLoading();

                myChart.setOption({
                    series : [ {
                        name:'扣分统计',
                        type:'pie',
                        radius : '55%',
                        center: ['50%', '50%'],
                        data:allData,
                        label: {
                            normal: {
                                textStyle: {
                                    color: 'rgba(0, 0, 0, 0.3)'
                                }
                            }
                        },
                        labelLine: {
                            normal: {
                                lineStyle: {
                                    color: 'rgba(0, 0, 0, 0.3)'
                                },
                                smooth: 0,
                                length: 10,
                                length2: 20
                            }
                        },
                        itemStyle: {
                            normal: {
                                // color: '#c23531',
                                shadowBlur: 200,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        },

                        animationType: 'scale',
                        animationEasing: 'elasticOut',
                        animationDelay: function (idx) {
                            return Math.random() * 200;
                        }
                    } ]
                })
            }
        },
        error : function (errorMsg) {
            console.log(errorMsg);
            myChart.hideLoading();
        }
    })


</script>

</body>
</html>
