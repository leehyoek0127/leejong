<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
request.setCharacterEncoding("euc-kr");
String id = request.getParameter("id");
String em1 = request.getParameter("em1");
String em2 = request.getParameter("em2");
String passwd2 = request.getParameter("passwd2");
String passwd2ans = request.getParameter("passwd2ans");
String result = null;

Connection conn = null;
Statement stmt = null;
try{
  Class.forName("com.mysql.jdbc.Driver");
  conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/footsal", "root", "0000");
   stmt = conn.createStatement();
   ResultSet rs = stmt.executeQuery("select * from sign where id='"+id+"' and em1='"+em1+"' and em2='"+em2+"' and passwd2='"+passwd2+"' and passwd2ans='"+passwd2ans+"';"); 

   if (rs.next()){
	   String pw = rs.getString("pw");

	   session.setAttribute("pw",pw);
	   
	   RequestDispatcher dispatcher = request.getRequestDispatcher("findpass_success.jsp");
	   dispatcher.forward(request,response);
   }else if(!rs.next()){
	  out.println("<script>alert('입력하신 회원정보가 존재하지 않습니다.'); location.href='findpass.jsp';</script>");
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

