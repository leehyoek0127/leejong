<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("utf-8");%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<HTML>
  <HEAD><TITLE>cset과 cremove</TITLE></HEAD>
  <BODY>
	<c:set var="str" value="Hello set Tag!!!" scope="session" />
	\${str} = ${str} <br>
	\${sessionScope.str} = ${sessionScope.str} <br>
	
	<c:remove var="str" scope="page" />
	\${str} = ${str} <br>

	<c:remove var="str" scope="session" />
	\${str} = ${str} <br>

	<c:set var="app" value="응용프로그램변수" scope = "application"/>
	\${app} = ${app} <br>
	<c:remove var="app" />
	\${app} = ${app}
  </BODY>
</HTML>