<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="qnaPack.QnaDto"%>
<%@page import="qnaPack.QnaDao"%>
<%@page import="java.util.ArrayList"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="dao" class="qnaPack.QnaDao" />
<%
  QnaDto qnaNew = new QnaDto();
  int qNo = Integer.parseInt(request.getParameter("index"));
  QnaDto one = dao.selectone(qNo);
  String name = one.getqMember();
  String text = one.getqContents();
  
  out.println(name);
  
  
  

  
  
%>
<div id="popup<%=qNo%>" class="overlay">
	<div class="popup">
		<h3>Q&A</h3>
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
					<th scope="row">지점</th>
					<td class="al_left">동대문점</td>
				</tr>
				<tr>
					<th scope="row">매치일자</th>
					<td class="al_left" colspan="3">2020.01.09(목) 19:00 ~ 20:00</td>
				</tr>
				<tr>
					<th scope="row">구장</th>
					<td class="al_left" colspan="3">B구장</td>
				</tr>
				<tr>
					<th scope="row">연락처</th>
					<td class="al_left">010-7484-3858</td>
					<th scope="row">팀 수준</th>
					<td class="al_left">
						<option value="4">중하</option>
					</td>
				</tr>
				<tr>
					<th scope="row">구인가능여부</th>
					<td class="al_left" colspan="3">

						<span class="state end">마감</span>

					</td>
				</tr>
				<tr>
					<td class="al_left" colspan="4">
						<div>
							<%=text %>
						</div>
					</td>
				</tr>

				<tr>
					<th scope="row">비밀번호</th>
					<td class="al_left" colspan="3">
						<input type="password" id="pwd">
					</td>
				</tr>

			</tbody>
		</table>




		</table>
		<a class="close" href="#">&times;</a>
		
	</div>
</div>
<%
//QnaDao dao2 = new QnaDao();
//ArrayList<QnaDto> arraylist = new ArrayList<QnaDto> ();
//ArrayList<QnaDto> list = dao.selectAll();	//리스트 담아왔다.
//dao.insert(arraylist);
%>