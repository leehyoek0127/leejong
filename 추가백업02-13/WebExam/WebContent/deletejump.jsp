<%@page import="vo.QnaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="dao.QnaDao"/>
<%
	String pwd = request.getParameter("pwd");
	String qSecretNum = (String)session.getAttribute("qSecretNum");
	String qNo = Integer.toString((int)session.getAttribute("qNo"));
	
	if(qSecretNum.equals(pwd)){
		dao.delete(qNo, pwd);
		out.println("삭제가 완료되었습니다.");
		
		
		
	}else{
		out.println("비밀번호가 일치하지 않습니다.");
	}
%>