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
		String protocol = request.getProtocol();
		String server = request.getServerName();
		int port = request.getServerPort();
		String clientIp = request.getRemoteAddr();
		String clientHost = request.getRemoteHost();
		String methodType = request.getMethod();
		String url = new String(request.getRequestURL());
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String browser = request.getHeader("User-Agent");
		String mediaType = request.getHeader("Accept");
		
	
	%>
	
	<h2> Request 내장 객체의 예제</h2>
	
	프로토콜명 : <%= protocol %> <br>
	접속한 서버명 : <%= server %> <br>
	접속한 서버의 포트번호 : <%= port %> <br>
	클라이언트 IP : <%= clientIp %> <br>
	클라이언트 호스트명 : <%= clientHost %> <br>
	현재페이지의 method : <%= methodType %> <br>
	요청한 현재 페이지의 경로(URL) : <%= url %> <br>
	요청한 현재 페이지의 경로(URI) : <%= uri %> <br>
	웹어플리케이션에서의 컨텍스트 경로 : <%= contextPath %> <br>
	브라우저명 : <%= browser %> <br>
	media명  : <%= mediaType %> <br>
	
	
</body>
</html>