package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import thongtin.TacGia;

public class TacGiaDAO implements interfaceDAO<TacGia>{

	
	@Override
	public ArrayList<TacGia> selectAll() {
		ArrayList<TacGia> ketqua =new ArrayList<TacGia>();
		try {
			
			Connection con = JDBCUtil.getConnection(); 
			
			String sql = "SELECT * FROM tacgia";
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				String matacgia = rs.getString("matacgia");
				String hovaten = rs.getString("hovaten");
				Date ngaysinh = rs.getDate("ngaysinh");
				String tieusu = rs.getString("tieusu");
				TacGia tg = new TacGia(matacgia, hovaten, ngaysinh, tieusu);
				ketqua.add(tg);
			}
			JDBCUtil.closeConnection(con);

		} catch (Exception e) {
			// TODO: handle exception
		}
		return ketqua;

		
	}

	@Override
	public TacGia selectById(TacGia t) {
		TacGia tg = null;
		try {

			Connection con = JDBCUtil.getConnection();

			String sql = "SELECT * FROM tacgia WHERE matacgia=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getMaTacGia());
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				String matacgia = rs.getString("matacgia");
				String hovaten = rs.getString("hovaten");
				Date ngaysinh = rs.getDate("ngaysinh");
				String tieusu = rs.getString("tieusu");
				tg = new TacGia(matacgia, hovaten, ngaysinh, tieusu);

			}
			JDBCUtil.closeConnection(con);

		} catch (Exception e) {
			// TODO: handle exception
		}
		return tg;
	}

	@Override
	public int insert(TacGia t) {
		try {
			Connection con = JDBCUtil.getConnection();

			String sql = "INSERT INTO tacgia (matacgia,hovaten,ngaysinh,tieusu)" + "VALUE (?,?,?,?)";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getMaTacGia());
			st.setString(2, t.getHoVaTen());
			st.setDate(3, t.getNgaySinh());
			st.setString(4, t.getTieuSu());
			st.executeUpdate();
			JDBCUtil.closeConnection(con);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
	}
	

	@Override
	public int insertAll(ArrayList<TacGia> arr) {
		int dem =0;
		for (TacGia tacGia : arr) {
			
			dem+=this.insert(tacGia);
		}
		return dem;
	}

	@Override
	public int delete(TacGia t) {
		try {
			Connection con = JDBCUtil.getConnection();

			String sql = "DELETE FROM tacgia "
					+ "WHERE matacgia=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getMaTacGia());
			st.executeUpdate();
			JDBCUtil.closeConnection(con);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
	}

	@Override
	public int deleteAll(ArrayList<TacGia> arr) {
		int dem=0;
		for (TacGia tacGia : arr) {
			
			
			 dem+=this.delete(tacGia);
				
			}
		return dem;
		}
		
	

		@Override
		public int update(TacGia t) {
			int kq=0;
			try {
				Connection con = JDBCUtil.getConnection();

				String sql = "UPDATE tacgia "
						+ "SET "
						+ "hovaten=?"
						+ ",ngaysinh=?"
						+ ",tieusu=?"
						+ "WHERE matacgia=?";
				PreparedStatement st = con.prepareStatement(sql);
				
				st.setString(1, t.getHoVaTen());
				st.setDate(2, t.getNgaySinh());
				st.setString(3, t.getTieuSu());
				st.setString(4, t.getMaTacGia());
				kq=st.executeUpdate();
				System.out.println("so dong bi thay doi"+kq);
				JDBCUtil.closeConnection(con);
				
			} catch (Exception e) {
				// TODO: handle exception
			}		
			return 1;
		}

		public static void main(String[] args) {
			TacGiaDAO tgd = new TacGiaDAO();
//			ArrayList<TacGia> arr = tgd.selectAll();
//			for (TacGia tacGia : arr) {
//				System.out.println(tacGia.toString());
//			}
//			TacGia tg = tgd.selectById(new TacGia("112", "", null, ""));
//			System.out.println(tg);
//			
			
			tgd.update(new TacGia("112","hoangkk",new Date(104,01,05),"Chúng ta không thuộc về nhau hêy !!"));
			
			System.out.println("chúng ta không thuộc về nhau của sơn tùng mtp nhé !!");
		}
	}