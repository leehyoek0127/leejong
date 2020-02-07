<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="model.YonglistDto"%>
<%@page import="mybatis.YonglistDao"%>
<%@page import="java.util.ArrayList"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dao" class="mybatis.YonglistDao" />
<%
  YonglistDto YonglistNew = new YonglistDto();
  int index = Integer.parseInt(request.getParameter("index"));
  String yid = request.getParameter("yid");
  YonglistDto one = dao.yongselectone(index, yid);
  String name = one.getyMember();
  String branch = one.getyBranch();
  Date date = one.getyDate();
  String ground = one.getyGround();
  String contents = one.getyContents();
  String matchdate = one.getyMatchdate();
  String time = one.getyTime();
  
  
  
  
  

  
  
%>
<div id="popup<%=index%> overlay" class="overlay">
	<div class="popup" style="height:600px;">
		<h2>용병 게시글 상세조회</h2>
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
					<th scope="row" style="width:80px;height:40px;">지점</th>
					<td class="al_left" style="text-align:left;"><%=branch %></td>
				</tr>
				<tr>
					<th scope="row" >구장</th>
					<td class="al_left" colspan="2">
						<div style=" height: 30px;text-align:left;">
							<%=ground %>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" style="width:80px;height:40px;">작성자</th>
					<td class="al_left" style="text-align:left;"><%=name %></td>
				</tr>
				<tr>
					<th scope="row" style="width:80px;height:70px;">작성일</th>
					<td class="al_left" colspan="3" style="text-align:left;"><%=date %></td>
				</tr>



				
				<tr style="height: 100px;">
					<th scope="row" >내용</th>
					<td class="al_left" colspan="5">
						<div style="text-align:left;">
							<%=contents %>
						</div>
					</td>
				</tr>
				<tr style="height: 100px;">
					<th scope="row" >매치 일자 및 시간대</th>
					<td class="al_left" colspan="5">
						<div style="text-align:left;">
							<%=matchdate%> &nbsp<%=time%>
						</div>
					</td>
				</tr>
				
				<tr>
					<td style="width:180px;">
					<br>
					<br>
			<input class="qnabutton qnabutton5" type="button" id="edit" name="edit" value="수정" style="font-size: 15px; width: 60px;"
			onclick="script: location.href='yongedit.jsp?index=<%=index%>&id=<%=yid%>&edit=1';">
			<input class="qnabutton qnabutton5" type="button"  id="delete" value="삭제"  name="delete"
			style="font-size: 15px; width: 60px;"
			onClick="location.href='yongedit.jsp?index=<%=index%>&id=<%=yid%>&delete=1';" />		
						
					
					</td>
					
				</tr>
				<tr>
				<td>
				<br>
				<td>
				</tr>
				</tbody>
				
		</table>
		





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