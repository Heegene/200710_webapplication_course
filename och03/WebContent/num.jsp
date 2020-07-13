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
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int res = 0;
	for (int i = 1; i <= num1; i++) {
		res += i;
	}
	
	%>
	
	<h1> 1부터 <%=num1%>까지의 합 </h1>
	<%=res%>
	
</body>
</html>