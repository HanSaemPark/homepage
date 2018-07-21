package member;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Statement stmt;

	public MemberDAO() {
		try {

			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/myoracle");
			// 풀링기술이 자동적으로 적용됨.
			conn = ds.getConnection();
			System.out.println("DBCP 연결 성공");
		} catch (Exception e) {
			System.out.println("DBCP 연결 오류");
			e.printStackTrace();
		}

	}

	// 회원가입 처리
	public int sign(BlogMB member) {

		String sql = "INSERT INTO BLOGMB VALUES (?, ?, ?, ?, ?)";
		System.out.println(sql);
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getUserEmail());
			pstmt.setString(2, member.getUserID());
			pstmt.setString(3, member.getUserPassword());
			pstmt.setString(4, member.getUserNickname());
			pstmt.setString(5, member.getUserAddress());
			pstmt.executeUpdate();
			
			return 1; // 회원가입 성공
			
		} catch (Exception e) {
			System.out.println("join sql error");
			e.printStackTrace();
		}
		
		return -1; // 데이터베이스 오류
	}
	
	// 로그인 처리
	public int login(String userEmail, String userPassword) {
		
		String sql = "SELECT USEREMAIL, USERPASSWORD FROM BLOGMB";
		System.out.println(sql);
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
		
			if(rs.next()) {
				
				return 1; // 로그인 성공
			}else {
				
				return 0; // 로그인 실패
			}
			
			
		} catch (SQLException e) {
			System.out.println("login sql error");
			e.printStackTrace();
		}
		
		return -2; // DB오류
	}
		
	// 회원정보 뿌리기.
	public BlogMB info(String userEmail) {
		
		String sql = "SELECT USEREMAIL, USERID, USERNICKNAME, USERADDRESS FROM BLOGMB WHERE USEREMAIL = ?";
		System.out.println(sql);
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userEmail);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
				BlogMB m = new BlogMB();
				rs.getString("userEmail");
				rs.getString("userID");
				rs.getString("userNickname");
				rs.getString("userAddress");
				
				m.setUserEmail(rs.getString("userEmail"));
				m.setUserID(rs.getString("userID"));
				m.setUserNickname(rs.getString("userNickname"));
				m.setUserAddress(rs.getString("userAddress"));
				
				return m;
			}
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch (SQLException e) {
			
			System.out.println("DB 오류");
			e.printStackTrace();
		}
		return null;
			
	}
	
	// 회원탈퇴
	/*public BlogMB delete(String userEmail, String userPassword) {
		
		String sql = "DELETE FROM BLOGMB WHERE USEREMAIL = ? AND USERPASSWORD = ?";
		System.out.println(sql);
		
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userEmail);
			pstmt.setString(2, userPassword);
			
			pstmt.executeUpdate();
			
			
			
		} catch (Exception e) {
			
			System.out.println("DB 오류");
			e.printStackTrace();
		}
		
		return null;
		
		
		
	}*/
}
