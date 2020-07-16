<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
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
		Context init = new InitialContext(); // 환경작업을 초기화하고 인스턴스화
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB"); 
		// jdbc 환경 중 OracleDB라는 이름 찾아서
		Connection conn = ds.getConnection(); // 거기에 연결함 (일반 driver잡고 하던 jdbc getconnection이랑 똑같음 )
		
		if (conn != null) {
			out.print("<h1> 연결 성공 </h1> ");
			
		} else {
			out.print("<h1> 연결 실패 </h1>");
		}
		conn.close();
	%>
</body>
</html>