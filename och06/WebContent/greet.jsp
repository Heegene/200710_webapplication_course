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
	
		public void jspInit() { // method 선언 
			GregorianCalendar gc = new GregorianCalendar();
			date = String.format("%TF %TT", gc, gc); // TF는 날짜 TT는 시간 
			String fileName = "c:/log/" + date.replaceAll(":", "") + ".txt"; // :이 들어가면 파일명으로 생성이 안되므로 replaceAll 사용
			// 파일명 2020-07-14 140433.txt 이렇게 생성됨 
			System.out.println("jsp Init 호출 date is " + date);
			
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
		pw.flush();
	
	%>
	
	<%!  // destory 도 메소드이므로 선언부에 선언 
		public void jspDestroy() {
		if (pw != null) {
			pw.close();
		}
	}
	
	
	%>
	
</body>
</html>