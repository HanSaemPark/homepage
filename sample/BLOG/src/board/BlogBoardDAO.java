package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

// 항상 이름이 뒤에 DAO여야 함.!!
public class BlogBoardDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public BlogBoardDAO() {

		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/myoracle");
			conn = ds.getConnection();
			System.out.println("DBCP 연결 성공");
		} catch (Exception e) {
			System.out.println("DBCP 연결 오류");
			e.printStackTrace();
		}
	}

	// 10개씩 페이징
	public ArrayList<BlogBoard> getList(int pageNum) {
		String sql = "SELECT  BDID, BDTITLE, USEREMAIL, BDDATE, BDCONTENT, BDUSED, ROWNUM "
				+ "FROM(SELECT /*+INDEX_DESC(BLOGBOARD SYS_C007170) */ "
				+ "BDID, BDTITLE, USEREMAIL, BDDATE, BDCONTENT, ROWNUM PAGECOUNT, BDUSED " + ""
				+ "FROM BLOGBOARD WHERE BDID > 0 AND BDUSED = 1 AND ROWNUM <= ? )WHERE PAGECOUNT > ?";
		ArrayList<BlogBoard> list = new ArrayList<BlogBoard>();
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pageNum * 10);
			pstmt.setInt(2, pageNum * 10 - 10);
			rs = pstmt.executeQuery();
			while (rs.next()) { // return boolean
				BlogBoard blogboard = new BlogBoard();

				blogboard.setBdID(rs.getInt("bdID"));
				blogboard.setBdTitle(rs.getString("bdTitle"));
				blogboard.setUserEmail(rs.getString("userEmail"));
				blogboard.setBdDate(rs.getString("bdDate"));
				blogboard.setBdContent(rs.getString("bdContent"));
				blogboard.setBdUsed(rs.getInt("bdUsed"));

				list.add(blogboard);
			}
		} catch (Exception e) {
			System.out.println("getList sql error");
			e.printStackTrace();
			return null;
		}
		return list;
	}

	// 호출 board
	public int write(BlogBoard board) {

		String sql = "INSERT INTO BLOGBOARD VALUES(BlogBoard_SEQ.NEXTVAL, ?, ?, SYSDATE, ?, 1, ?)";
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getBdTitle());
			pstmt.setString(2, board.getUserEmail());
			pstmt.setString(3, board.getBdContent());
			pstmt.setString(4, board.getBdIP());
			pstmt.executeUpdate();

		} catch (Exception e) {

			System.out.println("write sql error");
			e.printStackTrace();
		}
		return -2; // 데이터 베이스 오휴

	}

	// 마지막 페이지 찾기
	public boolean nextPage(int pageNum) {
		String sql = "SELECT  BDID, BDTITLE, USEREMAIL, BDDATE, BDCONTENT, BDUSED, ROWNUM "
				+ "FROM(SELECT /*+INDEX_DESC(BLOGBOARD SYS_C007170) */ "
				+ "BDID, BDTITLE, USEREMAIL, BDDATE, BDCONTENT, ROWNUM PAGECOUNT, BDUSED " + ""
				+ "FROM BLOGBOARD WHERE BDID > 0 AND BDUSED = 1 AND ROWNUM <= ? )WHERE PAGECOUNT > ?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, pageNum * 10);
			pstmt.setInt(2, pageNum * 10 - 10);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}

		} catch (Exception e) {
			System.out.println("nextpage sql error");
			e.printStackTrace();

		}
		return false;
	}

	// 상세보기
	public BlogBoard getBlogBoard(int bdID) {

		String sql = "SELECT * FROM BLOGBOARD WHERE BDID = ?";

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bdID); // 첫번째 물음표
			rs = pstmt.executeQuery(); // 결과값을 그냥 뿌리면 됨.

			if (rs.next()) {

				BlogBoard board = new BlogBoard();
				board.setUserEmail(rs.getString("UserEmail"));
				board.setBdTitle(rs.getString("bdTitle"));
				board.setBdDate(rs.getString("bdDate"));
				board.setBdContent(rs.getString("bdContent"));
				return board;

			}

		} catch (Exception e) {

			System.out.println("getBoard sql error");
			e.printStackTrace();

		}
		return null;

	}

	// 삭제 페이지
	public int delete(int bdID) {

		String sql = "UPDATE BLOGBOARD SET BDUSED = 0 WHERE BDID = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bdID);
			pstmt.executeUpdate();
			return 1; // 성공

		} catch (Exception e) {

			System.out.println("delete sql error");
			e.printStackTrace();
		}

		return -1; // 실패

	}

	// 수정 페이지 생성
	public int update(BlogBoard board) {

		// 인젝션 공격 방지를 위해서 prepareStatement를 사용하고 SQL 문을 ?로 사용한다.

		String sql = "UPDATE BLOGBOARD SET BDTITLE = ?, BDCONTENT =? WHERE BDID = ?";

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getBdTitle());
			pstmt.setString(2, board.getBdContent());
			pstmt.setInt(3, board.getBdID());
			pstmt.executeUpdate();
			return 1; // 수정 성공

		} catch (SQLException e) {

			System.out.println("update sql error");
			e.printStackTrace();
		}

		return -1; // 실패
	}
	
	// 게시물 실시간 업데이트
	public ArrayList<BlogBoard> getRealTimeData() {
		ArrayList<BlogBoard> list = new ArrayList<BlogBoard>();
		String sql = "SELECT BDID, BDTITLE, USEREMAIL, RANK\r\n" + 
				"FROM\r\n" + 
				"(\r\n" + 
				"SELECT BDID, BDTITLE, USEREMAIL, RANK() OVER(ORDER BY BDID DESC) RANK\r\n" + 
				"FROM BLOGBOARD\r\n" + 
				"WHERE BDUSED >= 0\r\n" + 
				"ORDER BY BDID DESC\r\n" + 
				")\r\n" + 
				"WHERE RANK <4;\r\n" + 
				"";
		
		System.out.println("getRealTime : " + sql);

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BlogBoard b = new BlogBoard();
				b.setBdID(rs.getInt("bdID"));
				b.setBdTitle(rs.getString("bdTitle"));
				b.setUserEmail(rs.getString("userEmail"));
				list.add(b);
			}
			pstmt.close();
			rs.close();
			conn.close();
			return list; // 정상
			
		} catch (Exception e) {
			
			System.out.println("실시간 업데이트 실패");
			e.printStackTrace();
		}
		return null; // 실패
	}

	// 게시물 검색하기
	public ArrayList<BlogBoard> search(String content) {
		ArrayList<BlogBoard> list = new ArrayList<BlogBoard>();
		String sql = "SELECT *\r\n" + "FROM BLOGBOARD\r\n"
				+ "WHERE USEREMAIL = LOWER(?) OR USEREMAIL = UPPER(?) OR BDCONTENT LIKE ? OR BDTITLE LIKE ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, content);
			pstmt.setString(2, content);
			pstmt.setString(3, "%" + content + "%");
			pstmt.setString(4, "%" + content + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BlogBoard board = new BlogBoard();
				board.setBdID(rs.getInt("bdID"));
				board.setBdTitle(rs.getString("bdTitle"));
				board.setUserEmail(rs.getString("userEmail"));
				board.setBdDate(rs.getString("bdDate"));
				board.setBdContent(rs.getString("bdContent"));
				list.add(board);
			}

		} catch (Exception e) {

			System.out.println("검색 오류 인가여?");
			e.printStackTrace();
			return null; // 오류나면 null뜸
		}
		return list;
	}

}