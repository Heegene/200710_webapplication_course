<%@page import="java.io.FileWriter"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%! // 선언부 (필드, 메소드)
		private PrintWriter pw;
		String date;
	
		public void jspInit() {
			GregorianCalendar gc = new GregorianCalendar();
			date = String.format("%TF", "%TT", gc, gc);
			String fileName = "c:/log/" + date.replaceAll(":", "") + ".txt";
			
			try {
				pw = new PrintWriter(new FileWriter(fileName, true));
				
				
			} catch (Exception e) {
				System.out.println("예외 발생");
				e.printStackTrace();
			}
		}
	%>
	
	
	<% 
		String name = request.getParameter("name");
		String msg = name + " 님 반갑습니다.";
		out.print(msg + "<br> 현재시간 :" + date );
		pw.print(msg + " \r\n 현재시간 :" + date + "\r\n");
	
	%>
	
	<%! 
		public void jspDestroy() {
		if (pw != null) {
			pw.close();
		}
	}
	
	
	%>
	
</body>
</html>