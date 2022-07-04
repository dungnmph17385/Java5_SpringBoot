<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IT16308 - Create Account</title>
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
	<div>
		<jsp:include page="/views/pages/header.jsp"></jsp:include>
	</div>
	<div class="card border-0 w-50 mx-auto">
		<h4 class="card-header bg-danger text-white">THÔNG TIN ACCOUNT</h4>
		<div class="bg-light p-sm-2">
			<form:form method="POST" action="/Assignment/admin/orderDetail/store"
				modelAttribute="orderDetail">
				<div>
					<label>Order ID</label>
					<form:select path="order_id" class="form-control">
						<c:forEach items="${ o }" var="o">
							<form:option value="${o.id}">${o.id}</form:option>
						</c:forEach>
					</form:select>
				</div>
				<div>
					<label>Product</label>
					<form:select path="product_id" class="form-control">
						<c:forEach items="${ pro }" var="pro">
							<form:option value="${pro.id}">${pro.name}</form:option>
						</c:forEach>
					</form:select>
				</div>
				<div>
					<label>Price</label>
					<form:input path="price" class="form-control" />
					<form:errors path="price" class="text-danger" />
				</div>
				<div>
					<label>Quantity</label>
					<form:input path="quantity" class="form-control" />
					<form:errors path="quantity" class="text-danger" />
				</div>
				
				<button class="btn btn-success mt-2">Save</button>
				<a href="/Assignment/admin/orderDetail/index" class="btn btn-dark mt-2">Cancel</a>
			</form:form>
		</div>
	</div>

	<jsp:include page="/views/pages/footer.jsp"></jsp:include>
	<script src="/Assignment/js/jquery.min.js"></script>
	<script src="/Assignment/js/popper.min.js"></script>
	<script src="/Assignment/js/bootstrap.min.js"></script>

</body>
</html>