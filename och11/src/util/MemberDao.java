package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.util.*;

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
		int count=0;
		Connection conn = getConnection();
		String sql = "INSERT INTO member1 VALUES (?, ?, ?, ?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		// id password name regidate
		String id = (String)session.getAttribute("id");
		String password = (String)session.getAttribute("password");
		String name = (String)session.getAttribute("name");
		Date date = new Date();
		
		
		
		// String attrValue = (String)session.getAttribute(attrName); 
		
		
		return count;
	}
	public int check(String id, String password) throws SQLException {
		int chk = 0;
		
		return chk;
	}
}
