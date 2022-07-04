<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
	<div class="container py-5 h-100">
		<div
			class="row d-flex justify-content-center align-items-center h-100">
			<div class="col-lg-8 col-xl-6">
				<div class="card rounded-3">
					<img
						src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/img3.webp"
						class="w-100"
						style="border-top-left-radius: .3rem; border-top-right-radius: .3rem;"
						alt="Sample photo">
					<div class="card-body p-4 p-md-5">
						<h3
							class="mb-4 pb-2 pb-md-0 mb-md-5 px-md-2 text-center text-danger">REGISTER</h3>

						<form:form action="/Assignment/register" method="post"
							modelAttribute="account" enctype="multipart/form-data">

							<div class="row  mb-3">

								<div class="col-12">
									<div class="form-group">
										<label>FullName:</label>
										<form:input path="fullname" class="form-control" />

										<form:errors path="fullname" class="text-danger" />
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
									<button class="btn btn-primary mt-3">Thêm</button>
									${message}
								</div>

							</div>


						</form:form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>