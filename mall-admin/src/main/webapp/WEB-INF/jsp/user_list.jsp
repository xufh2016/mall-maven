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
		<table class="layui-hide" id="datagrid"></table>
		
		<script>
			layui.use('table', function(){
			  var table = layui.table;
			  //第一个实例
			  table.render({
			    elem: '#datagrid',
			    height: 315,
			    url: '${ctx}/user/pageList.action', //数据接口
			    page: true, //开启分页
			 	cols: [[ //表头
				    {field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'},
				    {field: 'username', title: '用户名', width:80} ,
				    {field: 'password', title: '密码', width:80, sort: true},
				    {field: 'email', title: '邮箱', width:80} ,
				    {field: 'phone', title: '电话', width: 177},
				    {field: 'question', title: '问题', width: 80, sort: true},
				    {field: 'answer', title: '答案', width: 80, sort: true},
				    {field: 'role', title: '权限', width: 80},
				    {field: 'createTime', title: '创建时间', width: 135, sort: true},
				    {field: 'updateTime', title: '更新时间', width: 135, sort: true}
			    ]]
			  });
			});
		</script>
	</body>

</html>
