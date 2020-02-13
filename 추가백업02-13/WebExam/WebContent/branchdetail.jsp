<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--  
	ArrayList<BranchDto> BranchList = (ArrayList<BranchDto>) request.getAttribute("BranchList");
	ArrayList<GroundDto> GroundList = (ArrayList<GroundDto>) request.getAttribute("GroundList");
-->
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

<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<title>지점소개</title>
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

<!-- --------- -->
<!-- 한글글씨체적용 /아이디찾기 제목-->
<link rel="stylesheet" href="css/galboardstyle.css">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap" rel="stylesheet">

<!-- 이미지 슬라이더 -->
<style>
* {
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
}

html, body {
	height: 100%;
}

body {
	margin: 0;
	font: 16px/1.3 sans-serif;
}

/*
PURE RESPONSIVE CSS3 SLIDESHOW GALLERY by Roko C. buljan
http://stackoverflow.com/a/34696029/383904
*/
.CSSgal {
	position: relative;
	overflow: hidden;
	height: 100%; /* Or set a fixed height */
}

/* SLIDER */
.CSSgal .slider {
	height: 100%;
	white-space: nowrap;
	font-size: 0;
	transition: 0.8s;
}

/* SLIDES */
.CSSgal .slider>* {
	font-size: 1rem;
	display: inline-block;
	white-space: normal;
	vertical-align: top;
	height: 100%;
	width: 100%;
	background: none 50% no-repeat;
	background-size: cover;
}

/* PREV/NEXT, CONTAINERS & ANCHORS */
.CSSgal .prevNext {
	position: absolute;
	z-index: 1;
	top: 50%;
	width: 100%;
	height: 0;
}

.CSSgal .prevNext>div+div {
	visibility: hidden; /* Hide all but first P/N container */
}

.CSSgal .prevNext a {
	background: #fff;
	position: absolute;
	width: 60px;
	height: 60px;
	line-height: 60px; /* If you want to place numbers */
	text-align: center;
	opacity: 0.7;
	-webkit-transition: 0.3s;
	transition: 0.3s;
	-webkit-transform: translateY(-50%);
	transform: translateY(-50%);
	left: 0;
}

.CSSgal .prevNext a:hover {
	opacity: 1;
}

.CSSgal .prevNext a+a {
	left: auto;
	right: 0;
}

/* NAVIGATION */
.CSSgal .bullets {
	position: absolute;
	z-index: 2;
	bottom: 0;
	padding: 10px 0;
	width: 100%;
	text-align: center;
}

.CSSgal .bullets>a {
	display: inline-block;
	width: 30px;
	height: 30px;
	line-height: 30px;
	text-decoration: none;
	text-align: center;
	background: rgba(255, 255, 255, 1);
	-webkit-transition: 0.3s;
	transition: 0.3s;
}

.CSSgal .bullets>a+a {
	background: rgba(255, 255, 255, 0.5); /* Dim all but first */
}

.CSSgal .bullets>a:hover {
	background: rgba(255, 255, 255, 0.7) !important;
}

/* NAVIGATION BUTTONS */
/* ALL: */
.CSSgal>s:target ~ .bullets>* {
	background: rgba(255, 255, 255, 0.5);
}
/* ACTIVE */
#s1:target ~ .bullets>*:nth-child(1) {
	background: rgba(255, 255, 255, 1);
}

#s2:target ~ .bullets>*:nth-child(2) {
	background: rgba(255, 255, 255, 1);
}

#s3:target ~ .bullets>*:nth-child(3) {
	background: rgba(255, 255, 255, 1);
}

#s4:target ~ .bullets>*:nth-child(4) {
	background: rgba(255, 255, 255, 1);
}
/* More slides? Add here more rules */

/* PREV/NEXT CONTAINERS VISIBILITY */
/* ALL: */
.CSSgal>s:target ~ .prevNext>* {
	visibility: hidden;
}
/* ACTIVE: */
#s1:target ~ .prevNext>*:nth-child(1) {
	visibility: visible;
}

#s2:target ~ .prevNext>*:nth-child(2) {
	visibility: visible;
}

#s3:target ~ .prevNext>*:nth-child(3) {
	visibility: visible;
}

#s4:target ~ .prevNext>*:nth-child(4) {
	visibility: visible;
}
/* More slides? Add here more rules */

/* SLIDER ANIMATION POSITIONS */
#s1:target ~ .slider {
	transform: translateX(0%);
	-webkit-transform: translateX(0%);
}

#s2:target ~ .slider {
	transform: translateX(-100%);
	-webkit-transform: translateX(-100%);
}

#s3:target ~ .slider {
	transform: translateX(-200%);
	-webkit-transform: translateX(-200%);
}

#s4:target ~ .slider {
	transform: translateX(-300%);
	-webkit-transform: translateX(-300%);
}
/* More slides? Add here more rules */

/* YOU'RE THE DESIGNER! 
   ____________________
   All above was mainly to get it working :)
   CSSgal CUSTOM STYLES / OVERRIDES HERE: */
.CSSgal {
	color: #fff;
	text-align: center;
}

.CSSgal .slider h2 {
	margin-top: 40vh;
	font-weight: 200;
	letter-spacing: -0.06em;
	word-spacing: 0.2em;
	font-size: 3em;
}

.CSSgal a {
	border-radius: 50%;
	margin: 0 3px;
	color: rgba(0, 0, 0, 0.8);
	text-decoration: none;
}
</style>
<!-- ---------- -->
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
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d25325.265446899888!2d127.02924799651784!3d37.492391917303266!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca5bed583f92d%3A0xc93c837d2875ade6!2z7ZKL7IK07J6l!5e0!3m2!1sko!2skr!4v1575961834128!5m2!1sko!2skr" width="100%" height="100%" frameborder="0" style="border: 0;" allowfullscreen=""></iframe>
			</div>
		</div>


	</div>
	<section id="main">


		<section id="mainright">
			<div id="matList">
				<div class="container" id="formOutterWrapper">
					<center>
						<div class="writeboardtitle" style="text-align: center; font-size: 45px; margin-bottom: 70px;">시설 상세정보</div>
					</center>
					<!-- @@@@@@@@@@@@@@이미지 슬라이더@@@@@@@@@@@@@ -->
					<div class="CSSgal">

						<!-- Don't wrap targets in parent -->
						<s id="s1"></s> <s id="s2"></s> <s id="s3"></s> <s id="s4"></s>

						<div class="slider">
							<div>
								<img src="img/ground1.jpg" style="width: 1170px; height: 448px;">
							</div>
							<div>
								<img src="img/branch_thumb_1.jpg" style="width: 1170px; height: 448px;">
							</div>
							<div>
								<img src="img/branch_thumb_2.jpg" style="width: 1170px; height: 448px;">
							</div>
							<div>
								<img src="img/branch_thumb_3.jpg" style="width: 1170px; height: 448px;">
							</div>
						</div>

						<div class="prevNext">
							<div>
								<a href="#s4"></a><a href="#s2"></a>
							</div>
							<div>
								<a href="#s1"></a><a href="#s3"></a>
							</div>
							<div>
								<a href="#s2"></a><a href="#s4"></a>
							</div>
							<div>
								<a href="#s3"></a><a href="#s1"></a>
							</div>
						</div>

						<div class="bullets">
							<a href="#s1">1</a> <a href="#s2">2</a> <a href="#s3">3</a> <a href="#s4">4</a>
						</div>

					</div>
					<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->

					<table>
						<tbody>
							<tr>
								<td colsplan="2" style="height: 100px; font-size: 35px; font-weight: bold; color: navy;">레드폭 크레이지 풋살장</td>
							</tr>
							<tr>
								<td colsplan="2" style="font-size: 18px; font-weight: bold;"><img src="img/iconlocation.png" style="width: 24px; height: 24px;margin-right:10px;">지점주소</td>
							</tr>
							<tr>
								<td colsplan="2" style="height: 50px; font-size: 18px;">서울특별시 동대구 가나다동 마바사길 154-988</td>
							</tr>
							<tr>
								<td colsplan="2" style="font-size: 18px; font-weight: bold;"><img src="img/iconphone.png" style="width: 24px; height: 24px;margin-right:10px;">문의전화</td>
							</tr>
							<tr>
								<td colsplan="2" style="height: 50px; font-size: 18px;">010-6252-1007 / 010-9505-6646 (10:00 ~ 24:00)</td>
							</tr>

							<tr>
								<td style="float: left; margin-right: 18px;"><pre style="font-size: 17px; font-weight: bold; width: 650px; height: 520px; padding: 25px 25px 25px 25px;">
<label style="font-size: 20px; font-weight: bold; color: #a7a7a7d9;">■ 구장안내</label>

A 구장 : (구장크기)(추천인원)
B 구장 : (17m X 12m)(4 VS 4)
C 구장 : (40m X 20m)(8 VS 8)

<label style="font-size: 20px; font-weight: bold; color: #a7a7a7d9;">■ 편의시설</label>
<!-- 있음아이콘 -->
<img src="https://s3.ap-northeast-2.amazonaws.com/filesground/img/icons/new/svg/ju.svg" alt="주차장" style="width: 98px; height: 98px; float: left;"><img src="https://s3.ap-northeast-2.amazonaws.com/filesground/img/icons/new/svg/temp.svg" alt="냉난방" style="width: 98px; height: 98px; float: left;"><img src="https://s3.ap-northeast-2.amazonaws.com/filesground/img/icons/new/svg/sh.svg" alt="샤워실" style="width: 98px; height: 98px; float: left;"><img src="https://s3.ap-northeast-2.amazonaws.com/filesground/img/icons/new/svg/ballrent.svg" alt="공대여" style="width: 98px; height: 98px; float: left;"><img src="https://s3.ap-northeast-2.amazonaws.com/filesground/img/icons/new/svg/vestrent.svg" alt="팀조끼대여" style="width: 98px; height: 98px; float: left;"><img src="https://s3.ap-northeast-2.amazonaws.com/filesground/img/icons/new/svg/shoesrent.svg" alt="풋살화대여" style="width: 98px; height: 98px; float: left;">
<!-- 없음아이콘 -->
<img src="https://s3.ap-northeast-2.amazonaws.com/filesground/img/icons/new/svg/jux.svg" alt="주차장x" style="width: 98px; height: 98px; float: left;"><img src="https://s3.ap-northeast-2.amazonaws.com/filesground/img/icons/new/svg/tempx.svg" alt="냉난방x" style="width: 98px; height: 98px; float: left;"><img src="https://s3.ap-northeast-2.amazonaws.com/filesground/img/icons/new/svg/shx.svg" alt="샤워실x" style="width: 98px; height: 98px; float: left;"><img src="https://s3.ap-northeast-2.amazonaws.com/filesground/img/icons/new/svg/ballrentx.svg" alt="공대여x" style="width: 98px; height: 98px; float: left;"><img src="https://s3.ap-northeast-2.amazonaws.com/filesground/img/icons/new/svg/vestrentx.svg" alt="팀조끼대여x" style="width: 98px; height: 98px; float: left;"><img src="https://s3.ap-northeast-2.amazonaws.com/filesground/img/icons/new/svg/shoesrentx.svg" alt="풋살화대여x" style="width: 98px; height: 98px; float: left;">
</pre></td>
								<td style="float: left;"><pre style="font-size: 18px; font-weight: bold; width: 525px; height: 520px; padding: 25px 25px 25px 25px;">
<label style="font-size: 20px; font-weight: bold; color: #a7a7a7d9;">■ 예약비용 </label>

▷ A구장 (실외) (40m X 20m)
<div style="font-size: 15px;">평일주간 (10:00~18:00) : 40,000원 (1시간)
평일야간 (18:00~24:00) : 45,000원 (1시간)
주말, 공휴일주간 (10:00~18:00) : 45,000원 (1시간)
주말, 공휴일 야간(18:00~24:00) : 50,000원 (1시간)
</div>
▷ B구장 (실외) (40m X 20m)
<div style="font-size: 15px;">평일주간 (10:00~18:00) : 40,000원 (1시간)
평일야간 (18:00~24:00) : 45,000원 (1시간)
주말, 공휴일주간 (10:00~18:00) : 45,000원 (1시간)
주말, 공휴일 야간(18:00~24:00) : 50,000원 (1시간)
</div>
▷ C구장 (실외) (40m X 20m)
<div style="font-size: 15px;">평일주간 (10:00~18:00) : 40,000원 (1시간)
평일야간 (18:00~24:00) : 45,000원 (1시간)
주말, 공휴일주간 (10:00~18:00) : 45,000원 (1시간)
주말, 공휴일 야간(18:00~24:00) : 50,000원 (1시간)
</div>
</pre></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td colsplan="2"><label style="font-size: 20px; font-weight: bold; color: #a7a7a7d9;">■ 위치안내</label> <br> <br> <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d202400.053578974!2d126.80702748563169!3d37.56682259306878!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x6ac57e7e24d7bf1d!2z66CI65Oc7Y-t7Iqk7LyA7J207KeA7ZKL7IK0!5e0!3m2!1sko!2skr!4v1581495766937!5m2!1sko!2skr" width="1200" height="550" frameborder="0" style="border: 0;" allowfullscreen=""></iframe></td>
							</tr>
							<tr>
								<td style="word-break: break-all; font-size: 20px; float: left; margin-right: 60px;"><pre style="width: 570px; height: 520px; overflow: hidden; padding: 25px 25px 5px 25px;">	
<label style="font-size: 20px; font-weight: bold; margin-top: -24px; color: #a7a7a7d9;">■ 안내사항/이용규칙</label>
< 주차 상세 >
- 지상/지하주차장 5대 가능 
- 2시간 1,000원 (1대 당 / 유료)
- 현금만 가능!!!

< 대여 상세 >
- 공, 팀 조끼 무상 대여

< 물, 음료 >
- 정수기 사용 가능

** 풋살장 예약시간 준수

** 풋살장 내 취사, 흡연 및 음주행위,
지나친 소음행위 금지(적발 시 이용불가)

** 시설 사용 후 정리정돈 ( 쓰레기 반드시 처리 )

** 고의 및 과실로 인한 시설물 훼손 및 파손시
사용자가 배상하며 경기중 부상은 본인이 책임집니다.

** 잔디보호와 부상방지를 위하여 스터드가 있는 축구화(SG, FG, HG, AG)는
착용이 금지되며 풋살화(TF)만 착용 가능 합니다.
</pre></td>
								<td style="word-break: break-all; font-size: 20px; float: left;"><pre style="width: 570px; height: 520px; overflow: hidden; padding: 25px 25px 25px 25px;">
<label style="font-size: 20px; font-weight: bold; margin-top: -10px; color: #a7a7a7d9;">■ 환불규정</label>

- 이용 5일 전까지 : 100% 환불
- 4일 전 ~ 3일 전: 50% 환불
- 2일 전 ~ 대관 당일 : 환불 불가

** 해당 환불 규정은 구장 이용 날짜(대관 날짜)를 기준으로 합니다.

** 날짜변경은 상단 환불 규정 기준 100% 환불인 경우에만 가능합니다.
그 외에는 변경이 불가능합니다. (1회 한정)

** 1회 이상 날짜변경된 예약건은 환불 처리가 불가능 합니다.

** 다음과 같은 경우에는 <b style="color: #ff3c28;">상단 규정</b>대로만 처리되니
구장 예약은 <b style="color: #4285f4;">신중</b>하게 진행해주시길 바랍니다.

-> 이용자의 사정으로 예약된 날짜에 구장 이용을 하지 못하는 경우
-> 구장, 날짜, 시간 등을 실수로 잘못 선택하였을 경우
-> 단순변심으로 인하여 환불 혹은 날짜 / 시간변경을 요청하는 경우
					</pre></td>
							</tr>
						</tbody>
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
