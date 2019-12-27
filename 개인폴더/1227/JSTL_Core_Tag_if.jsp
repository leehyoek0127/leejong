<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("utf-8");%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<HTML>
  <HEAD><TITLE>JSTL Core Tag: if</TITLE></HEAD>
  <BODY>
	<h2>JSTL Core Tag: if</h2>

	안녕하세요.
	<c:set var="today" value="<%= new java.util.Date() %>" />
	<c:if test = "${today.hours > 17}" var = "bool" >
	저녁 식사는 하셨는지요?<br>
	</c:if>
	<p>
	<hr>
	\${today.hours} = ${today.hours} <br>
	\${bool} = ${bool}
  </BODY>
</HTML>