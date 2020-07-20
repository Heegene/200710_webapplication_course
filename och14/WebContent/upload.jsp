<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	request.setCharacterEncoding("utf-8");
	int maxSize = 5 * 1024 * 1024; // 1k * 1k 해서 1mb 인데 *5니까 5mb 까지 업로드 가능하다는뜻
	// 파일업로드시 항상 맥스사이즈를 걸어둬야함 안그러면 공격의 대상이 됨(테라단위로 올리거나 해서 서버 내리기)
	String fileSave = "/fileSave";
	String realPath = getServletContext().getRealPath(fileSave);
	// context의 getrealpath 까지만하면 och 14까지만 나타나는데 뒤에 fileSave를 그 밑에 넣어줘서
	// fileSave까지 나타나게된거 
	
	
	System.out.println("realPath -> " + realPath);
	
	MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
	
	
	Enumeration en = multi.getFileNames();
	// 여러개의 파일도 업로드할 수 있음 
	
	while (en.hasMoreElements()) {
		// input 태그의 속성이 file인 태그의 name 속성값 : 파라미터 이름
		String filename1 = (String)en.nextElement();
		// 서버에 저장된 파일 이름
		String filename = multi.getFilesystemName(filename1);
		// 전송 전 원래 이름
		String original = multi.getOriginalFileName(filename1);
		
		// 전송된 파일의 내용 타입
		String type = multi.getContentType(filename1);
		
		// 전송된 파일속성이 file인 태그의 name 속성값을 이용해 파일 객체 생성
		File file = multi.getFile(filename1);
		
		out.print("realPath -> " + realPath + "<br>");
	
		out.print("파라미터 이름  " + filename1 + "<br>");
		out.print("실제 파일 이름 -> " + original + "<br>");
		out.print("저장된 파일명 -> " + filename + "<br>");
		out.print("파일타입 -> " + type + "<br>");
		
		if (file != null) {
			out.print("크기  : " + file.length() + "<br>");
		}
		
	}
		String name = multi.getParameter("name");
		// request로 가져오면 안되고 multi.getparamater로 가져와야함 
		// multi로 받은건 multi로 받아오기 
		String title = multi.getParameter("title");
		
		

%>

작성자 : <%=name %> <br>
제목 : <%=title %> <br>
</body>
</html>