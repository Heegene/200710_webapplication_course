package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDao {
	private static BoardDao instance;

	private BoardDao() {
	}

	public static BoardDao getInstance() {
		if (instance == null) {
			instance = new BoardDao();
		}
		return instance;

	}

	private Connection getConnection() {
		// getConnection method를 통해 한 번에 DBCP 연결
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return conn;

	}

	public int getTotalCnt() throws SQLException {
		int cnt = 0;
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			String sql = "select count(*) from board";

			st = conn.createStatement();
			rs = st.executeQuery(sql);

			if (rs.next()) {
				cnt = rs.getInt(1);
			}

		} catch (Exception e) {

			e.printStackTrace();

		} finally {

			if (!rs.isClosed()) {
				rs.close();
			}
			if (st != null) {
				st.close();
			}
			if (conn != null) {
				conn.close();
			}

		}

		return cnt;
	}

	public List<Board> list(int startRow, int endRow) throws SQLException {
		// 처음에는 startrow, endrow 1, 10이 들어가게됨

		List<Board> list = new ArrayList<Board>();

		String sql = "SELECT *\r\n" + "FROM (SELECT rownum rn, a.*\r\n"
				+ "      FROM   (SELECT * FROM board ORDER BY ref DESC, re_step) a\r\n" + "      )\r\n"
				+ "WHERE rn between ? and ?";
		// 한번에 다 가져오면 안되므로 10개씩만 가져오게
		// rownum은 1부터 시작해야 인식할 수 있음
		// 중간에 where rownum between 20 and 30 하면 안됨
		// 그래서 rownum을 처음 in-line view 형태로 가상으로 뽑아서 매기고
		// a.* a.모든것 이렇게 해놓고 rownum을 뽑음
		// 그다음에 20에서 30 이런식으로 가져오도록 함
		// 계속 1번부터 볼 순 없으므로 서브쿼리로 만들어서
		// 가상의 뷰를 만들고 rn이라는 가상의 필드를 만듦
		// 저 ? ? 는 startrow, endrow 이런식으로

		// order by~ 부분은 원글번호인 reference ref(대댓은 이후에 등록되더라도 ref순으로 따라와야함)
		// 그리고 re_step(답댓은 1,2,3,4 순차로 나가니까)
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, startRow); // 글번호(sql기준 rn 컬럼값)
			ps.setInt(2, endRow); //
			rs = ps.executeQuery();

			while (rs.next()) {

				Board board = new Board();
				board.setNum(rs.getInt(2));
				board.setWriter(rs.getString(3));
				board.setSubject(rs.getString(4));
				board.setContent(rs.getString(5));
				board.setEmail(rs.getString(6));
				board.setReadcount(rs.getInt(7));
				board.setPasswd(rs.getString(8));
				board.setRef(rs.getInt(9));
				board.setRe_step(rs.getInt(10));
				board.setRe_level(rs.getInt(11));
				board.setIp(rs.getString(12));
				board.setReg_date(rs.getDate(13));

				list.add(board);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			ps.close();
			conn.close();
		}

		return list;
	}

	public void readCount(int num) {
		// 특정 num 의 readcount 값을 +1 하는 것
		int res = 0;
		String sql = "UPDATE board SET readcount = readcount+1 WHERE num = ?";
		try
		// try-with-resource to prevent memory leak
		(Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);)

		{
			ps.setInt(1, num);
			res = ps.executeUpdate();

			if (res == 1) {
				System.out.println("readcount 입력 성공");
			} else {
				System.out.println("readcount 입력 실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public Board select(int num) {

		Board board = new Board();
		String sql = "SELECT * FROM board WHERE num=?";

		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);

		)

		{
			ps.setInt(1, num);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				board.setNum(rs.getInt("num"));
				board.setWriter(rs.getString("writer"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setEmail(rs.getString("email"));
				board.setReadcount(rs.getInt("readcount"));
				board.setPasswd(rs.getString("passwd"));
				board.setRef(rs.getInt("ref"));
				board.setRe_step(rs.getInt("re_step"));
				board.setRe_level(rs.getInt("re_level"));
				board.setIp(rs.getString("ip"));
				board.setReg_date(rs.getDate("reg_date"));
				System.out.println("num -> " + num);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return board;
	}

	public int update(Board board) {
		int result = 0;

		String sql = "UPDATE board SET writer=?, email=?, subject=?, passwd=?, content=?, ip=? WHERE num=?";

		try

		(Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);)

		{
			ps.setString(1, board.getWriter());
			ps.setString(2, board.getEmail());
			ps.setString(3, board.getSubject());
			ps.setString(4, board.getPasswd());
			ps.setString(5, board.getContent());
			ps.setString(6, board.getIp());
			ps.setInt(7, board.getNum());

			result = ps.executeUpdate();

			if (result == 1) {
				System.out.println("수정 성공");
			} else {
				System.out.println("수정 실패");
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return result;
	}

	public int insert(Board board) throws SQLException {
		int num = board.getNum();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int result = 0;
		String sql1 = "select nvl(max(num),0) from board"; // maxnumber를 얻어냄
		String sql = "INSERT  INTO board VALUES(?,?,?,?,?,?,?,?,?,?,?,sysdate)";
		String sql2 = "update board set re_step = re_step+1 where " + " ref=? and re_step > ?"; // 답글용 sql
		// 원래보다 re_step이 높은경우 값을 받기 위해 re_step 하나 넣어줌 
		try {
			conn = getConnection();
			if (num != 0) { // 답글인 경우
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, board.getRef()); // ref값 받아서 조건검색
				pstmt.setInt(2, board.getRe_step());  // re_step값 받아서 조건검색
				pstmt.executeUpdate();  // 해당 조건에 맞춘다음 re_step 값 1 더함
				pstmt.close();
				board.setRe_step(board.getRe_step() + 1); // re_step 에 1을 더해줌
				board.setRe_level(board.getRe_level() + 1);

			}
			pstmt = conn.prepareStatement(sql1); // re_step 값을 하나 올린다음 다시 insert문으로 들어옴
			rs = pstmt.executeQuery(); 
			rs.next();
			// key인 num 1씩 증가, mysql auto_increment 또는 oracle sequence
			// sequence를 사용 : values(시퀀스명(board_seq).nextval,?,?...)
			int number = rs.getInt(1) + 1; 
			
			rs.close();
			pstmt.close();
			
			if (num == 0) { // 신규 글 작성 
				board.setRef(number);
			}
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, board.getWriter());
			pstmt.setString(3, board.getSubject());
			pstmt.setString(4, board.getContent());
			pstmt.setString(5, board.getEmail());
			pstmt.setInt(6, board.getReadcount());
			pstmt.setString(7, board.getPasswd());
			pstmt.setInt(8, board.getRef());
			pstmt.setInt(9, board.getRe_step());
			pstmt.setInt(10, board.getRe_level());
			pstmt.setString(11, board.getIp());
			result = pstmt.executeUpdate();

		} catch (Exception e) {

			System.out.println(e.getMessage());

		} finally { // 닫아줌
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}
	
	public int delete(Board board) {
		int result = 0;

		String sql = "DELETE FROM board WHERE num=? AND passwd=?";

		try

		(Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql);)

		{
			ps.setInt(1, board.getNum());
			ps.setString(2, board.getPasswd());
			
			result = ps.executeUpdate();

			if (result == 1) {
				System.out.println("삭제 성공");
			} else if (result == 0) {
				System.out.println("비밀번호를 확인해 주세요.");
			} else {
				System.out.println("삭제에 실패하였습니다. ");
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return result;
	}

}
