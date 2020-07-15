<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head>
<body>
<jsp:useBean id="emp" class="och08.Emp" scope="request"></jsp:useBean>
<h2>직원정보</h2>
사번 : <jsp:getProperty property="empno" name="emp"/><p>
이름 : <jsp:getProperty property="ename" name="emp"/><p>
업무 : <jsp:getProperty property="job" name="emp"/><p>
급여 : <jsp:getProperty property="sal" name="emp"/><p>
입사일 : <jsp:getProperty property="hiredate" name="emp"/><p>

</body>
</html>