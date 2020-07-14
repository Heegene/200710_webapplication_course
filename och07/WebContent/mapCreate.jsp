<%@page import="sun.rmi.server.Dispatcher"%>
<%@page import="java.util.HashMap"%>
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
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("Park", "목동");
		map.put("중앙", "강남");
		map.put("Jessica", "크라이스 처치");
		map.put("Susan", "시드니");
		// map 객체를 ADDRESS에 저장 
		request.setAttribute("ADDRESS", map);
		
		RequestDispatcher rd = request.getRequestDispatcher("mapView.jsp?NAME=Park");
		rd.forward(request, response);
	
	
	
	
	%>
</body>
</html>