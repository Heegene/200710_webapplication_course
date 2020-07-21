<%@page import="och12.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="Error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	MemberDao md = MemberDao.getInstance();
	// singleton 이므로 getInstance 
	
	
	int result = md.confirm(id, passwd);
	
	if (result == 1) {
		session.setAttribute("id", id); // 페이지 이동하면서 parameter 담아야하므로 session 사용
		response.sendRedirect("main.jsp");
		
	} else if (result == 0 ) {
		
%>
	<script type="text/javascript">
		alert('암호가 일치하지 않습니다.');
		history.go(-1); // loginform으로 다시 돌려보냄 
	</script>

<%
    }  else {
%>	<script type="text/javascript">
	alert('일치하는 아이디가 없습니다.');
	history.go(-1);
	</script>
<%
    }
%>
</body>
</html>