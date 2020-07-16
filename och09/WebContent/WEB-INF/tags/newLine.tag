<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ tag body-content="empty" %>
<%@ attribute name="color" required="true"%>
<%@ attribute name="size" type="java.lang.Integer" required="true"%>
<font color="${color}">
	<% 
		for (int i=0; i < size; i++) {
			out.print("-");
		}
	%>


 </font>
