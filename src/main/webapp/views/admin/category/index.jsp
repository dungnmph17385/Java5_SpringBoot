<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link style="stylesheet" href="/Assignment/css/bootstrap.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</head>
<body>

	<h4 style="text-align: center;" class="mt-2">Quản lý Category</h4>
	<div class="mt-3">
		<a type="button" class="btn btn-primary"
			href="/Assignment/admin/category/create">Thêm mới</a>
		<table class="table table-striped table-hover">
			<thead>
				<tr class="">
					<th>ID</th>
					<th>Category name</th>
					<th colspan="2">Thao tác</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="category" items="${data.content}">
					<tr>
						<td>${category.id}</td>
						<td>${category.name}</td>

						<td><a type="button" class="btn btn-primary"
							data-bs-toggle="tooltip" data-bs-placement="top"
							title="Cập nhật category"
							href="/Assignment/admin/category/edit/${category.id}">Cập nhật</a></td>
						<td>
							<button type="button" class="btn btn-danger"
								data-bs-toggle="modal"
								data-bs-target="#exampleModal${category.id}">Xoá</button> <!-- Modal -->
							<div class="modal fade" id="exampleModal${category.id}"
								tabindex="-1" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Xoá loại sản phẩm</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">Bạn có muốn xoá loại sản phẩm này
											không?</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Đóng</button>
											<a type="button" class="btn btn-primary"
												href="/Assignment/admin/category/delete/${category.id}">Xoá</a>
										</div>
									</div>
								</div>
							</div>
						<td>
					</tr>

				</c:forEach>

			</tbody>
		</table>
		<div class="row">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link"
					href="/Assignment/admin/accounts/index">First page</a></li>
				<li class="page-item"><a class="page-link"
					href="/Assignment/admin/accounts/index?page=${ data.number - 1 }">Previous
						page</a></li>
				<li class="page-item"><a class="page-link" href="#">${ data.number }</a></li>
				<li class="page-item"><a class="page-link"
					href="/Assignment/admin/accounts/index?page=${ data.number + 1 }">Next
						page</a></li>
				<li class="page-item"><a class="page-link"
					href="/Assignment/admin/accounts/index?page=${ data.totalPages - 1 }">Last
						page</a></li>
			</ul>
		</div>

	</div>
	<script src="/Assignment/js/jquery.min.js"></script>
	<script src="/Assignment/js/popper.min.js"></script>
	<script src="/Assignment/js/bootstrap.min.js"></script>
</body>
</html>