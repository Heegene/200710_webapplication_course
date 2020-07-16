<%@page import="och10.Dept"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% Dept dept = (Dept)request.getAttribute("dept");
%>
	<h1> Expression 부서정보</h1>
	부서코드: <%=dept.getDetpno() %> <br>
	부서이름: <%=dept.getDname()%><br>
	부서위치: <%=dept.getLoc()%><br>
	
	

	<h1> EL 표기법 부서정보 </h1>
	부서코드: ${dept.getDeptno() } <br>
	부서이름: ${dept.dname} <br>
	부서위치: ${dept.loc} <br>
	
</body>
</html>