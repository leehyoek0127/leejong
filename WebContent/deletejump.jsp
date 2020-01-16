<%@page import="Qna.QnaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="Qna.QnaDao"/>
<%
	String qSecretNum_input = request.getParameter("qSecretNum_input");
	String qSecretNum = (String)session.getAttribute("qSecretNum");
	String qNo = (String)session.getAttribute("qNo");
	
	if(qSecretNum.equals(qSecretNum_input)){
		dao.delete(qNo, qSecretNum_input);
		response.sendRedirect("qna.jsp");
	}else{
		response.sendRedirect("qnapop.jsp");
	}
%>