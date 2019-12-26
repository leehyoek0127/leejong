<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<HTML>
  <HEAD><TITLE>JSP예제:send.jsp</TITLE></HEAD>
  <BODY>
	<% response.sendRedirect("http://" + request.getParameter("url")); %>
  </BODY>
</HTML>