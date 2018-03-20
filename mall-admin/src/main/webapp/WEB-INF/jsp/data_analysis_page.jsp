
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>myProject</title>
    <!-- 引入 lib/echarts.custom.min.js -->
    <script src="${ctx}/static/back/js/echarts .js"></script>
    <script type="text/javascript" src="${ctx}/static/back/js/jquery.min.js"></script>
    
</head>
<body>
    <div id="main" style="width: 600px;height:400px;"></div>
    <script>
		$(function() {
			 // 基于准备好的dom，初始化echarts实例
	   	var myChart = echarts.init(document.getElementById('main'));
			$.ajax({
				url : '${ctx}/category/dataAnalysis.action',
				type : 'POST',
				dataType : 'json',
				success : function(jsonData) {
					if(jsonData.code == util.SUCCESS) {
						var data = jsonData.data;//data就是List<CategoryCountVo>
						var xArray = new Array();//x轴放分类的name
						var yArray = new Array();//y轴放分类的count
						for(var i = 0; i < data.length; i++) {
							xArray.push(data[i].name);
							yArray.push(data[i].count);
						}
						// 指定图表的配置项和数据
				        var option = {
				            title: {
				                text: '分类数量统计'
				            },
				            tooltip: {},
				            legend: {
				                data:['销量']
				            },
				            xAxis: {
				                data: xArray
				            },
				            yAxis: {},
				            series: [{
				                name: '销量',
				                type: 'bar',
				                data: yArray
				            }]
				        };
				        // 使用刚指定的配置项和数据显示图表。
			        	myChart.setOption(option);
					}
				}
			});
		});
    	
    </script>
</body>
</html>