<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="../DBError.jsp"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		ArrayList<Integer> al = new ArrayList<Integer>();
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
		Connection conn = ds.getConnection();
		String sql = "SELECT empno, ename FROM emp";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next()) {
			al.add(rs.getInt(1));
		}
		
		request.setAttribute("al", al);
		
		rs.close();
		stmt.close();
		conn.close();
		
		
	%>
	
	<h1> 보고 싶은 사원의 번호를 선택하세요. </h1>
	<form action="oraSelect.jsp">
		<select name="empno">
			<c:forEach var="empno" items="${al }">
				<option value="${empno }"> ${empno } </option>
			</c:forEach>
		
		</select> <br>
		<input type="submit" value="선택 완료">
	</form>

</body>
</html>