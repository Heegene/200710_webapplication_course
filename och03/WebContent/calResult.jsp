<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>연산 결과</h2>
	덧셈 :    <%= request.getAttribute("add") %> <br>
	뺄셈 :    <%= request.getAttribute("min") %> <br>
	곱셈 :    <%= request.getAttribute("mul") %> <br>
	나눗셈 :  <%= request.getAttribute("div") %> <br>
	
	
	
	
</body>
</html>