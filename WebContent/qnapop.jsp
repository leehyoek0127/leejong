<%@page import="qnaPack.QnaDto"%>
<%@page import="qnaPack.QnaDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	QnaDto one = (QnaDto)request.getAttribute("one");
	String title = one.getqTitle();
	String name = one.getqMember();
	String text = one.getqContents();
	
	
	
	
	
	%>
	제목 : <%=title %>
	이름 : <%=name %>
	내용 : <%=text %>
</body>
</html>