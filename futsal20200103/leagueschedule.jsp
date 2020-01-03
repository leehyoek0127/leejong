<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@page import="java.io.*"%>
<%
	request.setCharacterEncoding("euc-kr");
	String pw=(String)session.getAttribute("pw");
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
%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html>
<html lang="en">
 <head> <title>leagueranking</title>
  <meta charset="UTF-8">
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="width=device-width, initial-scale=1" name="viewport">
	<meta content="Chrissy Collins" name="author">
    <link rel="stylesheet" href="css/classic.css">
	<link rel="stylesheet" href="css/classic.date.css">
	<link rel="stylesheet" href="css/classic.time.css">
	<link rel="stylesheet" href="orbit-1.2.3.css">
	<link rel="stylesheet" href="css/demo-style.css">
	<link rel="stylesheet" href="css/style2.css" media="screen">
	<link rel="stylesheet" href="css/borderRightLeft.css" media="screen">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="img/png" href="img/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/leaguetableutil.css">
	<link rel="stylesheet" type="text/css" href="css/leaguetablemain.css">
<!--===============================================================================================-->
	<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Roboto:100,300,400'>
    <link rel="stylesheet" href="css/selectstyle.css">
	<script type="text/javascript" src="/js/jquery.min.js"></script>
	<script type="text/javascript" src="/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/js/datepicker.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript" src="/js/form_check.js"></script>
	<script type="text/javascript" src="jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="jquery.orbit-1.2.3.min.js"></script>
<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="js/leaguetablemain.js"></script>
	<script src="js/login.js"></script>

	<!-- select box -->
	<script src="js/selectindex.js"></script>

	<link rel="stylesheet" href="css/leaguescheduleCss.css" media="screen">
<!--기본적인 body등의 css-->
	<link rel="stylesheet" href="css/basicStyle.css" media="screen">
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
	

  <script>
	function schedulebutton(){
		window. open("leaguepopup.html", "popup01", "width=500, height=600");
		}
  </script>

 </head>
 <body>
	<header>
		<jsp:include page="<%=includeurl%>" />
	</header>



 
<div id="mainleft">
<div id="leftbanner">
<div id="banner1"><img src="img/20191211.png" width="100%" height="100%"/></div>
<div id="banner3">
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d25325.265446899888!2d127.02924799651784!3d37.492391917303266!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca5bed583f92d%3A0xc93c837d2875ade6!2z7ZKL7IK07J6l!5e0!3m2!1sko!2skr!4v1575961834128!5m2!1sko!2skr" width="100%" height="100%" frameborder="0" style="border:0;" allowfullscreen=""></iframe></div></div></div>



<section id="main">
<section id="mainright">
<div id="section_1" align="left">
<div id="sec1title" align="right">
<div class="cont_heg_50"></div>
<div class="cont_select_center">

<div class="select_mate" data-mate-select="active" >
<select name="" onclick="return false;" id="">
<option value=""  >전체일정</option>
<option value="1">12월</option>
<option value="2" >11월</option>
<option value="2" >10월</option>
<option value="2" >9월</option>
<option value="2" >8월</option>
<option value="2" >7월</option>
<option value="2" >6월</option>
<option value="2" >5월</option>
<option value="2" >4월</option>
<option value="2" >3월</option>
<option value="2" >2월</option>
<option value="2" >1월</option>
  </select>
<p class="selecionado_opcion"  onclick="open_select(this)" ></p><span onclick="open_select(this)" class="icon_select_mate" ><svg fill="#000000" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
    <path d="M7.41 7.84L12 12.42l4.59-4.58L18 9.25l-6 6-6-6z"/>
    <path d="M0-.75h24v24H0z" fill="none"/>
</svg></span>
<div class="cont_list_select_mate">
  <ul class="cont_select_int">  </ul> 
</div>
  </div>
</div>
</div>
<!-- 여기부터 테이블 -->
<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
					<div class="table" align="center">

						<div class="row header">
							<div class="cell">
								경기날짜/시간
							</div>
							<div class="cell">
								팀이름1
							</div>
							<div class="cell">
								결과
							</div>
							<div class="cell">
								팀이름2
							</div>
							<div class="cell">
								경기정보
							</div>
						</div>

						<div class="row">
							<div class="cell" data-title="경기날짜/시간">
								2019.10.05(토) 20:00<br>
								AIA Vitality Arena (A구장)
							</div>
							<div class="cell" data-title="팀이름1">
								FC BTC7 <div class="teamlogo"><img src="img/teamlogo1.png"></div>
							</div>
							<div class="cell" data-title="결과">
								0 : 3
							</div>
							<div class="cell" data-title="팀이름2">
								FC BTC7 <div class="teamlogo"><img src="img/teamlogo2.png"></div>
							</div>
							<div class="cell" data-title="경기정보">
								<div class="pressDown" onClick="schedulebutton()">경기정보</a></div>
							</div>
						</div>

						<div class="row">
							<div class="cell" data-title="경기날짜/시간">
								2019.10.05(토) 20:00<br>
								AIA Vitality Arena (A구장)
							</div>
							<div class="cell" data-title="팀이름1">
							FC BTC7 <div class="teamlogo"><img src="img/teamlogo1.png"></div>
							</div>
							<div class="cell" data-title="결과">
								0 : 3
							</div>
							<div class="cell" data-title="팀이름2">
								FC BTC7 <div class="teamlogo"><img src="img/teamlogo2.png"></div>
							</div>
							<div class="cell" data-title="경기정보">
								<div class="pressDown"><a href="leagueschedule.html" style="color: white">경기정보</a></div>
							</div>
						</div>

						<div class="row">
							<div class="cell" data-title="경기날짜/시간">
								2019.10.05(토) 20:00<br>
								AIA Vitality Arena (A구장)
							</div>
							<div class="cell" data-title="팀이름1">
								FC BTC7 <div class="teamlogo"><img src="img/teamlogo1.png"></div>
							</div>
							<div class="cell" data-title="결과">
								0 : 3
							</div>
							<div class="cell" data-title="팀이름2">
								FC BTC7 <div class="teamlogo"><img src="img/teamlogo2.png"></div>
							</div>
							<div class="cell" data-title="경기정보">
								<div class="pressDown"><a href="leagueschedule.html" style="color: white">경기정보</a></div>
							</div>
						</div>

						<div class="row">
							<div class="cell" data-title="경기날짜/시간">
								2019.10.05(토) 20:00<br>
								AIA Vitality Arena (A구장)
							</div>
							<div class="cell" data-title="팀이름1">
								FC BTC7 <div class="teamlogo"><img src="img/teamlogo1.png"></div>
							</div>
							<div class="cell" data-title="결과">
								0 : 3
							</div>
							<div class="cell" data-title="팀이름2">
								FC BTC7 <div class="teamlogo"><img src="img/teamlogo2.png"></div>
							</div>
							<div class="cell" data-title="경기정보">
								<div class="pressDown"><a href="leagueschedule.html" style="color: white">경기정보</a></div>
							</div>
						</div>

						<div class="row">
							<div class="cell" data-title="경기날짜/시간">
								2019.10.05(토) 20:00<br>
								AIA Vitality Arena (A구장)
							</div>
							<div class="cell" data-title="팀이름1">
								FC BTC7 <div class="teamlogo"><img src="img/teamlogo1.png"></div>
							</div>
							<div class="cell" data-title="결과">
								0 : 3
							</div>
							<div class="cell" data-title="팀이름2">
								FC BTC7 <div class="teamlogo"><img src="img/teamlogo2.png"></div>
							</div>
							<div class="cell" data-title="경기정보">
								<div class="pressDown"><a href="leagueschedule.html" style="color: white">경기정보</a></div>
							</div>
						</div>

						<div class="row">
							<div class="cell" data-title="경기날짜/시간">
								2019.10.05(토) 20:00<br>
								AIA Vitality Arena (A구장)
							</div>
							<div class="cell" data-title="팀이름1">
								FC BTC7 <div class="teamlogo"><img src="img/teamlogo1.png"></div>
							</div>
							<div class="cell" data-title="결과">
								0 : 3
							</div>
							<div class="cell" data-title="팀이름2">
								FC BTC7 <div class="teamlogo"><img src="img/teamlogo2.png"></div>
							</div>
							<div class="cell" data-title="경기정보">
								<div class="pressDown"><a href="leagueschedule.html" style="color: white">경기정보</a></div>
							</div>
						</div>

						<div class="row">
							<div class="cell" data-title="경기날짜/시간">
								2019.10.05(토) 20:00<br>
								AIA Vitality Arena (A구장)
							</div>
							<div class="cell" data-title="팀이름1">
								FC BTC7 <div class="teamlogo"><img src="img/teamlogo1.png"></div>
							</div>
							<div class="cell" data-title="결과">
								0 : 3
							</div>
							<div class="cell" data-title="팀이름2">
								FC BTC7 <div class="teamlogo"><img src="img/teamlogo2.png"></div>
							</div>
							<div class="cell" data-title="경기정보">
								<div class="pressDown"><a href="leagueschedule.html" style="color: white">경기정보</a></div>
							</div>
						</div>

						<div class="row">
							<div class="cell" data-title="경기날짜/시간">
								2019.10.05(토) 20:00<br>
								AIA Vitality Arena (A구장)
							</div>
							<div class="cell" data-title="팀이름1">
								FC BTC7 <div class="teamlogo"><img src="img/teamlogo1.png"></div>
							</div>
							<div class="cell" data-title="결과">
								0 : 3
							</div>
							<div class="cell" data-title="팀이름2">
								FC BTC7 <div class="teamlogo"><img src="img/teamlogo2.png"></div>
							</div>
							<div class="cell" data-title="경기정보">
								<div class="pressDown"><a href="leagueschedule.html" style="color: white">경기정보</a></div>
							</div>
						</div>

						<div class="row">
							<div class="cell" data-title="경기날짜/시간">
								2019.10.05(토) 20:00<br>
								AIA Vitality Arena (A구장)
							</div>
							<div class="cell" data-title="팀이름1">
								FC BTC7 <div class="teamlogo"><img src="img/teamlogo1.png"></div>
							</div>
							<div class="cell" data-title="결과">
								0 : 3
							</div>
							<div class="cell" data-title="팀이름2">
								FC BTC7 <div class="teamlogo"><img src="img/teamlogo2.png"></div>
							</div>
							<div class="cell" data-title="경기정보">
								<div class="pressDown"><a href="leagueschedule.html" style="color: white">경기정보</a></div>
							</div>
						</div>

						<div class="row">
							<div class="cell" data-title="경기날짜/시간">
								2019.10.05(토) 20:00<br>
								AIA Vitality Arena (A구장)
							</div>
							<div class="cell" data-title="팀이름1">
								FC BTC7 <div class="teamlogo"><img src="img/teamlogo1.png"></div>
							</div>
							<div class="cell" data-title="결과">
								0 : 3
							</div>
							<div class="cell" data-title="팀이름2">
								FC BTC7 <div class="teamlogo"><img src="img/teamlogo2.png"></div>
							</div>
							<div class="cell" data-title="경기정보">
								<div class="pressDown"><a href="leagueschedule.html" style="color: white">경기정보</a></div>
							</div>
						</div>




					</div>
			</div>
		</div>
	</div>







<!-- 여기까지 테이블-->
</div>

</section>
</section>

  <img src="img/bot.png">
 </body>
</html>

