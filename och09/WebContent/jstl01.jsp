<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:set var="value1" scope="request" value="KongE">
</c:set>

성: ${ value1 } <br>

<!-- 단일태그 방식으로 닫기 가능  -->

<c:remove var="value1" scope="request" />
<!--  변수 삭제하고나서 value1 출력하면 아무것도 안뜸  -->

성: ${ value1 } <br>

</body>
</html>