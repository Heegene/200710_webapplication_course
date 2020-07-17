<%@page import="och10.Emp"%>
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
		ArrayList<Emp> ale = new ArrayList<Emp>();
		
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
		Connection conn = ds.getConnection();
		String sql = "SELECT empno, ename FROM emp"; // 전체 사번리스트 조회 query 
		Statement stmt = conn.createStatement(); // 일반 statement 생성
		ResultSet rs = stmt.executeQuery(sql); // query 실행 후 resultset에 결과 담음 (Arraylist에 담김)
		// 사번의 리스트 생성 
		
		
		
		while (rs.next()) { // 남아있는 값이 있는동안 
			Emp emp = new Emp();
			emp.setEmpno(rs.getInt(1));
			emp.setEname(rs.getString(2));
			ale.add(emp);
		}
		
		
		
		request.setAttribute("ale", ale);
		
		
		// "al" object의 값을 al을 넣음
		
		rs.close(); // 연결종료
		stmt.close();
		conn.close();
		
		
	%>
	
	<h1> 보고 싶은 사원의 번호를 선택하세요. </h1>
	<form action="oraSelect.jsp">
		<select name="empno">
			<c:forEach var="emp" items="${ale }">
				<option value="${emp.empno }"> ${emp.empno}, ${emp.ename} </option>
			</c:forEach>
		
		</select> <br>
		<input type="submit" value="선택 완료">
	</form>

</body>
</html>