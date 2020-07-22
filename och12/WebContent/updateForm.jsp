<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="och12.*" errorPage="Error.jsp" %>
<%@ include file="memberCheck.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {
		background-color: gray;	
	}
</style>
</head>
<body>
<%
	MemberDao md = MemberDao.getInstance();
	Member member = md.select(id);
	// include file의 membercheck 가 session에 id를 넣어주기때문에
	// id를 session 값으로 가지고다닐 수 있는 것 
%>

<h1> 회원정보 수정</h1>

<form action="updatePro.jsp">
	<table border="1">
		<tr>
			<td> 아이디 </td>
			<!--  데이터로는 보여줘야하지만 이걸 수정하면 안되는 pk역할을 하므로 hidden attribute를 사용  -->
			<td><%=id %> <input type="hidden" name="id" value="<%=member.getId()%>"> </td>
		</tr>
		<tr>
			<td> 비밀번호 </td>
			<td><input type="password" name="passwd" required="required"> </td>
		</tr>
		<tr>
			<td> 이름 </td>
			<td><input type="text" name="name" required="required" value="<%=member.getName()%>"> </td>
		</tr>
		<tr>
			<td> 주소 </td>
			<td><input type="text" name="address" required="required" value="<%=member.getAddress()%>"> </td>
		</tr>
		<tr>
			<td> 전화번호 </td>
			<td><input type="tel" name="tel" required="required" pattern="\d{2,3}-\d{3,4}-\d{4}" value="<%=member.getTel()%>"> </td>
		</tr>
		<tr>
			<td> 날짜 </td>
			<td> <%=member.getReg_date() %> </td>
		</tr>
		<tr>
			<td> <input type="submit" value="확인"> </td>
			<td> <input type="reset" value="취소"> </td>
		</tr>
		
	</table>
</form>


</body>
</html>