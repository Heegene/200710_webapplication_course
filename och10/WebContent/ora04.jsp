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
	String deptno = request.getParameter("deptno");
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Class.forName(driver);
	
	
	Connection conn = DriverManager.getConnection(url, "scott", "tiger");
	String sqlname = "SELECT * from dept where deptno =" + deptno;
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sqlname);
	Dept dept = new Dept(); // DTO 이용해서 값 넣게될것 dept 단위로 움직이도록 
		
		if (rs.next()) {
			dept.setDetpno(rs.getInt(1));
			dept.setDname(rs.getString(2));
			dept.setLoc(rs.getString(3));
			
			request.setAttribute("dept", dept);
			rs.close();
			stmt.close();
			conn.close();
			
			
		RequestDispatcher rd = request.getRequestDispatcher("ora04Result.jsp");
		rd.forward(request, response);
	
	
		} else {
			out.print("해당하는 부서가 없습니다.");
		}
			
	%>
</body>
</html>