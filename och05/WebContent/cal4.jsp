<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error2.jsp"
    %>
    <!--  지시자에 문제 생겼을 때의 에러페이지를 지정해 줄 수도 있음  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
	 
	
			int num1 = Integer.parseInt(request.getParameter("num1"));
			int num2 = Integer.parseInt(request.getParameter("num2"));
			out.print(num1 + " / " + num2 + " = " + (num1/num2) + "<br>"); 
			// 에러 발생시킬거니까 굳이 다른연산 넣을필요없이 나누기만 넣음(arithmeticexception)
		
	%>

</body>
</html>