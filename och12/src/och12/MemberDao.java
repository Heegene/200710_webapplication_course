package och12;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDao {
	// singleton DBCP 이용
	private static MemberDao instance;

	private MemberDao() {
	}

	public static MemberDao getInstance() {
		if (instance == null) {
			instance = new MemberDao();
		}
		return instance;
	}

	private Connection getConnection() {
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

	public int confirm(String id, String passwd) throws SQLException {
		int chk = 0;
		ResultSet rs = null;
		Connection conn = getConnection();
		
		String sql = "SELECT passwd FROM member2 WHERE id=?"; // 아이디로 암호값 불러오고
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, id) ;
		rs = ps.executeQuery();
		
		try {
			if (rs.next()) {
				String pwd = rs.getString(1); // 암호값 가져옴
				if (pwd.equals(passwd)) {
					chk = 1; // 암호 일치하면 1
				} else {
					chk = 0; // 일치하지 않으면 0(암호가 틀림)
				}
			}
			else {
					chk = -1; // 아이디가 없어서 끌려나오지 않는 경우 
				}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			ps.close();
			conn.close();
		}
		
		return chk;
	}
	
	public int insert(Member member) throws SQLException {
		int result = 0;
		Connection conn = null;
		try {
			// 연결부
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
			
			String sql = "INSERT INTO member2 VALUES (?,?,?,?,?,sysdate)";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			
			ps.setString(1, member.getId());
			ps.setString(2, member.getPasswd());
			ps.setString(3, member.getName());
			ps.setString(4, member.getAddress());
			ps.setString(5, member.getTel());
			// id, passwd, name, address, tel, regdate
			
			result = ps.executeUpdate();
			
			ps.close();
			conn.close();
			
		} catch (Exception e){
			e.printStackTrace();
		}
					
		return result;
		
	}
	
	public List<Member> list() throws SQLException, NamingException {
		List<Member> li = new ArrayList<Member>();
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
		
		Connection conn = ds.getConnection();
		String sql = "SELECT * FROM member2";
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(sql);
		
		
		while (rs.next()) {
					// id 비번 이름 주소 번호 등록일자
			Member member = new Member();
			member.setId(rs.getString(1));
			member.setPasswd(rs.getString(2));
			member.setName(rs.getString(3));
			member.setAddress(rs.getString(4));
			member.setTel(rs.getString(5));
			member.setReg_date(rs.getDate(6));
			
			li.add(member);
		}
		
		
		
		rs.close();
		stmt.close();
		conn.close();
		
		return li;
	}
}
