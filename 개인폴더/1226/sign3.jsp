<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import = "java.io.*" %>
<%
  String loginid = request.getParameter("loginID");
  String loginpassword = request.getParameter("loginPASSWORD");
  String id = (String) session.getAttribute("ID");
  String password = (String) session.getAttribute("PASSWORD");
  String result = null;
  if(id.equals(loginid)&&password.equals(loginpassword)) {
	result = "SUCCESS";
	response.sendRedirect("sign4.jsp?RESULT=" + result);
  }
  else {
	result = "FAIL";
	response.sendRedirect("sign4.jsp?RESULT=" + result);
  }
%>

