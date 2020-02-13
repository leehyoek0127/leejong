<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<!-- datepicker -->
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
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html>
<html lang="en">
<head>
<title>대관신청</title>
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="width=device-width, initial-scale=1" name="viewport">
<meta content="Chrissy Collins" name="author">
<meta content="A pure vanilla JS calendar by @chrisssycollins"
	name="description">
<link href="css/vanillaCalendar.css" rel="stylesheet">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/classic.css">
<link rel="stylesheet" href="css/classic.date.css">
<link rel="stylesheet" href="css/classic.time.css">
<link rel="stylesheet" href="css/orbit-1.2.3.css">
<link rel="stylesheet" href="css/reservation_body.css">
<link rel="stylesheet" href="css/demo-style.css">
<link rel="stylesheet" href="css/style2.css" media="screen">
<link rel="stylesheet" href="css/borderRightLeft.css" media="screen">
<link rel='stylesheet prefetch'
	href='https://fonts.googleapis.com/css?family=Roboto:100,300,400'>
<link rel="stylesheet" href="css/selectstyle.css">
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/form_check.js"></script>
<script type="text/javascript" src="jquery-1.5.1.min.js"></script>
<link rel="stylesheet" href="reservation_body.css">
<!----------------------------바디 스타일------------------------------------>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.infinitecarousel.js"></script>

<!--2020.01.03 추가 css 분리-->
<link rel="stylesheet" href="css/logform.css" media="screen">
<!--2020.01.03 추가 javascript.가입기능 분리-->
<script type="text/javascript" src="js/signjs.js"></script>
<!--기본적인 body등의 css-->
<link rel="stylesheet" href="css/basicStyle.css" media="screen">
<link rel="stylesheet" href="css/navmid33.css">
<!-- select box -->
<script src="js/selectindex.js"></script>
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
<link href="css/front.css" media="screen, projection" rel="stylesheet"
	type="text/css">
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

<script type="text/javascript">
	$(window).load(function() {
		$('#featured').orbit();
	});
</script>
<script>
	/*스크롤 내리면 메뉴 위치 이동하는 기능------따로빼면 작동xxxxxx*/
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
<SCRIPT type="text/javascript">
	
</SCRIPT>
<style>
.box {
	width: 450px;
}
</style>
<!-- datepicker -->
<style>
.container {
	max-width: 320px;
}

h1 {
	line-height: 15px;
}

input {
	width: 100%;
	height: 20px;
}
</style>
<!-- -------- -->
<style>
.inputGroup {
	background-color: #fff;
	display: block;
	margin: 10px 0;
	position: relative;
}

.inputGroup label {
	padding: 12px 30px;
	width: 100%;
	display: block;
	text-align: center;
	color: #3C454C;
	cursor: pointer;
	position: relative;
	z-index: 2;
	-webkit-transition: color 200ms ease-in;
	transition: color 200ms ease-in;
	overflow: hidden;
	letter-spacing: 4px;
}

.inputGroup label:before {
	width: 100%;
	height: 10px;
	border-radius: 50%;
	content: '';
	background-color: #5562eb;
	position: absolute;
	left: 50%;
	top: 50%;
	-webkit-transform: translate(-50%, -50%) scale3d(1, 1, 1);
	transform: translate(-50%, -50%) scale3d(1, 1, 1);
	-webkit-transition: all 300ms cubic-bezier(0.4, 0, 0.2, 1);
	transition: all 300ms cubic-bezier(0.4, 0, 0.2, 1);
	opacity: 0;
	z-index: -1;
}

.inputGroup label:after {
	width: 32px;
	height: 32px;
	content: '';
	border: 2px solid #D1D7DC;
	background-color: #fff;
	background-image:
		url("data:image/svg+xml,%3Csvg width='32' height='32' viewBox='0 0 32 32' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M5.414 11L4 12.414l5.414 5.414L20.828 6.414 19.414 5l-10 10z' fill='%23fff' fill-rule='nonzero'/%3E%3C/svg%3E ");
	background-repeat: no-repeat;
	background-position: 2px 3px;
	border-radius: 50%;
	z-index: 2;
	position: absolute;
	right: 30px;
	top: 50%;
	-webkit-transform: translateY(-50%);
	transform: translateY(-50%);
	cursor: pointer;
	-webkit-transition: all 200ms ease-in;
	transition: all 200ms ease-in;
}

.inputGroup input:checked ~ label {
	color: #fff;
}

.inputGroup input:checked ~ label:before {
	-webkit-transform: translate(-50%, -50%) scale3d(56, 56, 1);
	transform: translate(-50%, -50%) scale3d(56, 56, 1);
	opacity: 1;
}

.inputGroup input:checked ~ label:after {
	background-color: #54E0C7;
	border-color: #54E0C7;
}

.inputGroup input {
	width: 32px;
	height: 32px;
	-webkit-box-ordinal-group: 2;
	order: 1;
	z-index: 2;
	position: absolute;
	right: 30px;
	top: 50%;
	-webkit-transform: translateY(-50%);
	transform: translateY(-50%);
	cursor: pointer;
	visibility: hidden;
}

.inputGroup form {
	padding: 0 16px;
	max-width: 550px;
	margin: 50px auto;
	font-size: 18px;
	font-weight: 600;
	line-height: 36px;
}

body .inputGroup {
	background-color: #D1D7DC;
	font-family: 'Fira Sans', sans-serif;
}

.inputGroup, .inputGroup::before, .inputGroup::after {
	box-sizing: inherit;
}

.inputGroup {
	box-sizing: border-box;
}

code {
	background-color: #9AA3AC;
	padding: 0 8px;
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
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d25325.265446899888!2d127.02924799651784!3d37.492391917303266!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca5bed583f92d%3A0xc93c837d2875ade6!2z7ZKL7IK07J6l!5e0!3m2!1sko!2skr!4v1575961834128!5m2!1sko!2skr"
					width="100%" height="100%" frameborder="0" style="border: 0;"
					allowfullscreen=""></iframe>
			</div>
		</div>
	</div>



	<section id="main">
		<section id="mainright" style="margin-top: 60px;">
			<form name="join" id="materialForm" class="form" method="post"
							action="reservation.do?command=reservation_input" role="form"
							autocomplete="off">


				<!------------------------------ datepicker ---------------------------->
				<!-- 아랫줄 max-width:달력 가로길이 -->
				<div ng-app="myApp" ng-controller="MyCtrl" class="container"
					style="max-width: 1025px; margin-left: -12px;">
					<div rm-datepicker ng-model="oDate1" rm-config="rmConfig1"></div>
					<br>
					<div
						style="font-size: 18px; text-align: left; letter-spacing: 1px;">
						<input type="hidden" name="res_time" value="{{oDate1 | date: 'yyyy-MM-dd'}}">
						날짜선택 : {{oDate1 | date: 'yyyy-MM-dd'}}</div>
						<hr>
				</div>

				<script
					src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular.min.js"></script>
				<!-- <script src="http://fian.my.id/Waves/static/waves.min.js?v=0.7.4"></script> -->
				<script src="js/rm-datepicker.js"></script>
				<script>
					var app = angular.module("myApp", [ "rmDatepicker" ]);

					/* Datepicker global configuration */
					app.config([ "rmDatepickerConfig",
							function(rmDatepickerConfig) {
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

							$scope.oDate1 = new Date();
							$scope.oDate2 = new Date();
						};
						app.controller("MyCtrl", [ '$scope', MyCtrl ]);

					}());

					// Init waves (OPTIONAL) :)
					// window.onload = Waves.init();
				</script>
				<!-- ---------------------------------------------------------------- -->


				<div class="select_mate" data-mate-select="active"
					style="text-align: left; margin-top: -11px;">
					<select name="ground_name" onclick="return false;" id="">
						<option value="">구장</option>
						<option value="A구장">A구장</option>
						<option value="B구장">B구장</option>
						<option value="C구장">C구장</option>
					</select>

					<p class="selecionado_opcion" onclick="open_select(this)"></p>
					<span onclick="open_select(this)" class="icon_select_mate"><svg
							fill="#000000" height="24" viewBox="0 0 24 24" width="24"
							xmlns="http://www.w3.org/2000/svg">
    <path d="M7.41 7.84L12 12.42l4.59-4.58L18 9.25l-6 6-6-6z" />
    <path d="M0-.75h24v24H0z" fill="none" />
</svg></span>
					<div class="cont_list_select_mate">
						<ul class="cont_select_int">
						</ul>
					</div>
				</div>
				</div>

			
				<div class="cont_heg_50"></div>
				<div style="text-align: left; font-size: 17px; margin-top: 80px;"></div>
				<hr>
				<div class="inputGroup">
					<input type="checkbox" id="option1" class="checkboxsquere"
						name="res_time" value="08:00 AM ~ 10:00 AM"><label
						for="option1">08:00 AM ~ 10:00 AM</label>
				</div>
				<div class="inputGroup">
					<input type="checkbox" id="option2" class="checkboxsquere"
						name="res_time" value="10:00 AM ~ 12:00 PM"><label
						for="option2">10:00 AM ~ 12:00 PM</label>
				</div>
				<div class="inputGroup">
					<input type="checkbox" id="option3" class="checkboxsquere"
						name="res_time" value="12:00 PM ~ 2:00 PM"><label
						for="option3">12:00 PM ~ 02:00 PM</label>
				</div>
				<div class="inputGroup">
					<input type="checkbox" id="option4" class="checkboxsquere"
						name="res_time" value="02:00 PM ~ 04:00 PM"><label
						for="option4">02:00 PM ~ 04:00 PM</label>
				</div>
				<div class="inputGroup">
					<input type="checkbox" id="option5" class="checkboxsquere"
						name="res_time" value="04:00 PM ~ 06:00 PM"><label
						for="option5">04:00 PM ~ 06:00 PM</label>
				</div>
				<div class="inputGroup">
					<input type="checkbox" id="option6" class="checkboxsquere"
						name="res_time" value="06:00 PM ~ 08:00 PM"><label
						for="option6">06:00 PM ~ 08:00 PM</label>
				</div>
				<hr>

				<div style="text-align: right; font-size: 20px;    margin-top: -9px;">
					합계 <!--  <=payment_charge%> -->(원) 
				</div>
				<!-- 
				<input type="hidden" name="ground_no" value="ground_no %>" />
				<input type="hidden" name="id" value="id %>"" />
				-->		
			</form>
			</div>
				 
				<br>
				<hr style="margin-top: -10px;">
				<div class="depthButton"
				style="height: 45px; width: 114px; text-align: center; font-size: 18px; padding-top: 10px; letter-spacing: 3px; float:right;">
				결제</div>
			</div>
		</section>
	</section>
	<footer id="footer">
		<jsp:include page="Footer.jsp" />
	</footer>

</body>
</html>

