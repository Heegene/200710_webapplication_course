<%@page import="och12.Member"%>
<%@page import="java.util.List"%>
<%@page import="och12.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="Error.jsp" %>
<%@ include file="memberCheck.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	tr:hover {
		background-color: gray;
	}
	td {
		text-align:center;
	}

</style>
</head>
<body bgcolor="emerald">

<%
	MemberDao md = MemberDao.getInstance();
	
	List<Member> list = md.list();
	if (list == null) {
		out.println("회원 정보가 없습니다. ");
	} else {
%>
	<h1> 회원 정보 </h1>
	<table bgcolor="pink" width="100%">
		<tr bgcolor="cyan">
			<th> 아이디 </th>
			<th> 이름 </th>
			<th> 주소 </th>
			<th> 전화번호 </th>
			<th> 가입일 </th>
		</tr>
<%
			for (int i = 0; i < list.size(); i++) {
				out.print("<tr><td>" + list.get(i).getId() +
						  "</td><td>" + list.get(i).getName()+
						  "</td><td>" + list.get(i).getAddress()+
						  "</td><td>" + list.get(i).getTel()+
						  "</td><td>" + list.get(i).getReg_date()+ "</td></tr>");
			}
		
%>
	
	</table>
<%
	}

%>		


</body>
</html>