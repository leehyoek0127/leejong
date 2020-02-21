<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList"%>

<%@ page import="java.util.Date"%>
<%
String url = request.getServletPath();
session.setAttribute("url",url);
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

%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>teamRegister</title>

<link rel="stylesheet" href="css/boardpop.css">


<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/borderRightLeft.css" media="screen">
<!-- 광호Q&A -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!--용병리스트 게시판 css파일 수정 2020.01.08-->
<link rel="stylesheet" href="yonglist_1_body.css">
<!----------------------------바디 스타일------------------------------------>

<!--기본적인 body등의 css-->
<link rel="stylesheet" href="css/basicStyle.css" media="screen">
<link rel="stylesheet" href="css/navmid33.css">

<!--서브메뉴부르는css-->
<link rel="stylesheet" href="css/style2.css" media="screen">

<!--배너2 자동슬라이드-->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.infinitecarousel.js"></script>


<!----------------------------서브메뉴마우스오버기능-------------------------->
<link rel="stylesheet" type="text/css" href="css/subMenuMouseOver.css">
<!-- 20200116 용병 버튼 크기 조절 by 문경이형 -->
<link rel="stylesheet" href="css/signbutton.css"> 
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
<!--2020.01.09Overray css추가 -->
<link rel="stylesheet" href="css/qnaOverray.css">

<script>
function teamregistsubmit()
{
	
	//var getName= (/^[가-힣]+$/);
	var uniform_home_top = reg_form.t_h_uniform_t.value.length
	var uniform_home_bottom = reg_form.t_h_uniform_b.value.length
	var uniform_home_socks=  reg_form.t_h_uniform_s.value.length
	var uniform_away_top = reg_form.t_a_uniform_t.value.length
	var uniform_away_bottom = reg_form.t_a_uniform_b.value.length
	var uniform_away_socks=  reg_form.t_a_uniform_s.value.length
	var t_logo = reg_form.t_logo.value.length
	var emaillen = reg_form.t_email.value.length
	var teamlen =reg_form.t_name.value.length
	
	if(reg_form.t_type.value=='none'){
		alert("팀분류를 선택하세요.");
		reg_form.t_type.focus();	
	}else if(teamlen<=0){
		alert("팀 이름을 입력하세요.");
		reg_form.t_name.focus();
	}else if(emaillen<=0){
		alert("이메일 주소를 입력하세요.");
		reg_form.t_email.focus()
	}else if(uniform_home_top<=0 || uniform_home_bottom <=0 || uniform_home_socks <=0){
		alert("홈 유니폼을 선택하세요.");
		reg_form.t_t_h_uniform_t.focus();
	}else if(uniform_away_top<=0 || uniform_away_bottom <=0 || uniform_away_socks <=0){
		alert("어웨이 유니폼을 선택하세요.");
		reg_form.t_t_h_uniform_t.focus();
	}else if(t_logo<=0){
		alert("팀 로고를 등록하세요.");
		reg_form.t_email.focus()
	}else
	{
		document.reg_form.submit();
	}

}
</script>
<style>

.league_regi .write_wrap {
    margin-top: 55px;
}
.write_wrap {
    margin: 0 auto;
    max-width: 800px !important;
    padding: 0 10px;
}
.write_wrap h4:first-child {
    margin-bottom: 20px;
}
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
h1, h2, h3, h4, h5, h6 {
    font-weight: normal;
}
h4 {
    display: block;
    margin-block-start: 1.33em;
    margin-block-end: 1.33em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
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
.fl_wrap:after {
    content: "";
    display: block;
    clear: both;
}
.write_wrap dl.fl_left {
    width: 49%;
}
.fl_left {
    float: left;
}
dl {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
.write_wrap dl dt {
    margin-top: 14px;
    color: #383838;
    font-size: 18px;
    font-weight: 700;
    line-height: 36px;
}
dt {
    display: block;
}
dd {
    display: block;
    
}
.write_wrap dl dd .select {
    height: 47px;
}
.select {
    display: inline-block;
    position: relative;
    padding: 0;
    height: 40px;
    border: 1px solid #e0e0e0;
    background: #fff;
    box-sizing: border-box;
    -moz-box-sizing: border-box;
}
.select:after {
    content: "";
    display: block;
    position: absolute;
    right: 12px;
    top: 50%;
    margin-top: -4px;
    width: 13px;
    height: 8px;
    background: url(img/select_arrow.png) no-repeat center center;
    background-size: 11px auto;
}
.write_wrap dl.fl_right {
    width: 49%;
}
.fl_right {
    float: right;
}
.write_wrap dl dd .select label {
    height: 45px;
    line-height: 45px;
}
.select label {
    position: absolute;
    top: 0px;
    right: 20px;
    bottom: 0;
    left: 10px;
    color: #404040;
    font-size: 16px;
    line-height: 38px;
    text-align: left;
}
.write_wrap dl dd .select select {
    height: 45px;
    line-height: 45px;
}
.select select {
    position: relative;
    z-index: 1;
    padding: 0 4px;
    width: 100%;
    height: 38px;
    line-height: 38px;
    vertical-align: top;
    opacity: 0;
    filter: alpha(opacity=0);
}
select {
    margin: 0;
    border: 1px solid #999;
    line-height: 22px;
    height: 22px;
    color: #a6a6a6;
    font-weight: bold;
}
select:not(:-internal-list-box) {
    overflow: visible !important;
}
select {
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: -internal-light-dark-color(black, white);
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    -webkit-appearance: menulist;
    box-sizing: border-box;
    align-items: center;
    white-space: pre;
    -webkit-rtl-ordering: logical;
    background-color: -internal-light-dark-color(white, black);
    cursor: default;
    margin: 0em;
    font: 400 13.3333px Arial;
    border-radius: 0px;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(169, 169, 169);
    border-image: initial;
}
.write_wrap dl dd input {
    height: 47px;
}
input[type='text'], input[type='password'] {
    -webkit-border-radius: 0;
    -webkit-appearance: none;
    outline: none;
}
input[type='text'], input[type='password'] {
    height: 45px;
    margin: 0;
    padding: 3px 9px 3px 9px;
    border: 1px solid #ddd;
    background: #fff;
    color: #383838;
    font-size: 16px;
    line-height: 43px;
    vertical-align: middle;
}
input {
    box-sizing: border-box;
    -moz-box-sizing: border-box;
}
input {
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: -internal-light-dark-color(black, white);
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    -webkit-appearance: textfield;
    background-color: -internal-light-dark-color(white, black);
    -webkit-rtl-ordering: logical;
    cursor: text;
    margin: 0em;
    font: 400 13.3333px Arial;
    padding: 1px 0px;
    border-width: 2px;
    border-style: inset;
    border-color: initial;
    border-image: initial;
}
.write_wrap dl dd .phone input {
    width: 31.333333%;
}


button {
    display: inline-block;
    padding: 0;
    border: 0;
    background: transparent;
    font-family: 'Nanum Gothic','맑은 고딕','AppleGothic','돋움','Dotum', sans-serif;
    text-align: center;
    vertical-align: middle;
    cursor: pointer;
    white-space: nowrap;
    -webkit-transition: all 0.25s ease-out;
    -moz-transition: all 0.25s ease-out;
    -ms-transition: all 0.25s ease-out;
    -o-transition: all 0.25s ease-out;
    transition: all 0.25s ease-out;
}

user agent stylesheet
button {
    -webkit-appearance: button;
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: buttontext;
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: center;
    align-items: flex-start;
    cursor: default;
    background-color: buttonface;
    box-sizing: border-box;
    margin: 0em;
    font: 400 13.3333px Arial;
    padding: 1px 6px;
    border-width: 2px;
    border-style: outset;
    border-color: buttonface;
    border-image: initial;
}
.write_wrap .upload_wrap .act_wrap .btn_file {
    display: block;
    float:right;
    top: 0;
    right: 0;
    width: 180px;
    height: 47px;
    background: #2389d8;
    color: #fff;
    font-size: 18px;
    line-height: 47px;
    text-align: center;
}
.write_wrap .upload_wrap .act_wrap .name_wrap {
    display: inline-block;
    position: relative;
    width: 577px;
    height: 45px;
    border: 1px solid #c2c2c2;
    line-height: 45px;
    float:left;
}
.write_wrap .btn_wrap {
    margin-top: 49px;
    padding-top: 40px;
    border-top: 2px solid #353535;
}
.btn_wrap {
    margin-top: 20px;
    text-align: center;
    font-size: 0;
    line-height: 0;
}
.btn_wrap .btn_base:first-child, .btn_wrap .btn_big:first-child {
    margin-left: 0 !important;
}
.btn_wrap .btn_base, .btn_wrap .btn_big {
    margin-left: 10px;
}

.write_wrap a:visited {
    text-decoration: none;
}
.btn_big {
    position: relative;
    display: inline-block;
    padding: 0 15px;
    width: 333px;
    background: #2c3c57;
    color: #fff !important;
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
.write_wrap a:-webkit-any-link {
    color: -webkit-link;
    cursor: pointer;
    text-decoration: underline;
}
.write_wrap .gray {
    background: #868686 !important;
}
.btn_wrap:after {
    content: "";
    display: block;
    clear: both;
}





#matList submit {
    text-decoration: none;
    border:none;
}
.write_wrap submit:-webkit-any-link {
    color: -webkit-link;
    cursor: pointer;
    text-decoration: underline;
}







</style>
</head>
<body>
<%//2020_01_22 로그인정보에 따라서 
	if(uss.equals("GUEST")){
		out.println("<script>alert('로그인 후 이용해주시기 바랍니다.');location.href='teamlist.do?command=teamlist';</script>");
	
		
	}else{

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
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d25325.265446899888!2d127.02924799651784!3d37.492391917303266!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca5bed583f92d%3A0xc93c837d2875ade6!2z7ZKL7IK07J6l!5e0!3m2!1sko!2skr!4v1575961834128!5m2!1sko!2skr" width="100%" height="100%" frameborder="0" style="border: 0;" allowfullscreen=""></iframe>
			</div>
		</div>
	</div>
	<section id="main">
		<section id="mainright">
			<div id="matList">
			
				<div class="cbox">
					<div class="write_wrap">
						<h4 class="h_bar line">팀 등록</h4>
						<form name="reg_form" id="reg_form" method="post" action="regist.do?command=team_regist" role="form"
							autocomplete="off" >
						<div class="fl_wrap">
							<dl class="fl_left">
								<dt>팀분류</dt>
								<dd>
										<select  class="select" style="width:100%" id="t_type" name="t_type"> 
										<option value="">팀분류를 선택해 주세요.</option>
										<option value="초등부">초등부</option>
										<option value="성인부">성인부</option>
										</select>
								</dd>
							</dl>
							
							<dl class="fl_right">
								<dt>팀명</dt>
								<dd><input type="text" title="" name="t_name" style="width:100%"></dd>
							</dl>
							
							
							<dl>
								<dt>이메일</dt>
								<dd><input type="text" title="" name="t_email" style="width:100%"></dd>
							</dl>
            				<dl class="fl_left">
								<dt>유니폼(홈)</dt>
								<dd>
									<div class="phone">
									<input type="text" title="" name="t_h_uniform_t" placeholder="상의색"><span></span>
									<input type="text" title="" name="t_h_uniform_b" placeholder="하의색"><span></span>
									<input type="text" title="" name="t_h_uniform_s" placeholder="스타킹색">
									</div>
								</dd>
							</dl>
							<dl class="fl_right">
								<dt>유니폼(어웨이)</dt>
								<dd>
									<div class="phone">
									<input type="text" title="" name="t_a_uniform_t" placeholder="상의색"><span></span>
									<input type="text" title="" name="t_a_uniform_b" placeholder="하의색"><span></span>
									<input type="text" title="" name="t_a_uniform_s" placeholder="스타킹색">
									</div>
								</dd>
							</dl>							
						</div>
						<dl>
							<dt>팀엠블럼</dt>
							<dd>
								<div class="upload_wrap">
									<div class="act_wrap">
										<span class="name_wrap">
											<span class="name"></span>
										</span>
										<button type="button" class="btn_file" onclick="document.getElementById('file').click();">찾아보기</button>
										<input name="t_logo" type="file" accept=".gif, .jpg, .jpeg, .png" id="file" placeholder="" onchange="fileTypeChk(this)" style="display:none">
									</div>
								</div>
							</dd>
						</dl>

						<div class="fl_wrap">
							
						</div>

						<div class="btn_wrap">
							<input type="button" class="btn_big" onClick="teamregistsubmit()" style="border:none;" value="등록하기">
							
							<a href="/league/league.asp" class="btn_big gray">취소하기</a>
						</div>
						<input type="hidden" name="id" id="id" value="<%=uss%>" />
					</form>
					</div>
				</div>
			</div>
			
		</section>
	</section>
	<script>
	function team_regist_submit(){
		alert(1);
		$('#reg_form').submit();
		
	}
	</script>
	<footer id="footer">
		<jsp:include page="Footer.jsp" />
	</footer>
	<%} %>
</body>
</html>
