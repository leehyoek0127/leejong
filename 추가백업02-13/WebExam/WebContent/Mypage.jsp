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
<link rel="stylesheet" type="text/css" href="css\join.css" />
<link rel="stylesheet" href="css/classic.css">
<link rel="stylesheet" href="css/classic.date.css">
<link rel="stylesheet" href="css/classic.time.css">
<link rel="stylesheet" href="css/style2.css" media="screen">
<link rel="stylesheet" href="css/materialFormStyles.css">
<link rel="stylesheet" href="css/borderRightLeft.css" media="screen">
<script src="js/materialForm.js"></script>
<link rel="stylesheet" href="css/signbutton.css">


<!--기본적인 body등의 css-->
<link rel="stylesheet" href="css/basicStyle.css" media="screen">
<link rel="stylesheet" href="css/navmid33.css">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.infinitecarousel.js"></script>


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
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/galboardstyle.css">

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
#my_frame {
	margin-left: -60px;
	width: 1300px;
	height: 1600px;
	overflow: hidden;
	overflow-x: hidden;
	overflow-y: hidden;
	cursor: pointer;
	border: 1px solid rgba(0, 0, 0, 0.1);
}

</style>

<script src="//code.jquery.com/jquery.min.js"></script>
<script>
	function open_in_frame(url) {
		$('#my_frame').attr('src', url);
	}
</script>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style>
p {
	margin: 20px 0px;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
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
					<div class="container">
						<div class="row">
							<div class="col">
								<ul class="nav nav-tabs" style="margin-bottom: -47px; border-bottom: none; margin-left: -75px;">
									<li class="nav-item"><button class="nav-link active" onclick='open_in_frame("mypage.do?command=mypage&id=${id}")'>회원정보수정</button></li>
									<li class="nav-item"><button class="nav-link active" onclick='open_in_frame("")'>대관내역</button></li>
									<li class="nav-item"><button class="nav-link active" onclick='open_in_frame("")'>메뉴</button></li>
									<li class="nav-item"><button class="nav-link active" onclick='open_in_frame("")'>메뉴</button></li>
									<li class="nav-item"><button class="nav-link active" onclick='open_in_frame("signdel.jsp")'>회원탈퇴</button></li>
								</ul>
							</div>
						</div>
					</div>
					<iframe id='my_frame'></iframe>
					</center>
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