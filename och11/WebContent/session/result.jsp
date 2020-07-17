<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% // ? 뒤에 parameter 값 넣으면 form 문으로 받아서 넣어주는것과 같으므로 아래와 같이 표현
		
	String chk = request.getParameter("chk"); // y 또는 n으로 나올것
	
	try {
		if (chk.equals("success")) {
			out.print("회원가입을 축하합니다.");
		} 
	}
	catch (Exception e) {
		out.print("회원가입에 실패했습니다.");
			e.printStackTrace();
		
	}
	
	
%>
</body>
</html>