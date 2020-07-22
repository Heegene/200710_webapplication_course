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
<!-- bean 으로 선언해서 쓰면 bean, dto로 쓰면 dto , 
property를 *로 주면 member에 있는 field 명과 똑같다는 전제 하에 통채로 올라감 
member 안에는 address, id, name, 등 그대로 쓰면 됨 md.insert(member) 하면 dto가 한번에 들어감
-->
<jsp:useBean id="member" class="och12.Member"></jsp:useBean>
<jsp:setProperty property="*" name="member"/>

<%
	MemberDao md = MemberDao.getInstance();
	//singleton 객체
	
	int result = md.insert(member);
	if (result > 0 ) {
		
	%>
	<script type="text/javascript">
		alert('회원가입을 축하합니다.');
		location.href="loginForm.jsp";
	</script>
<% 
	} else { 
%>
	<script type="text/javascript">
		alert('회원가입에 실패하였습니다.');
		location.href="joinForm.jsp";
	</script>	
<%
	}

%>
	
</body>
</html>