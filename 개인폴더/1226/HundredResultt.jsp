<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("utf-8");%>
<HTML>
  
  <BODY>
	1부터 100까지 더한 결과는? ${RESULT}
	<!-- 1부터 100까지 더한 결과는? <%= request.getAttribute("RESULT") %> -->
  </BODY>
</HTML>