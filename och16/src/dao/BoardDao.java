package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDao {
	private static BoardDao instance;
	private BoardDao() {}
	public static BoardDao getInstance() {
		if (instance == null ) {
			instance = new BoardDao();
		}
		return instance;
		
	}
	
	private Connection getConnection() {
		// getConnection method를 통해 한 번에 DBCP 연결 
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
			
			if (rs != null) {
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
}
