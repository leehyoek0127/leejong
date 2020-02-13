<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

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
<title>sign</title>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/datepicker.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/common/form_check.js"></script>
<link rel="stylesheet" type="text/css" href="css\join.css" />
<link rel="stylesheet" href="css/Mypage.css">
<link rel="stylesheet" href="css/classic.css">
<link rel="stylesheet" href="css/classic.date.css">
<link rel="stylesheet" href="css/classic.time.css">
<link rel="stylesheet" href="css/style2.css" media="screen">
<link rel="stylesheet" href="css/materialFormStyles.css">
<link rel="stylesheet" href="css/borderRightLeft.css" media="screen">
<script src="js/materialForm.js"></script>
<link rel="stylesheet" href="css/signbutton.css">

<!-- -----------------다음 주소 api ----------------------------------------->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!--기본적인 body등의 css-->
<link rel="stylesheet" href="css/basicStyle.css" media="screen">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.infinitecarousel.js"></script>

<!----------------------------alam form 추가 2020.01.06-------------------------->
<!----------------------------alam form 추가 2020.01.06-------------------------->

<!--2020.01.03 추가 css 분리-->
<link rel="stylesheet" href="css/logform.css" media="screen">
<!--2020.01.03 추가 javascript.가입기능 분리-->
<script type="text/javascript" src="js/signjs.js"></script>
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
<link href="css/frontlogin.css" media="screen, projection" rel="stylesheet" type="text/css">
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
			if ($(e.target).parent("a.mypage").length == 0) {
				$(".mypage").removeClass("menu-open");
				$("fieldset#mypage_menu").hide();
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

<TITLE>마이페이지</TITLE>
<style>
.BvMHM {
    background-color: #fff;
    background-color: rgba(var(--cdc,255,255,255),1);
    border: 1px solid #dbdbdb;
    border: 1px solid rgba(var(--b6a,219,219,219),1);
    border-radius: 3px;
    margin: 60px auto 0;
    max-width: 935px;
    overflow: hidden;
    width: 100%;
}
.EzUlV {
    -webkit-box-orient: horizontal;
    -webkit-box-direction: normal;
    -webkit-flex-direction: row;
    -ms-flex-direction: row;
    flex-direction: row;
    -webkit-flex-grow: 1;
    -ms-flex-positive: 1;
    flex-grow: 1;
    -webkit-box-pack: stretch;
    -webkit-justify-content: stretch;
    -ms-flex-pack: stretch;
    justify-content: stretch;
}
.EzUlV, .PVkFi {
    -webkit-box-flex: 1;
}
.wW1cu {
    border-right: 1px solid #dbdbdb;
    -webkit-flex-basis: 236px;
    -ms-flex-preferred-size: 236px;
    flex-basis: 236px;
    -webkit-box-flex: 0;
    -webkit-flex-grow: 0;
    -ms-flex-positive: 0;
    flex-grow: 0;
    -webkit-flex-shrink: 0;
    -ms-flex-negative: 0;
    flex-shrink: 0;
}
.h-aRd, .h-aRd:active, .h-aRd:hover, .h-aRd:visited {
    color: #262626;
}
a, a:visited {
    color: #003569;
    color: rgba(var(--fe0,0,53,105),1);
    text-decoration: none;
}
.-HRM- {
    border-left-color: #262626;
    font-weight: 600;
}
.PVkFi {
    -webkit-flex: 1 1 400px;
    -ms-flex: 1 1 400px;
    flex: 1 1 400px;
    min-width: 50px;
}
.EzUlV, .PVkFi {
    -webkit-box-flex: 1;
}
.h-aRd {
    border-left: 2px solid transparent;
    display: block;
    font-size: 16px;
    height: 100%;
    line-height: 20px;
    padding: 16px 16px 16px 30px;
    width: calc(100% - 48px);
}

</style>
</head>
<body>
	<header>
		<jsp:include page="<%=includeurl%>" />
	</header>

	<section id="main">
		<section id="mainright" style="height: 160%;">
			<div id="matList">
				<div class="container" id="formOutterWrapper">
					<center>
						<div id="sign_title">${id}'sMypage</div>
					</center>
					<!-- 아이프레임 -->
					<!-- <iframe width="100%" height="2000px" src="mypage.do?command=mypage&id=${id}"></iframe> -->
					
					<!-- mypage instagram style -->
					<div class="mypagebox">
					<ul class="">
					<li><b>회원정보 수정</b></li>
					<li><a href="/accounts/password/change/">대관내역</a></li>
					<li><a href="/accounts/manage_access/">메뉴</a></li>
					<li><a href="/emails/settings/">메뉴</a></li>
					<li><a href="/accounts/contact_history/">메뉴</a></li>
					<li><a href="/emails/emails_sent/">회원탈퇴</a></li>
					</ul>
					<article class="">
					</article>
					</div>
					<!-- mypage instagram style -->


					<script src="https://code.jquery.com/jquery-2.2.3.min.js" integrity="sha256-a23g1Nt4dtEYOj7bR+vTu7+T8VP13humZFBJNIYoEJo=" crossorigin="anonymous">
						
					</script>
					<script src="js/materialForm.js">
						
					</script>
		</section>
	</section>
	<footer>
		<jsp:include page="Footer.jsp" />
	</footer>

</body>
</html>