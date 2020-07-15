<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head><body>
<%-- <jsp:useBean id="pt" class="ch08.Product" scope="request"></jsp:useBean> --%>
<%-- <jsp:useBean id="pt" class="ch08.Book" scope="request"></jsp:useBean> --%>
<jsp:useBean id="pt" class="och08.Product" scope="request"></jsp:useBean>
<h2>제품정보</h2>
코드 : <jsp:getProperty property="code" name="pt"/><p>
이름 : <jsp:getProperty property="name" name="pt"/><p>
가격 : <jsp:getProperty property="price" name="pt"/><p>
</body>
</html>