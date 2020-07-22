<%@page import="och12.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="memberCheck.jsp"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:useBean id="member" class="och12.Member" ></jsp:useBean>
<jsp:setProperty property="*" name="member"/>
<!--  이렇게 빈을 사용하면 dto 사용하는것과 같은 효과 -->

</head>
<body>

<%
	MemberDao md = MemberDao.getInstance();
	int result = md.update(member);
	if(result > 0) {
		
%>
	<script type="text/javascript">
		alert('사용자 정보 수정이 완료되었습니다.');
		location.href="main.jsp";
	</script>
<%
	} else { 
%>
	<script type="text/javascript">
		alert('사용자 정보 수정에 실패했습니다.');
		history.back();
	</script>
<%
	}
%>



</body>
</html>