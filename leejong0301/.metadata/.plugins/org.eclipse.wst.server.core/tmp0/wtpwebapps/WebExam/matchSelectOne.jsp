<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="vo.MatchlistDto"%>
<%@page import="dao.MatchlistDao"%>
<%@page import="java.util.ArrayList"%>
<%request.setCharacterEncoding("UTF-8");%>
<link rel="stylesheet" href="css/signbutton.css">

<jsp:useBean id="dao" class="dao.MatchlistDao" />

<%
	MatchlistDto MatchlistNew = new MatchlistDto();
  int index = Integer.parseInt(request.getParameter("index"));
  String mid = request.getParameter("mid");
  MatchlistDto one = dao.matchselectone(index, mid);
  String name = one.getM_b_name();

  String branch = one.getM_b_branch();
//  Date date = one.getyDate();
  String ground = one.getM_b_ground();
  String mTel0= one.getM_b_tel1(); //db에서 전화번호 받음
  String mTel1=mTel0.substring(0,3); 
  String mTel2;  
  if(mTel0.length()<=10){ // 전화번호 중간자리 반는법 3자리와 4자리가 있을수있음으로 두경우로 나눔
	  mTel2=mTel0.substring(3,6);
	  
  }else{     
		mTel2=mTel0.substring(3,7);
		
	}
  String mTel3= mTel0.substring(mTel0.length()-4, mTel0.length());
  String mApply = one.getM_b_status();
  String mTeam = one.getM_b_level();
  String contents = one.getM_b_contents();
  String matchdate = one.getM_b_schedule();
  String time = one.getM_b_time();
  String type = one.getM_b_type();
  String count = one.getM_b_count();
%>
<link rel="stylesheet" href="css/boardpop.css">
<div id="popup<%=index%> overlay" class="overlay">
	<div class="popup" style="height:800px;">
		<h1 class="h_bar">매치신청 게시글 상세조회</h1>
		<br>
		<table> 
		<colgroup>
			<col class="t01">
			<col width="">
			<col class="t01">
			<col width="">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">작성자</th>
				<td class="al_left"><%=name %></td>
				<th scope="row">지점 </th>
				<td class="al_left"><%=branch %></td>
			</tr> 
			<tr>
				<th scope="row">매치일자</th>
				<td class="al_left" colspan="3"><%=matchdate %> </td>
			</tr>
			<tr>
				<th scope="row">구장</th>
				<td class="al_left" colspan="3"><%=ground %></td>
			</tr> 
			<tr>
				<th scope="row">연락처</th>
				<td class="al_left"><%=mTel1 %>-<%=mTel2 %>-<%=mTel3 %></td> 
				<th scope="row">팀 수준</th>
				<td class="al_left"><%=mTeam %></td>
			</tr>
			<tr>
				<th scope="row">매치형태</th>
				<td class="al_left"><%=type %></td> 
				<th scope="row">신청가능팀 수</th>
				<td class="al_left"><%=count %></td>
			</tr>
			<tr>
				<th scope="row">구인가능여부</th>
				<td class="al_left" colspan="3">
								
									<span class="state"><%=mApply %></span>
												
				</td>
			</tr>
			<tr>
				<td class="al_left" colspan="4" style="height:50px;"><textarea readonly><%=contents %></textarea></td>
			</tr>
			
			
			 
		</tbody>
	</table>
		<input class="signbutton signbutton5" type="button" id="edit" name="edit" value="수정" style="font-size: 15px; width: 49%; height:80px;margin-top: 10px;"
			onclick="script: location.href='matchedit.jsp?index=<%=index%>&id=<%=mid%>&edit=1';">
			<input class="signbutton signbutton5" type="button"  id="delete" value="삭제"  name="delete"
			style="font-size: 15px; width: 49%; height:80px;"
			onClick="location.href='matchedit.jsp?index=<%=index%>&id=<%=mid%>&delete=1';" />





		<a class="close" onclick="close1();">&times;</a>

	</div>
</div>

<script>
	function close1() {
		
		$("#innerpop").html("");
	}
</script>

