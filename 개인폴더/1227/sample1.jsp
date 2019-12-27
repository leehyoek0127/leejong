<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("utf-8");%>


<HTML>
  <HEAD><TITLE></TITLE></HEAD>
  <BODY>
    <h2></h2>
	<jsp:useBean id="list" class="java.util.ArrayList" type="javabean.StudentBean" />
	<jsp:useBean id="user" class="javabean.CreateStudent">
			  <jsp:getProperty name="user" property = "Student" />
	  ${list}=<jsp:getProperty name="user" property = "arr" />
	  
	</jsp:useBean>

	
  </BODY>
</HTML>