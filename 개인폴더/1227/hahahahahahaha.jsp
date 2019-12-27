<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="javabean.StudentBean" %>


<HTML>
  <HEAD><TITLE></TITLE></HEAD>
  <style>
  table {
  border:solid 1px;
  
  border-collapse: collapse;
  }
  td {
  border:solid 1px;
  
  
  }
  </style>
  <BODY>
  	<%request.setCharacterEncoding("utf-8");%>
	<jsp:useBean id = "list" class = "javabean.CreateStudent2"/>
	  <%
		ArrayList<StudentBean> jsplist=list.studentArr();
	  
	  %>
		<table>
	  <%
		
		for(int i=0; i<jsplist.size(); i++) {
			
			String id=jsplist.get(i).getId();
			String name=jsplist.get(i).getName();
			String snum=jsplist.get(i).getSnum();
			int year=jsplist.get(i).getYear();
			String pass=jsplist.get(i).getPass();
			String email=jsplist.get(i).getEmail();

	  %>
			<tr>
			<td><%=id%></td>
			<td><%=name%></td>
			<td><%=snum%></td>
			<td><%=list.birth(year)%></td>
			<td><%=pass%></td>
			<td><%=email%></td>
			</tr>

	  <%
		}
		
		
		
	  %>
	  
		
	  </table>


  </BODY>
</HTML>