<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	String deptno = request.getParameter("deptno");
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Class.forName(driver);
	
	Connection conn = DriverManager.getConnection(url, "scott", "tiger");
	String sqlname = "SELECT * from dept where deptno =" + deptno;
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sqlname);
	
	

		Class.forName(driver);
		
		if (rs.next()) {
			String dname = rs.getString("dname");
			String loc = rs.getString(3);
			out.print("부서코드 : " + deptno + "<br>");
			out.print("부서이름 : " + dname + "<br>");
			out.print("부서위치 : " + loc + "<br>");
		} else {
			out.print("해당하는 부서가 없습니다.");
		}
		
		
	
			
			rs.close();
			
			stmt.close();
		
			conn.close();
	
	
			
	
	
	%>
</body>
</html>