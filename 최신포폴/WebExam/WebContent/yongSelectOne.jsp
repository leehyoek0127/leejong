<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="Yonglist.YonglistDto"%>
<%@page import="Yonglist.YonglistDao"%>
<%@page import="java.util.ArrayList"%>
<%request.setCharacterEncoding("UTF-8");%>
<link rel="stylesheet" href="css/signbutton.css">

<jsp:useBean id="dao" class="Yonglist.YonglistDao" />

<%
  YonglistDto YonglistNew = new YonglistDto();
  int index = Integer.parseInt(request.getParameter("index"));
  String yid = request.getParameter("yid");
  YonglistDto one = dao.yongselectone(index, yid);
  String name = one.getyMember();
  String branch = one.getyBranch();
  Date date = one.getyDate();
  String ground = one.getyGround();
  String yTel1= one.getyTel1();
  String yTel2= one.getyTel2();
  String yTel3= one.getyTel3();
  String yApply = one.getyApply();
  String yTeam = one.getyTeam();
  String contents = one.getyContents();
  String matchdate = one.getyMatchdate();
  String time = one.getyTime();
  
  
  
  
  

  
  
%>
<link rel="stylesheet" href="css/boardpop.css">
<div id="popup<%=index%> overlay" class="overlay">
	<div class="popup" style="height:700px;">
		<h1 class="h_bar">용병 게시글 상세조회</h1>
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
				<td class="al_left" colspan="3"><%=date %> </td>
			</tr>
			<tr>
				<th scope="row">구장</th>
				<td class="al_left" colspan="3"><%=ground %></td>
			</tr> 
			<tr>
				<th scope="row">연락처</th>
				<td class="al_left"><%=yTel1 %>-<%=yTel2 %>-<%=yTel3 %></td> 
				<th scope="row">팀 수준</th>
				<td class="al_left"><%=yTeam %></td>
			</tr>
			<tr>
				<th scope="row">구인가능여부</th>
				<td class="al_left" colspan="3">
								
									<span class="state"><%=yApply %></span>
												
				</td>
			</tr>
			<tr>
				<td class="al_left" colspan="4" style="height:50px;"><textarea readonly><%=contents %></textarea></td>
			</tr>
			
			
			 
		</tbody>
	</table>
		<input class="signbutton signbutton5" type="button" id="edit" name="edit" value="수정" style="font-size: 15px; width: 49%; height:80px;margin-top: 10px;"
			onclick="script: location.href='yongedit.jsp?index=<%=index%>&id=<%=yid%>&edit=1';">
			<input class="signbutton signbutton5" type="button"  id="delete" value="삭제"  name="delete"
			style="font-size: 15px; width: 49%; height:80px;"
			onClick="location.href='yongedit.jsp?index=<%=index%>&id=<%=yid%>&delete=1';" />





		<a class="close" onclick="close1();">&times;</a>

	</div>
</div>
<script>
	function delete1() {
		//Yonglist게시글딜리트하는 dao 호출문 매개변수는 qNo
		location.href="yonglist_1.jsp";
	}
</script>
<script>
	function close1() {
		
		$("#innerpop").html("");
	}
</script>

<%
//YonglistDao dao2 = new YonglistDao();
//ArrayList<YonglistDto> arraylist = new ArrayList<YonglistDto> ();
//ArrayList<YonglistDto> list = dao.selectAll();	//리스트 담아왔다.
//dao.insert(arraylist);
%>