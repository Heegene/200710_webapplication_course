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

이름은 ${param.name } 입니다. 반갑습니다.  <br>

<c:choose>
	<c:when test="${param.name == 'admin' && param.pass =='1234'}">
		admin 권한으로 입장하였습니다. full access
	</c:when>
	
	<c:otherwise>
		no access available
	</c:otherwise>

</c:choose>
</body>
</html>