<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  String result = request.getParameter("RESULT");
  
  
%>
<% session.setAttribute("sign",null);%>
<html>
  <head>
	<title>로그인</title>
  </head>
  <body>
  	<H3>로그인 결과 </H3>
	<%
	  
	  if( result.equals("SUCCESS")){
		  out.println("로그인완료.");
		  session.setAttribute("sign","1");
		  %><a href="sign2.jsp">로그아웃</a><%
	  }else {
		  out.println("로그인실패");
		  %><a href="sign2.jsp">다시로그인하기</a><%
		  //response.sendRedirect("sign2.jsp");
		  
		  
	  }
	%>
  </body>
</html>