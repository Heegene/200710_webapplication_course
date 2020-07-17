<%@page import="java.net.URLDecoder"%>
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
	Cookie cooks[] = request.getCookies();
	if (cooks != null) {
		for (int i = 0; i < cooks.length; i++) { // cookies 탐색
			if (cooks[i].getName().equals("name")) {
				// name중 "name"과 일치하는 것이 있으면 value utf-8로 디코드함
				out.print("쿠키값 : " + URLDecoder.decode(cooks[i].getValue(),"utf-8"));
			}
		}
	}


%>
</body>
</html>