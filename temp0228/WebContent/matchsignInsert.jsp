<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="vo.MatchlistDto"%>
<%@ page import="java.util.Date"%>
<%@page import="dao.MatchlistDao"%>
<%request.setCharacterEncoding("UTF-8");%>



	<jsp:useBean id ="ml" class="dao.MatchlistDao"/>
	<jsp:useBean id="matchnew" class="vo.MatchlistDto"/>
	<jsp:setProperty name="matchnew" property="*"/>
	

		<%
		String function = request.getParameter("fn");
		String mid =request.getParameter("mid");
		if(function.equals("1")){
		ml.insert(matchnew);
		}
		else{
			ml.update(matchnew);
		}
		
		 response.sendRedirect("match_apply.jsp");
		%>
	
	
	
