<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
  String yMember = request.getParameter("yMember");
  String yBranch = request.getParameter("yBranch");
  String yGround = request.getParameter("yGround");
  String yTel1 = request.getParameter("yTel1");
  String yTel2 = request.getParameter("yTel2");
  String yTel3 = request.getParameter("yTel3");
  String yMatchdate = request.getParameter("yMatchdate");
  String yTime = request.getParameter("yTime");
  String yApply = request.getParameter("yApply");
  String yTeam = request.getParameter("yTeam");
  String yContents = request.getParameter("yContents");

  Connection conn = null;
  Statement stmt = null;
  try {
	  Class.forName("com.mysql.jdbc.Driver");
	  conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/footsal","root","0000");
	  if (conn == null)
		  throw new Exception("데이터베이스에 연결할 수 없습니다.<BR>");
	  stmt = conn.createStatement();

	  String command = String.format("insert into applyyong "+
								"(yMember, yBranch, yGround, yTel1, yTel2, yTel3, yMatchdate, yTime, yApply, yTeam, yContents) values ('"+yMember+"','"+yBranch+"','"+yGround+"','"+yTel1+"','"+yTel2+"','"+yTel3+"','"+yMatchdate+"','"+yTime+"','"+yApply+"','"+yTeam+"','"+yContents+"');");

					
								
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
  RequestDispatcher dispatcher = request.getRequestDispatcher("yonglist_1.jsp");
  dispatcher.forward(request,response);
%>