<%@page import="qnaPack.QnaDto"%>
<%@page import="qnaPack.QnaDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
//2020_01_02 수정부분
	String url = request.getServletPath();
	session.setAttribute("url",url);
	String includeurl = "header.jsp";
	String uss = (String)session.getAttribute("id");
	String log = "로그인";
	if(uss==null)
		uss="GUEST";
	 else{
	 	log="로그아웃";
		includeurl = "sign_login.jsp";
	 }
		//수정부분 끝
%>
<jsp:useBean id = "dao" class = "qnaPack.QnaDao"/>
























<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="css/borderRightLeft.css" media="screen">
<title>qna</title>
<!--기본적인 body등의 css-->
<link rel="stylesheet" href="css/basicStyle.css" media="screen">
<!--Q&A에 펠요한 css-->
<link rel="stylesheet" href="css/Q&Astyle.css" media="screen">
<!-- Q&A에 필요한 script -->
<script type="text/javascript" src="Q&Ascript.js"></script>
<!-- 광호Q&A -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!--2020.01.03 추가 css 분리-->
<link rel="stylesheet" href="css/logform.css" media="screen">
<link rel="stylesheet" href="css/Q&Astyle2.css" media="screen">
<!--2020.01.03 추가 javascript.가입기능 분리-->
<script type="text/javascript" src="js/signjs.js"></script>
<!--서브메뉴부르는css-->
<link rel="stylesheet" href="css/style2.css" media="screen">
<!--2020.01.06footer css추가 -->
<link rel="stylesheet" href="css/footer.css">
<!--배너2 자동슬라이드-->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.infinitecarousel.js"></script>
<!----------------------------서브메뉴마우스오버기능-------------------------->
<link rel="stylesheet" type="text/css" href="css/subMenuMouseOver.css">
<!--2020.01.09Overray css추가 -->
<link rel="stylesheet" href="css/qnaOverray.css">
<script type="text/javascript">
	$(document).ready(function(){
		$("#id").blur(function(){
			
				addHtml();
			
				$("#ajaxReturn").html("6~14자 사이의 영문 대소문자와 숫자만 사용가능합니다");
			
		});
		
	});
	
	function addHtml(){
		
		$.ajax({
			type:"post",
		url:"./qnaSelectOne.jsp",       
		data:{
	
			index:$('#id').val()
		},	
		success:whenSuccess,
		error:whenError
		});
	}
	var confirmid = "";
	function whenSuccess(resdata){
		
		var x=document.getElementById("ajaxReturn");
		$("#ajaxReturn").html(resdata);
		
		if(resdata.includes("이미 사용중인 ID입니다")){
			document.join.hidden.value="0";
			x.style.color="red";
		}
		
		else{
			document.join.hidden.value="1";
			x.style.color="blue";
			confirmid = join.id.value;
			
			
		}
	}
	function whenError(){
		alert("Error");
	}
</script>
<!----------------------------회원가입스크립트랑 스타일(따로 빼면 에러)-------------------------->
<script type='text/javascript'>
	$(function() {
		  $('#forgot_username_link').tipsy({gravity: 'w'});   
	});
</script>
<link href="css/front.css" media="screen, projection" rel="stylesheet" type="text/css">
<script src="js/jquery2.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".signin").click(function(e) {          
			e.preventDefault();
			$("fieldset#signin_menu").toggle();
			$(".signin").toggleClass("menu-open");
		});
		$("fieldset#signin_menu").mouseup(function() {
			return false
		});
		$(document).mouseup(function(e) {
			if($(e.target).parent("a.signin").length==0) {
				$(".signin").removeClass("menu-open");
				$("fieldset#signin_menu").hide();
			}
		});			
				
	});
</script>
<!----------------------------alam form 추가 2020.01.06-------------------------->
<script type="text/javascript">
			$(document).ready(function() {
				$(".mypage").click(function(e) {          
					e.preventDefault();
					$("fieldset#mypage_menu").toggle();
					$(".mypage").toggleClass("menu-open");
				});		
				$("fieldset#mypage_menu").mouseup(function() {
					return false
				});
				$(document).mouseup(function(e) {
					if($(e.target).parent("a.mypage").length!=0) {
						$(".mypage").removeClass("menu-open");
						$("fieldset#mypage_menu").hide();
					}
				});			
				
			});
	</script>
<!----------------------------회원가입스크립트랑 스타일여기까지------------------------------------>
<script>
 /*스크롤 내리면 메뉴 위치 이동하는 기능------따로빼면 작동xxxxxx*/
$(function(){
	var shrinkHeader = 30;
	var shrinkhollow = 465;
	$(window).scroll(function() {
		var scroll = getCurrentScroll();
		  if ( scroll >= shrinkHeader ) {
			   $('#navtop').addClass('shrink');  
			}
			else {
				$('#navtop').removeClass('shrink');	
			}
		   if(scroll>= shrinkhollow ){
				$('#navtop').addClass('shrinkhollow');  
			}
			else {
				$('#navtop').removeClass('shrinkhollow');	
			}
	});
	function getCurrentScroll() {
		return window.pageYOffset || document.documentElement.scrollTop;
		}
});
</script>
<style>
	#qnaTopTable td div {
		height:50px;
		margin:0px;
	}
	.nav_ban{
		margin-top:0px;
		padding:0px;
	}
</style>
</head>
<body>

	<header>
		<jsp:include page="<%=includeurl%>" />
	</header>

		<div id="mainleft">
			<div id="leftbanner">
				<div id="banner1">
					<img src="img/20191211.jpg" width="100%" height="100%" />
				</div>
				<div id="banner3">
					<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d25325.265446899888!2d127.02924799651784!3d37.492391917303266!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca5bed583f92d%3A0xc93c837d2875ade6!2z7ZKL7IK07J6l!5e0!3m2!1sko!2skr!4v1575961834128!5m2!1sko!2skr" width="100%" height="100%" frameborder="0" style="border: 0;" allowfullscreen=""> </iframe>
				</div>
			</div>
		</div>
		<section id="main">
			<section id="mainright">
				<div id="matList">
					<div class="sec_ban2">
						<ul class="nav_ban">
							<li><img src="img/qna.jpg" style="width: 100%; height: 200px"></li>
						</ul>
					</div>
					<div class="cbox">
					<form id="qnainsert" action="qnaInsert.jsp" method="post">
						<table class="table table-striped" id="qnaTopTable">
						<tbody>
								<tr>
									<td>제목</td>
									<td>
										<div class="form-group has-success">
											<input type="text" class="form-control" id="qTitle" name="qTitle">
										</div>
									</td>
								</tr>
								<tr>
									<td>작성자</td>
									<td>
										<div class="form-group has-success">
											<input type="text" class="form-control" id="qMember" name="qMember" maxlength="10" style="width: 250px">
										</div>
									</td>
								</tr>
								<tr>
									<td>비밀번호</td>
									<td>
										<div class="form-group has-warning" style="height: 45px">
											<input type="text" class="form-control" id="qSecretNum" name="qSecretNum" maxlength="10" style="width: 250px">
										</div>
										<label class="control-label" for="inputWarning1" style="color: #8a6d3b;"> 글 수정, 삭제,비밀글 확인시 사용됩니다. </label>
									</td>
								</tr>
								<tr>
									<td>비밀글 설정</td>
									<td>
										<div class="has-warning">
											<div class="checkbox">
												<label> <input type="checkbox" id="qSecret" name="secret" value="sc"> 비밀글 설정시 체크박스에 표시
												</label>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>내용</td>
									<td>
										<textarea id="qContents" name="qContents" class="form-control" rows="7" style="resize:none;">
										</textarea>
									</td>
								</tr>
							</tbody>
						</form>
						</table>
						<a class="btn btn-default" style="float: right; margin-left: 5px;"> 목록 </a> <input type="submit" value="글쓰기" class="btn btn-default pull-right"/> <br>
						<br>
						<br>
						<br>
						<br>
						<br>
						
						<table class="table table-striped">
							<thead>
								<tr id="tabletitle">
									<th scope="col" class="thno"><span> No </span></th>
									<th scope="col" class="thtitle" style="text-align: center"><span> 제목 </span></th>
									<th scope="col" class="thname"><span> 작성자 </span></th>
									<th scope="col" class="thdate"><span> 작성일 </span></th>
									<th scope="col" class="thview"><span> 조회 </span></th>
								</tr>
							</thead>
							<tbody>
						<% ArrayList<QnaDto> list = dao.selectAll(); %>
							
						<%
						
						for(int i=0; i<list.size(); i++){
						%>	<a>
							<tr>
								<td class="thgongji"><%=list.get(i).getqNo() %></td>
								<td class="thtitle">
									<a onClick="window.open('qnaInsert.jsp?index=<%=i %>','newwindow','width=430,height=500,location=no,status=no,scrollbar=yes');" class="button"><%=list.get(i).getqTitle() %></a><img src="img/lock2.png" class="secretimg">
								</td>
								<td class="thname" name="thname" id="thname"><%=list.get(i).getqMember() %></td>
								<td class="thdate"><%=list.get(i).getqDate() %></td>
								<td class="thview"><%=list.get(i).getqCount() %></td>
							</tr>
							</a>
						<%	
						}
						%>
								<div id="popup1" class="overlay">
									<div class="popup">
										
										<a class="close" href="#">&times;</a>
										<div class="content">Thank to pop me out of that button, but now i'm done so you can close this window.</div>
									</div>
								</div>



							</tbody>
						</table>
						<div class="text-center">
							<ul class="pagination">
								<li><a href="#" style="position:unset;">1</a></li>
								<li><a href="#" style="position:unset;">2</a></li>
								<li><a href="#" style="position:unset;">3</a></li>
								<li><a href="#" style="position:unset;">4</a></li>
								<li><a href="#" style="position:unset;">5</a></li>
								<li><a href="#" style="position:unset;">6</a></li>
								<li><a href="#" style="position:unset;">7</a></li>
								<li><a href="#" style="position:unset;">8</a></li>
								<li><a href="#" style="position:unset;">9</a></li>
								<li><a href="#" style="position:unset;">10</a></li>
								<li><a href="#" style="position:unset;">다음 ></a></li>
							</ul>
						</div>
						<select class="form-control" style="width: 200px; float: left; margin-left: 150px;">
							<option>전체기간
						</select>
						<select class="form-control" style="width: 200px; float: left; margin-left: 10px;">
							<option>제목+내용
						</select>
						<input type="text" class="form-control" id="exampleInputEmail1" placeholder="검색어를 입력하세요" class="form-control" style="width: 300px; float: left; margin-left: 10px;"> <input class="btn btn-default" type="button" value="검 색" style="float: left; margin-left: 10px;">
					</div>
			</section>
		</section>

	
	<footer id="footer">
		<jsp:include page="Footer.jsp" />
	</footer>
	<jsp:include page="quickbar.jsp" />
</body>
</html>
