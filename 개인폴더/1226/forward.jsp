<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<HTML>
  <HEAD><TITLE>JSP예제:forward.jsp</TITLE></HEAD>
  <BODY>
	<%
	//pageContext.forward("send.jsp");
	%>
	<jsp:forward page="send.jsp" />
  </BODY>
</HTML>