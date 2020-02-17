<%@page import="model.BranchDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//2020_01_02 수정부분
	String url = request.getServletPath();
	session.setAttribute("url", url);
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

<%ArrayList<BranchDto> BranchList = (ArrayList<BranchDto>) request.getAttribute("BranchList");%>
<!--  ArrayList<GroundDto> GroundList = (ArrayList<GroundDto>) request.getAttribute("GroundList");
-->

<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<title>풋살장리스트</title>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/datepicker.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/common/form_check.js"></script>
<link rel="stylesheet" type="text/css" href="css\find.css" />
<link rel="stylesheet" href="css/signbutton.css">
<link rel="stylesheet" href="css/find.css">
<link rel="stylesheet" href="css/classic.css">
<link rel="stylesheet" href="css/classic.date.css">
<link rel="stylesheet" href="css/classic.time.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/style2.css" media="screen">
<link rel="stylesheet" href="css/findid_materialFormStyles.css">
<link rel="stylesheet" href="css/borderRightLeft.css" media="screen">
<script src="js/materialForm.js"></script>
<!--기본적인 body등의 css-->
<link rel="stylesheet" href="css/basicStyle.css" media="screen">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.infinitecarousel.js"></script>

<!----------------------------서브메뉴마우스오버기능-------------------------->
<link rel="stylesheet" type="text/css" href="css/subMenuMouseOver.css">
<!----------------------------회원가입스크립트랑 스타일(따로 빼면 에러)-------------------------->
<script type='text/javascript'>
	$(function() {
		$('#forgot_username_link').tipsy({
			gravity : 'w'
		});
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
			if ($(e.target).parent("a.signin").length == 0) {
				$(".signin").removeClass("menu-open");
				$("fieldset#signin_menu").hide();
			}
		});
	});
</script>
<!----------------------------회원가입스크립트랑 스타일여기까지------------------------------------>
<script>
	$(function() {
		var shrinkHeader = 30;
		var shrinkhollow = 465;
		$(window).scroll(function() {
			var scroll = getCurrentScroll();
			if (scroll >= shrinkHeader) {
				$('#navtop').addClass('shrink');
			} else {
				$('#navtop').removeClass('shrink');
			}
			if (scroll >= shrinkhollow) {
				$('#navtop').addClass('shrinkhollow');
			} else {
				$('#navtop').removeClass('shrinkhollow');
			}
		});
		function getCurrentScroll() {
			return window.pageYOffset || document.documentElement.scrollTop;
		}
	});
</script>
<style>
.form-group {
	height: 70px;
}

.form-group input {
	float: left;
}

.button {
	
}
</style>
<style>
.signbutton {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 9px 36px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 18px;
	margin: 4px 2px;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
	height: 51px;
	width: 153px;
	border-radius: 5px;
}

.signbutton5:hover {
	background-color: #290080;
	color: white;
}

.signbutton5 {
	background-color: #2c5d88;
	color: white;
}

.signbuttoncancel:hover {
	background-color: #e0e0e0;
	color: #c8c8c8;
}

.signbuttoncancel {
	background-color: #e0e0e0;
	color: black;
}

<!--
-->
.signbutton2 {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 9px 36px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 18px;
	margin: 4px 2px;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
	height: 51px;
	width: 153px;
	border-radius: 5px;
}

.signbutton2_5:hover {
	background-color: #290080;
	color: white;
}

.signbutton2_5 {
	background-color: #bfd4e2;
	color: white;
}

.signbutton2cancel:hover {
	background-color: #e0e0e0;
	color: #c8c8c8;
}

.signbutton2cancel {
	background-color: #e0e0e0;
	color: white;
}
</style>
<!-- 드롭다운메뉴 -->
<style>
* {
	margin: 0;
	padding: 0;
	font-family: 'Roboto', sans-serif;
	box-sizing: border-box;
}

nav {
	position: absolute;
	width: 100%;
	background: #2a2a2a;
	font-size: 16px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 1);
}

/* first stage */
nav>ul {
	position: relative;
	display: flex;
	justify-content: center;
	width: 1200px;
	margin: 0 auto;
	padding: 0;
}

nav a {
	display: block;
	color: #fff;
	text-decoration: none;
}

nav ul li {
	color: #fff;
	list-style: none;
	transition: 0.5s;
}

nav>ul>li>a {
	padding: 15px 25px;
}

nav ul>li.submenu>a:after {
	position: relative;
	float: right;
	content: '';
	margin-left: 17px;
	margin-top: 13px;
	border-left: 7px solid transparent;
	border-right: 7px solid transparent;
	border-top: 10px solid #fff;
	border-bottom: 7px solid transparent;
}

nav ul>li.submenu:hover>a:after {
	margin-top: 7px;
	border-top: 7px solid transparent;
	border-bottom: 10px solid #fff;
}

nav>ul>li:hover {
	background: #2c5d88;
}

/* second stage (the mega-menu) */
nav ul.megamenu {
	position: absolute;
	display: flex;
	flex-wrap: wrap;
	width: 1200px;
	top: -9999px;
	left: 0;
	padding: 0px 98px 106px 128px;
	background: #fff;
	text-align: left;
	border-top: 5px solid #2c5d88;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.5);
	z-index: 1;
	margin-top: 0px;
}

nav ul li:hover ul.megamenu {
	top: 100%;
}

/* third stage (child-menus in the mega-menu) */
nav ul.megamenu ul {
	width: 25%;
	margin-bottom: 40px;
	color: #000;
	box-shadow: none;
}

nav ul.megamenu h4 {
	margin-bottom: 15px;
	text-transform: uppercase;
}

nav ul.megamenu ul li {
	display: block;
}

nav ul.megamenu ul li a {
	margin-top: 10px;
	transition: 0.5s;
	color: #000;
}

nav ul.megamenu ul li a:hover {
	color: #4096ee;
}
</style>
<!-- --------- -->
<!-- 한글글씨체적용 /아이디찾기 제목-->
<link rel="stylesheet" href="css/galboardstyle.css">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap" rel="stylesheet">
</head>
<!-- ---------------------------------------------------------------------------------------------- -->
<body>
	<header>
		<jsp:include page="<%=includeurl%>" />
	</header>
	<!-- 전체지점보기/내려오는메뉴 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
	<nav>
		<ul>
			<li class="submenu"><a href="#" title="Unser Produktsortiment" style="pointer-events: none; cursor: default; text-decoration: none; color: white; text-align: bold; font-weight: bold; font-size: 22px;">전체지점보기</a>
				<ul class="megamenu">
					<ul>
						<h4>서울, 경기 지역</h4>
						<li><a href="#" style="text-decoration: none; color: black;">동대문점</a></li>
						<li><a href="#" style="text-decoration: none; color: black;">서수원점</a></li>
						<li><a href="#" style="text-decoration: none; color: black;">안산 고잔점</a></li>
						<li><a href="#" style="text-decoration: none; color: black;">일산점</a></li>
					</ul>
					<ul>
						<h4>대전, 충청 지역</h4>
						<li><a href="#" style="text-decoration: none; color: black;">대전 탄방점</a></li>
						<li><a href="#" style="text-decoration: none; color: black;">동대전점</a></li>
					</ul>
					<ul>
						<h4>부산, 경상 지역</h4>
						<li><a href="#" style="text-decoration: none; color: black;">부산 가야점</a></li>
						<li><a href="#" style="text-decoration: none; color: black;">부산 북구점</a></li>
						<li><a href="#" style="text-decoration: none; color: black;">울산 남구점</a></li>
						<li><a href="#" style="text-decoration: none; color: black;">울산 북구점</a></li>
						<li><a href="#" style="text-decoration: none; color: black;">창원점</a></li>
					</ul>
					<ul>
						<h4>광주, 전라 지역</h4>
						<li><a href="#" style="text-decoration: none; color: black;">전주 완산점</a></li>
					</ul>
					<ul>
						<h4>제주 지역</h4>
						<li><a href="#" style="text-decoration: none; color: black;">가천대학교 운동장</a></li>
						<li><a href="#" style="text-decoration: none; color: black;">GLOBAL ARENA (Japan)</a></li>
						<li><a href="#" style="text-decoration: none; color: black;">Seogwipo, JEJU</a></li>
					</ul>
				</ul></li>
		</ul>
	</nav>
	<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
	<div style="margin-top: 80px;"></div>
	<div id="mainleft">


		<div id="leftbanner">
			<div id="banner1">
				<img src="img/20191211.jpg" width="100%" height="100%" />
			</div>

			<div id="banner3">
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d25325.265446899888!2d127.02924799651784!3d37.492391917303266!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca5bed583f92d%3A0xc93c837d2875ade6!2z7ZKL7IK07J6l!5e0!3m2!1sko!2skr!4v1575961834128!5m2!1sko!2skr" width="100%" height="100%" frameborder="0" style="border: 0;" allowfullscreen=""></iframe>
			</div>
		</div>


	</div>
	<section id="main">


		<section id="mainright">
			<div id="matList">
				<div class="container" id="formOutterWrapper">
					<center>
						<div class="writeboardtitle" style="text-align: center; font-size: 45px; margin-bottom: 70px;">풋살장 목록</div>
					</center>

					<table>
						<%
							if (BranchList != null) {
						%>
						<tbody>
							<%
								for (int i = 0; i < BranchList.size(); i++) {
							%>
							<tr>
								<td rowspan="4"><img src="img/ground1.jpg" style="width: 430px; height: 270px;"></td>
								<td style="color: #1b4367; width: 675px; height: 80px; font-weight: bold; font-size: 30px; padding-left: 20px;">
									<!-- 지점이름 --> <%=BranchList.get(i).getBranch_name()%>
									<hr style="width: 720px; border-top: 2.3px solid #254765;">
								</td>
							<tr>
								<td style="padding-left: 20px; font-size: 17px;"><img src="img/iconlocation.png" style="padding-right: 12px;"> <!-- 지점주소 --><%=BranchList.get(i).getBranch_location()%></td>
							</tr>
							<tr>
								<td style="padding-left: 20px; font-size: 17px; letter-spacing: 2px;"><img src="img/iconphone.png" style="padding-right: 12px;"> <!-- 지점전화번호 --><%=BranchList.get(i).getBranch_tel()%></td>
							</tr>
							<tr>
								<td><input type="button" value="예약하기" class="signbutton signbutton5" style="float: left; margin-left: 200px;" onclick="script: location.href='reservation.jsp'"> <input type="button" value="지점소개" onclick="script: location.href='branchdetail.jsp'" class="signbutton2 signbutton2_5" style="float: left;"></td>
							</tr>
						</tbody>
					
					<hr>
					<%
						}
					%>
					<%
						}
					%>
					</table>
				</div>
				<script src="https://code.jquery.com/jquery-2.2.3.min.js" integrity="sha256-a23g1Nt4dtEYOj7bR+vTu7+T8VP13humZFBJNIYoEJo=" crossorigin="anonymous"></script>
				<script src="js/materialForm.js"></script>



			</div>

		</section>


	</section>
	<footer id="footer">
		<jsp:include page="Footer.jsp" />
	</footer>
</body>
</html>
