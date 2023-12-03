<%@page import="thongtin.KhachHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Bookstore</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
	integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
	integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
	crossorigin="anonymous"></script>
</head>
<body>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"> <img
				src="https://tse3.mm.bing.net/th?id=OIP.dpCCEhxYeeGlap-J8O788QHaHa&pid=Api&P=0&h=220"
				alt="Bootstrap" height="50">
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Trang chủ</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Combo
							giảm giá</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Thể loại </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Conan</a></li>
							<li><a class="dropdown-item" href="#">Doraemon</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">One Oiece</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link disabled">Hết hàng</a>
					</li>
				</ul>
				<form class="d-flex" role="search">
					<input class="form-control me-2" type="search"
						placeholder="Nội dung tìm kiếm" aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Tìm</button>
					<%
					Object obj = session.getAttribute("khachHang");
								KhachHang kh =null;
								kh = (KhachHang) obj;
								if(kh==null){
					%>
					<a class="btn btn-primary" style="white-space: nowrap;"
						href="khachhang1/dangnhap.jsp"> Đăng Nhập </a>
					<%
					} else {
				
				%><div>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Xin Chào:<%=kh.getTenDangNhap()%> </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Đơn hàng của tôi</a></li>
							<li><a class="dropdown-item" href="#">Thông báo</a></li>
							<li><a class="dropdown-item" href="khachhang1/thaydoithongtin.jsp">Thay đổi thông tin</a></li>
							<li><a class="dropdown-item" href="khachhang1/doimatkhau.jsp">Đổi mật khẩu</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="khach-hang?hanhDong=dangxuat">Đăng xuất</a></li>
						</ul></li>		</div>			
					<%}%>

				</form>
			</div>
		</div>
	</nav>
	<!-- End Navbar -->

	<!-- Page content -->
	<div class="container mt-4">
		<div class="row">
			<!-- Menu left -->
			<div class="col-lg-3">
				<div class="list-group ">
					<a href="#" class="list-group-item list-group-item-action">
						Truyện Tranh </a> <a href="#"
						class="list-group-item list-group-item-action">Sách Đạo Lý</a> <a
						href="#" class="list-group-item list-group-item-action">Sách Ôn Thi</a>
				</div>
			</div>
			<!-- End Menu left -->

			<!-- Slider and Products -->
			<div class="col-lg-9">
				<!-- Slider -->
				<div id="carouselExampleIndicators" class="carousel slide mb-4"
					data-bs-ride="true">
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="0" class="active" aria-current="true"
							aria-label="Slide 1"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="1" aria-label="Slide 2"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="2" aria-label="Slide 3"></button>
					</div>
					<div class="carousel-inner " >
						<div class="carousel-item active">
							<img src="img/chibi.jpg" class="d-block w-100" height="400"  alt="...">
						</div>
						<div class="carousel-item">
							<img src="img/chibi2.jpg" class="d-block w-100" height="400" alt="...">
						</div>
						<div class="carousel-item">
							<img src="img/chibi3.jpg" class="d-block w-100" height="400" alt="...">
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
				<!-- End Slider -->
				<!-- Products -->
				<div class="row">
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="#"><img class="card-img-top" src="img/conan.jpg"
								alt=""></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="#">CoNan</a>
								</h4>
								<h5>50.000</h5>
								<p class="card-text">Cốt truyện hay ,lôi cuốn .</p>
							</div>
							<div class="card-footer">
								<small class="text-muted">&#9733; &#9733; &#9733;
									&#9733; &#9734;</small>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="#"><img class="card-img-top" src="img/onepiece.jpg"
								alt="" ></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="#">One Piece</a>
								</h4>
								<h5>50.000</h5>
								<p class="card-text">Ý nghĩa sâu xa , tình huống kịch tính .</p>
							</div>
							<div class="card-footer">
								<small class="text-muted">&#9733; &#9733; &#9733;
									&#9733; &#9734;</small>
							</div>
						</div>
					</div>


					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="#"><img class="card-img-top" src="img/doraemon.jpg"
								alt="" ></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="#">Doraemon</a>
								</h4>
								<h5>50.000</h5>
								<p class="card-text">Cuộc sống đời thường , gần gũi .</p>
							</div>
							<div class="card-footer">
								<small class="text-muted">&#9733; &#9733; &#9733;
									&#9733; &#9734;</small>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a href="#"><img class="card-img-top" src="img/daoli.jpg"
								alt="" ></a>
							<div class="card-body">
								<h4 class="card-title">
									<a href="#">Sách Đạo Lý</a>
								</h4>
								<h5>50.000</h5>
								<p class="card-text">Hướng tới cái thiện , tu tâm , khai sáng đầu óc .</p>
							</div>
							<div class="card-footer">
								<small class="text-muted">&#9733; &#9733; &#9733;
									&#9733; &#9734;</small>
							</div>
						</div>
					</div>
				</div>
				<!-- End Products -->
			</div>
			<!-- End Slider and Products -->
		</div>
	</div>
	<!-- End Page content -->

	<!-- Footer -->
	<footer class="py-3 my-4">
		<ul class="nav justify-content-center border-bottom pb-3 mb-3">
			<li class="nav-item"><a href="#"
				class="nav-link px-2 text-muted">Trag chủ</a></li>
			<li class="nav-item"><a href="#"
				class="nav-link px-2 text-muted">Quy định giao hàng</a></li>
			<li class="nav-item"><a href="#"
				class="nav-link px-2 text-muted">Quy định trả hàng</a></li>
			<li class="nav-item"><a href="#"
				class="nav-link px-2 text-muted">Liên hệ</a></li>
			<li class="nav-item"><a href="#"
				class="nav-link px-2 text-muted">Blogs</a></li>
		</ul>
		<p class="text-center text-muted">© 2023 TITV.vn, Inc</p>
	</footer>
	<!-- End footer -->
	
	
</body>
</html>