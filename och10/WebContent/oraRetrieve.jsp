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
		String deptno = request.getParameter("deptno");
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Class.forName(driver);

		Connection conn = DriverManager.getConnection(url, "scott", "tiger");
		String sqlname = "SELECT * from dept where deptno =" + deptno;
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sqlname);

		if (rs.next()) {
			String dname = rs.getString("dname");
			String loc = rs.getString(3);
			request.setAttribute("deptno", deptno);
			request.setAttribute("dname", rs.getString(2));
			request.setAttribute("loc", rs.getString(3));
			RequestDispatcher rd = request.getRequestDispatcher("oraResult.jsp");
			rd.forward(request, response);

		} else {
			out.print("해당하는 부서가 없습니다.");
		}

		rs.close();
		stmt.close();
		conn.close();
	%>
	<script type="text/javascript">
		alert("부서가 존재하지 않습니다.");
		location.href = "oraUpdate.html";
	</script>
</body>
</html>