<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head>
<body>
<%	
	// request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String[] song = request.getParameterValues("song");
	String songs = "";
	if (song != null) {
		for (int i = 0 ; i < song.length; i++) {
			songs += song[i] + " ";
		}
	}
%>
<%=name %>님이 좋아하는 음악은 <%=songs %>이군요
</body>
</html>









