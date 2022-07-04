<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IT16308 - Create Product</title>
<link sytle="stylesheet" href="/Assignment/css/bootstrap.min.css" />
</head>
<body>
	<div class="row">
	<div class="col-3"></div>
	<div class="col-6 mb-5 mt-5">
		<div class="card">
			<div class="card-body ">
				<h5 class="mt-3 fw-bold">THÊM SẢN PHẨM</h5>
				<hr>
				<form:form action="/Assignment/admin/products/store"
					method="post" modelAttribute="product"
					enctype="multipart/form-data">
					<div class="form-group">
						<label>Category name:</label>
						<form:select path="" class="form-select" name="cate_id">
							<c:forEach var="cate" items="${categoryData}">
								<form:option value="${cate.id}">${cate.name}</form:option>
							</c:forEach>
						</form:select>
					</div>
					<div class="form-group mb-3 mt-3">
						<label>Product name:</label>
						<form:input path="name" class="form-control mt-2" />
						<c:if test="${!empty sessionScope.name }">
							<span class="text-danger"> ${sessionScope.name} <c:remove
									var="name" scope="session" />
							</span>
						</c:if>
					</div>
					<div class="form-group mb-3 mt-3">
						<label>Product price:</label>
						<form:input path="price" class="form-control" />
						<c:if test="${!empty sessionScope.price }">
							<span class="text-danger"> ${sessionScope.price} <c:remove
									var="price" scope="session" />
							</span>
						</c:if>
					</div>
					<div class="form-group mb-3 mt-3">
						<label>Chọn ảnh:</label>
						<form:input path="" name="upload_file_product" type="file"
							class="form-control" />
						<c:if test="${!empty sessionScope.image }">
							<span class="text-danger"> ${sessionScope.image} <c:remove
									var="image" scope="session" />
							</span>
						</c:if>
					</div>
					<div class="form-group mb-3 mt-3">
						<label>Available:</label>
						<form:input path="available" class="form-control" />
					</div>
					<button class="btn btn-primary ">Thêm</button>
					${message}
					<form:errors path="*" />
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