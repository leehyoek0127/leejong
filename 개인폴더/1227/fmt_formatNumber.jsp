<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("utf-8");%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/fmt" %>

<HTML>
  <HEAD><TITLE>숫자 포맷</TITLE></HEAD>
  <BODY>
	첫번째 수: <fmt:fotmatNumber value = "1234500" groupingUsed = "true" /> <br>
	두번째 수: <fmt:fotmatNumber value = "3.14158" pattern = "#.##" /> <br>
	세번째 수: <fmt:fotmatNumber value = "10.5" pattern = "#.00" />
  </BODY>
</HTML>