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

</head>

<body>
	<div style="margin: 15px">
		<form id="form_add" class="layui-form layui-form-pane" action="">
			<input type="hidden" name="id" value="${order.id}" readonly="readonly"/>
			<div class="layui-form-item">
				<label class="layui-form-label">订单号</label>
				<div class="layui-input-block">
					<input type="text" name="name" autocomplete="off"
						value="${order.orderNo}" placeholder="请输入商品名称" class="layui-input"  readonly="readonly">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">用户ID</label>
				<div class="layui-input-block">
					<input type="text" name="subtitle" lay-verify="required"
						value="${order.userId}" placeholder="请输入商品副标题"
						autocomplete="off" class="layui-input"  readonly="readonly">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">Shipping ID</label>
				<div class="layui-input-block">
					<input type="text" name="subtitle" lay-verify="required"
						value="${order.shippingId}" placeholder="请输入商品副标题"
						autocomplete="off" class="layui-input"  readonly="readonly">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">商品价格</label>
				<div class="layui-input-block">
					<input type="text" name="price" autocomplete="off"
						value="${order.payment}" placeholder="请输入商品价格" class="layui-input"  readonly="readonly">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">paymentType</label>
				<div class="layui-input-block">
					<input type="text" name="stock" lay-verify="required"
						value="${order.paymentType}" placeholder="请输入商品库存" autocomplete="off"
						class="layui-input"  readonly="readonly">
				</div>
			</div>

			<div class="layui-form-item" pane="">
				<label class="layui-form-label">postage</label>
				<div class="layui-input-block">
					<input type="text" name="stock" lay-verify="required"
						value="${order.postage}" placeholder="请输入商品库存" autocomplete="off"
						class="layui-input"  readonly="readonly">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">status</label>
				<div class="layui-input-block">
					<input type="text" name="stock" lay-verify="required"
						value="${order.status}" placeholder="请输入商品库存" autocomplete="off"
						class="layui-input"  readonly="readonly">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">paymentTime</label>
				<div class="layui-input-block">
					<input type="text" name="stock" lay-verify="required"
						value="${order.paymentTime}" placeholder="请输入商品库存" autocomplete="off"
						class="layui-input"  readonly="readonly">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">sendTime</label>
				<div class="layui-input-block">
					<input type="text" name="stock" lay-verify="required"
						value="${order.sendTime}" placeholder="请输入商品库存" autocomplete="off"
						class="layui-input"  readonly="readonly">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">endTime</label>
				<div class="layui-input-block">
					<input type="text" name="stock" lay-verify="required"
						value="${order.endTime}" placeholder="请输入商品库存" autocomplete="off"
						class="layui-input"  readonly="readonly">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">closeTime</label>
				<div class="layui-input-block">
					<input type="text" name="stock" lay-verify="required"
						value="${order.closeTime}" placeholder="请输入商品库存" autocomplete="off"
						class="layui-input"  readonly="readonly">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">createTime</label>
				<div class="layui-input-block">
					<input type="text" name="stock" lay-verify="required"
						value="${order.createTime}" placeholder="请输入商品库存" autocomplete="off"
						class="layui-input"  readonly="readonly">
				</div>
			</div>
		</form>	
	</div>
	<script type="text/javascript"
		src="${ctx}/static/lib/jquery/jquery.form.js"></script>
	<script type="text/javascript"
		src="${ctx}/static/lib/kindeditor/kindeditor-all.js"></script>
	<script type="text/javascript">
	</script>
</body>

</html>
