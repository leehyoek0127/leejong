<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//2020_01_02 수정부분
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

	//수정사항 2020.01.14 로그인 ID에 대한 정보.
	String logid = (String) session.getAttribute("id");
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<title>yongsign</title>
<!-- datepicker 2020.02.11 지은 수정 -->
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
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/datepicker.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/common/form_check.js"></script>
<link rel="stylesheet" type="text/css" href="css\join.css" />
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/classic.css">
<link rel="stylesheet" href="css/classic.date.css">

<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/signformrelocation.css">
<link rel="stylesheet" href="css/classic.time.css">
<link rel="stylesheet" href="css/style2.css" media="screen">
<link rel="stylesheet" href="css/materialFormStyles2.css">
<link rel="stylesheet" href="css/borderRightLeft.css" media="screen">
<script src="js/materialForm.js"></script>



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

<!--2020.01.03 추가 css 분리-->
<link rel="stylesheet" href="css/logform.css" media="screen">
<!--2020.01.03 추가 javascript.가입기능 분리-->
<script type="text/javascript" src="js/signjs.js"></script>


<script type="text/javascript" async=""
	src="https://www.google-analytics.com/analytics.js"></script>
<script type="text/javascript" src="/js/libs/jquery.min.js"></script>
<script type="text/javascript" src="/js/libs/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/common/common.js"></script>
<script type="text/javascript" src="/js/common/form_check.js"></script>
<script type="text/javascript" src="/js/datepicker.js"></script>
<script src="/admincms/js/pickadate.js-3.5.6/lib/picker.js"></script>
<script src="/admincms/js/pickadate.js-3.5.6/lib/picker.date.js"></script>
<script src="/admincms/js/pickadate.js-3.5.6/lib/picker.time.js"></script>
<script src="/admincms/js/pickadate.js-3.5.6/lib/legacy.js"></script>
<script async=""
	src="https://www.googletagmanager.com/gtag/js?id=UA-116234591-1"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());

	gtag('config', 'UA-116234591-1');
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
			if ($(e.target).parent("a.mypage").length != 0) {
				$(".mypage").removeClass("menu-open");
				$("fieldset#mypage_menu").hide();
			}
		});

	});
</script>
<!----------------------------회원가입스크립트랑 스타일여기까지------------------------------------>
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
<!------------------------------ datepicker 2020.02.12 지은수정---------------------------->

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular.min.js"></script>
<!-- <script src="http://fian.my.id/Waves/static/waves.min.js?v=0.7.4"></script> -->
<script src="js/rm-datepicker.js"></script>
<script>
	var app = angular.module("myApp", [ "rmDatepicker" ]);

	/* Datepicker global configuration */
	app.config([ "rmDatepickerConfig", function(rmDatepickerConfig) {
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

			$scope.oDate1 = new Date('2015-12-12');
			$scope.oDate2 = new Date();
		};
		app.controller("MyCtrl", [ '$scope', MyCtrl ]);

	}());

	// Init waves (OPTIONAL) :)
	// window.onload = Waves.init();
</script>
<!-- ---------------------------------------------------------------- -->
<!-- -----------------다음 주소 api ----------------------------------------->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- ------------------------------------------------------------------------- -->
<!-- -------------------------ID 중복확인에 대한 ajax--------------------------------- -->
<script type="text/javascript">
	$(document).ready(function() {
		$("#id").blur(function() {
			var idReg = /^[a-zA-z]+[a-zA-z0-9]{5,13}$/g;
			if (idReg.test(join.id.value))
				callAjax();
			else {
				$("#ajaxReturn").html("6~14자 사이의 영문 대소문자와 숫자만 사용가능합니다");
			}
		});
		$("#name").blur(function() {
			if (join.name.value.length != 0)
				$("#nameReturn").html("");
			else {
				$("#nameReturn").html("이름을 입력해주세요.");
			}
		});

		$("#hp2").blur(function() {
			if (join.hp2.value.length != 0)
				$("#hpReturn").html("");
			else {
				$("#hpReturn").html("휴대폰번호를 입력하세요.");
			}
		});
		$("#hp3").blur(function() {
			if (join.hp3.value.length != 0)
				$("#hpReturn").html("");
			else {
				$("#hpReturn").html("휴대폰번호를 입력하세요.");
			}
		});
		$("#em1").blur(function() {
			if (join.em1.value.length != 0)
				$("#emReturn").html("");
			else {
				$("#emReturn").html("이메일을 입력하세요.");
			}
		});
	});

	function callAjax() {

		$.ajax({
			type : "post",
			url : "./confirmId.jsp",
			data : {

				id : $('#id').val()
			},
			success : whenSuccess,
			error : whenError
		});
	}
	var confirmid = "";
	function whenSuccess(resdata) {

		var x = document.getElementById("ajaxReturn");
		$("#ajaxReturn").html(resdata);

		if (resdata.includes("이미 사용중인 ID입니다")) {
			document.join.hidden.value = "0";
			x.style.color = "red";
		}

		else {
			document.join.hidden.value = "1";
			x.style.color = "blue";
			confirmid = join.id.value;

		}
	}
	function whenError() {
		alert("Error");
	}

	

	$(document).ready(function() {

		//form : date picker 셋팅
		var $dateInput = $('#cm_reserve_date').pickadate({
			formatSubmit : 'yyyy-mm-dd',
			labelMonthNext : 'Go to the next month',
			labelMonthPrev : 'Go to the previous month',
			labelMonthSelect : 'Pick a month from the dropdown',
			labelYearSelect : 'Pick a year from the dropdown',
			selectMonths : true,
			selectYears : true,
		})

		var datePicker = $dateInput.pickadate('picker')

		datePicker.on('close', function() {
			var selDate = datePicker.get('select', 'yyyy-mm-dd');
			$('#cm_reserve_date').val(selDate);
			selTime(selDate);
		})
	});
	//-->

	//	<!--js 파일 분리가 안돼서 어쩔수없이 이곳에 사용한 용병가입 창 js 파일 2020.01.09            + 유효성 검사 2020.01.16 by 종혁형-->
	function matchjoinsubmit() {

		var getName = (/^[가-힣]+$/);
		var date_pattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
		var regPhone2 = /(\d{3}|\d{4})$/;
		var regPhone3 = /(\d{4}$)/;
		var mBranchlen = matchjoin.m_b_branch.value.length
		var mGroundlen = matchjoin.m_b_ground.value.length
		var mMemberlen = matchjoin.m_b_name.value.length
		var mTel1len = matchjoin.m_b_tel1.value.length
		var mTel2len = matchjoin.m_b_tel2.value.length
		var mTel3len = matchjoin.m_b_tel3.value.length
		var mMatchdatelen = matchjoin.m_b_schedule.value.length
		var mTimelen = matchjoin.m_b_time.value.length
		var mApplylen = matchjoin.m_b_status.value.length
		var mTeamlen = matchjoin.m_b_level.value.length
		var mTypelen = matchjoin.m_b_type.value.length
		var mCountlen = matchjoin.m_b_count.value.length
		if (mBranchlen <= 0) {
			alert("지점을 선택하세요.");
			matchjoin.m_b_branch.focus();

		} else if (mGroundlen <= 0) {
			alert("구장을 선택하세요.");
			matchjoin.m_b_ground.focus();
		} else if (mMemberlen <= 1 || !getName.test(matchjoin.m_b_name.value)) {
			alert("이름을 정확히 입력하세요.ex)홍길동");
			matchjoin.m_b_name.focus();
		} else if (mTel1len <= 0 || !regPhone2.test(matchjoin.m_b_tel2.value)
				|| !regPhone3.test(matchjoin.m_b_tel3.value)) {
			alert("전화번호를 입력하세요.ex)010-5555-6666");
			matchjoin.m_b_tel1.focus();
		} else if (!date_pattern.test(matchjoin.m_b_schedule.value)) {
			alert("매치일정을 정확히 입력하세요.ex)2020-08-20");
			matchjoin.m_b_schedule.focus();
		} else if (mTimelen <= 0) {
			alert("시간을 선택하세요.");
			matchjoin.m_b_time.focus();
		} else if (mTypelen <= 0) {
			alert("매치형태를 선택하세요.");
			matchjoin.m_b_type.focus();
		} else if (mCountlen <= 0) {
			alert("신청가능 팀 수를 선택하세요.");
			matchjoin.m_b_count.focus();
		}
		else if (mApplylen <= 0) {
			alert("마감여부를 선택하세요.");
			matchjoin.m_b_status.focus();
		} else if (mTeamlen <= 0) {
			alert("팀 수준을 선택하세요.");
			matchjoin.m_b_level.focus();
		}
		
		else {
			document.matchjoin.submit();
		}

	}
</script>
<!-- 비밀번호 체크 ajax -->
<script type="text/javascript">
	function callAjax2() {
		if (join.pw.value != join.pwch.value) {
			$("#pwReturn").html("비밀번호가 일치하지 않습니다");
		} else {
			$("#pwReturn").html("");
		}
	}
</script>
<script type="text/javascript">
	
</script>
<!-- 한글글씨체적용 /아이디찾기 제목-->
<link rel="stylesheet" href="css/galboardstyle.css">
<link
	href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap"
	rel="stylesheet">

<style>
.h_bar.line {
	padding-bottom: 13px;
	border-bottom: 2px solid #353535;
}

.h_bar {
	position: relative;
	padding-left: 26px;
	color: #2c3c57;
	font-size: 30px;
	line-height: 40px;
	letter-spacing: -2px;
}

.h_bar:before {
	content: "";
	display: block;
	position: absolute;
	top: 5px;
	left: 0;
	width: 5px;
	height: 30px;
	background: #2c3c57;
}

.h_bar:after {
	content: "";
	display: block;
	position: absolute;
	top: 5px;
	left: 0;
	width: 5px;
	height: 6px;
	background: #aec8f4;
}

.h_tit {
	position: relative;
	margin-bottom: 45px;
	padding-bottom: 24px;
	font-size: 50px;
	font-family: 'NanumBarunGothicL';
	line-height: 60px;
	text-align: center;
}

.h_tit:after {
	content: "";
	display: block;
	position: absolute;
	bottom: 0;
	left: 50%;
	margin-left: -49px;
	width: 98px;
	height: 2px;
	background: #bfc4cc;
}

.write_wrap {
	margin: 0 auto;
	max-width: 800px !important;
	padding: 0 10px;
}

.write_wrap .btn_wrap {
	padding-top: 40px;
	border-top: 2px solid #353535;
}

.btn_wrap {
	margin-top: 20px;
	text-align: center;
	font-size: 0;
	line-height: 0;
}

.btn_big {
	position: relative;
	display: inline-block;
	padding: 0 15px;
	width: 333px;
	background: #2c3c57;
	color: #fff;
	font-size: 23px;
	line-height: 80px;
	text-align: center;
	vertical-align: middle;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	-webkit-transition: all 0.25s ease-out;
	-moz-transition: all 0.25s ease-out;
	-ms-transition: all 0.25s ease-out;
	-o-transition: all 0.25s ease-out;
	transition: all 0.25s ease-out;
}

.gray {
	background: #868686 !important;
}

.btn_wrap .btn_base, .btn_wrap .btn_big {
	margin-left: 10px;
}

.btn_wrap:after {
	content: "";
	display: block;
	clear: both;
}

.btn_wrap .btn_base:first-child, .btn_wrap .btn_big:first-child {
	margin-left: 0 !important;
}

.write_wrap dl dd input {
	height: 47px;
}

.btn_wrap .btn_base:first-child, .btn_wrap .btn_big:first-child {
	margin-left: 0 !important;
}

a:focus, a:hover {
	color: white;
	text-decoration: underline;
}
</style>
</head>
<body>
	<%
		//2020_01_22 로그인정보에 따라서 
		if (uss.equals("GUEST")) {
			out.println("<script>alert('로그인 후 이용해주시기 바랍니다.');location.href='yonglist_1.jsp';</script>");

		} else {
	%>
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


		<section id="mainright">
			<div id="matList">

				<div class="container" id="formOutterWrapper">

					<h3 class="h_tit" style="font-weight: normal;">매 치 신 청</h3>
					<div class="write_wrap">
						<h4 class="h_bar line">매치신청</h4>


						<div class="container" id="formInnerWrapper"
							style="padding-left: 0px;">
							<form name="matchjoin" id="materialForm" class="form"
								method="post" action="matchsignInsert.jsp?fn=1&mid=<%=uss%>"
								role="form" autocomplete="off" style="margin-top: 30px;">
								<div class="form-group">

									<div class="col-xs-4">
										<select name="m_b_branch" class=formInput>
											<option value="">지점선택</option>
											<option>동대문점</option>
											<option>안산 고잔점</option>
											<option>서수원점</option>
											<option>일산점</option>
											<option>대전 탄방점</option>
											<option>동대전점</option>
											<option>부산 가야점</option>
											<option>울산 남구점</option>
											<option>창원점</option>
											<option>전주 완산점</option>
											<option>울산 북구점</option>
											<option>GLOBAL ARENA(Japan)</option>
											<option>부산 북구점</option>
											<option>Seogwipo. JEJU</option>
											<option>가천대학교 운동장</option>
										</select>
									</div>
									<div class="col-xs-4">
										<select name="m_b_ground" class=formInput>
											<option value="">구장선택</option>
											<option>A구장</option>
											<option>B구장</option>
											<option>C구장</option>
										</select>
									</div>
								</div>
								<div class="form-group">

									<div class="col-xs-4">
										<label class="labels" for="m_b_name">신청자명</label> <input
											type="text" class="formInput" id="m_b_name" name="m_b_name"
											style="font-size: 18px;">
									</div>
									<div class="col-xs-1">
										<label class="labels" for="">연락처</label>
									</div>
									<div class="col-xs-1">
										<select class="formInput" id="m_b_tel1" name="m_b_tel1">
											<option value="">선택</option>
											<option>010</option>
											<option>011</option>
											<option>016</option>
											<option>017</option>
											<option>018</option>
											<option>019</option>
										</select>
									</div>
									<div style="float: left;">-</div>
									<div class="col-xs-1">
										<label class="labels" for="m_b_tel2"></label> <input
											type="text" class="formInput" id="m_b_tel2" name="m_b_tel2"
											style="font-size: 18px;">
									</div>
									<div style="float: left;">-</div>
									<div class="col-xs-1">
										<label class="labels" for="m_b_tel3"></label> <input
											type="text" class="formInput" id="m_b_tel3" name="m_b_tel3"
											style="font-size: 18px;">
									</div>
								</div>
								<div class="form-group">

									<div class="col-xs-1"
										style="font-size: 18px; width: 120px; letter-spacing: 4px;">

										매치일정</div>
									<div class="col-xs-3">
										<div ng-app="myApp" ng-controller="MyCtrl" class="container">
											<input rm-datepicker type="text" ng-model="oDate2"
												id="m_b_schedule" name="m_b_schedule"
												style="width: 233px; margin-left: -21px; height: 27px; margin-top: -1px; font-size: 17px;">
											<br> <br> <br>
										</div>
									</div>
									<div class="col-xs-4" style="margin-left: -25px;">
										<select class="formInput" id="m_b_time" name="m_b_time">
											<option value="">시간선택</option>
											<option>13:00 - 15:00</option>
											<option>16:00 - 18:00</option>
											<option>18:00 - 20:00</option>
											<option>20:00 - 22:00</option>
										</select>
									</div>
								</div>
								<div class="form-group">

									<div class="col-xs-4">
										<select name="m_b_type" id="m_b_type" class=formInput>
											<option value="">매치형태</option>
											<option>5 vs 5</option>
											<option>6 vs 6</option>
										</select>
									</div>
									<div class="col-xs-4">
										<select name="m_b_count" id="m_b_count" class=formInput>
											<option value="">신청가능팀</option>
											<option>1 팀</option>
											<option>2 팀</option>

										</select>
									</div>
								</div>
								<div class="form-group">

									<div class="col-xs-4">
										<select name="m_b_status" id="m_b_status" class=formInput>
											<option value="">마감여부</option>
											<option>가능</option>
											<option>마감</option>
										</select>
									</div>
									<div class="col-xs-4">
										<select name="m_b_level" id="m_b_level" class=formInput>
											<option value="">팀수준선택</option>
											<option>상</option>
											<option>중상</option>
											<option>중</option>
											<option>중하</option>
											<option>하</option>
										</select>
									</div>
								</div>
								<div class="form-group" style="height: 220px;">

									<div class="col-xs-4">
										<label class="labels" for="m_b_contents"></label>
										<textarea name="m_b_contents" id="m_b_contents"
											style="width: 730px; resize: none; height: 200px;"
											placeholder="내용을 입력하세요."></textarea>
									</div>

								</div>
						</div>
						<input type="hidden" id="mId" name="mId" value="<%=logid%>" />
						<div class="btn_wrap">

							<a href="javascript:;" class="btn_big" onClick="matchjoinsubmit()";>등록하기</a>
							<a href="match_apply.jsp"
								class="btn_big gray">취소</a>
						</div>

					</div>
					</form>

				</div>
				<script src="https://code.jquery.com/jquery-2.2.3.min.js"
					integrity="sha256-a23g1Nt4dtEYOj7bR+vTu7+T8VP13humZFBJNIYoEJo="
					crossorigin="anonymous"></script>
				<script src="js/materialForm.js"></script>
			</div>

		</section>


	</section>



	<footer id="footer">
		<jsp:include page="Footer.jsp" />
	</footer>
	<%
		}
	%>
</body>
</html>
