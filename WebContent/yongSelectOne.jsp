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
<style>




.overlay .popup table th, .overlay .popup table td {
    border: 1px solid #c2c2c2;
    height: 70px;
    
    
}
.popup table tbody tr th {
    background: #f0f1f3;
    color: #2c3c57;
    font-size: 18px;
    font-weight: 700;
    line-height: 28px;
    text-align: center;
}
.popup table th, .popup table td {
    border-top: 1px solid #636363;
    border-left: 1px solid #636363;
    font-size: 12px;
    vertical-align: middle;
    border: 0 none;
}
table th {
    font-weight: normal;

    display: table-cell;
    vertical-align: inherit;
    font-weight: bold;
    text-align: -internal-center;
}
.popup table {
    width: 100%;
    border: 1px solid #c2c2c2;;
    border-collapse: collapse;
    border-spacing: 0;

    border-collapse: separate;
    
    width: 100%;
    border: 0 none;
    border-collapse: collapse;
    

    border-collapse: separate;
    

    
    min-width: 320px;
    color: #403d3f;
    font-size: 18px;
    
    font-weight: normal;
    line-height: 26px;
    -webkit-text-size-adjust: none;
    word-spacing: 0;
    letter-spacing: -0.3px;

    
    min-width: 320px;
    color: #403d3f;
    font-size: 18px;
    
    font-weight: normal;
    line-height: 26px;
    -webkit-text-size-adjust: none;
    word-spacing: 0;
    letter-spacing: -0.3px;
    font-family:none;
}





.overlay .popup table tbody tr td.al_left {
    padding: 10px;
}
.overlay .popup table tbody tr td {
    padding: 10px 0;
    height: 45px;
}
.popup table tbody tr td.al_left {
    padding-left: 20px;
    text-align: left;
}
.overlay .popup table th, .overlay .popup table td {
    border-top: 1px solid #c2c2c2;
    border-left: 1px solid #c2c2c2;
}
.popup table tbody tr td {
    padding: 18px 0;
    height: 20px;
    color: #2a2a2a;
    font-size: 18px;
    line-height: 28px;
    text-align: center;
    word-break: keep-all;
}
.popup table th, .popup table td {
    border-top: 1px solid #636363;
    border-left: 1px solid #636363;
    font-size: 12px;
    vertical-align: middle;
}
.al_left {
    text-align: left !important;
}






.popup td {
    display: table-cell;
    vertical-align: inherit;
}


.popup textarea {
	resize:none;
	width: 100%;
	height: 100%;
	border:0;
	height:100px;
	
}
.popup textarea:focus {
  outline: none;
}
.h_bar:before {
    content: "";
    display: block;
    position: absolute;
    top: 5px;
    left: 0;
    width: 5px;
    height: 30px;
    background: #2c3c57;
}
.h_bar:after {
    content: "";
    display: block;
    position: absolute;
    top: 5px;
    left: 0;
    width: 5px;
    height: 6px;
    background: #aec8f4;
}
.h_bar {
    position: relative;
    padding-left: 26px;
    color: #2c3c57;
    font-size: 30px;
    line-height: 40px;
    letter-spacing: -2px;
}


</style>
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