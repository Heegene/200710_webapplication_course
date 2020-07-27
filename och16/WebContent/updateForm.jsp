<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 수정</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<form action="updatePro.do" method="post">
	<!--  입력받을 필요 없는 것들을 보여주기만 하기 위해 hidden 으로 걸어줌 -->
	<input type="hidden" name="num" value="${board.num }">
	<input type="hidden" name="pageNum" value="${pageNnum }">
	<table border="1">
		<caption> <h1> 게시판 수정 </h1></caption>
		<tr>
			<td> 번호 </td>
			<td> ${board.num } </td>
		</tr>
		
		<tr>
			<td> 제목 </td>
			<td> <input type="text" name="subject" required="required" value="${board.subject}"> </td>
		</tr>
		
		<tr>
			<td> 작성자 </td>
			<td> <input type="text" name="writer" required="required" value="${board.writer}"> </td>
		</tr>
		
		<tr>
			<td> 이메일 </td>
			<td> <input type="email" name="email" required="required" value="${board.email}"> </td>
		</tr>
		
		<tr>
			<td> 암호 </td>
			<td> <input type="password" name="passwd" required="required" value="${board.passwd}"> </td>
		</tr>
		
		<tr>
			<td> 내용 </td>
			<td> <pre> <textarea rows="10" cols="40" name="content" required="required"> ${board.content }</textarea>
			</pre> </td> 
		</tr>
		
		<tr> 
			<td colspan="2"> <input type="submit" value="수정 완료">
		</tr>
		
	</table>
</form>
	
</body>
</html>