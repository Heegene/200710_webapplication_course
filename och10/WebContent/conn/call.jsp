<%@page import="java.sql.Types"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="../DBError.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%	
	Context ctx = new InitialContext();
	DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
	Connection conn = ds.getConnection();
	String sql = "{call Emp_info3(?, ?)}";
	// call 사용하면 callablestatement를 사용해야함 
	CallableStatement cs = conn.prepareCall(sql);
	// preparedstatement처럼 in, out에 지정해줌
	cs.registerOutParameter(2, Types.DOUBLE); // out type 지정(받을값 double)
	cs.setInt(1, 7369); // 변수 잡아줌 
	cs.execute();
	
	out.print("급여 : " + cs.getDouble(2) + "<br>");
	cs.close();
	conn.close();
	
	
	

%>

</body>
</html>