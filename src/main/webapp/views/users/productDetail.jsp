<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	<div class="row mt-3">
		<div class="col-4">
			<div class="card text-center">
				<div class="card-body">
					<img alt="" src="/Assignment/storage/${product.image}" style="width: 90%">
				</div>
			</div>
		</div>
		<div class="col-8">
			<div class="card">
				<div class="card-body ms-2">
					<form
						action="/Assignment/users/store/cart/${product.id}/${product.price}"
						method="post">
						<h5 class="fw-bold fs-3 text-danger">
							<c:set var="string1" value="${product.name}" />
							<c:set var="string2" value="${fn:toUpperCase(string1)}" />
							<p>${string2}</p>
						</h5>
						<h5 class="fw-bold fs-4 text-warning">Giá tiền :
							${product.price } $</h5>
						

						<label class="fw-bold mt-2 fs-6">Số lượng:</label>
						<div style="width: 200px" class=" mt-2">
							<input type="number" name="quantity" value="1" min="1"
								class="form-control">
						</div>
						

						<button class="btn btn-warning">Thêm vào giỏ hàng</button>
					</form>


				</div>
			</div>

		</div>
	</div>
</body>
</html>