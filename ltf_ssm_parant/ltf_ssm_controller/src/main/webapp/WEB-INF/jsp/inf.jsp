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
<title>主页</title>
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

.titlename {
	text-align: center;
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

	<section class="jumbotron text-center">
		<div class="container">
			<h1 class="jumbotron-heading">欢迎来到LTF漫网!</h1>
			<c:if test="${result}">
				<p class="lead text-muted">登录以添加信息.</p>
			</c:if>
			<c:if test="${!result}">
				<a href="toAdd" class="btn btn-primary my-2">添加信息</a>
			</c:if>
		</div>
	</section>

	<div class="album py-5 bg-light">
		<div class="container">
			<div class="row">
				<c:forEach items="${ls}" var="ll">

					<div class="col-md-4">
						<div class="card mb-4 shadow-m">
							<img style="width: 100%; height: 300px;"
								src="${ll.img }">
							<title class="titlename" style="display:block;">${ll.name }</title>
							<div class="card-body">
								<p class="card-text">${ll.brief }</p>
								<div class="d-flex justify-content-between align-items-center">
									<c:if test="${!result}">
										<a href="toEdit?id=${ll.id }"
											class="btn btn-sm btn-outline-secondary">编辑</a>
										<a href="delete?id=${ll.id }"
											class="btn btn-sm btn-outline-secondary">删除</a>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

		</div>
	</div>

	</main>

	<footer class="text-muted">
		<div class="container">
			<p class="float-right">
				<a href="#">回到顶部↑</a>
			</p>
			<p>&copy; 2019 刘博文 唐鉴 方鹏</p>
		</div>
	</footer>
</body>

</html>