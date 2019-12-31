<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  




%>
<HTML>
  <HEAD><TITLE>로그인완료</TITLE></HEAD>
  
  <BODY>
    <h3>${id}님 로그인완료 무엇을 하시겠습니까?</h3>
	<A HREF = userUp.jsp?id=${param.id}>회원정보수정</A>
	<A HREF = delete.jsp?id=${param.id}>회원탈퇴</A>
	<A HREF = allPrt.jsp>전체유저정보출력</A>
	<a href="login.html"><input type="button" value="로그아웃" onclick="<script>session.removeall();</script>"></a>
  </BODY>
</HTML>