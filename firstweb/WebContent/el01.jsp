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
	pageContext.setAttribute("p1", "page scope value");
	request.setAttribute("r1", "request scope value");
	session.setAttribute("s1", "session scope value");
	application.setAttribute("a1", "application scope value");
	
	
	%>
	
	
</body>
	pageContext.getAttribute("p1") : ${pageScope.p1} <br>
	request.getAttribute("r1") : ${requestScope.r1} <br>
	session.getAttribute("s1") : ${sessionScope.s1} <br>
	application.getAttribute("p1") : ${applicationScope.a1} <br>
	<br>
	<br>
	pageContext.getAttribute("p1") : ${p1} <br>
	request.getAttribute("r1") : ${r1} <br>
	session.getAttribute("s1") : ${s1} <br>
	application.getAttribute("p1") : ${a1} <br>
	<br>
	


</html>