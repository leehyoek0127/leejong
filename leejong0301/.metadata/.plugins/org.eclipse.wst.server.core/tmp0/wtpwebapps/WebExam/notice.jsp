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
@media screen and (max-width: 1360px)
#wrapper #container .content > div {
    padding: 0 20px;
}
#wrapper #container .content > div {
    margin: 0 auto;
    max-width: 1200px;
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
h1, h2, h3, h4, h5, h6 {
    font-weight: normal;
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
.table_wrap {
    margin-top: 15px;
}
.table_wrap.list table {
    border: 0;
    border-top: 2px solid #2c3c57;
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
table caption {
    width: 0;
    height: 0;
    line-height: 0px;
    visibility: hidden;
}
.table_wrap.list table thead tr th {
    padding: 16px 0;
    border: 0;
    border-bottom: 1px solid #d5d8dd;
    background: #fff;
    height: 21px;
    color: #2c3c57;
    font-size: 18px;
    font-weight: 700;
    line-height: 21px;
}
.table_wrap table thead tr th {
    padding: 21px 0;
    height: 22px;
    background: #f0f1f3;
    color: #383838;
    font-size: 22px;
    line-height: 22px;
    text-align: center;
}
.table_wrap table th, .table_wrap table td {
    border-top: 1px solid #636363;
    border-left: 1px solid #636363;
    font-size: 12px;
    vertical-align: middle;
}
table th, table td {
    border: 0 none;
}
table th {
    font-weight: normal;
}
.table_wrap.list table tbody tr td {
    padding: 9px 0;
    height: 32px;
    border: 0;
    border-bottom: 1px solid #d5d8dd;
    color: #383838;
    font-size: 16px;
    line-height: 32px;
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
.table_wrap table th, .table_wrap table td {
    border-top: 1px solid #636363;
    border-left: 1px solid #636363;
    font-size: 12px;
    vertical-align: middle;
}
table th, table td {
    border: 0 none;
}
.table_wrap.list table tbody tr td.al_left {
    padding: 9px 10px;
}
.table_wrap table tbody tr td.al_left {
    padding-left: 20px;
    text-align: left;
}
.al_left {
    text-align: left !important;
}
.table_wrap.list table tbody tr td a.tit {
    overflow: hidden;
    display: inline-block;
    color: #2c3c57;
    height: 32px;
    line-height: 32px;
    vertical-align: top;
}
a:visited {
    text-decoration: none;
}
a {
    color: #000;
    text-decoration: none;
}
.notice_wrap.list table tbody tr td:nth-child(3), .notice_wrap.list table tbody tr td:nth-child(4) {
    color: #a7a7a7;
}
.notice_wrap.list table tbody tr td:nth-child(3), .notice_wrap.list table tbody tr td:nth-child(4) {
    color: #a7a7a7;
}
.pager_wrap {
    position: relative;
    margin-top: 42px;
    
    line-height: 0;
    text-align: center;
    letter-spacing: -10px;
}
.pager_wrap .search {
    position: relative;
    margin-bottom: 42px;
    
    line-height: 0;
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
.pager_wrap .search .select label {
    height: 41px;
    line-height: 41px;
    letter-spacing: 0;
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
.pager_wrap .search .select select {
    height: 41px;
    line-height: 41px;
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
.pager_wrap .search input {
    width: 235px;
    height: 43px;
    border: 1px solid #d0d0d0;
    border-left: 0;
    border-right: 0;
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
.pager_wrap .search button {
    width: 69px;
    height: 43px;
    vertical-align: top;
    background: #2c3c57 url(img/icon_search.png) no-repeat center center;
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
.pager_wrap a.btn_page.prev {
    margin: 0;
    background: #fff url(img/icn_page_prev.png) no-repeat center center;
}
.pager_wrap a.btn_page {
}
.pager_wrap a {
    display: inline-block;
    margin-left: 8px;
    width: 79px;
    height: 41px;
    border: 1px solid #cecece;
    background: #fff;
    color: #afafaf;
    font-size: 16px;
    line-height: 41px;
    vertical-align: top;
    letter-spacing: 0;
}
a:visited {
    text-decoration: none;
}
a {
    color: #000;
    text-decoration: none;
}
.hide {
    display: block;
    overflow: hidden;
    position: absolute;
    top: 0;
    left: 0;
    width: 0;
    height: 0;
    text-indent: -9999px;
}
.pager_wrap .page {
    display: inline-block;
    margin: 0 22px;
    text-align: center;
    vertical-align: top;
}
.pager_wrap .page a.on {
    border: 1px solid #2c3c57;
    background: #2c3c57;
    color: #fff;
    text-decoration: none;
}
.pager_wrap .page a:first-child {
    margin: 0;
}
.pager_wrap .page a {
    position: relative;
    width: 41px;
    height: 41px;
}
.pager_wrap a {
    display: inline-block;
    margin-left: 8px;
    width: 79px;
    height: 41px;
    border: 1px solid #cecece;
    background: #fff;
    color: #afafaf;
    font-size: 16px;
    line-height: 41px;
    vertical-align: top;
    letter-spacing: 0;
}
a:visited {
    text-decoration: none;
}
a {
    color: #000;
    text-decoration: none;
}
.pager_wrap a.btn_page.next {
    margin: 0;
    background: #fff url(img/icn_page_next.png) no-repeat center center;
}
.pager_wrap .search .select {
    width: 90px;
    height: 43px;
    border: 1px solid #d0d0d0;
    border-right: 0;
    vertical-align: top;
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
					<div class="notice_wrap list">
				<h3 class="h_tit">공지사항</h3>
				
				<div class="table_wrap list">
					<table>
						<caption>공지사항 리스트</caption>
						<colgroup>
							<col style="width:90px" class="w01">
							<col style="">
							<col style="width:155px" class="w02">
							<col style="width:85px" class="tb">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">작성일</th>
								<th scope="col" class="tb">조회</th>
							</tr>
						</thead>
						<tbody>
					
							<tr>
								<td>19</td>
								<td class="al_left"><a href="comm_notice_view.asp?cno=21&amp;page=1" class="tit">제 2희 손흥민을 꿈꿔라! AIA W&amp;P FC 선수 공개테스트 1기 모집</a></td>
								<td>2019.06.05</td>
								<td class="tb">987</td>
							</tr>
					
							<tr>
								<td>18</td>
								<td class="al_left"><a href="comm_notice_view.asp?cno=20&amp;page=1" class="tit">[2019 플레이컵 풋살 페스티벌]</a></td>
								<td>2019.04.02</td>
								<td class="tb">6,463</td>
							</tr>
					
							<tr>
								<td>17</td>
								<td class="al_left"><a href="comm_notice_view.asp?cno=19&amp;page=1" class="tit">[울산북구점] 불금 풋살 이벤트!</a></td>
								<td>2019.02.14</td>
								<td class="tb">880</td>
							</tr>
					
							<tr>
								<td>16</td>
								<td class="al_left"><a href="comm_notice_view.asp?cno=18&amp;page=1" class="tit">[HM슈퍼메가 이벤트] 제 1회 HMSPORTS배 FIFA 도장깨깃!</a></td>
								<td>2019.01.22</td>
								<td class="tb">795</td>
							</tr>
					
							<tr>
								<td>15</td>
								<td class="al_left"><a href="comm_notice_view.asp?cno=17&amp;page=1" class="tit">2019 HM풋살파크 특급 이벤트! </a></td>
								<td>2019.01.07</td>
								<td class="tb">1,035</td>
							</tr>
					
							<tr>
								<td>14</td>
								<td class="al_left"><a href="comm_notice_view.asp?cno=15&amp;page=1" class="tit">안산 실내풋살장 HM'락'풋살파크 오픈!!</a></td>
								<td>2018.12.07</td>
								<td class="tb">1,427</td>
							</tr>
					
							<tr>
								<td>13</td>
								<td class="al_left"><a href="comm_notice_view.asp?cno=14&amp;page=1" class="tit">[챔피언십 성인부]AIA 바이탈리티 2018 H풋살리그 전국 챔피언십 성인부 결과발표!^^</a></td>
								<td>2018.12.04</td>
								<td class="tb">709</td>
							</tr>
					
							<tr>
								<td>12</td>
								<td class="al_left"><a href="comm_notice_view.asp?cno=13&amp;page=1" class="tit">[챔피언십 초등부]AIA 바이탈리티 2018 H풋살리그 전국 챔피언십 초등부 결과발표!^^</a></td>
								<td>2018.12.04</td>
								<td class="tb">581</td>
							</tr>
					
							<tr>
								<td>11</td>
								<td class="al_left"><a href="comm_notice_view.asp?cno=12&amp;page=1" class="tit"> [챔피언십 성인부]AIA 바이탈리티 2018 H풋살리그 전국 챔피언십 성인부 조편성 및 대진스케줄 발표! </a></td>
								<td>2018.11.28</td>
								<td class="tb">1,325</td>
							</tr>
					
							<tr>
								<td>10</td>
								<td class="al_left"><a href="comm_notice_view.asp?cno=11&amp;page=1" class="tit">[챔피언십 초등부]AIA 바이탈리티 2018 H풋살리그 전국 챔피언십 초등부 조편성 및 대진스케줄 발표!</a></td>
								<td>2018.11.27</td>
								<td class="tb">1,143</td>
							</tr>
					
							<tr>
								<td>9</td>
								<td class="al_left"><a href="comm_notice_view.asp?cno=9&amp;page=1" class="tit">[대전탄방점 성인리그] 폭력 및 비신사적 행위에 따른 양팀 리그 실격패 처리</a></td>
								<td>2018.11.23</td>
								<td class="tb">848</td>
							</tr>
					
							<tr>
								<td>8</td>
								<td class="al_left"><a href="comm_notice_view.asp?cno=8&amp;page=1" class="tit">[부산가야 성인리그] 부정선수 출전에 따른 해당 경기 실격패 처리 안내</a></td>
								<td>2018.11.22</td>
								<td class="tb">886</td>
							</tr>
					
							<tr>
								<td>7</td>
								<td class="al_left"><a href="comm_notice_view.asp?cno=7&amp;page=1" class="tit">[서수원점 성인리그] 부정선수 출전에 따른 해당 경기 실격패 처리</a></td>
								<td>2018.11.16</td>
								<td class="tb">787</td>
							</tr>
					
							<tr>
								<td>6</td>
								<td class="al_left"><a href="comm_notice_view.asp?cno=6&amp;page=1" class="tit">H-LEAGUE 주니어 그룹 부산지역 최종 우승팀 발표</a></td>
								<td>2018.11.14</td>
								<td class="tb">657</td>
							</tr>
					
							<tr>
								<td>5</td>
								<td class="al_left"><a href="comm_notice_view.asp?cno=5&amp;page=1" class="tit">AIA바이탈리티 H-LEAGUE 이적시장 오픈!</a></td>
								<td>2018.11.01</td>
								<td class="tb">1,075</td>
							</tr>
					
							<tr>
								<td>4</td>
								<td class="al_left"><a href="comm_notice_view.asp?cno=4&amp;page=1" class="tit">H-LEAGUE 부산가야점 초등부 현장 스케치</a></td>
								<td>2018.10.11</td>
								<td class="tb">922</td>
							</tr>
					
							<tr>
								<td>3</td>
								<td class="al_left"><a href="comm_notice_view.asp?cno=3&amp;page=1" class="tit">AIA 바이탈리티 H-LEAGUE 서울지역 리그 대망의 START</a></td>
								<td>2018.10.02</td>
								<td class="tb">970</td>
							</tr>
					
							<tr>
								<td>2</td>
								<td class="al_left"><a href="comm_notice_view.asp?cno=2&amp;page=1" class="tit">[HM풋살파크] 홈페이지 서버 정상화 안내</a></td>
								<td>2018.09.14</td>
								<td class="tb">792</td>
							</tr>
					
							<tr>
								<td>1</td>
								<td class="al_left"><a href="comm_notice_view.asp?cno=1&amp;page=1" class="tit">[HM풋살파크] 홈페이지 개편 안내</a></td>
								<td>2018.09.12</td>
								<td class="tb">1,029</td>
							</tr>
					
						</tbody>
					</table>
				</div>

				<!-- Page -->
				<div class="pager_wrap">
					<div class="search">
						<form name="frm_search" method="get" action="?" onsubmit="Fn_Search(); return false;">
						<span class="select" style="width:100px">
							<label for="select01">제목</label>
							<select id="select01" name="s_kinds" class="select_box">
								<option value="title">제목</option>
							</select>
						</span>
						<input type="text" id="searchstr" title="" name="searchstr" value="" style="width:200px">
						<button type="input" class="btn_search" onclick="Fn_Search(); return false;"></button>
						</form>
					</div>
					<a href="comm_notice.asp?page=1" class="btn_page prev"><span class="hide">이전 페이지</span></a><span class="page"><a href="comm_notice.asp?page=1" class="on">1</a></span><a href="comm_notice.asp?page=1" class="btn_page next"><span class="hide">다음 페이지</span></a>
				</div>
				<!-- //Page -->
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
