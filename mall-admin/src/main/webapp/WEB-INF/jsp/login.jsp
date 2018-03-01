<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

<title>- 登录</title>
<meta name="keywords" content="">
<meta name="description" content="">
<link href="${ctx}/static/back/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/static/back/css/font-awesome.css?v=4.4.0"
	rel="stylesheet">
<link href="${ctx}/static/back/css/animate.css" rel="stylesheet">
<link href="${ctx}/static/back/css/style.css" rel="stylesheet">
<link href="${ctx}/static/back/css/login.css" rel="stylesheet">
<!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
<script>
	if (window.top !== window.self) {
		window.top.location = window.location;
	}
</script>

</head>

<body class="signin">
	<div class="signinpanel">
		<div class="row">
			<div class="col-sm-12">
				<form method="post" id="login-form">
					<h4 class="no-margins">登录：</h4>
					<input type="text" id="username" name="username"
						class="form-control uname" placeholder="用户名" /> <input
						type="password" id="password" name="password"
						class="form-control pword m-b" placeholder="密码" />
					<table >
						<tr style="align-content: center;align-items: center;" >
							<td><input type="text" class="form-control" id="checkCode1"
								name="checkCode" placeholder="验证码"></td>
							<td><img id="checkCodeImg"
								src="${ctx}/check/image.action"
								onclick=" refreshCode()" /></td>
						</tr>
					</table>
					<a href="">忘记密码了？</a>
				</form>
				<button class="btn btn-success btn-block" onclick="submitForm()">登录</button>
			</div>
		</div>
		<div class="signup-footer">
			<div class="pull-left">&copy; hAdmin</div>
		</div>
	</div>
	<script type="text/javascript">
		layui.use([ 'layer', 'form' ], function() {
			var layer = layui.layer;
			var form = layui.form;
		});
		function refreshCode() {
			$("#checkCodeImg").attr(
					"src",
					"${ctx}/check/image.action?"
							+ Math.random());
		}
		function submitForm() {
			var username = $("#username").val();
			var password = $("#password").val();
			//验证用户名是否为空
			if (util.isNull(username)) {
				mylayer.errorMsg("用户名不能为空");
				return;
			}
			//验证用户名是否合法
			if (!isUsernameValid(username)) {
				mylayer.errorMsg("用户名不合法，4-8数字或字母");
				return;
			}
			//验证密码是否为空
			if (util.isNull(password)) {
				mylayer.errorMsg("密码不能为空");
				return;
			}

			//ajax提交用户名和密码，并判断；接受后台返回的json数据
			$.ajax({
				url : "${ctx}/user/login.action",//发送请求的地址
				type : "POST",
				dataType : "json",
				data : $("#login-form").serialize(),
				success : function(jsonData) {//data 就是UserManagerController中login（）方法返回的数据（json格式，dataType : "json"->ajax方法已定义的返回类型,）
					if (jsonData.code == util.SUCCESS) {
						mylayer.successUrl(jsonData.msg,
								"${ctx}/index.action");
					} else {
						mylayer.errorMsg(jsonData.msg);
					}
				}
			});
		}
		//定义验证用户名格式，4--8位字母数字下划线
		function isUsernameValid(value) {
			var pattern = /^[0-9a-zA-Z]{4,8}$/;
			return pattern.test(value);
		}
	</script>
</body>

</html>
