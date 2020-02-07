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
<%
  QnaDto qnaNew = new QnaDto();
  int qNo = Integer.parseInt(request.getParameter("index"));
  QnaDto one = dao.selectone(qNo);
  String name = one.getqMember();
  String pw = one.getqSecretNum();
  Date date = one.getqDate();
  String text = one.getqContents();
  String title = one.getqTitle();
  String email= one.getqEmail();
  String id = one.getqId();
  
  
  
  
  

  
  
%>
<div id="popup<%=qNo%> overlay" class="overlay">
	<div class="popup" style="height:550px;">
		<h2>Q&A</h2>
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
					<th scope="row" style="width:80px;height:70px;">제목</th>
					<td class="al_left" style="text-align:left;"><%=title %></td>
				</tr>
				<tr>
					<th scope="row" style="width:80px;height:70px;">작성자</th>
					<td class="al_left" style="text-align:left;"><%=name %></td>
				</tr>
				<tr>
					<th scope="row" style="width:80px;height:70px;">작성일</th>
					<td class="al_left" colspan="3" style="text-align:left;"><%=date %></td>
				</tr>



				<tr>
					<th scope="row" >내용</th>
					<td class="al_left" colspan="4">
						<div style=" height: 100px;text-align:left;">
							<%=text %>
						</div>
					</td>
				</tr>

				<tr>
					<th scope="row"><div id="dddd">비밀번호</div></th>
					<td class="al_left" colspan="3" >
						<input type="password" id="pwd" style="width:90px;float:left;">
					</td>
				</tr>
				<tr>
					<td style="width:180px;">
					<br>
					<br>
			<input class="qnabutton qnabutton5" type="button" value="수정" style="font-size: 15px; width: 60px;"
			onclick="script: location.href='qnaupdate.jsp?qNo='+'<%=one.getqNo()%>'+'&qTitle='+'<%=one.getqTitle()%>'+'&qMember='+'<%=one.getqMember()%>'+'&qContents='+'<%=one.getqContents() %>';">
			<input class="qnabutton qnabutton5" type="button" value="삭제" id="delete" name="delete"
			style="font-size: 15px; width: 60px;"
			onClick="location.href='qnadelete.jsp?qSecretNum='+'<%=one.getqSecretNum()%>'+'&qNo='+<%=one.getqNo() %>;" />		
						
					
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
		//qna게시글딜리트하는 dao 호출문 매개변수는 qNo
		location.href="qna.jsp";
	}
</script>
<script>
	function close1() {
		
		$("#innerpop").html("");
	}
</script>

<%
//QnaDao dao2 = new QnaDao();
//ArrayList<QnaDto> arraylist = new ArrayList<QnaDto> ();
//ArrayList<QnaDto> list = dao.selectAll();	//리스트 담아왔다.
//dao.insert(arraylist);
%>