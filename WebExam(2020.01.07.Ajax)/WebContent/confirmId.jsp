<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
  String id = request.getParameter("id");
  String check = null;
  
  Connection conn = null;
  Statement stmt = null;
  try {
	  Class.forName("com.mysql.jdbc.Driver");
	  conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/footsal","root","159357");
	  if (conn == null)
		  throw new Exception("데이터베이스에 연결할 수 없습니다.<BR>");
	  stmt = conn.createStatement();
	  ResultSet rs = stmt.executeQuery("select * from sign "+
									"where id = '" + id +"';");
	  if(rs.next()){ 
		  
%>
<center>
	<br />
	<br />
	<h4>이미 사용중인 아이디입니다.</h4>
	<% check = "0";%>
	<input type="button" value="닫기" onClick="setid()">

</center>
<%
	  }else {
%>
<center>
	<br />
	<br />
	<h4>
		입력하신
		<%=id%>는 사용하실 수 있는 ID입니다.
	</h4>
	<% check = "1";%>
	<input type="button" value="닫기" onClick="setid()">
</center>
<%
	  }
		  
  }finally {
	  try {
		  stmt.close();
	  } catch (Exception ignored) {
	  }
	  try {
		  conn.close();
	  }catch (Exception ignored) {
	  }
  }
  

%>
<script language="javascript">
	function setid() {
		opener.document.join.hidden.value="<%=check%>";
		self.close();
	}
</script>
