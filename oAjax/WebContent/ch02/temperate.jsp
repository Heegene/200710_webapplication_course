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
	double[] temp = { 9.8, 12.2, 24.7, 23.7, 23.1 };
	for (int i = 0; i < temp.length; i++) {
		out.println(temp[i]);
		
		if (i != (temp.length-1)) {
			out.println(",");
		}
	}

%>
</body>
</html>