<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String result = request.getParameter("RESULT"); %>
<html>
  <head>
	<title>회원가입</title>
  </head>
  <body>
  	<H3>회원 가입 결과 </H3>
	<%
	  
	  if( result.equals("SUCCESS")){
		  out.println("가입되었습니다.");
	  }else {
		  out.println("가입되지 않았습니다.");
	  }
	%>
  </body>
</html>