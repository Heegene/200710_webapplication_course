<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
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
	int deptno = Integer.parseInt(request.getParameter("deptno"));
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Class.forName(driver);
	
	
	
	Connection conn = DriverManager.getConnection(url, "scott", "tiger");
	String sql = "UPDATE dept SET dname=?, loc=? where deptno=?";
	// String sql = String.format("insert into dept values (%s, '%s', '%s')", deptno, dname, loc);
	// 이렇게 formatting으로도 사용 가능 
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, dname);
	ps.setString(2, loc);
	ps.setInt(3, deptno);

	
	int count = ps.executeUpdate();
		
		if (count > 0 ) {
			
			out.print("수정 성공");
			
	
		} else {
			out.print("수정 실패 ");
		}
			
	%>
</body>
</html>