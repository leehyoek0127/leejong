<%@page import="Qna.QnaDto"%>
<%@page import="Qna.QnaDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="dao" class="Qna.QnaDao"/>
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
<title>qna 게시글표시</title>
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
				<form action="deletejump.jsp">
				<% 
				
				String qSecretNum = request.getParameter("qSecretNum"); 
				String qNo = request.getParameter("qNo");
				session.setAttribute("qSecretNum", qSecretNum);
				session.setAttribute("qNo",qNo);
				%>
				
					<center>게시물의 비밀번호를 입력하세요.</center>
					<input type="password" name="qSecretNum_input" id="qSecretNum_input" />
					<br> <input type="submit" value="삭제" onclick="script: location.href='deletejump.jsp?qSecretNum='+'<%=qSecretNum%>'+'&qNo='+'<%=qNo %>';" />
					</form>
				</div>

				<br> <br> <br> <br>
			</div>
		</section>
	</section>

	<footer id="footer">
		<jsp:include page="Footer.jsp" />
	</footer>
	<jsp:include page="quickbar.jsp" />
</body>
</html>
