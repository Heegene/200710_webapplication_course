<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="이콩이" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
	// 선언하려면 %뒤에 !붙임
		int three(int x) {
		return x * x * x;
	}
	
	%>
	
	2^3 = <%= three(2) %>
	<br>
	3^3 = <%= three(3) %>
	<br>
	4^3 = <%= three(4) %>
	<br>
	5^3 = <%= three(5) %>
	<br>
	6^3 = <%= three(6) %>
	<br>
	
	<%= getServletInfo() %>
	
</body>
</html>