<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="greet" value="How Are You?"/>

<h2> 인삿말 </h2>
원글 : ${greet } <br>
대문자 : ${fn:toUpperCase(greet) } <br>
소문자 : ${fn:toLowerCase(greet) } <br>
Are 위치 : ${fn:indexOf(greet, "Are") } <br>
Replace : ${fn:replace(greet, "Are", "Were") } <br>
문자길이  : ${fn:length(greet) } <br>

</body>
</html>