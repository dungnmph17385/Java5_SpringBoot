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

	<div>
		<div class=" bg-white mt-5 rounded">
			<form:form action="/Assignment/admin/products/index"
				modelAttribute="category">
				<div class="row">
					<div class="col-4 ">
						<a type="button" class="btn btn-primary"
							href="/Assignment/admin/products/create">Thêm mới</a>
					</div>
					<%-- <div class="col-4 ">

						<select class="form-select mt-4" name="cate_id">
							<c:forEach var="cate" items="${listCategory}">
								<option value="${cate.id}">${cate.name}</option>
							</c:forEach>
						</select>

					</div>
					<div class="col-4 ">
						<button class="btn btn-primary btn-rounded mt-4">Tìm kiếm</button>
					</div> --%>

				</div>
			</form:form>
			<table class="table ">
				<thead>
					<tr>
						<th>Id</th>
						<th>Product name</th>
						<th>Product image</th>
						<th>Product price</th>
						<th>Available</th>
						<th>Create Date</th>

						<th colspan="2">Thao tác</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="product" items="${data.content}">
						<tr>
							<td>${product.id}</td>
							<td>${product.name}</td>
							<td><img alt="" src="/Assignment/storage/${product.image}"
								width="80px" height="80px"></td>
							<td>${product.price}</td>
							<td>${product.available}</td>
							<th>${product.createdDate}</th>

							<td><a class="btn btn-primary"
								href="/Assignment/admin/products/edit/${product.id}"
								type="button">Cập nhật</a></td>
							<td>
								<!-- Button trigger modal -->
								<button type="button" class="btn btn-danger"
									data-bs-toggle="modal"
									data-bs-target="#exampleModal${product.id}">Xoá</button> <!-- Modal -->
								<div class="modal fade" id="exampleModal${product.id }"
									tabindex="-1" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">
													<h4 class="text-warning">FPT POLYTECHNIC</h4>
												</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">Bạn có muốn xoá bản ghi này
												không?</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">Close</button>
												<a type="button"
													href="/Assignment/admin/products/delete/${product.id}"
													class="btn btn-danger">Xoá</a>
											</div>
										</div>
									</div>
								</div>
							</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
	</div>
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
	<script src="/Assignment/js/jquery.min.js"></script>
	<script src="/Assignment/js/popper.min.js"></script>
	<script src="/Assignment/js/bootstrap.min.js"></script>
</body>
</html>