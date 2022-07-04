<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IT16308 - Create Order</title>
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
	<div class="card border-0 w-50 mx-auto">
		<h4 class="card-header bg-danger text-white">THÔNG TIN ORDER</h4>
		<div class="bg-light p-sm-2">
			<form:form method="POST" action="/Assignment/admin/orders/store"
				modelAttribute="order" enctype="multipart/form-data">
				<div>
					<label>User</label>
					<form:select path="" class="form-select" name="user_id">
							<c:forEach var="acc" items="${acc}">
								<form:option value="${acc.id}">${acc.fullname}</form:option>
							</c:forEach>
						</form:select>
				</div>
				<div>
					<label>Address</label>
					<form:input path="address" class="form-control" />
					<form:errors path="address" class="text-danger" />
				</div>
				<button class="btn btn-success mt-2">Save</button>
				<a href="/Assignment/admin/orders/index" class="btn btn-dark mt-2">Cancel</a>
			</form:form>
		</div>
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