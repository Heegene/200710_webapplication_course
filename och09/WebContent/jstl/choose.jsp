<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 인사말 </h2> 
	<c:choose>
		<c:when test="${param.num1==0}">
			안녕하세요
		</c:when>
		<c:when test="${param.num1==1}">
			Hi, Hi
		</c:when>
		<c:when test="${param.num1==2}">
			Nihao
		</c:when>
		<c:otherwise>
			해당하는 값이 없습니다. 
		</c:otherwise>	
	</c:choose>
</body>
</html>