package och12;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
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
	
}
