<%@page import="och12.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="Error.jsp"%>
 <%@ include file="memberCheck.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String passwd = request.getParameter("passwd");
	MemberDao md = MemberDao.getInstance();
	
	int result = md.delete(id, passwd);
	
	if (result == 1 ) {
		session.invalidate();
		System.out.println("DeletePro id -> " + id);
%>
	<script type="text/javascript">
		alert('회원 탈퇴가 완료되었습니다. ');
		location.href="main.jsp";
	</script>
<%
	} if (result == 0) { 
%>		
	<script type="text/javascript">
		alert('비밀번호가 일치하지 않습니다.');
		history.go(-1);
	</script>	
<%
	} else {
%> 	<script type="text/javascript">
		alert('에러가 발생하였습니다.');
		history.go(-1);
	</script>
<% 
	}
%>
	
	
%>
</body>
</html>