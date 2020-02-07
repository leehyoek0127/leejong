<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="java.sql.*"%>

<%
  String id = (String)session.getAttribute("id");
  String name = request.getParameter("name");
  String pw = request.getParameter("pw");
  String hp1 = request.getParameter("hp1");
  String hp2 = request.getParameter("hp2");
  String hp3 = request.getParameter("hp3");
  String em1 = request.getParameter("em1");
  String em2 = request.getParameter("em2");
  String gender = request.getParameter("gender");
  String hp = request.getParameter("hp");
  String adr1 = request.getParameter("adr1");
  String adr2 = request.getParameter("adr2");
  String yy = request.getParameter("yy");
  String mm = request.getParameter("mm");
  String dd = request.getParameter("dd");
  String pic = request.getParameter("pic");
  String lv = request.getParameter("lv");
  String team = request.getParameter("team");
  String[] hobbyarr = request.getParameterValues("hobby");
  String hobby="";
  String passwd2 = request.getParameter("passwd2");
  String passwd2ans = request.getParameter("passwd2ans");
  String bank = request.getParameter("bank");
  String accountnumber = request.getParameter("accountnumber");
  String accountholder = request.getParameter("accountholder");

  if(hobbyarr!=null){
	  for(int i=0; i<hobbyarr.length; i++){
		hobby += hobbyarr[i]+" ";
	  }
  }
  
  Connection conn = null;
  Statement stmt = null;
  try {
	  Class.forName("com.mysql.jdbc.Driver");
	  conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/footsal?useSSL=false&useUnicode=true&characterEncoding=utf8","root","0000");
	  if (conn == null)
		  throw new Exception("데이터베이스에 연결할 수 없습니다.<BR>");
	  stmt = conn.createStatement();

	  String command = "update sign set name='"+name+"',hp1='"+hp1+"',hp2='"+hp2+"',hp3='"+hp3+"',em1='"+em1+"',em2='"+em2+"',gender='"+gender+"',hp='"+hp+"',adr1='"+adr1+"',adr2='"+adr2+"',yy='"+yy+"',mm='"+mm+"',dd='"+dd+"',pic='"+pic+"',lv='"+lv+"',team='"+team+"',hobby='"+hobby+"',passwd2='"+passwd2+"',passwd2ans='"+passwd2ans+"',bank='"+bank+"',accountnumber='"+accountnumber+"',accountholder='"+accountholder+"'where id='"+id+"';";
													
	  int rowNum = stmt.executeUpdate(command);
	  if(rowNum < 1){
		  throw new Exception("데이터를 DB에 입력할 수 없습니다.");
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
  RequestDispatcher dispatcher = request.getRequestDispatcher("logincom.jsp");
  dispatcher.forward(request,response);
%>