package DBPKG;

import java.awt.List;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;


public class memberDAO {
	private static memberDAO instance = new memberDAO();
	
	public static memberDAO getInstance(){
		return instance;
	}
	
	public Connection getConnection() {// sql연결
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String password = "hr";
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user,password);
			System.out.println(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public int getMaxNum() {
		int num = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String sql = "SELECT MAX(CUSTNO) FROM member_tbl_02";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				num = rs.getInt(1)+1;
				System.out.println(num);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return num;
	}
	public boolean insertMember(memberVO vo) {
		boolean result = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int line = 0;
		try {
			conn = getConnection();
			String sql = "insert into MEMBER_TBL_02 values (?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,vo.getCustno());
			pstmt.setString(2,vo.getCustName());
			pstmt.setString(3, vo.getPhone());
			pstmt.setString(4, vo.getAddress());
			pstmt.setDate(5, vo.getJoindate());
			pstmt.setString(6, vo.getGrade());
			pstmt.setString(7, vo.getCity());
			
			line = pstmt.executeUpdate();
			
			if(line > 0) {
				result = true;
				System.out.println(result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<memberVO> selectMember() {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		ArrayList<memberVO> list = new ArrayList<memberVO>();
		try {
			conn = getConnection();
			String sql = "SELECT * FROM MEMBER_TBL_02";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				memberVO vo = new memberVO();
				vo.setCustno(rs.getInt(1));
				vo.setCustName(rs.getString(2));
				vo.setPhone(rs.getString(3));
				vo.setAddress(rs.getString(4));
				vo.setJoindate(rs.getDate(5));
				String rank = rs.getString(6);
				switch (rank) {
				case "A" : vo.setGrade("VIP"); break;
				case "B" : vo.setGrade("일반"); break;
				case "C" : vo.setGrade("직원"); break;
				default: vo.setGrade("등급오류"); break;
				}
				String house = rs.getString(7);
				switch (house) {
				case "01" : vo.setCity("서울"); break;
				case "10" : vo.setCity("인천"); break;
				case "20" : vo.setCity("성남"); break;
				case "30" : vo.setCity("대전"); break;
				case "40" : vo.setCity("광주"); break;
				case "50" : vo.setCity("부산"); break;
				default: vo.setCity("불명"); break;
				}
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}