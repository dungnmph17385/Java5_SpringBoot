<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IT16308 - Create Category</title>
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

<div class="row">
	<div class="col-3"></div>
	<div class="col-6 mb-5" style="margin-top:100px">
		<div class="card">
			<div class="card-body text-center">
				<h5 class="mt-3 fw-bold">THÊM LOẠI SẢN PHẨM</h5>
				<hr>
				<form:form action="/Assignment/admin/category/store" method="post" modelAttribute="category">
					<div class="form-group mb-3 mt-3">
						<label>Category name:</label>
						<form:input path="name" class="form-control mt-2"/>
					</div>
					<button class="btn btn-primary ">Thêm</button>
				</form:form>

			</div>
		</div>
	</div>
	<div class="col-3"></div>

</div>
	<script src="/Assignment/js/jquery.min.js"></script>
	<script src="/Assignment/js/popper.min.js"></script>
	<script src="/Assignment/js/bootstrap.min.js"></script>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet">
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</body>
</html>