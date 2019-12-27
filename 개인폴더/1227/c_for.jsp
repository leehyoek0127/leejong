<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("utf-8");%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<HTML>
  <HEAD><TITLE>메아리</TITLE></HEAD>
  <BODY>
	<c:forEach var="cnt" begin="1" end="5">
	  <FONT size=${cnt} > 야~호~ </FONT> <BR>
	</c:forEach>
  </BODY>
</HTML>