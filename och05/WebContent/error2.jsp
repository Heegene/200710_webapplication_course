<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<% response.setStatus(200); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> 공지사항 </h1>
	더 나은 서비스를 위해 준비 중입니다 <br>
	메세지 : <%=exception.getMessage() %> <br>
	클래스 : <%=exception.getClass() %> <br>
</body>
</html>