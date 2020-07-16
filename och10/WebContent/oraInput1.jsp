<%@page import="java.sql.PreparedStatement"%>
<%@page import="och10.Dept"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
	request.setCharacterEncoding("utf-8");
	// response.setContentType("text/html;charset=utf-8");
	String deptno = request.getParameter("deptno");
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Class.forName(driver);
	
	
	Connection conn = DriverManager.getConnection(url, "scott", "tiger");
	String sql = "INSERT INTO dept VALUES (?, ?, ?)";
	// String sql = String.format("insert into dept values (%s, '%s', '%s')", deptno, dname, loc);
	// 이렇게 formatting으로도 사용 가능 
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, deptno);
	ps.setString(2, dname);
	ps.setString(3, loc);

	
	int count = ps.executeUpdate();
		
		if (count > 0 ) {
			
			System.out.println("입력 성공");
			
	
		} else {
			System.out.println("해당하는 부서가 없습니다.");
		}
			
	%>
</body>
</html>