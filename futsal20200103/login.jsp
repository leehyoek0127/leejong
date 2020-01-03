<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
  String id = request.getParameter("username");
  String pw = request.getParameter("password");
  String url = (String)session.getAttribute("url");
  Connection conn = null;
  Statement stmt = null;
  try {
	  Class.forName("com.mysql.jdbc.Driver");
	  conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/footsal","root","0000");
	  if (conn == null)
		  throw new Exception("데이터베이스에 연결할 수 없습니다.<BR>");
	  stmt = conn.createStatement();
	  ResultSet rs = stmt.executeQuery("select * from sign "+
									"where id = '" + id + "' and pw = '"+pw+"';");
	  if(rs.next()){
		  
		  String name = rs.getString("name");
		  session.setAttribute("id",id);
		  session.setAttribute("pw",pw);
		  //수정부분 01-02 
		  RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		  dispatcher.forward(request,response);
			//수정부분 끝
	  }else {
		out.println("<script>alert('아이디나 비밀번호가 틀렸습니다'); location.href='sign.jsp';</script>");
		
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