<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<HTML>
  <HEAD><TITLE>로그인예제</TITLE></HEAD>
  <BODY>
	<h2>로그인예제</h2>
	<%
	  request.setCharacterEncoding("utf-8");
	  String userid = request.getParameter("userid");
	  String passwd = request.getParameter("passwd");
	%>
	<%
	if( userid.equals("")) {
	%>
		<jsp:include page="loginhandle.jsp">
		<jsp:param name = "userid" value="guest" />
		<jsp:param name = "passwd" value="anonymous" />
		</jsp:include>
	<%
	} else {
	%>
		<jsp:include page="loginhandle.jsp" />
	<%
	}
	%>
  </BODY>
</HTML>