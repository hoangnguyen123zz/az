package controller;

import java.io.IOException;
import java.sql.Date;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.khachhangDAO;
import thongtin.KhachHang;

/**
 * Servlet implementation class khachhangcontroller
 */
@WebServlet("/khach-hang")
public class khachhangcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public khachhangcontroller() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String hanhdong = request.getParameter("hanhDong");
		if(hanhdong.equals("dangki")) {
			dangki(request, response);
		}else if(hanhdong.equals("dangnhap")) {
			dangnhap(request, response);
		}else if(hanhdong.equals("dangxuat")) {
			dangxuat(request, response);
		}else if(hanhdong.equals("doimatkhau")) {
			doimatkhau(request, response);
		}else if(hanhdong.equals("thaydoithongtin")) {
			thaydoithongtin(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	private void dangki(HttpServletRequest request, HttpServletResponse response) {
		
			try {
				String tenDangNhap = request.getParameter("tenDangNhap");
				String matKhau = request.getParameter("matKhau");
				String matKhauNhapLai = request.getParameter("matKhauNhapLai");
				String hoVaTen = request.getParameter("hoVaTen");
				String gioiTinh = request.getParameter("gioiTinh");
				String ngaySinh = request.getParameter("ngaySinh");
				String diaChiKhachHang = request.getParameter("diaChiKhachHang");
				String diaChiMuaHang = request.getParameter("diaChiMuaHang");
				String diaChiNhanHang = request.getParameter("diaChiNhanHang");
				String dienThoai = request.getParameter("dienThoai");
				String email = request.getParameter("email");
				String dongYNhanMail = request.getParameter("dongYNhanMail");
				request.setAttribute("tenDangNhap", tenDangNhap);		
				request.setAttribute("hoVaTen", hoVaTen);
				request.setAttribute("gioiTinh", gioiTinh);
				request.setAttribute("ngaySinh", ngaySinh);
				request.setAttribute("diaChiKhachHang", diaChiKhachHang);
				request.setAttribute("diaChiMuaHang", diaChiMuaHang);
				request.setAttribute("diaChiNhanHang", diaChiNhanHang);
				request.setAttribute("dienThoai", dienThoai);
				request.setAttribute("dongYNhanMail", dongYNhanMail);
				
				String url = "";
				
				String baoLoi = "";
				khachhangDAO khachHangDAO = new khachhangDAO();

				if(khachHangDAO.kiemTraTenDangNhap(tenDangNhap)) {
					baoLoi +="Tên đăng nhập đã tồn tại, vui lòng chọn tên đăng nhập khác.<br/>";
				}
				
				if(!matKhau.equals(matKhauNhapLai)) {
					baoLoi +="Mẫu khẩu không khớp.<br/>";
				}
				
				request.setAttribute("baoLoi", baoLoi);
				
				
				if(baoLoi.length()>0) {
					url = "/khachhang1/dangky.jsp";
				}else {
					Random rd = new Random();
					String maKhachHang = System.currentTimeMillis() + rd.nextInt(1000) +"";
					KhachHang kh = new KhachHang(maKhachHang, tenDangNhap, matKhau, hoVaTen, gioiTinh, diaChiKhachHang, diaChiNhanHang, diaChiMuaHang, Date.valueOf(ngaySinh), dienThoai, email, dongYNhanMail!=null);
					khachHangDAO.insert(kh);
					url = "/thanhcong.jsp";
				}
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}
	private void dangnhap(HttpServletRequest request, HttpServletResponse response) {
		
			try {
				String tenDangNhap =request.getParameter("tenDangNhap");
				String matKhau =request.getParameter("matKhau");
				KhachHang kh= new KhachHang();
				kh.setTenDangNhap(tenDangNhap);
				kh.setMatKhau(matKhau);
				khachhangDAO khd = new khachhangDAO();
				String url="";
				KhachHang khachhang=khd.kiemTraTenDangNhapVaMatKhau(kh);
				if(khachhang!=null) {
					HttpSession session=request.getSession();
					session.setAttribute("khachHang", khachhang);
					url="/index.jsp";
				
				}else {
					request.setAttribute("baoLoi", "Tên đăng nhập hoặc mật khẩu không chính xác !");
					url="/khachhang1/dangnhap.jsp";
				}
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
			} catch (ServletException e) {
			
				e.printStackTrace();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		
		
	}
	private void dangxuat(HttpServletRequest request, HttpServletResponse response) {
		
			try {
				HttpSession session = request.getSession();
				session.invalidate();
				String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
				+ request.getContextPath();
				
				response.sendRedirect(url+"/index.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
	}
	private void doimatkhau(HttpServletRequest request, HttpServletResponse response) {
		
			try {
				String matKhauHienTai= request.getParameter("matKhauHienTai");
				String matKhauMoi= request.getParameter("matKhauMoi");
				String matKhauMoiNhapLai= request.getParameter("matKhauMoiNhapLai");
				
				String baoLoi="";
				String url="/khachhang1/doimatkhau.jsp";
				HttpSession session = request.getSession();
				Object obj = session.getAttribute("khachHang");
				KhachHang kh =null;
				kh = (KhachHang) obj;
				
				if(!matKhauHienTai.equals(kh.getMatKhau())) {
					baoLoi+="Mật khẩu hiện tại không đúng ";
				}else if(!matKhauMoi.equals(matKhauMoiNhapLai)) {
					baoLoi+="Mật khẩu nhập lại không khớp ";			
				}else {
					kh.setMatKhau(matKhauMoi);
					khachhangDAO khd=new khachhangDAO();
					khd.doimatkhau(kh);	
					if(khd.doimatkhau(kh)==1) {
						baoLoi = "Mật khẩu đã thay đổi thành công!";
					}else {
						baoLoi = "Quá trình thay đổi mật khẩu không thành công!";
					}
				}
				request.setAttribute("baoLoi",baoLoi);
RequestDispatcher rd= getServletContext().getRequestDispatcher(url);
rd.forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
	}
	private void thaydoithongtin(HttpServletRequest request, HttpServletResponse response) {
		
			try {
				String hoVaTen = request.getParameter("hoVaTen");
				String gioiTinh = request.getParameter("gioiTinh");
				String ngaySinh = request.getParameter("ngaySinh");
				String diaChiKhachHang = request.getParameter("diaChiKhachHang");
				String diaChiMuaHang = request.getParameter("diaChiMuaHang");
				String diaChiNhanHang = request.getParameter("diaChiNhanHang");
				String dienThoai = request.getParameter("dienThoai");
				String email = request.getParameter("email");
				String dongYNhanMail = request.getParameter("dongYNhanMail");
				
				String url = "";
				
				String baoLoi = "";
				khachhangDAO khachHangDAO = new khachhangDAO();

				request.setAttribute("baoLoi", baoLoi);
							
				if(baoLoi.length()>0) {
					url = "/khachhang1/dangky.jsp";
				}else {
					Object obj = request.getSession().getAttribute("khachHang");
					KhachHang khachHang = null;
					if (obj!=null)
						khachHang = (KhachHang)obj;		
						if(khachHang!=null){	
							String maKhachHang = khachHang.getMaKhacHang();
							KhachHang kh = new KhachHang(maKhachHang, "", "", hoVaTen, gioiTinh, diaChiKhachHang, diaChiNhanHang, diaChiMuaHang, Date.valueOf(ngaySinh), dienThoai, email, dongYNhanMail!=null);
							khachHangDAO.updateInfo(kh);
							KhachHang kh2 = khachHangDAO.selectById(kh);
							request.getSession().setAttribute("khachHang", kh2);
							url = "/thanhcong.jsp";
						}
					
				}
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}
}


