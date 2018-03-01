<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<title>商品列表</title>
<meta name="keywords" content="">
<meta name="description" content="">
<body>
	<div style="margin: 15px">
		<div class="demoTable">
			名称：
			<div class="layui-inline">
				<input class="layui-input" name="id" id="productName"
					autocomplete="off">
			</div>
			子标题：
			<div class="layui-inline">
				<input class="layui-input" name="id" id="productSubtitle"
					autocomplete="off">
			</div>
			<div class="layui-inline">
				日期时间:
				<div class="layui-input-inline">
					<input type="text" class="layui-input" id="beginTime" 
						placeholder="yyyy-MM-dd HH:mm:ss">
				</div>
				-
				<div class="layui-input-inline">
					<input type="text" class="layui-input" id="endTime"
						placeholder="yyyy-MM-dd HH:mm:ss">
				</div>
			</div>
			<button class="layui-btn" data-type="search">搜索</button>
			<button class="layui-btn layui-btn-danger" data-type="deleteBatch">批量删除</button>
			<button class="layui-btn " data-type="add">添加商品</button>
		</div>
	</div>
	<table class="layui-hide" id="listTable" lay-filter="datagrid"></table>


	<script type="text/html" id="imgTpl">
  		<img src="/pic/{{d.mainImage}}">
	</script>
	<script type="text/html" id="statusTpl">
  		{{#   if(d.status==1){  }}
			上架
		{{#   } else if(d.status==2){   }}
			下架
		{{#   }    }}
	</script>
	<script>
		layui.use('laydate', function() {
			var laydate = layui.laydate;
			//时间选择器
			laydate.render({
				elem : '#beginTime',
				type : 'datetime'
			});
			laydate.render({
				elem : '#endTime',
				type : 'datetime'
			});
		});
	</script>

	<script>
		layui
				.use(
						'table',
						function() {
							var table = layui.table;
							//第一个实例
							table.render({
								id : 'listTable',
								elem : '#listTable',
								height : 500,
								cellMinWidth : 60,//全局定义常规单元格的最小宽度，layui 2.2.1 新增
								url : '${ctx}/product/pageList.action', //数据接口
								page : true, //开启分页
								cols : [ [ //表头
								{
									checkbox : true,
									fixed : true
								}, {
									field : 'id',
									title : 'ID',
									sort : true,
									fixed : 'left'
								}, {
									field : 'categoryId',
									title : '库存编号'
								}, {
									field : 'name',
									title : '商品名称'
								}, {
									field : 'subtitle',
									title : '子标题',
									sort : true
								}, {
									field : 'detail',
									title : '商品详情'
								}, {
									field : 'price',
									title : '价格'
								},

								{
									field : 'mainImage',
									title : '商品主图片',
									templet : '#imgTpl'
								},

								{
									field : 'stock',
									title : '库存',
									sort : true
								}, {
									field : 'status',
									title : '商品状态',
									templet : '#statusTpl'
								}, {
									field : 'createTime',
									title : '创建时间',
									sort : true
								}, {
									field : 'updateTime',
									title : '更新时间',
									sort : true
								}, {
									fixed : 'right',
									width : 178,
									align : 'center',
									toolbar : '#toolBar'
								} ] ]
							});
							active = {
								search : function() {
									var productName = $('#productName');
									var productSubtitle = $('#productSubtitle');
									var sc_beginTime = $('#beginTime');
									var sc_endTime = $('#endTime');
									//执行重载
									table.reload('listTable', {
										page : {
											curr : 1,//重新从第 1 页开始
										},
										where : {
											sc_name : productName.val(),
											sc_subtitle : productSubtitle.val(),
											beginTime : sc_beginTime.val(),
											endTime : sc_endTime.val(),
										}
									});
								},
								deleteBatch : function() {
									var checkStatus = table
											.checkStatus('listTable');
									var data = checkStatus.data;
									layer
											.confirm(
													'确定要删除这' + data.length
															+ '条数据吗？',
													function(index) {
														var ids = util
																.getSelectedIds(data);
														$
																.ajax({
																	url : '${ctx}/product/deleteBatch.action',
																	data : {
																		'ids' : ids
																	},
																	dataType : 'json',
																	success : function(
																			jsonData) {
																		if (jsonData.code == util.SUCCESS) {
																			mylayer
																					.success(jsonData.msg);
																			active
																					.search();
																		} else {
																			mylayer
																					.errorMsg(jsonData.msg);
																		}
																	}
																});
													});
									//layer.alert(JSON.stringify(data));
								},

								add : function() {
									location.href = '${ctx}/product/getAddPage.action';
								},

							};

							table
									.on(
											'tool(datagrid)',
											function(obj) { //注：tool是工具条事件名，datagrid是table原始容器的属性 lay-filter="对应的值"
												var data = obj.data; //获得当前行数据
												var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
												var tr = obj.tr; //获得当前行 tr 的DOM对象

												if (layEvent === 'detail') { //查看
													layer.msg("查看：" + data.id);
													layer
															.open({
																type : 2,
																area : [
																		'900px',
																		'500px' ],
																content : '${ctx}/product/showProductInfo.action?id='
																		+ data.id
															});
												} else if (layEvent === 'del') { //删除
													layer
															.confirm(
																	'真的删除行么',
																	function(
																			index) {
																		$
																				.ajax({
																					url : '${ctx}/product/deleteById.action',
																					data : {
																						'id' : data.id
																					},
																					dataType : 'json',
																					success : function(
																							jsonData) {
																						if (jsonData.code == util.SUCCESS) {
																							mylayer
																									.success(jsonData.msg);
																							active
																									.search();
																						} else {
																							mylayer
																									.errorMsg(jsonData.msg);
																						}
																						layer
																								.close(index);
																					}
																				});
																	});
												} else if (layEvent === 'edit') { //编辑
													layer
															.open({
																type : 2,
																area : [
																		'900px',
																		'500px' ],
																content : '${ctx}/product/showSingleInfo.action?id='
																		+ data.id
															});
													//layer.msg("查看：" + data.id);
												}
											});

							$('.demoTable .layui-btn').on('click', function() {
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
