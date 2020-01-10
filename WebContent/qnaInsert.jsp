<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="qnaPack.QnaDto"%>
<%@page import="qnaPack.QnaDao"%>
<%@page import="java.util.ArrayList"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id = "dao" class = "qnaPack.QnaDao"/>
<%
  QnaDto qnaNew = new QnaDto();
 
SimpleDateFormat format1 = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
Date time = new Date();
  ArrayList<QnaDto> listCount = dao.selectAll();
  int qNo = listCount.size() +1;
  String qMember = request.getParameter("qMember");
  String qSecret = request.getParameter("qSecret");
  String qSecretNum = request.getParameter("qSecretNum");
  String qContents = request.getParameter("qContents");
  String qTitle = request.getParameter("qTitle");
  String qId = (String)session.getAttribute("id");
  //Timestamp qDate = format1.format(time);
  qnaNew.setqNo(qNo);
  qnaNew.setqMember(qMember);
  qnaNew.setqSecret(qSecret);
  qnaNew.setqSecretNum(qSecretNum);
  qnaNew.setqContents(qContents);
  qnaNew.setqTitle(qTitle);
  qnaNew.setqId(qId);
  //dao.insert(qnaNew);
  String index = request.getParameter("index");
  out.println(index);
%>
<%
//QnaDao dao2 = new QnaDao();
//ArrayList<QnaDto> arraylist = new ArrayList<QnaDto> ();
//ArrayList<QnaDto> list = dao.selectAll();	//리스트 담아왔다.
//dao.insert(arraylist);
%>