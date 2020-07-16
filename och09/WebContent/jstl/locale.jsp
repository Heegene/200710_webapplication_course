<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="date" value="<%=new Date() %>"/>
	<h2> 우리나라 </h2>
	<fmt:setLocale value="ko-kr"/>
	
	금액 : <fmt:formatNumber value="1000000" type="currency"/> <br>
	일시 : <fmt:formatDate value="${date }" type="both" dateStyle="full" timeStyle="full"/> <br>
	<h2> 미국</h2>
	
	<fmt:setLocale value="en-us"/>
	
	금액 : <fmt:formatNumber value="1000000" type="currency"/> <br>
	일시 : <fmt:formatDate value="${date }" type="both" dateStyle="full" timeStyle="full"/> <br>
	
	<h2> 일본 </h2>
	
	<fmt:setLocale value="ja_jp"/>
	
	금액 : <fmt:formatNumber value="1000000" type="currency"/> <br>
	일시 : <fmt:formatDate value="${date }" type="both" dateStyle="full" timeStyle="full"/> <br>
	
</body>
</html>