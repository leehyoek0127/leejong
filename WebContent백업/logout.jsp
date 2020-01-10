<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String url = (String)session.getAttribute("url");
 request.setCharacterEncoding("UTF-8");
 
 session.removeAttribute("id");
 session.removeAttribute("pw");
 session.removeAttribute("name");
 session.removeAttribute("em1");
 session.removeAttribute("em2");
 session.removeAttribute("hp1");
 session.removeAttribute("hp2");
 session.removeAttribute("hp3");

if(url.equals("/futsal0106/logincom.jsp")){
	 response.sendRedirect("gal.jsp");
}
 else{
	RequestDispatcher dispatcher = request.getRequestDispatcher(url);
	dispatcher.forward(request,response);
 }
%>
