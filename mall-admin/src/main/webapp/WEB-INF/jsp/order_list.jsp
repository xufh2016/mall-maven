<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
		<title>用户列表</title>
		<meta name="keywords" content="">
		<meta name="description" content="">
	
	</head>
	
	<body>
		<table class="layui-hide" id="listTable" lay-filter="datagrid"></table>
		
		<script>
			layui.use('table', function(){
			  var table = layui.table;
			  //第一个实例
			  table.render({
				id : 'listTable',
			    elem: '#listTable',
			    height: 315,
			    url: '${ctx}/order/orderList.action', //数据接口
			    page: true, //开启分页
			 	cols: [[ //表头
				    {field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'},
				    {field: 'orderNo', title: '订单号', width:80} ,
				    {field: 'userId', title: '用户ID', width:80, sort: true},
				    {field: 'payment', title: '付款', width:80} ,
				    {fixed : 'right', width : 178, align : 'center', toolbar : '#toolBar'}
			    ]]
			  });
			  table.on('tool(datagrid)',function(obj) { //注：tool是工具条事件名，datagrid是table原始容器的属性 lay-filter="对应的值"
				  var data = obj.data; //获得当前行数据
				  var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
				  var tr = obj.tr; //获得当前行 tr 的DOM对象

				  if (layEvent === 'detail') { //查看
					  layer.msg("查看：" + data.id);
					  layer.open({
					      type : 2,
						  area : ['900px','500px' ],
						  content : '${ctx}/order/showOrderInfo.action?id='+ data.id
					  });
				   } else if (layEvent === 'del') { //删除
						layer.confirm('真的删除行么',function(index) {
							$.ajax({
								url : '${ctx}/order/deleteById.action',
								data : {'id' : data.id},
								dataType : 'json',
								success : function(jsonData) {
									if (jsonData.code == util.SUCCESS) {
										mylayer.success(jsonData.msg);
										active.search();
									} else {
										mylayer.errorMsg(jsonData.msg);
									}
									layer.close(index);
								}
							});
						});
					} else if (layEvent === 'edit') { //编辑
						layer.open({
							type : 2,
							area : ['900px','500px' ],
							content : '${ctx}/order/showSingleInfo.action?id='+ data.id
						});
						//layer.msg("查看：" + data.id);
					}
				});
			$('.layui-btn').on('click', function() {
				var type = $(this).data('type');
				active[type] ? active[type].call(this) : '';
			});
			  
		});
		</script>
		<script type="text/html" id="toolBar">
  	    	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
  	    	<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  	    	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
		</script>
	</body>

</html>
