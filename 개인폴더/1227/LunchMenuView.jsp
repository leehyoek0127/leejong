<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("utf-8");%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<HTML>
  <HEAD><TITLE>구내 식당</TITLE></HEAD>
  <BODY>
    <h3>오늘의 점심 메뉴입니다.</h3>
	<ul>
	  <c:forEach var="dish" items = "${MENU}">
	    <li>${dish}</li>
	  </c:forEach>
	</ul>
  </BODY>
</HTML>