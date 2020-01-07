<%@page import="java.util.HashMap"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>
		<%
			String number = request.getParameter("ab");
			String id = request.getParameter("cd");
			String comment = request.getParameter("ef");

			HashMap<String, String> map = new HashMap<String, String>();
			map.put("number", number);
			map.put("id", id);
			map.put("comment", comment);
			
			out.print("ddd");
		%>
		글번호:<%=map.get("number")%>
		아이디:<%=map.get("id")%>
		내용:<%=map.get("comment")%>
	</p>
</body>
</html>