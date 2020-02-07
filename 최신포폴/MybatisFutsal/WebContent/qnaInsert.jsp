<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="model.QnaDto"%>
<%@page import="mybatis.QnaDao"%>
<%@page import="java.util.ArrayList"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dao" class="mybatis.QnaDao" />
<jsp:useBean id="qnaNew" class="model.QnaDto" />

<jsp:setProperty name="qnaNew" property="*" />
<%
  
int qNo = 0;
int qCount = 0;
SimpleDateFormat format1 = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
Date time = new Date();

  dao.insert(qnaNew);
  response.sendRedirect("qna.jsp");
  
%>
<%
//QnaDao dao2 = new QnaDao();
//ArrayList<QnaDto> arraylist = new ArrayList<QnaDto> ();
//ArrayList<QnaDto> list = dao.selectAll();	//리스트 담아왔다.
//dao.insert(arraylist);
%>