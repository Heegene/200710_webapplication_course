<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> EL 문법 우승자 </h1>
	<!-- EL 표기법으로 배열값을 꺼낼시 별도의 선언 없이 그냥 꺼내면 됨 -->
	1등 : ${winner[0]} <br>
	2등 : ${winner[1]} <br>
	3등 : ${winner[2]} <br>
	
	
	<h1> 일반 JSP문법 우승자 </h1>
	<%
		String[] win = (String[])request.getAttribute("winner");
		for (int i = 0; i < win.length; i++) {
			out.print((i+1) + "등 : " + win[i] + "<br>");
		}
	
	%>
	
</body>
</html>