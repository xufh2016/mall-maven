
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
	数据统计页面
    <div id="main" style="width: 600px;height:400px;"></div>
    <script>
		$(function() {
		// 基于准备好的dom，初始化echarts实例
	   	var myChart = echarts.init(document.getElementById('main'));
			$.ajax({
				url : '${ctx}/category/circleDataAnalysis.action',
				type : 'POST',
				dataType : 'json',
				success : function(jsonData){
					if(jsonData.code == util.SUCCESS) {
						var data=jsonData.data;
						var xArray = new Array();//x轴放分类的name
						//var yArray = new Array();//y轴放分类的count
						
						for(var i = 0; i < data.length; i++) {
							xArray.push(data[i].name);
							//yArray.push(data[i].count);
						}
						//alert(xArray);
					  	var seriess=new Array();
					    for(var j=0;j<data.length;j++){//构造一个json格式
					    	var json = {value:data[j].count,name:data[j].name};
					    	seriess.push(json);
					    }
					    option = {
				    	    title : {
				    	        text: '商品销售统计',
				    	        x:'center'
				    	    },
				    	    tooltip : {
				    	        trigger: 'item',
				    	        formatter: "{a} <br/>{b} : {c} ({d}%)"
				    	    },
				    	    legend: {
				    	        orient: 'vertical',
				    	        left: 'left',
				    	        data: xArray
				    	    },
				    	    series : [
				    	        {
				    	            name: '商品来源',
				    	            type: 'pie',
				    	            radius : '55%',
				    	            center: ['50%', '60%'],
				    	            data:seriess,
				    	            itemStyle: {
				    	                emphasis: {
				    	                    shadowBlur: 10,
				    	                    shadowOffsetX: 0,
				    	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
				    	                }
				    	            }
				    	        }
				    	    ]
				    	};
						// 使用刚指定的配置项和数据显示图表。
			        	myChart.setOption(option);//必须加的，设置图表实例的配置项以及数据，万能接口，所有参数和数据的修改都可以通过setOption完成，ECharts 会合并新的参数和数据，然后刷新图表。
					}
				}
			})
		});
    	
    </script>
</body>
</html>