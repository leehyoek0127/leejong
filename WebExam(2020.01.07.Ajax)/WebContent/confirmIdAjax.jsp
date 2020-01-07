
<%@ page import="java.sql.*"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>중복검사</title>
</head>
<body>
	<p>
		<%
		  Connection conn = null;
		  Statement stmt = null;
		  String id = request.getParameter("id");
		  HashMap<String, String> map = new HashMap<String, String>();
		  try {
			  Class.forName("com.mysql.jdbc.Driver");
			  conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/footsal","root","159357");
			  if (conn == null)
				  throw new Exception("데이터베이스에 연결할 수 없습니다.<BR>");
			  stmt = conn.createStatement();
			  ResultSet rs = stmt.executeQuery("select * from sign "+
											"where id = '" + id +"';");
			  if(rs.next()){ 	
				  map.put("id", id);
				  out.println("ID "+map.get("id")+"는(은) 이미 사용중인 ID입니다");
			  }
			else{
				map.put("id", id);
				out.println("ID "+map.get("id")+"는(은) 사용할 수 있는  ID입니다");
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
	</p>
</body>
</html>
