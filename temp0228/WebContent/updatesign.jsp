<!-- 마이페이지에서 수정하는 중간지점 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="java.sql.*"%>

<%
  String id = (String)session.getAttribute("id");
  String name = request.getParameter("name");
  String pw = request.getParameter("pw");
  String tel1 = request.getParameter("tel1");
  String tel2 = request.getParameter("tel2");
  String tel3 = request.getParameter("tel3");
  String telall = tel1+"-"+tel2+"-"+tel3;
  String email1 = request.getParameter("email1");
  String email2 = request.getParameter("email2");
  String emailall = email1+"@"+email2;
  String gender = request.getParameter("gender");
  String address_code = request.getParameter("address_code");
  String address_basic = request.getParameter("address_basic");
  String address_detail = request.getParameter("address_detail");
  String birth_year = request.getParameter("birth_year");
  String birth_month = request.getParameter("birth_month");
  String birth_day = request.getParameter("birth_day");
  String birthall = birth_year+"년"+birth_month+"월"+birth_day+"일";
  String pic = request.getParameter("pic");
  String level = request.getParameter("level");
  String team = request.getParameter("team");
  String[] positionarr = request.getParameterValues("position");
  String position="";
  String second_pw = request.getParameter("second_pw");
  String second_pwc = request.getParameter("second_pwc");
  String bank_code = request.getParameter("bank_code");
  String account_code = request.getParameter("account_code");
  String account_holder = request.getParameter("account_holder");

  if(positionarr!=null){
	  for(int i=0; i<positionarr.length; i++){
		  position += positionarr[i]+" ";
	  }
  }
  
  Connection conn = null;
  Statement stmt = null;
  try {
	  Class.forName("com.mysql.jdbc.Driver");
	  conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/futsal?useSSL=false&useUnicode=true&characterEncoding=utf8","root","0000");
	  if (conn == null)
		  throw new Exception("데이터베이스에 연결할 수 없습니다.<BR>");
	  stmt = conn.createStatement();

	  String command = "update sign set NAME='"+name+"',TEL='"+telall+"',EMAIL='"+emailall+"',GENDER='"+gender+"',ADDRESS_CODE='"+address_code+"',ADDRESS_BASIC='"+address_basic+"',ADDRESS_DETAIL='"+address_detail+"',BIRTH='"+birthall+"',PIC='"+pic+"',LEVEL='"+level+"',POSITION='"+position+"',SECOND_PW='"+second_pw+"',SECOND_PWC='"+second_pwc+"',BANK_CODE='"+bank_code+"',ACCOUNT_CODE='"+account_code+"',ACCOUNT_HOLDER='"+account_holder+"'where ID='"+id+"';";
													
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