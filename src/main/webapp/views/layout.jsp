<%@ page language="java" session="true"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<div id="carouselExampleControls" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="/Assignment/images/1.jpg" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="/Assignment/images/1.jpg" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="/Assignment/images/1.jpg" class="d-block w-100" alt="...">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleControls" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleControls" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	<nav
		class="row navbar navbar-expand-lg navbar-light bg-light border m-0">
		<div class="container-fluid">
			<a class="navbar-brand" href="/Assignment/users/home">FPT
				Polytechnic</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav me-auto">
					<!-- <li class="nav-item px-2"><a class="nav-link bi bi-list"
						href="#subjects/1"> Môn học</a></li> -->
					<li class="nav-item px-2"><a class="nav-link bi bi-info-lg"
						href="#introduce">Giới thiệu</a></li>
					<li class="nav-item px-2"><a
						class="nav-link bi bi-telephone-fill" href="#contact"> Liên hệ</a>
					</li>
					<li class="nav-item px-2"><a class="nav-link bi bi-envelope"
						href="#feedback"> Góp ý</a></li>
					<li class="nav-item px-2"><a
						class="nav-link bi bi-question-lg" href="#qna">Hỏi đáp</a></li>
					<c:if
						test="${ !empty sessionScope.account && sessionScope.account.admin == 1}">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Admin </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li ng-if="currentUser"><a class="dropdown-item"
									href="/Assignment/admin/accounts/index">Quản lý User</a></li>
								<li ng-if="currentUser"><a class="dropdown-item"
									href="/Assignment/admin/products/index">Quản lý Product</a></li>
								<li ng-if="currentUser"><a class="dropdown-item"
									href="/Assignment/admin/category/index">Quản lý Category</a></li>
								<li ng-if="currentUser"><a class="dropdown-item"
									href="/Assignment/admin/orders/index">Quản lý Order</a></li>
								<li ng-if="currentUser"><a class="dropdown-item"
									href="/Assignment/admin/orderDetail/index">Quản lý Order
										Detail</a></li>
							</ul></li>
					</c:if>
					<li class="nav-item px-2"><a
						class="nav-link bi bi-cart" href="/Assignment/users/cart"> Giỏ hàng</a></li>
				</ul>
				<div class="dropdown">
					<a
						class="nav-link dropdown-toggle bi bi-person-fill text-secondary"
						type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown"
						aria-expanded="false"> <c:if
							test="${ sessionScope.account == null}">Tài khoản</c:if> <c:if
							test="${ sessionScope.account != null}">${ sessionScope.account.fullname }</c:if>
					</a>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<c:if test="${ empty sessionScope.account }">
							<li ng-if="!currentUser"><a class="dropdown-item"
								href="/Assignment/login">Đăng nhập</a></li>
							<li ng-if="!currentUser"><a class="dropdown-item"
								href="/Assignment/auth/register">Đăng ký</a></li>
						</c:if>
						<c:if test="${ !empty sessionScope.account}">
							<li ng-if="!currentUser"><a class="dropdown-item"
								href="#forgot-password">Quên mật khẩu</a></li>
							<li ng-if="currentUser"><a class="dropdown-item"
								href="/Assignment/logout" ng-click="logout($event)">Đăng
									xuất</a></li>
							<li ng-if="currentUser"><a class="dropdown-item"
								href="#change-password">Đổi mật khẩu</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	<!-- End Navbar -->

	<div><jsp:include page="${ views }"></jsp:include></div>


	<footer class="text-center text-lg-start bg-light text-muted">
		<!-- Section: Social media -->
		<section
			class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
			<!-- Left -->
			<div class="me-5 d-none d-lg-block">
				<span>Get connected with us on social networks:</span>
			</div>
			<!-- Left -->

			<!-- Right -->
			<div>
				<a href="" class="me-4 text-reset"> <i class="fab fa-facebook-f"></i>
				</a> <a href="" class="me-4 text-reset"> <i class="fab fa-twitter"></i>
				</a> <a href="" class="me-4 text-reset"> <i class="fab fa-google"></i>
				</a> <a href="" class="me-4 text-reset"> <i class="fab fa-instagram"></i>
				</a> <a href="" class="me-4 text-reset"> <i class="fab fa-linkedin"></i>
				</a> <a href="" class="me-4 text-reset"> <i class="fab fa-github"></i>
				</a>
			</div>
			<!-- Right -->
		</section>
		<!-- Section: Social media -->

		<!-- Section: Links  -->
		<section class="">
			<div class="container text-center text-md-start mt-5">
				<!-- Grid row -->
				<div class="row mt-3">
					<!-- Grid column -->
					<div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
						<!-- Content -->
						<h6 class="text-uppercase fw-bold mb-4">
							<i class="fas fa-gem me-3"></i>Company name
						</h6>
						<p>Here you can use rows and columns to organize your footer
							content. Lorem ipsum dolor sit amet, consectetur adipisicing
							elit.</p>
					</div>
					<!-- Grid column -->

					<!-- Grid column -->
					<div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
						<!-- Links -->
						<h6 class="text-uppercase fw-bold mb-4">Products</h6>
						<p>
							<a href="#!" class="text-reset">Angular</a>
						</p>
						<p>
							<a href="#!" class="text-reset">React</a>
						</p>
						<p>
							<a href="#!" class="text-reset">Vue</a>
						</p>
						<p>
							<a href="#!" class="text-reset">Laravel</a>
						</p>
					</div>
					<!-- Grid column -->

					<!-- Grid column -->
					<div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
						<!-- Links -->
						<h6 class="text-uppercase fw-bold mb-4">Useful links</h6>
						<p>
							<a href="#!" class="text-reset">Pricing</a>
						</p>
						<p>
							<a href="#!" class="text-reset">Settings</a>
						</p>
						<p>
							<a href="#!" class="text-reset">Orders</a>
						</p>
						<p>
							<a href="#!" class="text-reset">Help</a>
						</p>
					</div>
					<!-- Grid column -->

					<!-- Grid column -->
					<div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
						<!-- Links -->
						<h6 class="text-uppercase fw-bold mb-4">Contact</h6>
						<p>
							<i class="fas fa-home me-3"></i> New York, NY 10012, US
						</p>
						<p>
							<i class="fas fa-envelope me-3"></i> info@example.com
						</p>
						<p>
							<i class="fas fa-phone me-3"></i> + 01 234 567 88
						</p>
						<p>
							<i class="fas fa-print me-3"></i> + 01 234 567 89
						</p>
					</div>
					<!-- Grid column -->
				</div>
				<!-- Grid row -->
			</div>
		</section>
		<!-- Section: Links  -->

		<!-- Copyright -->
		<div class="text-center p-4"
			style="background-color: rgba(0, 0, 0, 0.05);">
			© 2022 Copyright: <a class="text-reset fw-bold"
				href="https://mdbootstrap.com/">DungNMPH17385</a>
		</div>
		<!-- Copyright -->
	</footer>
	<!-- Footer -->
	<!-- End Footer -->
	<script src="/Assignment/js/jquery.min.js"></script>
	<script src="/Assignment/js/popper.min.js"></script>
	<script src="/Assignment/js/bootstrap.min.js"></script>
</body>
</html>