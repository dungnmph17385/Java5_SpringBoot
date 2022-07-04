<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<link rel="stylesheet" href="/ASSIGNMENT_JAVA5/css/mdb.min.css">
<link sytle="stylesheet" href="/Assignment/css/bootstrap.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<div class="bg-white mt-3">
	<div class="row">

		<form:form action="/Assignment/admin/accounts/store" method="post"
			modelAttribute="account" enctype="multipart/form-data">
			<h5 class="fw-bold ms-3 mt-3">THÊM TÀI KHOẢN</h5>
			<hr class="ms-3 me-3" />
			<div class="row ms-2 mt-3 me-2 mb-3">
				<div class="col-3"></div>
				<div class="col-6">
					<div class="form-group">
						<label>FullName:</label>
						<form:input path="fullname" class="form-control"/>
					</div>
					<div class="form-group">
						<label>Email:</label>
						<form:input path="email" class="form-control" />

					</div>
					<div class="form-group">
						<label>Username:</label>
						<form:input path="username" class="form-control" />
						<form:errors path="username" class="text-danger" />
					</div>
					<div class="form-group">
						<label>Password:</label>
						<form:input path="password" class="form-control" />
						<form:errors path="password" class="text-danger" />
					</div>
					<div class="form-group">
						<label>Photo:</label>
						<form:input type="file" path="" name="upload_file"
							class="form-control" />
					</div>
					<div class="form-group">
						<label>Address:</label>
						<form:input  path="address"  class="form-control" />
					</div>
					<div class="form-group">
						<label>Admin:</label>
						<form:select path="admin" class="form-select">
							<form:option value="0">Member</form:option>
							<form:option value="1">Admin</form:option>
						</form:select>

					</div>
					<button class="btn btn-primary mt-3" >Thêm</button>
				</div>
				<div class="col-3"></div>
			</div>


		</form:form>
	</div>

</div>

