<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
	request.setAttribute("score", 93);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:choose>
	<c:when test="${ score >= 90 }">
		A학점 입니다.
	</c:when>
	
	<c:when test="${ score >= 80 }">
		B학점 입니다.
	</c:when>
	
	
	<c:when test="${ score >= 70 }">
		C학점 입니다.
	</c:when>
	
	
	<c:when test="${ score >= 60 }">
		D학점 입니다.
	</c:when>
	
	
	<c:otherwise>
		낙제입니다.
	</c:otherwise>
	
</c:choose>


</body>
</html>