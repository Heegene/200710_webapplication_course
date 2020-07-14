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
	    // 자바스크립트를 이용한 예외처리>
		try {
			int num1 = Integer.parseInt(request.getParameter("num1"));
			int num2 = Integer.parseInt(request.getParameter("num2"));
			out.print(num1 + " / " + num2 + " = " + (num1/num2) + "<br>"); 
			// 에러 발생시킬거니까 굳이 다른연산 넣을필요없이 나누기만 넣음(arithmeticexception)
		
		} catch (NumberFormatException e) { %> 
			<script type="text/javascript">
				alert("숫자가 아닙니다.");
				history.go(-1);
			</script>
		<%
		}
		 catch (ArithmeticException e) { %>
		  <script type="text/javascript">
				alert("arithmeticexception");
				history.back();
			</script>
		<%	
		} catch (Exception e) {%>
			<script type="text/javascript">
				alert("기타 예외 발생");
				location.href="num2.html";
			</script>
		<%
		}
	
	%>
	
	


</body>
</html>