<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
	<meta name="generator" content="Jekyll v3.8.5">
	<title>忘记密码</title>

	<link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/checkout/">
	<script src="static/jquery/jquery-3.3.1.slim.min.js"></script>
	<script src="static/popper/popper.min.js"></script>
	<script src="static/bootstrap/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
	<style>
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

		.col-md-8 {
			flex: 0 0 100%;
			max-width: 100%;
		}

		.container {
			max-width: 640px;
		}

		.lh-condensed {
			line-height: 1.25;
		}
	</style>
<script type="text/javascript">
	function validate_email(field, alerttxt) {
		with (field) {
			apos = value.indexOf("@")
			dotpos = value.lastIndexOf(".")
			if (apos < 1 || dotpos - apos < 2) {
				alert(alerttxt);
				return false
			} else {
				return true
			}
		}
	}

	function validate_form(thisform) {
		with (thisform) {
			if (validate_email(email, "请检查输入的电子邮箱!") == false) {
				email.focus();
				return false
			}
		}
	}
</script>
</head>

<body class="bg-light">
	<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
		<h5 class="my-0 mr-md-auto font-weight-normal">刘唐方动漫网</h5>
	    <c:if test="${empty username}" var="result">
		    <a class="btn btn-outline-default" href="toLogin">登录</a>
		    <a class="btn btn-outline-primary" href="toRegister">注册</a>
		</c:if>
			<c:if test="${!result }">
			登录用户:<a href="toChangePassword">${username}</a>, <a href="logout">注销</a>
		</c:if>
	</div>
	<div class="container">
		<div class="py-5 text-center"></div>
		<div class="row">
			<div class="col-md-8 order-md-1">
				<h1 class="mb-3">忘记密码</h1>
				<br>
				<form class="needs-validation" onsubmit="return validate_form(this);" novalidate action="forgetPassword">
					<div class="mb-3">
						<label for="email">邮箱地址:</label>
						<input type="email" class="form-control" name="semail" id="email"
							placeholder="address@example.com" required>
						<div class="invalid-feedback">
							请输入邮箱地址.
						</div>
					</div>
					<hr class="mb-4">
					<button class="btn btn-primary btn-lg btn-block" type="submit">提交</button>
				</form>
			</div>
		</div>

		<footer class="my-5 pt-5 text-muted text-center text-small">
			<p class="mb-1">&copy;
				2019 刘博文 唐鉴 方鹏
			</p>
		</footer>
	</div>
</body>
</html>