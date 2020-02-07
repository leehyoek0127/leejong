<%@page import="model.QnaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="mybatis.QnaDao"/>
<%
	String qTitle_up = request.getParameter("qTitle_up");
	String qMember_up = request.getParameter("qMember_up");
	String qContents_up = request.getParameter("qContents_up");
	String qNo = (String)session.getAttribute("qNo");
	
	
		int updatech= dao.update(qNo, qTitle_up, qMember_up,qContents_up);
		
		if(updatech==1){
		response.sendRedirect("qna.jsp");
		}else{
		response.sendRedirect("qna.jsp");
		}
%>