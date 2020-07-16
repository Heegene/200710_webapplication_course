<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setAttribute("n", 10);
	// 위의 방법과 아래 jstl 문법은 똑같음 
%>

<c:set var="n" scope="request" value="10"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${n ==0}">
	n과 0은 같습니다. 
</c:if>

<c:if test="${n ==10}">
	n과 10은 같습니다. 
</c:if>

흐름제어 태그 - choose<br>






</body>
</html>