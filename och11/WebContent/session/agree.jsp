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
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	
	session.setAttribute("id", id);
	session.setAttribute("password", password);
	session.setAttribute("name", name);

%>

<h1> 약관 동의 </h1>
---------------------------------------------------------------------------------------<br>
1. 회원 정보는 웹 사이트의 운영을 위해서만 사용됩니다. <br>
2. 웹 사이트의 정상 운영을 방해하는 회원은 탈퇴 처리합니다. <br>
---------------------------------------------------------------------------------------<br>

<form action="subscribe.jsp">
	동의 <input type="radio" name="agree" value="y"> <br>
	거부 <input type="radio" name="agree" value="n"> <br>
	<input type="submit" value="확인">
</form>

</body>
</html>