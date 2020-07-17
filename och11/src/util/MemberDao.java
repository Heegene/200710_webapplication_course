package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDao {
	
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
	public int insert(MemberDto member) throws SQLException {
		int chk=0;
		Connection conn = getConnection();
		String sql = "INSERT INTO member1 VALUES (?, ?, ?, sysdate)";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, member.getId());
		ps.setString(2, member.getPassword());
		ps.setString(3, member.getName());
		
		chk = ps.executeUpdate();
		
		ps.close();
		conn.close();
		
		return chk;
	}
	public int check(String id, String password) throws SQLException {
		int chk = 0;
		
		return chk;
	}
}
