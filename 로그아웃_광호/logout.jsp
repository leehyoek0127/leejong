<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
 request.setCharacterEncoding("UTF-8");
 
 session.removeAttribute("id");
 session.removeAttribute("pw");
 session.removeAttribute("name");

 response.sendRedirect("sign.jsp");

%>
