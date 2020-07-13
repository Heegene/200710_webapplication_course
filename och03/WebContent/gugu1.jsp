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
	int n = Integer.parseInt(request.getAttribute("num").toString());
	%>
	
	<h1> 구구단 <%= n%>단 </h1> <br>
	
	<%
		for (int i = 1; i <= 9; i++) {
			out.print(n + " * " + i + " = " + (n*i) + "<br>");
		}
		out.close();
	%>
	



</body>
</html>