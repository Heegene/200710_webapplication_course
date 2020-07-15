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
		String[] pet = {"야옹이", "진돗개", "치와와", "구렁이", "조랑말"};
		request.setAttribute("pet", pet);
		
	%>
	
	<jsp:forward page="each2result.jsp"/>
	
</body>
</html>