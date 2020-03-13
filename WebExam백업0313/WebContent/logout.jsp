<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String url = (String) session.getAttribute("url");
	request.setCharacterEncoding("UTF-8");
	session.removeAttribute("url");
	session.removeAttribute("id");
	session.removeAttribute("pw");
	session.removeAttribute("name");
	session.removeAttribute("email");
	session.removeAttribute("tel");

	if (url.equals("/logincom.jsp")) {
		response.sendRedirect("qna.jsp");
	} else if (url.equals("/signdel.jsp")) {
		response.sendRedirect("qna.jsp");
	} else {
		response.sendRedirect(request.getHeader("referer"));
	}
%>
