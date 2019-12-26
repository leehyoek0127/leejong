<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  request.setCharacterEncoding("utf-8");
  String id = request.getParameter("ID");
  String password = request.getParameter("PASSWORD");
  String name = request.getParameter("NAME");
  session.setAttribute("ID",id);
  session.setAttribute("PASSWORD",password);
  session.setAttribute("NAME",name);
%>
<html>
  <head>
	<title>회원가입</title>
  </head>
  <body>
  	<H3>약관</H3>
	------------------------------------------<br>
	1.회원 정보는....사용됩니다.<br>
	2.웹 사이트의 정상....처리합니다.<br>
	------------------------------------------<br>
	<form action = "sample7.jsp" method = post >
	  위의 약관에 동의하십니까?
	  <input type="radio" name="agree" value="YES">동의함
	  <input type="radio" name="agree" value="NO">동의하지 않음<BR><BR>
	  <input type="submit" value="확인">
	</form>
  </body>
</html>
