<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
	  request.setCharacterEncoding("utf-8");
	  
	String sign = (String) session.getAttribute("sign");
	if(sign!=null){
	  String id = request.getParameter("ID");
	  String password = request.getParameter("PASSWORD");
	  String name = request.getParameter("NAME");
	  session.setAttribute("ID",id);
	  session.setAttribute("PASSWORD",password);
	  session.setAttribute("NAME",name);
		
	}else{
	  out.println("다시 로그인하세요.");
	}
	  
	  
 
%>
<html>
  <head>
	<title>로그인</title>
  </head>
  <body>
  	<H3>로그인</H3>
	<form action = "sign3.jsp" method = post >
	  아이디: <input type="text" name="loginID"> <br>
	  패스워드: <input type="PASSWORD" name = "loginPASSWORD"> <br>
	  <input type="submit" value="로그인">
	</form>
  </body>
</html>

