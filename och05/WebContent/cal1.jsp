<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> 연산 결과 </h1>
	<% 
    		int num1 = Integer.parseInt(request.getParameter("num1"));
		    int num2 = Integer.parseInt(request.getParameter("num2"));
	
	   try {
			// 이 이하의 내용에 try catch exception 해서 예외별로 처리해 주면 됨
	   }
		catch (ArithmeticException a) {
			a.printStackTrace();
		}
	%>

	<%=num1%> + <%=num2%> = <%=num1+num2%> <br>
	<%=num1%> - <%=num2%> = <%=num1-num2%>	<br>
	<%=num1%> * <%=num2%> = <%=num1*num2%> <br>
	<%=num1%> / <%=num2%> = <%=num1/num2%> <br>
	
	
</body>
</html>