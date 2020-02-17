<%@page import="com.mysql.jdbc.PreparedStatement.ParseInfo"%>
<%@page import="dao.MatchlistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="vo.MatchlistDto"%>
<%@ page import="java.util.Date"%>

<%
	//2020_01_02 수정부분
	String includeurl = "header.jsp";
	String uss = (String) session.getAttribute("id");
	String log = "로그인";
	if (uss == null)
		uss = "GUEST";
	else {
		log = "로그아웃";
		includeurl = "sign_login.jsp";
	}
	//수정부분 끝
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<title>yongsign</title>
<!-- datepicker 2020.02.11 지은 수정 -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,500,300,700'
	rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!-- <link rel='stylesheet' type='text/css' href='http://fian.my.id/Waves/static/waves.min.css?v=0.7.4'> -->
<link rel='stylesheet' type='text/css' href='css/rm-datepicker.css'>
<!-- ---------- -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/datepicker.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/common/form_check.js"></script>
<link rel="stylesheet" type="text/css" href="css\join.css" />
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/content.css">
<link rel="stylesheet" href="css/classic.css">
<link rel="stylesheet" href="css/classic.date.css">
<link rel="stylesheet" href="css/signbutton.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/signformrelocation.css">
<link rel="stylesheet" href="css/classic.time.css">
<link rel="stylesheet" href="css/style2.css" media="screen">
<link rel="stylesheet" href="css/materialFormStyles2.css">
<link rel="stylesheet" href="css/borderRightLeft.css" media="screen">
<script src="js/materialForm.js"></script>



<!--기본적인 body등의 css-->
<link rel="stylesheet" href="css/basicStyle.css" media="screen">
<link rel="stylesheet" href="css/navmid33.css">
	<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.infinitecarousel.js"></script>

<!--2020.01.03 추가 css 분리-->
<link rel="stylesheet" href="css/logform.css" media="screen">
	<!--2020.01.03 추가 javascript.가입기능 분리-->
<script type="text/javascript" src="js/signjs.js"></script>
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
<!----------------------------서브메뉴마우스오버기능-------------------------->
<link rel="stylesheet" type="text/css" href="css/subMenuMouseOver.css">
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
<!----------------------------회원가입스크립트랑 스타일여기까지------------------------------------>
<script>
		
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
	<!------------------------------ datepicker 2020.02.12 지은수정---------------------------->

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular.min.js"></script>
<!-- <script src="http://fian.my.id/Waves/static/waves.min.js?v=0.7.4"></script> -->
<script src="js/rm-datepicker.js"></script>
<script>
	var app = angular.module("myApp", [ "rmDatepicker" ]);

	/* Datepicker global configuration */
	app.config([ "rmDatepickerConfig", function(rmDatepickerConfig) {
		rmDatepickerConfig.mondayStart = true;
		rmDatepickerConfig.initState = "month";
	} ]);
</script>
<script>
	(function() {

		var app = angular.module("myApp");

		var MyCtrl = function($scope) {

			/* Datepicker local configuration */
			$scope.rmConfig1 = {
				mondayStart : false,
				initState : "month", /* decade || year || month */
				maxState : "decade",
				minState : "month",
				decadeSize : 12,
				monthSize : 42, /* "auto" || fixed nr. (35 or 42) */
				min : new Date('2000-11-21'),
				max : new Date('2023-11-21'),
				format : "yyyy-MM-dd" /* https://docs.angularjs.org/api/ng/filter/date */
			};

			$scope.oDate1 = new Date('2015-12-12');
			$scope.oDate2 = new Date();
		};
		app.controller("MyCtrl", [ '$scope', MyCtrl ]);

	}());

	// Init waves (OPTIONAL) :)
	// window.onload = Waves.init();
</script>
<!-- ---------------------------------------------------------------- -->
<!-- -----------------다음 주소 api ----------------------------------------->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- ------------------------------------------------------------------------- -->
<!-- -------------------------ID 중복확인에 대한 ajax--------------------------------- -->
<script type="text/javascript">
	$(document).ready(function(){
		$("#id").blur(function(){
			var idReg = /^[a-zA-z]+[a-zA-z0-9]{5,13}$/g;
			if(idReg.test(join.id.value))
				callAjax();
			else{
				$("#ajaxReturn").html("6~14자 사이의 영문 대소문자와 숫자만 사용가능합니다");
			}
		});
		$("#name").blur(function(){
			if(join.name.value.length!=0)
				$("#nameReturn").html("");
			else{     
				$("#nameReturn").html("이름을 입력해주세요.");
			}
		});
		
		$("#hp2").blur(function(){
			if(join.hp2.value.length!=0)
				$("#hpReturn").html("");
			else{
				$("#hpReturn").html("휴대폰번호를 입력하세요.");
			}
		});
		$("#hp3").blur(function(){
			if(join.hp3.value.length!=0)
				$("#hpReturn").html("");
			else{
				$("#hpReturn").html("휴대폰번호를 입력하세요.");
			}
		});
		$("#em1").blur(function(){
			if(join.em1.value.length!=0)
				$("#emReturn").html("");
			else{
				$("#emReturn").html("이메일을 입력하세요.");
			}
		});
	});
	
	function callAjax(){
		
		$.ajax({
			type:"post",
		url:"./confirmId.jsp",       
		data:{
	
			id:$('#id').val()
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
	
//	<!--js 파일 분리가 안돼서 어쩔수없이 이곳에 사용한 용병가입 창 js 파일 2020.01.09-->
	function matcheditsubmit()
	{
		
		var m_b_namelen=matchedit.m_b_name.value.length
		
		if(m_b_namelen<=0)
		{
			alert("이름을 입력하세요.");
			matchedit.m_b_name.focus();
		}else
		{
			document.matchedit.submit();
		}

	}
</script>
<!-- 비밀번호 체크 ajax -->
<script type="text/javascript">
function callAjax2(){
	if(join.pw.value!=join.pwch.value){
		$("#pwReturn").html("비밀번호가 일치하지 않습니다");
	}else{
		$("#pwReturn").html("");
	}
}
</script>
<script type="text/javascript">

</script>
<style>
a:focus, a:hover {
	color: white;
	text-decoration: underline;
}
</style>
<link rel="stylesheet" href="css/galboardstyle.css">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap" rel="stylesheet">
</head>
<body>
<jsp:useBean id="ml" class="dao.MatchlistDao" />
	<% 
	ArrayList<MatchlistDto> match = ml.select();
	int index = Integer.parseInt(request.getParameter("index"));
	String id = request.getParameter("id");
	String edit =request.getParameter("edit");
	int edit2=1;
	int acc=0;// 권한이 없을 때 0
	if(edit!=null)
		 edit2 =0;
	String del =request.getParameter("delete");
	for(int i=0;i<match.size();i++){
		if(id.equals(match.get(i).getMid())){
			acc++;
		}
		
	}
	
	%>
	
	%>

<%if (edit2==0){
	if(acc>=1&&!id.equals("null")){
		acc=0;
	%>
<header>
		<jsp:include page="<%=includeurl%>" />
	</header>
	<div id="mainleft">


		<div id="leftbanner">
			<div id="banner1">
				<img src="img/20191211.jpg" width="100%" height="100%" />
			</div>

			<div id="banner3">
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d25325.265446899888!2d127.02924799651784!3d37.492391917303266!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca5bed583f92d%3A0xc93c837d2875ade6!2z7ZKL7IK07J6l!5e0!3m2!1sko!2skr!4v1575961834128!5m2!1sko!2skr"
					width="100%" height="100%" frameborder="0" style="border: 0;"
					allowfullscreen=""></iframe>
			</div>
		</div>


	</div>
	<section id="main">


		<section id="mainright">
			<div id="matList">

				<div class="container" id="formOutterWrapper">

					<h3 class="h_tit" style="font-weight: normal;">매 치 신 청</h3>
					<div class="write_wrap">
						<h4 class="h_bar line">매치신청</h4>


						<div class="container" id="formInnerWrapper"
							style="padding-left: 0px;">
							<form name="matchedit" id="materialForm" class="form" method="post" action="matchsignInsert.jsp?fn=2&mno=<%=index%>" role="form" autocomplete="off"><div class="form-group">

									<div class="col-xs-4">
										<select name="m_b_branch" class=formInput>
											<option value="">지점선택</option>
											<option>동대문점</option>
											<option>안산 고잔점</option>
											<option>서수원점</option>
											<option>일산점</option>
											<option>대전 탄방점</option>
											<option>동대전점</option>
											<option>부산 가야점</option>
											<option>울산 남구점</option>
											<option>창원점</option>
											<option>전주 완산점</option>
											<option>울산 북구점</option>
											<option>GLOBAL ARENA(Japan)</option>
											<option>부산 북구점</option>
											<option>Seogwipo. JEJU</option>
											<option>가천대학교 운동장</option>
										</select>
									</div>
									<div class="col-xs-4">
										<select name="m_b_ground" class=formInput>
											<option value="">구장선택</option>
											<option>A구장</option>
											<option>B구장</option>
											<option>C구장</option>
										</select>
									</div>
								</div>
								<div class="form-group">

									<div class="col-xs-4">
										<label class="labels" for="m_b_name">신청자명</label> <input
											type="text" class="formInput" id="m_b_name" name="m_b_name"
											style="font-size: 18px;">
									</div>
									<div class="col-xs-1">
										<label class="labels" for="">연락처</label>
									</div>
									<div class="col-xs-1">
										<select class="formInput" id="m_b_tel1" name="m_b_tel1">
											<option value="">선택</option>
											<option>010</option>
											<option>011</option>
											<option>016</option>
											<option>017</option>
											<option>018</option>
											<option>019</option>
										</select>
									</div>
									<div style="float: left;">-</div>
									<div class="col-xs-1">
										<label class="labels" for="m_b_tel2"></label> <input
											type="text" class="formInput" id="m_b_tel2" name="m_b_tel2"
											style="font-size: 18px;">
									</div>
									<div style="float: left;">-</div>
									<div class="col-xs-1">
										<label class="labels" for="m_b_tel3"></label> <input
											type="text" class="formInput" id="m_b_tel3" name="m_b_tel3"
											style="font-size: 18px;">
									</div>
								</div>
								<div class="form-group">

									<div class="col-xs-1"
										style="font-size: 18px; width: 120px; letter-spacing: 4px;">

										매치일정</div>
									<div class="col-xs-3">
										<div ng-app="myApp" ng-controller="MyCtrl" class="container">
											<input rm-datepicker type="text" ng-model="oDate2"
												id="m_b_schedule" name="m_b_schedule"
												style="width: 233px; margin-left: -21px; height: 27px; margin-top: -1px; font-size: 17px;">
											<br> <br> <br>
										</div>
									</div>
									<div class="col-xs-4" style="margin-left: -25px;">
										<select class="formInput" id="m_b_time" name="m_b_time">
											<option value="">시간선택</option>
											<option>13:00 - 15:00</option>
											<option>16:00 - 18:00</option>
											<option>18:00 - 20:00</option>
											<option>20:00 - 22:00</option>
										</select>
									</div>
								</div>
								<div class="form-group">

									<div class="col-xs-4">
										<select name="m_b_type" id="m_b_type" class=formInput>
											<option value="">매치형태</option>
											<option>5 vs 5</option>
											<option>6 vs 6</option>
										</select>
									</div>
									<div class="col-xs-4">
										<select name="m_b_count" id="m_b_count" class=formInput>
											<option value="">신청가능팀</option>
											<option>1 팀</option>
											<option>2 팀</option>

										</select>
									</div>
								</div>
								<div class="form-group">

									<div class="col-xs-4">
										<select name="m_b_status" id="m_b_status" class=formInput>
											<option value="">마감여부</option>
											<option>가능</option>
											<option>마감</option>
										</select>
									</div>
									<div class="col-xs-4">
										<select name="m_b_level" id="m_b_level" class=formInput>
											<option value="">팀수준선택</option>
											<option>상</option>
											<option>중상</option>
											<option>중</option>
											<option>중하</option>
											<option>하</option>
										</select>
									</div>
								</div>
								<div class="form-group" style="height: 220px;">

									<div class="col-xs-4">
										<label class="labels" for="m_b_contents"></label>
										<textarea name="m_b_contents" id="m_b_contents"
											style="width: 730px; resize: none; height: 200px;"
											placeholder="내용을 입력하세요."></textarea>
									</div>

								</div>
						</div>
						
						<div class="btn_wrap">

							<a href="javascript:;" class="btn_big" onClick="matcheditsubmit()";>수정</a>
							<a href="match_apply.jsp"
								class="btn_big gray">취소</a>
						</div>

					</div>
					<input type="hidden" name="hidden" value="" />
					</form>

				</div>
				<script src="https://code.jquery.com/jquery-2.2.3.min.js" integrity="sha256-a23g1Nt4dtEYOj7bR+vTu7+T8VP13humZFBJNIYoEJo=" crossorigin="anonymous"></script>
				<script src="js/materialForm.js"></script>
			</div>

		</section>
		</section>
<%}
	else{
		out.println("<script>alert('접근 권한이 없습니다.'); history.back();</script>");
		acc=0;
	}}
else{

	if(acc>=1&&!id.equals("null")){
	acc=0;
	out.println("<script>alert('게시글이 삭제되었습니다.');location.href='match_apply.jsp';</script>");
	out.println(id+edit);
	ml.delete(index);

	}
	else
		out.println("<script>alert('접근 권한이 없습니다.'); history.back();</script>");
}

	%>
	<footer id="footer">
		<jsp:include page="Footer.jsp" />
	</footer>
</body>
</html>
