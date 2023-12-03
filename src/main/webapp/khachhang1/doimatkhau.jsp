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
<body class="d-flex align-items-center py-4 bg-body-tertiary">
	<%
Object obj = session.getAttribute("khachHang");
								KhachHang kh =null;
								kh = (KhachHang) obj;
								if(kh==null){
								%>
								<h3>Vui lòng đăng nhập trước !!</h3>
								<%} else{ %>
								<body class="d-flex align-items-center py-4 bg-body-tertiary">
	<form class="container" action="../khach-hang" method="post">
	<input type="hidden" name="hanhDong" value="doimatkhau">

		<main class="form-signin w-100 m-auto">
			<form>
				<img class="mb-4" src="img/chibi.jpg" alt="" width="72" height="57">
				<h1 class="h3 mb-3 fw-normal">Đổi mât khẩu</h1>
				<%
				String baoLoi=request.getAttribute("baoLoi")+"";
				baoLoi=(baoLoi.equals("null"))?"": baoLoi;
				
				%>
				<span class="st"><%=baoLoi %></span>
				<div class="form-floating">
					<input type="text" class="form-control" id="matKhauHienTai"
						name="matKhauHienTai"> <label for="floatingInput">Mật
						Khẩu Hiện Tại </label>
				</div>
				<div class="form-floating">
					<input type="password" class="form-control" id="matKhauMoi"
						name="matKhauMoi"> <label for="floatingPassword">Mật
						Khẩu Mới</label>
				</div>
				<div class="form-floating">
					<input type="password" class="form-control" id="matKhauMoiNhapLai"
						name="matKhauMoiNhapLai"> <label for="floatingPassword">Nhập
						Lại Mật Khẩu</label>
				</div>

				<div class="form-check text-start my-3">
					<input class="form-check-input" type="checkbox" value="remember-me"
						id="flexCheckDefault"> <label class="form-check-label">
						Remember me </label>
				</div>
				<button class="btn btn-primary w-100 py-2" type="submit">Đổi
					Mật Khẩu</button>

				<div class="text-center">
					<br>

				</div>
				<p class="mt-5 mb-3 text-center">&copy; 2017–2023</p>
			</form>
		</main>
	</form>

<%} %>
</body>
</html>