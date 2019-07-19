<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
	<meta name="generator" content="Jekyll v3.8.5">
	<title>注册</title>

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
		
		.col-md-6 {
			padding-left: 0px;
			padding-right: 0px;
		}
	</style>
	<script>
		(function () {
			'use strict'

			window.addEventListener('load', function () {
				// Fetch all the forms we want to apply custom Bootstrap validation styles to
				var forms = document.getElementsByClassName('needs-validation')

				// Loop over them and prevent submission
				Array.prototype.filter.call(forms, function (form) {
					form.addEventListener('submit', function (event) {
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
	$(function(){
		$("#exec").click(function(){
			$.ajax({
                type: "post",
                url: "getEmail?="+new Date().getTime(),
                data: {'email':$("#email").val()},
                dataType: "text",
                success: function (msg) {
                    if("success" == msg) {
						alert("发送成功!请查收.");
                    } else if ("failed") {
                    		alert("输入邮箱不可用!请重新输入.");
                    		$("#email").attr("value", "");
                        }
                }
            });
		});
	})
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
				<h1 class="mb-3">注册</h1>
				<br>
				<form class="needs-validation" novalidate action="registerMethod">
					<div class="mb-3">
						<label for="username">用户名:</label>
						<input type="text" class="form-control" name="username" id="username" placeholder="请输入用户名"
							required>
						<div class="invalid-feedback">
							请输入用户名.
						</div>
					</div>

					<div class="mb-3">
						<label for="email">邮箱地址:</label>
						<input type="email" class="form-control" name="email" id="email" placeholder="请输入邮箱地址" required>
						<div class="invalid-feedback">
							请输入邮箱地址.
						</div>

						<div class="mb-3">
							<label for="password">密码:</label>
							<input type="password" class="form-control" name="password" id="password"
								placeholder="请输入密码" required>
							<div class="invalid-feedback">
								请输入密码.
							</div>
						</div>

						<div class="mb-3">
								<label for="code">验证码:</label>
							<div class="container-fluid">
								<div class="row">
									<div class="col-md-6">
										<input name="code" class="form-control" id="code" required="" type="code"
											placeholder="验证码">
										<div class="invalid-feedback">
												请输入验证码.
											</div>
									</div>
									<div class="col-md-6">
											<input type="button" class="btn btn-primary btn-lg btn-block" value="获取验证码" id="exec" style="padding-top: 0px;" />
									</div>
								</div>
							</div>
						</div>
					</div>
					<hr class="mb-4">
					<button class="btn btn-primary btn-lg btn-block" type="submit">提交</button>
				</form>
			</div>
		</div>
		<footer class="my-5 pt-5 text-muted text-center text-small">
			<p class="mb-1">&copy; 2019 刘博文 唐鉴 方鹏 </p>
		</footer>
	</div>
</body>

</html>