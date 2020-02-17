<!-- 풋살구장등록 만들어둔거 아직 안 쓰고있다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
//2020_01_02 수정부분
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
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html>
<html lang="en">
<head>
<title>풋살구장등록</title>
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="width=device-width, initial-scale=1" name="viewport">
<meta content="Chrissy Collins" name="author">
<meta content="A pure vanilla JS calendar by @chrisssycollins" name="description">
<link href="css/vanillaCalendar.css" rel="stylesheet">
<link rel="stylesheet" href="css/classic.css">
<link rel="stylesheet" href="css/classic.date.css">
<link rel="stylesheet" href="css/classic.time.css">
<link rel="stylesheet" href="orbit-1.2.3.css">
<link rel="stylesheet" href="css/demo-style.css">
<link rel="stylesheet" href="css/style2.css" media="screen">
<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Roboto:100,300,400'>
<link rel="stylesheet" href="css/selectstyle.css">
<link rel="stylesheet" type="text/css" href="css\logform.css" />
<link rel="stylesheet" type="text/css" href="css\join.css" />
<link rel="stylesheet" type="text/css" href="css\sign.css" />
<link rel="stylesheet" type="text/css" href="css\subject.css" />
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/materialFormStyles.css">
<link rel="stylesheet" href="css/groundregistration_css.css">
<link href="css/front.css" media="screen, projection" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/reservation_javascript.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/datepicker.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/form_check.js"></script>
<script type="text/javascript" src="js/groundregistration_js.js"></script>
<script type="text/javascript" src="jquery-1.5.1.min.js"></script>
<script type="text/javascript" src="jquery.orbit-1.2.3.min.js"></script>
<script type="text/javascript" src="js/jquery-3.1.0.min.js" charset="utf-8"></script>
<script src="js/jquery2.js" type="text/javascript"></script>
<script src="js/selectindex.js"></script>
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
					<h1>풋살구장등록</h1>
					<div class="container" id="formInnerWrapper">
						<form name="ground" id="materialForm" class="form" method="post" action="groundinput.jsp" role="form" autocomplete="off">
							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-8">
									<label class="labels" for="place">풋살장위치</label> <input type="text" class="formInput" id="place" name="place">
								</div>
								<div class="col-xs-2"></div>
							</div>


							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-8">
									<label class="labels" for="placename">풋살장명칭</label> <input type="text" class="formInput" id="placename" name="placename">
								</div>
								<div class="col-xs-2"></div>
							</div>



							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-8">
									<label class="labels" for="placesize">구장크기</label> <input type="text" class="formInput" id="placesize" name="placesize">
								</div>
								<div class="col-xs-2"></div>
							</div>



							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-8">
									<label class="labels" for="placeinfo">시설정보</label> <input type="text" class="formInput" id="placeinfo" name="placeinfo">
								</div>
								<div class="col-xs-2"></div>
							</div>

							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-3 groundtitle">주차장여부</div>
								<div class="col-xs-6 radio">
									<div class="col-xs-3">
										<label> <input type="radio" name="car" value="Yes">Yes
										</label>
									</div>
									<div class="col-xs-3">
										<label> <input type="radio" name="car" value="No">No
										</label>
									</div>
								</div>
							</div>


							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-3 groundtitle">냉난방시설</div>
								<div class="col-xs-6 radio">
									<div class="col-xs-3">
										<label> <input type="radio" name="cold" value="Yes">Yes
										</label>
									</div>
									<div class="col-xs-3">
										<label> <input type="radio" name="cold" value="No">No
										</label>
									</div>
								</div>
							</div>


							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-3 groundtitle">샤워실</div>
								<div class="col-xs-6 radio">
									<div class="col-xs-3">
										<label> <input type="radio" name="clean" value="Yes">Yes
										</label>
									</div>
									<div class="col-xs-3">
										<label> <input type="radio" name="clean" value="No">No
										</label>
									</div>
								</div>
							</div>

							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-3 groundtitle">공대여</div>
								<div class="col-xs-6 radio">
									<div class="col-xs-3">
										<label> <input type="radio" name="ball" value="Yes">Yes
										</label>
									</div>
									<div class="col-xs-3">
										<label> <input type="radio" name="ball" value="No">No
										</label>
									</div>
								</div>
							</div>


							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-3 groundtitle">팀조끼대여</div>
								<div class="col-xs-6 radio">
									<div class="col-xs-3">
										<label> <input type="radio" name="cloth" value="Yes">Yes
										</label>
									</div>
									<div class="col-xs-3">
										<label> <input type="radio" name="cloth" value="No">No
										</label>
									</div>
								</div>
							</div>

							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-3 groundtitle">풋살화대여</div>
								<div class="col-xs-6 radio">
									<div class="col-xs-3">
										<label> <input type="radio" name="shoes" value="Yes">Yes
										</label>
									</div>
									<div class="col-xs-3">
										<label> <input type="radio" name="shoes" value="No">No
										</label>
									</div>
								</div>
							</div>

							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-3 groundtitle">구장소개</div>
							</div>

							<div class="form-group" style="height: 220px;">
								<div class="col-xs-2"></div>
								<div class="col-xs-6">
									<textarea name="infor" rows="10" cols="85"></textarea>
								</div>
							</div>

							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-3 groundtitle">구장사진</div>
							</div>

							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-6">
									<input type="file" id="input_imgs" multiple />
									<div class="imgs_wrap"></div>
								</div>
							</div>


							<div class="form-group">
								<div class="col-xs-9"></div>
								<div class="col-xs-1">
									<input type="submit" value="구장등록" class="btn btn-primary" onClick="groundsubmit()">

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
