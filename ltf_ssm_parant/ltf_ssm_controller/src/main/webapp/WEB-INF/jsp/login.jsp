<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<script src="static/jquery/jquery-3.3.1.slim.min.js"></script>
	<script src="static/popper/popper.min.js"></script>
	<script src="static/bootstrap/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
	<title>登录</title>
	<script type="text/javascript">
	//点击图片切换验证码
		$(function () {
			$("#vcodeImg").click(
				function () {
					this.src = "getCode?t="+new Date().getTime();
				}
			);
		})
	</script>
	<style>
		html,
		body {
			height: 100%;
		}

		body {
			display: -ms-flexbox;
			display: flex;
			-ms-flex-align: center;
			align-items: center;
			padding-top: 40px;
			padding-bottom: 40px;
			background-color: #f5f5f5;
		}

		.form-signin {
			width: 100%;
			max-width: 330px;
			padding: 15px;
			margin: auto;
		}

		.form-signin .checkbox {
			font-weight: 400;
		}

		.form-signin .form-control {
			position: relative;
			box-sizing: border-box;
			height: auto;
			padding: 10px;
			font-size: 16px;
		}

		.form-signin .form-control:focus {
			z-index: 2;
		}

		.form-signin input[type="text"] {
			margin-bottom: -1px;
			border-bottom-right-radius: 0;
			border-bottom-left-radius: 0;
		}

		.form-signin input[type="password"] {
			margin-bottom: 10px;
			border-top-left-radius: 0;
			border-top-right-radius: 0;
		}

		.form-signin input[type="code"] {
			margin-bottom: 10px;
			border-top-left-radius: 0;
			border-top-right-radius: 0;
		}

		.bd-placeholder-img {
			font-size: 1.125rem;
			text-anchor: middle;
			-webkit-user-select: none;
			-moz-user-select: none;
			-ms-user-select: none;
			user-select: none;
		}

		@media (min-width: 768px) {
			.bd-placeholder-img-lg {
				font-size: 3.5rem;
			}
		}
		
		.col-md-6 {
			padding-right:0px;
			padding-left:0px;
		}
	</style>
</head>

<body class="text-center">
	<form class="form-signin" action="login">
		<h1 class="h3 mb-3 font-weight-normal">登录</h1>
		<label for="username" class="sr-only">用户名</label>
		<input type="text" id="username" name="username" class="form-control" placeholder="用户名" required autofocus>
		<label for="password" class="sr-only">密码</label>
		<input type="password" id="password" name="password" class="form-control" placeholder="密码" required>
		<label for="password" class="sr-only">验证码</label>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-6">
					<input type="code" id="code" name="code" class="form-control" placeholder="验证码" required>
				</div>
				<div class="col-md-6">
					<img title="点击图片切换验证码" id="vcodeImg" src="getCode">
				</div>
			</div>
		</div>
		<div>${name }${msg }</div>
		<button class="btn btn-lg btn-primary btn-block" id="doLogin" type="submit">登入</button>
		<a href="toRegister" class="btn btn-lg btn-secondary btn-block">注册</a>
		<br>
		<a href="toForgetPassword"><small class="text-muted">忘记密码?</small></a>
		<p class="mt-5 mb-3 text-muted">&copy;
			2019 刘博文 唐鉴 方鹏
		</p>
	</form>
</body>

</html>