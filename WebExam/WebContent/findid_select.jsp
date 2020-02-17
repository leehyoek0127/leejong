<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("euc-kr");
String name = request.getParameter("name");
String em1 = request.getParameter("em1");
String em2 = request.getParameter("em2");
String result = null;

Connection conn = null;
Statement stmt = null;
try{
  Class.forName("com.mysql.jdbc.Driver");
  conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/footsal", "root", "0000");
   stmt = conn.createStatement();
   
   ResultSet rs = stmt.executeQuery("select * from sign where name='"+name+"' and em1='"+em1+"' and em2='"+em2+"';"); 
   
   if (rs.next()){
	   String id = rs.getString("id");

	   session.setAttribute("id",id);
	   
	   RequestDispatcher dispatcher = request.getRequestDispatcher("findid_success.jsp");
	   dispatcher.forward(request,response);
   }else if(!rs.next()){
	  out.println("<script>alert('입력하신 회원정보가 존재하지 않습니다. 회원가입 페이지로 이동하시겠습니까?'); location.href='sign.jsp';</script>");
   }
}finally {
	try{
		stmt.close();
	}catch (Exception ignored) {
	}
	try {
		conn.close();
	}catch (Exception ignored) {
	}
	}
%>

