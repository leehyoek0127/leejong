<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String uss="GUEST";%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<title>아이디 찾기</title>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/datepicker.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/common/form_check.js"></script>
<link rel="stylesheet" type="text/css" href="css\find.css" />
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
<style>
.form-group {
	height: 70px;
}

.form-group input {
	float: left;
}
</style>
</head>
<!-- ---------------------------------------------------------------------------------------------- -->
<body>
	<header>
		<jsp:include page="header.jsp" />
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
						<h1>아이디 찾기</h1>
					</center>
					<div class="container" id="formInnerWrapper">
						<form name="join" id="materialForm" class="form" method="post" action="findid_select.jsp" role="form" autocomplete="off">
							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-8">
									<label class="labels" for="name">이름</label> <input type="text" class="formInput" id="name" name="name">
								</div>
								<div class="col-xs-2"></div>
							</div>
							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-4">
									<label class="labels" for="em1">이메일</label> <input type="text" class="formInput" id="em1" name="em1">
								</div>
								<div class="col-xs-1">@</div>
								<div class="col-xs-3">
									<input type="text" class="formInput" id="em2" name="em2">
								</div>
								<div class="col-xs-2"></div>
							</div>
							<div class="form-group">
								<div class="col-xs-2"></div>

							</div>
					</div>
					<div class="form-group">
						<div class="col-xs-2">
							<br>
						</div>
						<div class="form-group">
							<div class="col-xs-12">
								<input type="submit" value="찾기" class=fbtn onClick="joinsubmit()">
							</div>
						</div>
						<input type="hidden" name="hidden" value="" />
						</form>
					</div>
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
