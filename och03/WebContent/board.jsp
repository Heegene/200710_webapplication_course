    <!-- 지시자 부분 -->
<%@page import="java.io.FileWriter"%>
<%@page import="java.util.Date"%>
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
		request.setCharacterEncoding("utf-8");
	
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	String msg = "제목 : " + title + "\r \n " ;
			// r n은 캐리지리턴 라인피드(엔터역할)
	msg += "작성자 : " + writer + "\r \n " ;
	msg += "내용 : " + content + "\r \n " ;
	Date date = new Date();
	// import시 util date를 import 해야하는것 유의
	long fileName = date.getTime();
	
	String real = application.getRealPath("/WEB-INF/OUT/"+fileName+".txt");
	
	System.out.println(real);
	// java io의 filewriter 임포트 
	FileWriter fw = new FileWriter(real);
	fw.write(msg);
	fw.flush();
	fw.close();
	
	
	out.print("제목 :" + title + "<br>");
	out.print("작성자 :" + writer + "<br>");
	out.print("내용 :" + content + "<br>");
	%>
	
</body>
</html>