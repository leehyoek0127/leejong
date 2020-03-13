<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="model.TeamDto"%>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.ArrayList"%>


<%@ page import="java.util.Date"%>
<%
//request URL 받아오기 나중에 쓸지도 ?
Enumeration param = request.getParameterNames();
String strParam = "";
while(param.hasMoreElements()) {
    String name = (String)param.nextElement();
    String value = request.getParameter(name);
    strParam += name + "=" + value + "&";
}
String URL = request.getRequestURL() + "?" + strParam;

//URL 받기 끝

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
<!-- 팀 상세보기 리스트  -->
<%ArrayList<TeamDto> TeamList = (ArrayList<TeamDto>) request.getAttribute("TeamList");
session.setAttribute("TeamListDetail",TeamList);
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
<title>team_info</title> 

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
.league_wrap .league_cont {
    margin: 0 auto;
    margin-top: 60px;
    max-width: 1200px;
}
h1, h2, h3, h4, h5, h6 {
    font-weight: normal;
}
h3 {
    display: block;
    font-size: 1.17em;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
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
.league_cont .detail_score.team {
    margin-bottom: 84px;
    max-width: 1200px;
}
.league_cont .detail_score {
    margin: 0 auto;
    margin-top: 60px;
    max-width: 800px;
}
.league_cont .detail_score .h_bar {
    margin-top: 55px;
    width: 700px;
}
.h_bar {
    position: relative;
    padding-left: 26px;
    color: #2c3c57;
    font-size: 30px;
    line-height: 40px;
    letter-spacing: -2px;
}
p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
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
.table_wrap {
    margin-top: 15px;
}
.league_cont .detail_score .table_wrap.indi table {
    border: 1px solid #c2c2c2;
    border-top: 0;
    border-left: 0;
}
.table_wrap table {
    border: 1px solid #636363;
    border-top: 0;
    border-left: 0;
}
table {
    width: 100%;
    border: 0 none;
    border-collapse: collapse;
    border-spacing: 0;
}
table {
    display: table;
    border-collapse: separate;
    border-spacing: 2px;
    border-color: grey;
}
table caption {
    width: 0;
    height: 0;
    line-height: 0px;
    visibility: hidden;
}
caption {
    display: table-caption;
    text-align: -webkit-center;
}
colgroup {
    display: table-column-group;
}
tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}
tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}
.league_cont .detail_score .table_wrap.indi table tbody tr td {
    padding: 8px 0;
    border-top: 1px solid #c2c2c2;
    border-left: 1px solid #c2c2c2;
}
.table_wrap table tbody tr td {
    padding: 18px 0;
    height: 20px;
    color: #2a2a2a;
    font-size: 18px;
    line-height: 28px;
    text-align: center;
    word-break: keep-all;
}

table th, table td {
    border: 0 none;
}
td {
    display: table-cell;
    vertical-align: inherit;
}
.league_cont .detail_score.team .table_wrap.indi table tbody tr td .pic {
    width: 240px;
    height: auto;
}
.league_cont .detail_score .table_wrap.indi table tbody tr td .pic {
    display: inline-block;
    width: 200px;
    height: 258px;
}
.table_wrap table tbody tr td .pic {
    display: inline-block;
    width: 90px;
    height: 105px;
    /* background: url(/images/content/bg_pic_info.jpg) no-repeat 0 0; */
    font-size: 0;
    line-height: 0;
    vertical-align: middle;
}
.league_cont .detail_score .table_wrap.indi table tbody tr td .pic.emblem img {
    width: 240px;
    height: auto;
}
.league_cont .detail_score .table_wrap.indi table tbody tr td .pic img {
    width: auto;
}
.h_tit {
    position: relative;
    margin-bottom: 45px;
    padding-bottom: 24px;
    font-size: 60px;
    font-family: 'NanumBarunGothicL';
    line-height: 60px;
    text-align: center;
}
img {
    border: 0 none;
}
.tab_wrap {
    border: 1px solid #4b4b4b;
    height:72px;
}
ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}

.tab_wrap ul li.on {
    z-index: 10;
}
.tab_wrap ul li {
    position: relative;
    float: left;
    
}
li {
    display: list-item;
    text-align: -webkit-match-parent;
}
ol, ul {
    list-style-type: none;
}
ul {
    list-style-type: disc;
}
.tab_wrap ul li.on > a {
    background: #2c3c57;
    color: #fff;
}
.tab_wrap ul li:first-child > a {
    border-left: 0;
}
.tab_wrap ul li > a {
    display: block;
    position: relative;
    border-left: 1px solid #2c3c57;
    background: #fff;
    color: #2c3c57;
    font-size: 22px;
    font-weight: 700;
    line-height: 70px;
    text-align: center;
}
a:visited {
    text-decoration: none;
}
a {
    color: #000;
    text-decoration: none;
}
a:-webkit-any-link {
    color: -webkit-link;
    cursor: pointer;
    text-decoration: underline;
}
.tab_wrap ul li.on > a:after {
    content: "";
    display: block;
    position: absolute;
    left: 50%;
    bottom: -13px;
    margin-left: -6px;
    width: 13px;
    height: 13px;
    background: url(img/bg_tab_arr.png) no-repeat 0 0;
}
.team .tab_wrap + .league_schedule {
    margin-top: 60px;
    /* padding-top: 40px; */
}
.league_cont .league_schedule {
    position: relative;
    padding-top: 1px;
    clear: both;
}
form {
    display: block;
    margin-top: 0em;
}
input {
    box-sizing: border-box;
    -moz-box-sizing: border-box;
}
input[type="hidden" i] {
    display: none;
    -webkit-appearance: initial;
    background-color: initial;
    cursor: default;
    padding: initial;
    border: initial;
}
user agent stylesheet
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
.league_cont .league_schedule .select {
    width: 210px;
    height: 40px;
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
label {
    cursor: default;
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
user agent stylesheet
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
option {
    font-weight: normal;
    display: block;
    white-space: pre;
    min-height: 1.2em;
    padding: 0px 2px 1px;
}
.league_cont .league_schedule table {
    border: 1px solid #d7d7d7;
    border-top: 2px solid #353535;
}
.table_wrap table {
    border: 1px solid #636363;
    border-top: 0;
    border-left: 0;
}
table {
    width: 100%;
    border: 0 none;
    border-collapse: collapse;
    border-spacing: 0;
}
.league_cont .detail_score .table_wrap.indi table tbody tr th {
    border-top: 1px solid #c2c2c2;
    border-left: 1px solid #c2c2c2;
}
.table_wrap table tbody tr th {
    background: #f0f1f3;
    color: #2c3c57;
    font-size: 18px;
    font-weight: 700;
    line-height: 28px;
    text-align: center;
}
.table_wrap table th, .table_wrap table td {
    border-top: 1px solid #636363;
    
    font-size: 12px;
    vertical-align: middle;
}
table th, table td {
    border: 0 none;
}
th {
    display: table-cell;
    vertical-align: inherit;
    font-weight: bold;
    text-align: -internal-center;
}
.tab_wrap ul.t03 li {
    width: 33.33%;
}
.tab_wrap ul li.on {
    z-index: 10;
}
.tab_wrap ul li {
    position: relative;
    float: left;
   
}
li {
    display: list-item;
    text-align: -webkit-match-parent;
}
.t03{
	margin:0px;
	padding:0px;
}

</style>
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
			
				<div class="cbox">
					<div class="league_cont team">
					<h3 class="h_tit"><%=TeamList.get(0).getT_name() %></h3>
					<input class="signbutton signbutton5" type="button" value="가입신청(어떤 방식으로 할지..)" style="float: right; margin: 10px;" onClick="script:location.href='teamRegister.jsp'">
					<div class="detail_score team">
						<p class="h_bar">팀 상세 정보</p>
						<div class="table_wrap indi">
							<table>
								<caption>상세 정보 테이블</caption>
								<colgroup>
									<col style="width:270px" class="w01">
									<col style="width:255px" class="w02">
									<col style="">
								</colgroup>
								<tbody>
									<tr>
										<td rowspan="4" class="pic">
											<span class="pic emblem"><img src="img/<%=TeamList.get(0).getT_logo() %>" alt=""></span>
										</td>
										<th scope="row">팀 생성일</th>
										<td><%=TeamList.get(0).getT_birth() %></td>
									</tr>
									<tr>
										<th scope="row">팀분류</th>
										<td> <%=TeamList.get(0).getT_class() %></td>
									</tr>
									<tr>
										<th scope="row">팀관리자</th>
										<td>이종혁(어떻게 할것인가)</td>
									</tr>
									<tr>
										<th scope="row">팀유니폼</th>
										<td>Home :<%=TeamList.get(0).getT_uniform_home() %><br>Away : <%=TeamList.get(0).getT_uniform_away() %></td>
									</tr>
								</tbody>
							</table>
						</div>
					
					</div>
					<div class="tab_wrap">
						<ul class="t03">
							<li class="on"><a href="team_info.jsp">팀일정</a></li>
							<li><a href="team_ranking.do?command=teamranking&teamcode=<%=TeamList.get(0).getT_code()%>">팀순위</a></li>
							<li><a href="team_ranking.do?command=teamplayer&teamcode=<%=TeamList.get(0).getT_code()%>">선수명단</a></li> 
						</ul>
					</div>

					<div class="league_schedule">
							<form name="form" method="get" action="?">
							<input type="hidden" name="tcode" value="T1769">
							<span class="select">
								<label for="select01">2020년</label>
								<select id="select01" name="lyear" class="select_box" onchange="this.form.submit();">
									
										<option value="2020">2020년</option>
									
								</select>
							</span>
							</form>
						<div class="table_wrap">
							<table>
								<caption>LEAGUE SCHEDULE 테이블</caption>
								<colgroup>
									<col style="width:120px" class="w01 tb">
									<col style="">
									<col style="width:270px" class="w02">
									<col style="width:120px" class="w03">
									<col style="width:270px" class="w04">
									<col style="width:120px" class="w05">
								</colgroup>
								<tbody>
								
									<tr>
										<td colspan="7">등록된 일정이 없습니다.</td>
									</tr>
								
								</tbody>
							</table>
						</div>

					</div>
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
