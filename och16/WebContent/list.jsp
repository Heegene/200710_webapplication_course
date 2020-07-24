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

	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>이메일</th>
			<th>IP</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:if test="${totCnt > 0 }">
			<c:forEach var="board" items="${list }"> 
			<!-- foreach문으로 하나하나 넣어줌 -->
				<tr>
					<td>${startNum }</td> 
					<!-- 시작번호 뿌려줌  -->
					<td class="left" width=200>
					<c:if test="${board.readcount > 20 }">
							<!--  조회수 20 넘으면 hot 스티커 붙임  -->
							<img src='images/hot.gif'>
						</c:if> <c:if test="${board.re_level > 0 }">
						<!--  답글다는거면 re-level 이 생겨나는데 이때 들여쓰기를 위한 이미지 삽입 -->
							<img src='images/level.gif' width="${board.re_level*10 }">
							<!-- 답댓 수준(레벨) *10픽셀만큼 더 들어가게 됨  -->
							<img src="images/re.gif">
						</c:if> <a href="content.do?num=${board.num }&pageNum=${currentPage}">${board.subject }</a>
						<!--  내용 누르면 content.do로 가도록 앵커태그가 들어가있음 -->
					</td>

					<td>${board.writer }</td>
					<td><a href="mailto:${board.email }">${board.email }</a></td>
					<td>${board.ip }</td>
					<td>${board.reg_date }</td>
					<td>${board.readcount }</td>
				</tr>

				<c:set var="startNum" value="${startNum -1 }" />
				<!--  38에서 하나씩 빼주니까 게시글번호에서 하나씩 빼줌  -->
				<!--  만약에 게시글번호가 위에서부터 1,2,3,4,... 이렇게하고싶으면 +1 처리해줘야함 -->
			</c:forEach>

		</c:if>
		<c:if test="${totCnt == 0 }">
			<tr>
				<td colspan=7>데이터가 없습니다.</td>
			</tr>
		</c:if>
	</table>


	Board Table 전체 Row 수: ${totCnt}

	<div style="text-align: center">
		<c:if test="${startPage > blockSize }">
			<a href='list.do?pageNum=${startPage-blockSize}'> [이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<a href='list.do?pageNum=${i}'> [${i }]</a>
		</c:forEach>
		<c:if test="${endPage > pageCnt }">
			<a href='list.do?pageNum=${startPage+blockSize}'> [다음 ]</a>
		</c:if>
	</div>
</body>
</html>

