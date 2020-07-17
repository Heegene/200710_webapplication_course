<%@page import="util.MemberDto"%>
<%@page import="util.MemberDao"%>
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
	String chk = "";
	String agree = request.getParameter("agree");
	if (agree.equals("y")) {
		// agree 에 y / n 값을 받아왔으므로 yes 일때만 저장하도록 함 
		String id = (String)session.getAttribute("id");
		String password = (String)session.getAttribute("password");
		String name = (String)session.getAttribute("name");
		// session 값을 받아서 
		
		MemberDao md = new MemberDao();
		MemberDto member = new MemberDto();
		
		member.setId(id); // dto에 setter를 이용해서 아이디, 이름, 비밀번호를 넣음
		member.setName(name);
		member.setPassword(password);
		
		int result = md.insert(member); // 넣을때는 member 하나만 넣음 
		
		if(result > 0) {
			chk = "success";
		} else {
			chk = "fail";
		}
		session.invalidate(); // session연결이 끊어짐 
		out.print("invalidate 적용 후에도" + session.getId()+"<br>"); // 몇초 후에 끊어지는거라 바로 보면 getId 될수도있음
		response.sendRedirect("result.jsp?chk="+chk); //페이지 이동하는데 paramater의 chk값 넣고 이동 
		
		
	}

%>
</body>
</html>