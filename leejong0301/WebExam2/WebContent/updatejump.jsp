<%@page import="vo.QnaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="dao.QnaDao"/>
<%
	String qTitle_up = request.getParameter("qTitle");
	
	String qContents_up = request.getParameter("qContents");
	String pwd = request.getParameter("pwd");
	String qSecretNum = (String)session.getAttribute("qSecretNum");
	String qNo = Integer.toString((int)session.getAttribute("qNo"));
	int updatech;
	out.println("제목"+qTitle_up+"내용"+qContents_up+"글번호"+qNo+"비번"+pwd+"실제비번"+qSecretNum);
		
		if(qSecretNum.equals(pwd)){
			updatech= dao.update(qNo, qTitle_up,qContents_up);
			out.println("수정이 완료되었습니다.");
		}else{
			out.println("비밀번호가 일치하지 않습니다.");
		}
%>