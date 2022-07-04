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
	<div class="container">
		<div class="row">
			<div class="col-12 bg-white mt-3">



				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>Tên sản phẩm</th>
							<th>Hình ảnh</th>
							<th>Số lượng</th>
							<th>Thành tiền</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="cart" items="${listCart}">
							<tr>
								<td></td>
								<td>${cart.product.name}</td>
								<td><img alt=""
									src="/Assignment/storage/${cart.product.image}"
									width="80px"></td>

								<%-- <td>${cart.product.color}</td>
								<td>${cart.product.size}</td> --%>
								<td>${cart.quantity }</td>
								<td>${cart.price}</td>
								<td>
									<!-- Button trigger modal --> <a type="button"
									data-bs-toggle="modal"
									data-bs-target="#exampleModal${cart.id }"> <i
										class="fa fa-remove" style="font-size: 36px; color: red"></i></a>
									<!-- Modal -->
									<div class="modal fade" id="exampleModal${cart.id}"
										tabindex="-1" aria-labelledby="exampleModalLabel"
										aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title text-warning" id="exampleModalLabel">FPT
														POLYTECHNIC</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">Bạn có muốn xoá sản phẩm khỏi
													giỏ hàng?</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">Đóng</button>
													<a type="button" type="button"
														href="/Assignment/deleteCart/${cart.id}"
														class="btn btn-primary">Xác nhận</a>
												</div>
											</div>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>

					</tbody>

				</table>
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">

					<a class="btn btn-danger" href="/Assignment/users/order">TIẾN
						HÀNH ĐẶT HÀNG</a>

				</div>

			</div>

		</div>
	</div>
</body>
</html>