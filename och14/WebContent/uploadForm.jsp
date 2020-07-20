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
	String context = request.getContextPath();
	System.out.print("contextpath -> " + context);
%>
	<h1> 파일 업로드 </h1>
	<form action="upload.jsp" method="post" enctype="multipart/form-data">
		<label for="name"> 작성자 </label> :
		<input type="text" name="name" id="name" required="required"> <br>
		&nbsp;&nbsp;제목 : <input type="text" name="title" id="name" required="required"> <br>
		파일명 : <input type="file" name="uploadFile" id="name" required="required"> <br>
		<input type="submit" value="확인">
	
	<img src="<%=context%>/fileSave/kkk.jpg">
	
	</form>
</body>
</html>