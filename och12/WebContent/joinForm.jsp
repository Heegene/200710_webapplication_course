<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function chk() {
		if(frm.passwd.value != frm.passwd2.value) {
			alert('입력한 두 비밀번호가 일치하지 않습니다.');
			frm.passwd.focus();
			return false;
		}
		return true;
	}
	
	function winop() {
		if (!frm.id.value) {
			alert('아이디를 입력하세요.');
			frm.id.focus();
			return false;
		}
		window.open("confirmId.jsp?id=" + frm.id.value, "",
					 "width=300 height=300");
		/* window.open(url, name, space, replace) */
		
	}
</script>
<style type="text/css">
	table {
		background-color:salmon;
	}

</style>
</head>
<body>


<h2> 회원가입 </h2>
	<form action="joinPro.jsp" name="frm" onsubmit="return chk()">
	<table border="1">
		<tr>
			<td> 아이디 </td>
			<td> <input type="text" name="id" required="required"> 
			<input type="button" value="중복체크" onclick="winop()"> </td>
		</tr>
		
		<tr>
			<td> 비밀번호 </td>
			<td> <input type="password" name="passwd" required="required"> </td>
		</tr>	
		
			<tr>
			<td> 비밀번호 확인 </td>
			<td> <input type="password" name="passwd2" required="required"> </td>
		</tr>	
		
		<tr>
			<td> 이름 </td>
			<td> <input type="text" name="name" required="required"> </td>
		</tr>
		
		<tr>
			<td> 주소 </td>
			<td> <input type="text" name="address" required="required"> </td>
		</tr>
		
		<tr>
			<td> 전화번호 </td>
			<td> <input type="tel" name="tel" required="required" placeholder="xxx-xxxx-xxxx"
				  pattern="\d{2,3}-\d{3,4}-\d{4}" 
				  title="2,3자리-3,4자리-4자리"
				  > </td>
				  <!-- 정규표현식으로 pattern 지정 -->
		</tr>
		
		
		
		<tr>
			<td> <input type="submit" value="확인"> </td>
			<td> <input type="reset" value="취소"> </td>
		</tr>
	
	</table>
	</form>
	
</body>
</html>