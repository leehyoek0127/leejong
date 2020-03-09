<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="vo.YonglistDto"%>
<%@page import="dao.YonglistDao"%>
<%@page import="java.util.ArrayList"%>
<%request.setCharacterEncoding("UTF-8");%>
<link rel="stylesheet" href="css/signbutton.css">

<jsp:useBean id="dao" class="dao.YonglistDao" />

<%
  YonglistDto YonglistNew = new YonglistDto();
  int index = Integer.parseInt(request.getParameter("index")); //글번호
  String yid = request.getParameter("yid"); //아이디
  YonglistDto one = dao.yongselectone(index, yid);
  String name = one.getY_b_name();

  String branch = one.getY_b_branch();
//  Date date = one.getyDate();
  String ground = one.getY_b_ground();
  String yTel0= one.getY_b_tel1(); //db에서 전화번호 받음
  String yTel1=yTel0.substring(0,3); 
  String yTel2;  
  if(yTel0.length()<=10){ // 전화번호 중간자리 반는법 3자리와 4자리가 있을수있음으로 두경우로 나눔
	  yTel2=yTel0.substring(3,6);
	  
  }else{     
		yTel2=yTel0.substring(3,7);
		
	}
  
  
  String yTel3= yTel0.substring(yTel0.length()-4, yTel0.length());

  
  String yApply = one.getY_b_status();
  String yTeam = one.getY_b_level();
  String contents = one.getY_b_contents();
  String matchdate = one.getY_b_schedule();
  String time = one.getY_b_time();
  
  
  
  
  

  
  
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
				<td class="al_left" colspan="3"><%=matchdate%> </td>
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