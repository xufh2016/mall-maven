<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>靓淘网_购物车</title>
		<link rel="stylesheet" type="text/css" href="${ctx}/static/front/css/cart_style.css" />
		<link rel="stylesheet" type="text/css" href="${ctx}/static/front/css/login_style.css" />
	</head>

	<body>
		<div class="login" style="display:none" id="loginForm">
			<form id="login-form">
				<ul>
					<li class="login_title_1">
						<a href="">密码登录</a>
	
					</li>
					<li class="login_title_2">
						<a href="">扫码登录</a>
					</li>
					<li>
						<input id="username" name="username" class="login_user" type="text" placeholder="会员名/邮箱/手机号" />
						<input id="password" name="password" class="login_password" type="password" placeholder="密码" />
						<input class="login_btn" type="button" onclick="login()" value="登录" />
					</li>
					<li class="login_select">
						<a class="weibo" href="">微博登录</a>
						<a class="zhifubao" href="">支付宝登录</a><br />
					</li>
					<li class="renmenber_user">
						<input type="checkbox" value="remer_user" id="remer_user" />
						<label for="remer_user">记住用户名</label>
					</li>
					<li class="login_bottom">
						<a href="">忘记密码</a>
						<a href="">免费注册</a>
					</li>
				</ul>
			</form>
		</div>
	</body>

</html>