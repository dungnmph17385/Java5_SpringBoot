<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link sytle="stylesheet" href="/Assignment/css/bootstrap.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</head>
<body>
	<div class="col-10 offset-1 mt-1">
		<c:if test="${not empty sessionScope.error }">
			<div class="alert alert-danger">${sessionScope.error  }</div>
			<c:remove var="error" scope="session" />
		</c:if>
	</div>
	<div style="min-height: 610px; padding-top: 70px;">
		<div class="col-7 offset-4 mt-5 ">
			<div class="col-6 mt-5 border border-gray p-4">
				<h3 align="center">Sign in</h3>
				<form method="POST" action="/Assignment/auth/login">
					<div class="mt-3">
						<label for="email">Email</label> <input type="email" name="email"
							id="email" class="form-control" />
					</div>

					<div class="mt-3">
						<label for="password">Password</label> <input type="password"
							name="password" id="password" class="form-control" />
					</div>

					<div class="mt-4" align="center">
						<a href="/Assignment/auth/register">Create
							account?</a>
					</div>

					<div class="mt-2 " align="center">
						<button class="btn btn-primary col-6">Sign in</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="/Assignment/js/jquery.min.js"></script>
	<script src="/Assignment/js/popper.min.js"></script>
	<script src="/Assignment/js/bootstrap.min.js"></script>
</body>
</html>