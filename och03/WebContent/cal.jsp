<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
여기는 연산만 하고 다음 페이지 
<%
	int num1 = Integer.parseInt(request.getParameter("num1")); // 내장객체 request 
	int num2 = Integer.parseInt(request.getParameter("num2"));

	
	int add = num1 + num2;
	int min = num1 = num2;
	int mul = num1 * num2;
	int div = num1 / num2;
	
	request.setAttribute("add", add); // form 문이 아닐 때 저장하는 방식 attr, value 형식으로 저장됨 
	request.setAttribute("min", min);
	request.setAttribute("mul", mul);
	request.setAttribute("div", div);
	
	out.flush();
	RequestDispatcher rd = request.getRequestDispatcher("calResult.jsp");
	// rd.forward(request, response);
	rd.include(request, response);

%>

</body>
</html>