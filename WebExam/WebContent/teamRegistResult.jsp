<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%int playerregistresult3 = (int)request.getAttribute("playerregistresult3"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%if(playerregistresult3==2){ %>
<div>입력성공</div>
<%}else {%>
<div>입력실패</div>
<%} %>
</body>
</html>