<%@page import="oAjax.MemberDao"%>
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
	MemberDao md = MemberDao.getInstance();
	
	int result = md.confirm(id);
	if (result == 0) {
		out.print("사용할 수 있는 ID 입니다.");
	} else {
		out.print("이미 사용중인 아이디입니다.");
	}
%>
</body>
</html>