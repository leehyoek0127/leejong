<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="Qna.QnaDto"%>
<%@page import="Qna.QnaDao"%>
<%@page import="java.util.ArrayList"%>
<%request.setCharacterEncoding("UTF-8");%>
<link rel="stylesheet" href="css/signbutton.css">
<jsp:useBean id="dao" class="Qna.QnaDao" />
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

	String qSecretNum = one.getqSecretNum(); 
	session.setAttribute("qSecretNum", qSecretNum);
	session.setAttribute("qNo",qNo);
	
	

  
%>

<style>


</style>
<!--용병리스트 게시판 css파일 수정 2020.01.08-->
<link rel="stylesheet" href="yonglist_1_body.css">
<link rel="stylesheet" href="css/boardpop.css">
<div id="popup<%=qNo%> overlay" class="overlay">
	<div class="popup" style="height:700px;">
		<h1 class="h_bar">Q&A</h1>
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
				<th scope="row">제목</th>
				<td class="al_left"><%=title %></td>
				<th scope="row">작성자 </th>
				<td class="al_left"><%=name %></td>
			</tr> 
			<tr>
				<th scope="row">작성일자</th>
				<td class="al_left" colspan="3"><%=date %> </td>
			</tr>
			
		
		
			<tr>
				<td class="al_left" colspan="4" style="height:50px;"><textarea readonly><%=text %></textarea></td>
			</tr>
			<tr>
				<th scope="row">비밀번호</th>
				<td class="al_left" colspan="3"><input type="password" id="pwd" name="pwd" style="width:200px;float:left;"></td>
			</tr> 
			<tr>
					<td style="width:180px; border:0;" colspan="2">
					<br>
					
				
						
					
					</td>
					
					
				</tr>
			
			 
		</tbody>
	</table>
		<input class="signbutton signbutton5" type="button" id="edit" name="edit" value="수정" style="font-size: 15px; width: 49%; height:80px; margin-top:10px;"
			onclick="script: location.href='qnaupdate.jsp?qNo='+'<%=one.getqNo()%>'+'&qTitle='+'<%=one.getqTitle()%>'+'&qMember='+'<%=one.getqMember()%>'+'&qContents='+'<%=one.getqContents() %>';">
			
			<td style="width:180px;border:0;" colspan="2" >
			
			<input class="signbutton signbutton5" type="button"  value="삭제" id="delete" name="delete"
			style="font-size: 15px; width: 49%; height:80px;"
			onClick="deleteClick1(<%=qNo %>);" />	





		<a class="close" onclick="close1();">&times;</a>

	</div>
</div>










	
	
		
<script>
function edit(){
	var pwd = $("#pwd").val();
	var idx = "1490";
	window.open("/comm/check_pwd.asp?idx="+idx+"&pwd="+pwd+"&fldr=match", "HiddenFrame");
}
</script>
</div>

			</div>





		

	</div>
</div>
<script>
	function deleteClick1(qNo) {
		var pwd=document.getElementById("pwd").value;
		
		$.ajax({
			type:"get",
			url:"./deletejump.jsp",       
			data:{
				
				qNo:qNo,
				pwd:pwd
			},	
			success:whenSuccess3,
			error:whenError3
			});
	}
	function whenSuccess3(resdata){
		console.log(resdata);
		if(resdata!=null){
			alert(resdata);
			$("#innerpop").html("");
			location.reload();
		}
	
			
	}
	function whenError3(){
		alert("리스트에러");
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