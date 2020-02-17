<!--  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.SignDto"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!--마이페이지 접근 위한 css 파일 추가 2020.01.15-->


<script type="text/javascript" src="js/signjs.js"></script>
<%
	//2020_01_02 수정부분
	String url = request.getServletPath();
	session.setAttribute("url", url);
	String includeurl = "header.jsp";
	String uss = (String)session.getAttribute("id");
	ArrayList<SignDto> list = (ArrayList<SignDto>) request.getAttribute("data");
	//String uss = list.get(0).getId();
	session.setAttribute("uss", uss);

	String log = "로그인";
	if (uss == null)
		uss = "GUEST";
	else {
		log = "로그아웃";
		includeurl = "sign_login.jsp";
	}
	//수정부분 끝
%>
<script>
	/* 	function pwchange1(id) {
	
	 var pw = document.join.pw.value;
	 alert(pw);
	 location.href = "mypage.do?command=pwchange&id="+id+"&pw="+pw
	

	 } */

	function pwchange1() {

		$.ajax({
			type : "post",
			url : "./mypage.do?command=signdel",
			data : {

				
				pw : $('#pw').val()
			},
			success : whenSuccess,
			error : whenError
		});
	}
	var confirmid = "";
	function whenSuccess(resdata) {	
		$('#delcheck').html(resdata);	
		
		if(resdata.includes("삭제가 완료되었습니다.")){
			document.location.href="logout.jsp";
		}
	}
	function whenError() {
		alert("Error");
	}
</script>


<!-- <A HREF=userUp.jsp?id=${param.id}>회원정보수정</A>
<A HREF=delete.jsp?id=${param.id}>회원탈퇴</A>
<A HREF=allPrt.jsp>전체유저정보출력</A>
 -->

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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
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
<link href="css/front.css" media="screen, projection" rel="stylesheet"
	type="text/css">
<script src="js/jquery2.js" type="text/javascript"></script>
<link href="css/frontlogin.css" media="screen, projection"
	rel="stylesheet" type="text/css">
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>
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
		<section id="mainright" style="height: 160%;">
			<div id="matList">
				<div class="container" id="formOutterWrapper">
					<center>
						<div id="sign_title">회원탈퇴</div>
					</center>
					<div class="container" id="formInnerWrapper">
						<form name="join" id="materialForm" class="form" method="post"
							action="mypage.do?command=signmodify" role="form"
							autocomplete="off">

							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-7">
									<label class="labels active" for="pw">비밀번호</label> <input
										type="password" class="formInput" id="pw" name="pw">
								</div>

							</div>




							<div class="form-group">
								<div class="col-xs-4" style="margin-left: 65px;"></div>
								<div class="col-xs-3">
									<input type="button" value="삭제" class="signbutton signbutton5"  onclick="pwchange1()">
									<input type="button" value="취소" class="signbutton signbuttoncancel"
										onClick="script: location.href='sign.jsp'">
								</div>
							</div>
							<div id="delcheck">
								
							</div>
							<input type="hidden" name="hidden" value="" />
						</form>
					</div>
				</div>
			</div>
			<script src="https://code.jquery.com/jquery-2.2.3.min.js"
				integrity="sha256-a23g1Nt4dtEYOj7bR+vTu7+T8VP13humZFBJNIYoEJo="
				crossorigin="anonymous">
				
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