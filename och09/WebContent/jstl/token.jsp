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
	<c:set var="animals" value="토끼, 고양이*강아지, 망아지"/>
	<h2> 사자의 생일 </h2>
	<c:forTokens var="an" items="${animals}" delims="*">
		${an } <br> 
	</c:forTokens>
</body>
</html>