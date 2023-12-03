<%@page import="thongtin.KhachHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/cssdangnhap.css" ref="stylesheet">
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
	<style type="text/css">
	.st{
	color: red;
	}
	</style>
</head>
<body>
<%
String baoLoi = request.getAttribute("baoLoi") + "";
baoLoi = (baoLoi.equals("null")) ? "" : baoLoi;
%>

<body class="d-flex align-items-center py-4 bg-body-tertiary">
<form class="container" action="../khach-hang" method="post">
	<input type="hidden" name="hanhDong" value="dangnhap">

	<main class="form-signin w-100 m-auto">
		<form>
			<img class="mb-4" src="../img/chibi2.jpg"
				alt="" width="72" height="57">
			<h1 class="h3 mb-3 fw-normal">Please sign in</h1>
        <span class="st"><%=baoLoi %></span>
			<div class="form-floating">
				<input type="text" class="form-control" id="tendangnhap"
					name="tenDangNhap"> <label for="floatingInput">Tên Đăng Nhập
					</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="matKhau"
					placeholder="Password" name="matKhau"> <label for="floatingPassword">Mật Khẩu</label>
			</div>

			<div class="form-check text-start my-3">
				<input class="form-check-input" type="checkbox" value="remember-me"
					id="flexCheckDefault"> <label class="form-check-label"
					> Remember me </label>
			</div>
			<button class="btn btn-primary w-100 py-2" type="submit">Đăng Nhập</button>
			
			<div class="text-center"><br>
			<a style="white-space: nowrap;" href="/khachhang1/dangky.jsp">
						Đăng kí tài khoản.
					</a>
					</div>
			<p class="mt-5 mb-3 text-center">&copy; 2017–2023</p>
		</form>
	</main>
</form>
</body>


</html>