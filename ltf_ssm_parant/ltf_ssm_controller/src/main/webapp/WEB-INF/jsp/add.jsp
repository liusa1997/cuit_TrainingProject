<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="static/jquery/jquery-3.3.1.slim.min.js"></script>
<script src="static/popper/popper.min.js"></script>
<script src="static/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
<title>添加</title>
<style>
.jumbotron {
	padding-top: 3rem;
	padding-bottom: 3rem;
	margin-bottom: 0;
	background-color: #fff;
}

@media ( min-width : 768px) {
	.jumbotron {
		padding-top: 6rem;
		padding-bottom: 6rem;
	}
}

.jumbotron p:last-child {
	margin-bottom: 0;
}

.jumbotron-heading {
	font-weight: 300;
}

.jumbotron .container {
	max-width: 40rem;
}

footer {
	padding-top: 3rem;
	padding-bottom: 3rem;
}

footer p {
	margin-bottom: .25rem;
}

.card {
	width: 348px;
	height: 483px;
}
</style>
</head>

<body>
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

	<form role="form" action="add">
		<div class="form-group row">
			<label for="name" class="col-sm-2 col-form-label">动漫名称:</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="name"
					placeholder="动漫名称" name="name">
			</div>
		</div>
		<div class="form-group row">
			<label for="brief" class="col-sm-2 col-form-label">描述:</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="brief"
					placeholder="动漫描述" name="brief">
			</div>
		</div>
		
		<div class="form-group row">
			<label for="img" class="col-sm-2 col-form-label">图片:</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="img"
					placeholder="网络链接图片" name="img">
			</div>
		</div>
		<section class="jumbotron text-center">
				<button type="submit" class="btn btn-primary">确认添加</button>
		</section>
	</form>






	<footer class="text-muted">
		<div class="container">
			<p class="float-right">
				<a href="#">回到顶部↑</a>
			</p>
			<p>&copy; 2019 刘博文 唐鉴 方鹏</p>
		</div>
	</footer>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="static/jquery/jquery-3.3.1.slim.min.js"></script>
	<script src="static/popper/popper.min.js"></script>
	<script src="static/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>