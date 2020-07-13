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
	String[] col = {"red", "orange", "yellow", "green", "blue", "navy", "violet", "black"};
	int n = (int)(Math.random() * 8);
	
	// program명.jsp 로 pgm 파일명
	String pgm = request.getParameter("pgm") + ".jsp";
		RequestDispatcher rd = request.getRequestDispatcher(pgm);
	
	if(pgm.equals("color1.jsp")) {
		request.setAttribute("color", col[n]);
		// rd = request.getRequestDispatcher("color1.jsp"); 이렇게 각각 3개 적어줘도 되는데 비효율적
	} else if (pgm.equals("gugu1.jsp")) {
		request.setAttribute("num", n + 2);
		// rd = request.getRequestDispatcher("gugu1.jsp");
	} else if (pgm.equals("response.jsp")) {
		// rd = request.getRequestDispatcher("response.jsp");
	}
	
	// 각 프로그램으로 forward 
	rd.forward(request, response);
	
	%>


</body>
</html>