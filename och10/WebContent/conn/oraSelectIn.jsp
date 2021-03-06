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
		String sql = "SELECT empno FROM emp"; // 전체 사번리스트 조회 query 
		// 예제에서는 select empno, ename from emp 했는데 굳이 데이터를 더 가져올 필요 못느껴서 empno만 넣음 
		Statement stmt = conn.createStatement(); // 일반 statement 생성
		ResultSet rs = stmt.executeQuery(sql); // query 실행 후 resultset에 결과 담음 (Arraylist에 담김)
		// 사번의 리스트 생성 
		
		
		
		while (rs.next()) { // 남아있는 값이 있는동안 
			al.add(rs.getInt(1)); // arraylist 객체 al에 첫 번째 항목인 empno를 추가
		}
		
		request.setAttribute("al", al);
		
		// "al" object의 값을 al을 넣음
		
		rs.close(); // 연결종료
		stmt.close();
		conn.close();
		
		
	%>
	
	<h1> 보고 싶은 사원의 번호를 선택하세요. </h1>
	<form action="oraSelect.jsp">
		<select name="empno">
			<c:forEach var="empno" items="${al }"> 
			<!--  안에 al 의 아이템을 꺼내와서 집어넣고 empno 에 대입 -->
				<option value="${empno }"> ${empno } </option>
				<!-- foreach 돌아가면서 empno 각각 들어가고, 옵션을 표기하는 empno도 따로 넣어줌(화면 뿌리기용) -->
			</c:forEach>
		
		</select> <br>
		<input type="submit" value="선택 완료">
	</form>

</body>
</html>