<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% session.setAttribute("sign","1");%>
<html>
  <head>
  	<meta http-equiv="Content-Type" content = "text/html; charset=utf-8">
	<title>회원가입</title>
  </head>
  <body>
  	개인 정보를 입력하십시오.
	<form action = "sign2.jsp" method = post >
	  아이디: <input type="text" name="ID"> <br>
	  패스워드: <input type="PASSWORD" name = "PASSWORD"> <br>
	  이름: <input type="text" name= "NAME"><br>
	  <input type="submit" name="submit" value="확인">
	</form>
  </body>
</html>