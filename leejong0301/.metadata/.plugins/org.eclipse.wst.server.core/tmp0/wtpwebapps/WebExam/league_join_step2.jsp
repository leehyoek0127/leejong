<%@page import="model.TeamDto"%>
<%@page import="model.LeagueDto"%>
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
	//2020.01.14 로그인 id 수정
	String yid = (String) session.getAttribute("id");
%>
<%
	String branch_name = (String)request.getAttribute("branch_name");
	ArrayList<LeagueDto> leaguecode = (ArrayList<LeagueDto>)request.getAttribute("leaguecode");
	ArrayList<TeamDto> teamlist = (ArrayList<TeamDto>)request.getAttribute("teamlist");
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
<title>league_join_step1</title>

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
<!----------------------------오버레이 화면 띄우는 스크립트------------------------------------>
<script>						
	function selectOne(index,yid) {
		$.ajax({
		type:"get",
		
		url:"./yongSelectOne.jsp",       
		data:{
	
			index:index,
			yid:yid
		},	
		success:whenSuccess2,
		error:whenError2
		});
	}
		function whenSuccess2(resdata){
			console.log(resdata);
			$("#innerpop").html(resdata);
		}
		function whenError2(){
			alert("리스트에러");
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
.write_wrap .code button {
    display: block;
    position: absolute;
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
.write_wrap .code {
    position: relative;
    padding-right: 180px;
}





</style>
</head>
<body>
	<!-- 유즈빈 사용 -->
	
	
	
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
						<h4 class="h_bar line">리그접수</h4>
						<form name="reg_form" id="reg_form" method="post" action="league_join_step3.do?command=league_join_step3" target="HiddenFrame">
						<input type="hidden" name="branch_code" value="HM0007">
						<div class="fl_wrap">
							
							<dl class="fl_left">
								<dt>팀선택</dt>
								<dd>
									<span class="select" style="width:100%"> 
										<label for="select03">팀이름</label>
										<select id="select03" name="team_name"> 
										<option value="">팀이름</option>
										<%for(int i=0; i<teamlist.size(); i++){ %>
										<option value="<%=teamlist.get(i).getT_name() %>"><%=teamlist.get(i).getT_name() %></option>
										<%} %>
										</select>
										<input type=hidden name="team_code" id="team_code" value="" />
									</span>
								</dd>
							</dl>
							
							<dl class="fl_right">
								<dt>소속지점</dt>
								<dd><input type="text" name="branch_name" style="width:100%;" readonly value=<%=branch_name %>></dd>
							</dl>
							
						</div>
						<dl>
							<dt>컵/리그 선택</dt>
							<dd>
								<span class="select" style="width:100%"> 
									<label for="select02">컵/리그</label>
									<select id="select02" > 
									<option value="">컵/리그</option>
									<%for(int i=0; i<leaguecode.size(); i++){ %>
									<option value="<%=leaguecode.get(i).getLeague_name() %>"><%=leaguecode.get(i).getLeague_name() %></option>
									<%} %>
									</select>
									<input type=hidden name="league_code" id="league_code" value="" />
									<input type=hidden name="id" id="id" value="<%=uss %>" />
								</span>
								
							</dd>
						</dl>
						<div class="btn_wrap">
							<a href="javascript:league_step2_teamcheck();" class="btn_big" "="">등록하기</a>
							<a href="league_join_step1.asp" class="btn_big gray">취소하기</a>
						</div>
						</form>
						<script>
						$(document).ready(function() {
							$("#select02").change(function(e) {
								var x = this.selectedIndex;
								var y = this.options;
								var idx = y[x].index;
								console.log("선택한 index:"+idx);
								var leaguecodeList = [];
								<%for(int i=0; i<leaguecode.size(); i++){ %>
									leaguecodeList[<%=i%>]='<%=leaguecode.get(i).getLeague_code()%>'
								<%}%>
								console.log("지점넘버 리스트:"+leaguecodeList);
								$("#league_code").val(leaguecodeList[idx-1]);
							});
							$("#select03").change(function(e) {
								var x1 = this.selectedIndex;
								var y1 = this.options;
								var idx1 = y1[x1].index;
								console.log("선택한팀의 index:"+idx1);
								var teamcodeList = [];
								<%for(int i=0; i<teamlist.size(); i++){ %>
								teamcodeList[<%=i%>]='<%=teamlist.get(i).getT_code()%>'
								<%}%>
								console.log("팀코드넘버 리스트:"+teamcodeList);
								$("#team_code").val(teamcodeList[idx1-1]);
							});
						});
						
						
						
						
							
							function league_step2_teamcheck() {

								$.ajax({
									type : "post",
									url : "./leaguestep2submit.do?command=leaguestep2teamcheck",
									dataType : "json",
									data : {
										team_name : $("#select03").val(),
										team_code : $("#team_code").val(),
										league_code : $("#league_code").val(),
										id : $("#id").val()
									},
									success : whenSuccesscheck,
									error : whenErrorcheck
								});
							}
							
							function whenSuccesscheck(resdata) {
								
								var leagueteamresult = resdata[0].leagueteamresult;
								var reg_form = $("#reg_form");
								if(leagueteamresult=="ture"){
									
									
									reg_form.submit();
								}else if(leagueteamresult=="ture+"){
									alert("이미 참가완료된 회원입니다.");
									
								}else{
									alert("오류가발생했습니다.(ajax.whenSuccesscheck)");
								}
									
							}
							function whenErrorcheck() {
								var team_name = $("#select03").val();
								var league_name = $("#select02").val();
								alert(team_name+" 팀은 "+league_name+" 리그에 접수되어있지 않습니다.");
							}
						</script>
					</div>
				</div>
			</div>
			
		</section>
	</section>
	<footer id="footer">
		<jsp:include page="Footer.jsp" />
	</footer>
</body>
</html>
