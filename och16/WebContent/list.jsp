<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="style.css" type="text/css">
<style type="text/css">
table {
	width: 100%;
}
</style>
</head>
<body>
	<h1>게시판</h1>
	<table>
		<tr>
			<td><a href="writeForm.do"> 글쓰기 </a>
		</tr>
	</table>

	Board Table 전체 Row 수: ${totCnt}

	<div style="text-align: center">
		<c:if test="${startPage > blockSize }">
			<a href='list.do?pageNum=${startPage-blockSize}'> [이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<a href='list.do?prageNum=${i}'> [${i }]</a>
		</c:forEach>
		<c:if test="${endPage > pageCnt }">
			<a href='list.do?pageNum=${startPage+blockSize}'> [다음 ]</a>
		</c:if>
	</div>
</body>
</html>

<!-- 
<h1>게시글 조회</h1>

<table border="1">

<tr>

<th>번호</th>

<td>${idx}</td>

<th>작성자</th>

<td>${writer}</td>

<th>날짜</th>

<td>${regdate}</td>

<th>조회수</th>

<td>${count}</td>

</tr>

<tr>

<th colspan="2">제목</th>

<td colspan="6">${title}</td>

</tr>

<tr>

<th colspan="2">내용</th>

<td colspan="6">${content}</td>

</tr>

</table>

<a href="delete.jsp?idx=${idx}">게시글삭제</a>

<a href="index.jsp">목록으로</a> 

 -->