<%@page import="och12.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="Error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<%
	String id = request.getParameter("id");
	
 %>
<script type="text/javascript">
	function wincl() {
		opener.document.frm.id.value="<%=id%>";
		window.close();
	}

</script>
<body>
<%
	MemberDao md = MemberDao.getInstance();
	int result = md.confirm(id);
	if (result == 0) {
%>
	<%=id %>는 사용할 수 있습니다. <br>
	<input type="button" value="닫기" onclick="wincl()">
<%
	} else {
%> 
	<%=id %> 는 이미 사용중입니다. <br>
	<form>
		아이디: <input type="text" name="id"> <br>
		<input type="submit" value="확인">
	</form>

<%
	}
%>


</body>
</html>