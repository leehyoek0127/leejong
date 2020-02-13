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

<!-- 로그인된 상태로 회원가입페이지 가는것 막기 -->
<%
	String strReferer = request.getHeader("referer");

	if (strReferer == null) {
%>
<script>
	alert("정상적인 경로를 통해 다시 접근해 주십시오.");
	document.location.href = "qna.jsp";
</script>
<%
	return;
	}
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<title>회원가입</title>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/datepicker.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<!-- form_check.js 없음 -->
<script type="text/javascript" src="/js/common/form_check.js"></script>
<link rel="stylesheet" type="text/css" href="css\join.css" />
<link rel="stylesheet" href="css/classic.css">
<link rel="stylesheet" href="css/classic.date.css">
<link rel="stylesheet" href="css/signbutton.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/signformrelocation.css">
<link rel="stylesheet" href="css/classic.time.css">
<link rel="stylesheet" href="css/style2.css" media="screen">
<link rel="stylesheet" href="css/materialFormStyles.css">
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
				$("#ajaxReturn").html("6~12자 사이의 영문 대소문자와 숫자만 사용가능합니다");
			}
		});
		var n = document.getElementById("nameReturn");
		$("#name").blur(function() {
			if (join.name.value.length != 0)
				$("#nameReturn").html("");
			else {
				$("#nameReturn").html("이름을 입력해주세요.");
				n.style.color = "red";
			}
		});

		$("#tel2").blur(function() {
			if (join.hp2.value.length != 0)
				$("#hpReturn").html("");
			else {
				$("#hpReturn").html("휴대폰번호를 입력하세요.");
			}
		});
		$("#tel3").blur(function() {
			if (join.hp3.value.length != 0)
				$("#hpReturn").html("");
			else {
				$("#hpReturn").html("휴대폰번호를 입력하세요.");
			}
		});
		$("#email1").blur(function() {
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
			url : "./idcheck.do?command=idcheck",
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
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d25325.265446899888!2d147.02924799651784!3d37.492391917303266!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca5bed583f92d%3A0xc93c837d2875ade6!2z7ZKL7IK07J6l!5e0!3m2!1sko!2skr!4v1575961834128!5m2!1sko!2skr"
					width="100%" height="100%" frameborder="0" style="border: 0;"
					allowfullscreen=""></iframe>
			</div>
		</div>


	</div>
	<section id="main">


		<section id="mainright">
			<div id="matList">
				<div class="container" id="formOutterWrapper">
					<center>
						<h2 id="sign_title">JOIN US</h2>
					</center>
					<div class="container" id="formInnerWrapper">
						<form name="join" id="materialForm" class="form" method="post"
							action="input.do?command=signinput" role="form"
							autocomplete="off">
							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-8">
									<label class="labels" for="id">아이디<img
										src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
										alt="필수"></label> <input type="text" class="formInput" id="id"
										name="id">
									<div id="ajaxReturn" style="color: red; font-size: 12px;"></div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-8">
									<label class="labels" for="name">이름<img
										src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
										alt="필수"></label> <input type="text" class="formInput" id="name"
										name="name">
									<div id="nameReturn" style="color: red; font-size: 12px;"></div>
								</div>
								<div class="col-xs-2"></div>
							</div>
							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-4">
									<label class="labels" for="pw">비밀번호<img
										src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
										alt="필수"></label> <input type="password" class="formInput"
										id="pw" name="pw">
								</div>
								<div class="col-xs-4">
									<label class="labels" for="pwch">비밀번호재확인<img
										src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
										alt="필수"></label> <input type="password" class="formInput"
										id="pwch" name="pwch" onBlur="callAjax2()">
									<div id="pwReturn" style="color: red; font-size: 12px;"></div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-2 labels">
									<label class="labels"> 휴대폰번호<img
										src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
										alt="필수">
									</label>
								</div>
								<div class="col-xs-2" style="margin-left: -10px;">
									<select class="formInput" id="tel1" name="tel1">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
									</select>
									<div id="hpReturn" style="color: red; font-size: 12px;"></div>
								</div>
								<div style="float: left;">-</div>
								<div class="col-xs-2">
									<label class="labels" for="tel2"></label> <input type="text"
										class="formInput" id="tel2" name="tel2">
								</div>
								<div style="float: left;">-</div>
								<div class="col-xs-2">
									<label class="labels" for="tel3"></label> <input type="text"
										class="formInput" id="tel3" name="tel3">
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-3">
									<label class="labels" for="email1">이메일<img
										src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
										alt="필수"></label> <input type="text" class="formInput"
										id="email1" name="email1">
									<div id="emReturn" style="color: red; font-size: 12px;"></div>
								</div>

								<div class="col-xs-3">

									<input type="text" class="formInput" id="email2" name="email2">
								</div>
								<div class="col-xs-2">

									<select name="mail" class=formInput
										onChange=mailaddr(join.mail) style="width: 163px;">
										<option value="">직접입력</option>
										<option value="naver.com">naver.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="gmail.com">gmail.com</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-2">
									<label class="labels">성별</label>
								</div>
								<div class="col-xs-6 radio">
									<div class="col-xs-3">
										<label2> <input type="radio" name="gender"
											value="female" checked>여성 </label2>
									</div>
									<div class="col-xs-3">
										<label2> <input type="radio" name="gender"
											value="male">남성 </label2>
									</div>
								</div>


							</div>
							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-2"
									style="font-size: 14px; letter-spacing: 4px; font-weight: 400; width: 182px;">
									<label class="labels">주소<img
										src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
										alt="필수"></label>
								</div>

								<div class="col-xs-2">
									<label class="labels" for="address_code"></label> <input
										type="text" id="sample6_postcode" class="formInput"
										id="address_code" name="address_code" placeholder="우편번호"
										readonly>
								</div>
								<div class="col-xs-2">
									<input type="button" value="우편번호 찾기" class="btn btn-default"
										onclick="sample6_execDaumPostcode()">
								</div>
								<div class="col-xs-5"></div>

							</div>
							<div class="form-group">
								<div class="col-xs-4"></div>
								<div class="col-xs-2" style="width: 192px; margin-left: -8px;">
									<label class="labels" for="address_basic"></label> <input
										type="text" class="formInput" id="sample6_address"
										name="address_basic" placeholder="주소" readonly>
								</div>
								<div class="col-xs-4" style="width: 395px;">
									<label class="labels" for="address_detail"></label> <input
										type="text" class="formInput" id="sample6_detailAddress"
										name="address_detail" placeholder="상세주소">
								</div>
							</div>

							<div class="form-group">
								<div class="col-xs-2"></div>

								<div class="col-xs-1">
									<label class="labels">생년월일</label>
								</div>
								<div class="col-xs-1"></div>
								<div class="col-xs-3"
									style="margin-top: 8px; margin-left: -16px;">
									<select name="birth_year" class="btn btn-default">
										<option value="1920">1920</option>
										<option value="1921">1921</option>
										<option value="1922">1922</option>
										<option value="1923">1923</option>
										<option value="1924">1924</option>
										<option value="1925">1925</option>
										<option value="1926">1926</option>
										<option value="1927">1927</option>
										<option value="1928">1928</option>
										<option value="1929">1929</option>
										<option value="1930">1930</option>
										<option value="1931">1931</option>
										<option value="1932">1932</option>
										<option value="1933">1933</option>
										<option value="1934">1934</option>
										<option value="1935">1935</option>
										<option value="1936">1936</option>
										<option value="1937">1937</option>
										<option value="1938">1938</option>
										<option value="1939">1939</option>
										<option value="1940">1940</option>
										<option value="1941">1941</option>
										<option value="1942">1942</option>
										<option value="1943">1943</option>
										<option value="1944">1944</option>
										<option value="1945">1945</option>
										<option value="1946">1946</option>
										<option value="1947">1947</option>
										<option value="1948">1948</option>
										<option value="1949">1949</option>
										<option value="1950">1950</option>
										<option value="1951">1951</option>
										<option value="1952">1952</option>
										<option value="1953">1953</option>
										<option value="1954">1954</option>
										<option value="1955">1955</option>
										<option value="1956">1956</option>
										<option value="1957">1957</option>
										<option value="1958">1958</option>
										<option value="1959">1959</option>
										<option value="1960">1960</option>
										<option value="1961">1961</option>
										<option value="1962">1962</option>
										<option value="1963">1963</option>
										<option value="1964">1964</option>
										<option value="1965">1965</option>
										<option value="1966">1966</option>
										<option value="1967">1967</option>
										<option value="1968">1968</option>
										<option value="1969">1969</option>
										<option value="1970">1970</option>
										<option value="1971">1971</option>
										<option value="1972">1972</option>
										<option value="1973">1973</option>
										<option value="1974">1974</option>
										<option value="1975">1975</option>
										<option value="1976">1976</option>
										<option value="1977">1977</option>
										<option value="1978">1978</option>
										<option value="1979">1979</option>
										<option value="1980">1980</option>
										<option value="1981">1981</option>
										<option value="1982">1982</option>
										<option value="1983">1983</option>
										<option value="1984">1984</option>
										<option value="1985">1985</option>
										<option value="1986">1986</option>
										<option value="1987">1987</option>
										<option value="1988">1988</option>
										<option value="1989">1989</option>
										<option value="1990">1990</option>
										<option value="1991">1991</option>
										<option value="1992">1992</option>
										<option value="1993">1993</option>
										<option value="1994">1994</option>
										<option value="1995">1995</option>
										<option value="1996">1996</option>
										<option value="1997">1997</option>
										<option value="1998">1998</option>
										<option value="1999">1999</option>
										<option value="2000">2000</option>
										<option value="2001">2001</option>
										<option value="2002">2002</option>
										<option value="2003">2003</option>
										<option value="2004">2004</option>
										<option value="2005">2005</option>
										<option value="2006">2006</option>
										<option value="2007">2007</option>
										<option value="2008">2008</option>
										<option value="2009">2009</option>
										<option value="2010">2010</option>
										<option value="2011">2011</option>
										<option value="2012">2012</option>
										<option value="2013">2013</option>
										<option value="2014">2014</option>
										<option value="2015">2015</option>
										<option value="2016">2016</option>
										<option value="2017">2017</option>
										<option value="2018">2018</option>
										<option value="2019">2019</option>
										<option value="2020">2020</option>

									</select> <select name="birth_month" class="btn btn-default">
										<option value="01">01</option>
										<option value="02">02</option>
										<option value="03">03</option>
										<option value="04">04</option>
										<option value="05">05</option>
										<option value="06">06</option>
										<option value="07">07</option>
										<option value="08">08</option>
										<option value="09">09</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
									</select> <select name="birth_day" class="btn btn-default">
										<option value="01">01</option>
										<option value="02">02</option>
										<option value="03">03</option>
										<option value="04">04</option>
										<option value="05">05</option>
										<option value="06">06</option>
										<option value="07">07</option>
										<option value="08">08</option>
										<option value="09">09</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
										<option value="13">13</option>
										<option value="14">14</option>
										<option value="15">15</option>
										<option value="16">16</option>
										<option value="17">17</option>
										<option value="18">18</option>
										<option value="19">19</option>
										<option value="20">20</option>
										<option value="21">21</option>
										<option value="22">22</option>
										<option value="23">23</option>
										<option value="24">24</option>
										<option value="25">25</option>
										<option value="26">26</option>
										<option value="27">27</option>
										<option value="28">28</option>
										<option value="29">29</option>
										<option value="30">30</option>
										<option value="31">31</option>
									</select>
								</div>
								<div class="col-xs-1">
									<label class="labels">사진</label>
								</div>
								<div class="col-xs-3">
									<input type="file" name="pic">
								</div>


							</div>

							<div class="form-group">
								<div class="col-xs-2" style="font-size: 14px;"></div>
								<div class="col-xs-1">
									<label class="labels">실력</label>
								</div>
								<div class="col-xs-3" style="margin-left: 82px;">
									<select name="level" class=formInput>
										<option value="5">상</option>
										<option value="4">중상</option>
										<option value="3">중</option>
										<option value="2">중하</option>
										<option value="1">하</option>
									</select>
								</div>

							</div>

							<div class="form-group">
								<div class="col-xs-2" style="font-size: 14px;"></div>
								<div class="col-xs-2"
									style="font-size: 14px; letter-spacing: 4px; font-weight: 400;">
									<label class="labels">선호포지션</label>
								</div>
								<div class="col-xs-8 checkbox">
									<div id="checkboxmargin">
										<div class="col-xs-2">
											<label2> <input type="checkbox" name=position
												value="FW"> FW </label2>
										</div>

										<div class="col-xs-2">
											<label2> <input type="checkbox" name=position
												value="MF"> MF </label2>
										</div>
										<div class="col-xs-2">
											<label2> <input type="checkbox" name=position
												value="DF"> DF </label2>
										</div>
										<div class="col-xs-2">
											<label2> <input type="checkbox" name=position
												value="GK"> GK </label2>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-2">
									<label class="labels">비밀번호확인질문</label>
								</div>
								<div class="col-xs-6">
									<select name="second_pw" size="1" class=formInput
										style="width: 340px; height: 30px; margin-left: -15px;">
										<option value="Q01">기억에 남는 추억의 장소는?</option>
										<option value="Q02">자신의 인생 좌우명은?</option>
										<option value="Q03">자신의 보물 제1호는?</option>
										<option value="Q04">가장 기억에 남는 선생님 성함은?</option>
										<option value="Q05">타인이 모르는 자신만의 신체비밀이 있다면?</option>
										<option value="Q06">받았던 선물 중 기억에 남는 독특한 선물은?</option>
										<option value="Q07">유년시절 가장 생각나는 친구 이름은?</option>
										<option value="Q08">인상 깊게 본 축구경기는?</option>
										<option value="Q09">신었던 축구화 중에서 제일좋은 축구화는?</option>
										<option value="Q10">자신이 제일 좋아하는 축구팀은?</option>
										<option value="Q11">공개하지 않는 어릴 적 별명이 있다면?</option>
										<option value="Q12">초등학교 때 기억에 남는 짝꿍 이름은?</option>
										<option value="Q13">다시 태어나면 되고 싶은 축구선수는?</option>
										<option value="Q14">제일 좋아하는 축구선수의 이름은?</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-8" style="width: 785px;">
									<label class="labels" for="second_pwc">비밀번호확인답변</label> <input
										type="text" class="formInput" id="second_pwc"
										name="second_pwc">
								</div>
							</div>

							<div class="form-group" style="height: 30px;">
								<div class="col-xs-2"></div>
								<div class="col-xs-2">
									<label class="labels"> 환불계좌정보<img
										src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif"
										alt="필수">
									</label>
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-2" style="margin-top: 5px;">
									<select name="bank_code" size="1" class=formInput
										style="width: 130px; height: 30px;">
										<option value="001">한국은행</option>
										<option value="002">산업은행</option>
										<option value="003">기업은행</option>
										<option value="004">국민은행</option>
										<option value="005">외환은행</option>
										<option value="007">수협중앙회</option>
										<option value="008">농협중앙회</option>
										<option value="011">농.축협</option>
										<option value="020">우리은행</option>
										<option value="023">SC제일은행</option>
										<option value="027">한국씨티은행</option>
										<option value="045">새마을금고</option>
										<option value="048">신협중앙회</option>
										<option value="071">우체국</option>
										<option value="081">하나은행</option>
										<option value="088">신한은행</option>
									</select>
								</div>
								<div class="col-xs-3" style="margin-left: -9px; width: 375px;">
									<label class="labels" for="account_code">계좌번호</label> <input
										type="text" class="formInput" id="account_code"
										name="account_code">
								</div>
								<div class="col-xs-1"
									style="font-size: 16px; font-weight: 400; width: 20px;"></div>
								<div class="col-xs-2" style="width: 203px;">
									<label class="labels" for="account_holder">예금주</label> <input
										type="text" class="formInput" id="account_holder"
										name="account_holder">
								</div>
							</div>



							<div class="form-group" style="">
								<div class="col-xs-4"></div>

								<div class="col-xs-3"
									style="margin-left: 90px; margin-bottom: 90px;">

									<input type="button" value="가입" class="signbutton signbutton5"
										onClick="joinsubmit()"> <input type="button"
										value="취소" class="signbutton signbuttoncancel"
										onClick="script: location.href='sign.jsp'">
								</div>
							</div>

							<input type="hidden" name="hidden" value="" />

						</form>
					</div>
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

</body>

</html>
