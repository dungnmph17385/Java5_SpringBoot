<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
	<h4 style="text-align: center;" class="mt-2">Quản lý Order</h4>
	<div class="mt-3">
		<a class="btn btn-success mt-2"
			href="/Assignment/admin/orders/create">Thêm mới</a>
		<table class="table table-bordered mt-2">
			<thead>
				<tr>
					<th>ID</th>
					<th>User</th>
					<th>Create Date</th>
					<th>Address</th>
					<th colspan="2">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ data.content }" var="order">
					<tr>
						<td>${ order.id }</td>
						<td>${ order.user.fullname }</td>
						<td>${ order.createdDate }</td>
						<td>${ order.address }</td>
						<td><a href="/Assignment/admin/orders/edit/${ order.id }"
							class="btn btn-primary">Cập nhật</a></td>
						<td><a class="btn btn-danger" data-bs-toggle="modal"
							data-bs-target="#Modal${order.id }"> Xóa </a></td>
					</tr>
					<div class="modal fade" id="Modal${order.id }" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h2 class="modal-title fw-bold" id="exampleModalLabel">Thông
										báo</h2>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									Bạn muốn xóa danh mục <b>${order.id}</b> không?
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary fs-5"
										data-bs-dismiss="modal">No</button>
									<a href="/Assignment/admin/orders/delete/${order.id }"><button
											type="button" class="btn btn-primary fs-5">Yes</button></a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</tbody>
		</table>

		<div class="row">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link"
					href="/Assignment/admin/accounts/index">First page</a></li>
				<li class="page-item"><a class="page-link"
					href="/Assignment/admin/accounts/index?page=${ data.number - 1 }">Previous page</a></li>
				<li class="page-item"><a class="page-link"
					href="#">${ data.number }</a></li>
				<li class="page-item"><a class="page-link"
					href="/Assignment/admin/accounts/index?page=${ data.number + 1 }">Next page</a></li>
				<li class="page-item"><a class="page-link"
					href="/Assignment/admin/accounts/index?page=${ data.totalPages - 1 }">Last page</a></li>
			</ul>
		</div>
		<script src="/Assignment/js/jquery.min.js"></script>
		<script src="/Assignment/js/popper.min.js"></script>
		<script src="/Assignment/js/bootstrap.min.js"></script>
</body>
</html>