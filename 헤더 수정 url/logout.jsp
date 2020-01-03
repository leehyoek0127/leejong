<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
String url = (String)session.getAttribute("url");
 request.setCharacterEncoding("UTF-8");
 
 session.removeAttribute("id");
 session.removeAttribute("pw");
 session.removeAttribute("name");

 
RequestDispatcher dispatcher = request.getRequestDispatcher(url);
dispatcher.forward(request,response);

%>
