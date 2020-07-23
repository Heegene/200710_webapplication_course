package dao;

import java.sql.Connection;

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
	
	
}
