<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit product</title>
</head>
<body>
	<div class=" mt-5">
	<div class="row bg-white rounded">
		<h5 class="mt-3 fw-bold">CẬP NHẬT SẢN PHẨM</h5>
			<hr class="">
		<div class="col-6 text-center mt-5 mb-5">
			<div class="card">
				<div class="card-body">
					<img alt="" src="/Assignment/storage/${product.image}" width="400px" height="400px">
				</div>
			</div>
		</div>
		<div class="col-6 mb-5 mt-5">


			
			<form:form action="/Assignment/admin/products/update/${product.id}"
				method="post" modelAttribute="product" enctype="multipart/form-data">
				<div class="form-group mb-3 mt-3">
					<label>Product name:</label>
					<form:input path="name" class="form-control mt-2" />
				</div>
				<div class="form-group mb-3 mt-3">
					<label>Category name:</label>
					<form:select path="" class="form-select" name="cate_id">
							<c:forEach var="cate" items="${listCategory}">
								<form:option value="${cate.id}">${cate.name}</form:option>
							</c:forEach>
						</form:select>
				</div>

				<div class="form-group mb-3 mt-3">
					<label>Product price:</label>
					<form:input path="price" class="form-control" />
				</div>
				<div class="form-group mb-3 mt-3">
					<label>Available:</label>
					<form:input path="available" class="form-control" />
				</div>
				
				<div class="form-group mb-3 mt-3">
					<label>Chọn ảnh:</label>
					<form:input path="" name="upload_file_product" type="file"
						class="form-control" />
				</div>
				<button class="btn btn-primary ">Cập nhật</button>
			</form:form>


		</div>
	</div>



</div>
</body>
</html>