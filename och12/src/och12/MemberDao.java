package och12;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDao {
	//singleton DBCP 이용
	private static MemberDao instance;
	private MemberDao() { }
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
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
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
		
		String sql = "SELECT id FROM member2 WHERE id=? AND passwd=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, id) ;
		ps.setString(2, passwd);
		rs = ps.executeQuery();
		
		try {
			if (rs.next()) {
				chk = 1;
			} else {
				chk = 0;
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