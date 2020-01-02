<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<HTML>
  <HEAD><TITLE>로그인완료</TITLE></HEAD>
  <BODY>
    <h3>${id}님 로그인완료 무엇을 하시겠습니까?</h3>
	<A HREF = userUp.jsp>회원정보수정</A>
	<A HREF = delete.jsp>회원탈퇴</A>
	<A HREF = allPrt.jsp>전체유저정보출력</A>
	<input type="button" value="로그아웃" onclick="logout();">
  </BODY>
</HTML>
<script>
	function logout() {
		var con = confirm("접속을 종료하시겠습니까");
		if(con==true) {
			location.href="logout.jsp";
		}
	}
</script>