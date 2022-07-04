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
	<div class="container mt-3">
		<div class="row mt-5">
			<div class="col-3">
				<div class="card ">
					<div class="card-body row ">
						<div class="col-1"></div>
						<div class="col-2 text-center">
							<img alt="" src="/ASSIGNMENT_JAVA5/image/check.png">
						</div>
						<div class="col-8 ">
							<h5>Chất lượng</h5>
						</div>
						<div class="col-1"></div>
					</div>
				</div>
			</div>
			<div class="col-3">
				<div class="card ">
					<div class="card-body row ">
						<div class="col-1"></div>
						<div class="col-2 text-center">
							<img alt="" src="/ASSIGNMENT_JAVA5/image/delivery-truck.png">
						</div>
						<div class="col-8 ">
							<h5>Miễn phí ship</h5>
						</div>
						<div class="col-1"></div>
					</div>
				</div>
			</div>
			<div class="col-3">
				<div class="card ">
					<div class="card-body row ">
						<div class="col-1"></div>
						<div class="col-2 text-center">
							<img alt="" src="/ASSIGNMENT_JAVA5/image/opposite-arrows.png">
						</div>
						<div class="col-8 ">
							<h5>14 ngày đổi trả</h5>
						</div>
						<div class="col-1"></div>
					</div>
				</div>
			</div>
			<div class="col-3">
				<div class="card ">
					<div class="card-body row ">
						<div class="col-1"></div>
						<div class="col-2 text-center">
							<img alt="" src="/ASSIGNMENT_JAVA5/image/phone-call.png">
						</div>
						<div class="col-8 ">
							<h5>24/7 Hỗ trợ</h5>
						</div>
						<div class="col-1"></div>
					</div>
				</div>
			</div>
		</div>

		<div class="row mt-5">
			<h1>Danh mục</h1>
			<hr />
			<c:forEach var="item" items="${listCategory}">
				<div class="col-3">
					<div class="card ">
						<div class="card-body row ">

							<div class="col-1"></div>
							<div class="col-2 text-center">
								<img alt=""
									src="https://cf.shopee.vn/file/687f3967b7c2fe6a134a2c11894eea4b_tn"
									width="60px">
							</div>
							<div class="col-8 mt-3">
								<a href="/Assignment/findProductByCategoryId/${item.id}"
									class="ms-2">${item.name}</a>

							</div>
							<div class="col-1"></div>

						</div>
					</div>

				</div>
			</c:forEach>


		</div>
		<div class="row mt-5">
			<h1>Sản phẩm</h1>
			<hr />
			<c:forEach var="item" items="${listProduct.content}">
				<div class="col-3 mt-3">
					<div class="card ">
						<div class="card-body row ">
							<div class="text-center">
								<img src="/Assignment/storage/${item.image}" width="250px"
									height="250px">
							</div>
						</div>
						<div class="card-footer bg-white">

							<div class="text-center">
								<p class="fw-bold text-primary fs-5">${item.name}</p>
								<p>${item.price}</p>
							</div>
							<div class="row">
								<div class="col-6 ">
									<!-- Button trigger modal -->
									<button type="button" class="btn btn-primary btn-rounded"
										data-bs-toggle="modal" data-bs-target="#exampleModal">
										Mua</button>

									<!-- Modal -->
									<div class="modal fade" id="exampleModal" tabindex="-1"
										aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">THỰC
														HIỆN MUA HÀNG</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<form action="/Assignment/order1/${item.price}/${item.id}">
														<div class="form-group">
															<label>Họ tên:</label> <input class="form-control"
																value="${account.fullname}" name="name">
														</div>
														<%-- <div class="form-group">
															<label>Số điện thoại:</label> <input class="form-control"
																value="${account.phoneNumber }" name="phone">
														</div>
														<div class="form-group">
															<label>Địa chỉ:</label> <input class="form-control"
																value="${account.address }" name="address">
														</div> --%>
														<div class="form-group">
															<label>Số lượng</label> <input class="form-control"
																type="number" value="1" min="1" name="quantity">
														</div>
														<button type="button" class="btn btn-secondary mt-2"
															data-bs-dismiss="modal">Đóng</button>
														<button class="btn btn-primary mt-2">Đặt hàng</button>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-6">
									<a type="button" href="/Assignment/users/productDetail/${item.id}"
										class="btn btn-warning btn-rounded ">Xem</a>
								</div>


							</div>

						</div>
					</div>
				</div>
			</c:forEach>




		</div>
		<div class="row mt-2">
			<div class="col-12">
				<div class="text-center">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">

							<li class="page-item bg-warning rounded"><c:choose>
									<c:when test="${page.number-1>0}">
										<a class="page-link"
											href="/Assignment/home?p=${page.number-1}"><span
											aria-hidden="true">&laquo;</span></a>
									</c:when>
									<c:when test="${page.number-1<0}">

										<a class="page-link" href="/Assignment/home?p=0"><span
											aria-hidden="true">&laquo;</span></a>
									</c:when>
								</c:choose></li>

							<li class="page-item active" aria-current="page"><a class=""
								href="">${page.number}</a></li>
							<li class="page-item bg-warning rounded"><a
								class="page-link" href="/Assignment/home?p=${page.number+1}">
									<span aria-hidden="true">&raquo;</span>
							</a></li>

						</ul>
					</nav>
				</div>
			</div>
		</div>


	</div>
</body>
</html>