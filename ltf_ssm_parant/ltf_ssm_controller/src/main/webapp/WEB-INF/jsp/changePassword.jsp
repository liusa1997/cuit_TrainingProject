<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v3.8.5">
<title>修改密码</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.3/examples/checkout/">
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

@media ( min-width : 768px) {
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
<script>
	(function() {
		'use strict'

		window.addEventListener('load', function() {
			// Fetch all the forms we want to apply custom Bootstrap validation styles to
			var forms = document.getElementsByClassName('needs-validation')

			// Loop over them and prevent submission
			Array.prototype.filter.call(forms, function(form) {
				form.addEventListener('submit', function(event) {
					if (form.checkValidity() === false) {
						event.preventDefault()
						event.stopPropagation()
					}
					form.classList.add('was-validated')
				}, false)
			})
		}, false)
	}())
</script>

<script type="text/javascript">
	$(document).ready(function() {$('#new_password').on(
	'input propertychange',
	function() {
		var pwd = $.trim($(this).val());
		var rpwd = $.trim($("#re_password").val());
		if (rpwd != "") {
			if (pwd == "" && rpwd == "") {
			} else {
				if (pwd == rpwd) {
					$("#msg").html("");
					$("#execBtn").attr("disabled",false);
				} else {
					$("#msg").html("<font color='red'>两次密码不匹配</font>");
					$("#execBtn").attr("disabled",true);
				}
			}
		}
	})
	})
	$(document).ready(function() {
		$('#re_password').on('input propertychange', function() {
			var pwd = $.trim($(this).val());
			var rpwd = $.trim($("#new_password").val());
			if (pwd == "" && rpwd == "") {
			} else {
				if (pwd == rpwd) {
					$("#msg").html("");
					$("#execBtn").attr("disabled", false);
				} else {
					$("#msg").html("<font color='red'>两次密码不匹配</font>");
					$("#execBtn").attr("disabled", true);
				}
			}
		})
	})
</script>
</head>

<body class="bg-light">
	<div
		class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
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
				<h1 class="mb-3">正在为用户${username }修改密码</h1>
				<br>
				<form action="changePassword">

					<div class="mb-3">
						<label for="new_password">新密码:</label> <input type="password"
							class="form-control" id="new_password" placeholder="请输入新密码"
							name="new_password" required>
						<div class="invalid-feedback">请输入修改后的新密码.</div>
					</div>

					<div class="mb-3">
						<label for="re_password">确认密码:</label> <input type="password"
							class="form-control" id="re_password" placeholder="请确认输入的新密码"
							required>
						<div class="invalid-feedback">请重新输入修改后的新密码.</div>
					</div>
					<p id="msg"></p>
					<p>${errmsg }</p>
					<hr class="mb-4">
					<button class="btn btn-primary btn-lg btn-block" id="execBtn" type="submit">修改密码</button>
				</form>
			</div>
		</div>

		<footer class="my-5 pt-5 text-muted text-center text-small">
			<p class="mb-1">&copy; 2019 刘博文 唐鉴 方鹏</p>
		</footer>
	</div>
</body>
</html>