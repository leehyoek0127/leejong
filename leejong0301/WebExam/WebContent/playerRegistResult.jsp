<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%int playerregistresult1 = (int)request.getAttribute("playerregistresult1"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%if(playerregistresult1==1){ %>
<div>�Է¼���</div>
<%}else {%>
<div>�Է½���</div>
<%} %>
</body>
</html>