<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head>
<body>
<%-- <% 
String hiredate = request.getParameter("hiredate"); 
%>
입사일1:<%=hiredate%>
입사일2: ${param.hiredate } 
 --%>
  <jsp:useBean id="emp" class="och08.Emp" scope="request"></jsp:useBean>
<%-- <jsp:setProperty property="*" name="emp"/> --%>
<jsp:setProperty property="empno"     name="emp"/>
<jsp:setProperty property="ename"     name="emp"/>
<jsp:setProperty property="job"       name="emp"/>
<jsp:setProperty property="sal"       name="emp"/>
 <jsp:setProperty property="hiredate" name="emp"/>
<jsp:forward page="empresult.jsp"></jsp:forward>


</body>
</html>