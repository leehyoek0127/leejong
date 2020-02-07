<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String url = (String)session.getAttribute("url");
 request.setCharacterEncoding("UTF-8");
 session.removeAttribute("url"); 
 session.removeAttribute("id");
 session.removeAttribute("pw");
 session.removeAttribute("name");
 session.removeAttribute("em1");
 session.removeAttribute("em2");
 session.removeAttribute("hp1");
 session.removeAttribute("hp2");
 session.removeAttribute("hp3");

if(url.equals("/logincom.jsp")){
	 response.sendRedirect("qna.jsp");
}
 else{
	 response.sendRedirect(request.getHeader("referer"));
 }
%>
