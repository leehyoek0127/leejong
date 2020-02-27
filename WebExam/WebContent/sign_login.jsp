<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	//2020_01_02 수정부분
	String uss = (String) session.getAttribute("id");
	String log = "로그인";
	if (uss == null)
		uss = "GUEST";
	else
		log = "로그아웃";
	//수정부분 끝
	String headerurl = (String) request.getAttribute("javax.servlet.include.request_uri");
	session.setAttribute("headerurl", headerurl);
%>

<!--마이페이지 접근 위한 css 파일 추가-->
<link href="css/frontlogin.css" media="screen, projection" rel="stylesheet" type="text/css">
<style>
.border-animation {
  --border-width: 0.1em;
  --animation-speed: 0.5s;
  --color: #ffffff;
  color: var(--color);
  position: relative;
  display: inline-block;
  font-size: 26px;
  line-height: 1em;
  transform: scale(1, 0.8);
  border: var(--border-width) solid transparent;
}
.border-animation .border-animation__inner {
  position: relative;
  display: inline-block;
  width: 312px;
  font-family: 'Six Caps', sans-serif;
  font-weight: 300;
  text-transform: uppercase;
  letter-spacing: 0.05em;
  cursor: pointer;
  padding: 0.2em;
  background: #333;
  z-index: 1;
  border: solid var(--border-width) transparent;
}
.border-animation:before, .border-animation:after {
  content: '';
  position: absolute;
  background: var(--color);
}
.border-animation:focus:before, .border-animation:hover:before {
  animation: beforeBorders var(--animation-speed) forwards ease-in-out;
}
.border-animation:focus:after, .border-animation:hover:after {
  animation: afterBorders var(--animation-speed) forwards ease-in-out;
}
.border-animation:focus, .border-animation:hover {
  animation: borderColors var(--animation-speed) steps(1) forwards;
  outline: none;
}
.border-animation:focus .border-animation__inner, .border-animation:hover .border-animation__inner {
  animation: background calc(var(--animation-speed) / 5 * 3) forwards ease-in-out;
  animation-delay: calc(var(--animation-speed) / 5 * 2);
}
@keyframes beforeBorders {
  0% {
    top: calc(var(--border-width) * -1);
    left: 50%;
    bottom: auto;
    right: auto;
    width: 0;
    height: var(--border-width);
  }
  33% {
    top: calc(var(--border-width) * -1);
    left: calc(var(--border-width) * -1);
    bottom: auto;
    right: auto;
    width: calc(var(--border-width) + 50%);
    height: var(--border-width);
  }
  66% {
    top: calc(var(--border-width) * -1);
    left: calc(var(--border-width) * -1);
    bottom: auto;
    right: auto;
    width: var(--border-width);
    height: calc((var(--border-width) * 2) + 100%);
  }
  100% {
    top: auto;
    left: calc(var(--border-width) * -1);
    bottom: calc(var(--border-width) * -1);
    right: auto;
    width: calc(var(--border-width) + 50%);
    height: calc((var(--border-width) * 2) + 100%);
  }
}
@keyframes afterBorders {
  0% {
    top: calc(var(--border-width) * -1);
    left: auto;
    bottom: auto;
    right: 50%;
    width: 0;
    height: var(--border-width);
  }
  33% {
    top: calc(var(--border-width) * -1);
    left: auto;
    bottom: auto;
    right: calc(var(--border-width) * -1);
    width: calc(var(--border-width) + 50%);
    height: var(--border-width);
  }
  66% {
    top: calc(var(--border-width) * -1);
    left: auto;
    bottom: auto;
    right: calc(var(--border-width) * -1);
    width: var(--border-width);
    height: calc((var(--border-width) * 2) + 100%);
  }
  100% {
    top: auto;
    left: auto;
    bottom: calc(var(--border-width) * -1);
    right: calc(var(--border-width) * -1);
    width: calc(var(--border-width) + 50%);
    height: calc((var(--border-width) * 2) + 100%);
  }
}
@keyframes borderColors {
  0% {
    border-top-color: transparent;
    border-right-color: transparent;
    border-bottom-color: transparent;
    border-left-color: transparent;
  }
  33% {
    border-top-color: var(--color);
    border-right-color: transparent;
    border-bottom-color: transparent;
    border-left-color: transparent;
  }
  66% {
    border-top-color: var(--color);
    border-right-color: var(--color);
    border-bottom-color: transparent;
    border-left-color: var(--color);
  }
  100% {
    border-top-color: var(--color);
    border-right-color: var(--color);
    border-bottom-color: var(--color);
    border-left-color: var(--color);
  }
}
@keyframes background {
  to {
    background: #555;
    text-shadow: 0 0.1em 0.1em #111;
  }
}
@media (min-width: 850px) {
  body {
    justify-content: center;
  }
}
@media (min-width: 1200px) {
  .border-animation {
    font-size: 26px;
    line-height: 1em;
  }
}
</style>
<body>
	<jsp:include page="quickbar.jsp" />
	<header id="header">

		<video id="video01" autoplay="" playsinline="" muted="" loop="" height="460" width="100%" title="video element">
			<source src="img/video element.mp4" type="video/mp4">
		</video>
		<div id="navtop">
			<div id="navtop_logo">
				<a class="border-animation" href="index.do?command=index">
    				<div class="border-animation__inner">GREEN FUTSAL PARK</div>
    			</a>
			</div>
			<div id="navtop_menu" style="margin-left: 156px;">
				<ul class="menu">
					<li class="borderRightLeft"><a href="branchlist.do?command=branchlistview">대관</a>
						<ul>
							<li><a href="branchlist.do?command=branchlistview">시설검색</a></li>
							<li><a href="reservation.jsp">대관신청</a></li>
							<li><a href="branchdetail.jsp">시설소개</a></li>
						</ul></li>
					<li class="borderRightLeft"><a href="yonglist_1.jsp">매치/용병</a>
						<ul>
							<li><a href="match_apply.jsp">매치신청</a></li>
							<li><a href="yonglist_1.jsp">용병등록</a></li>
							<li><a href="teamlist.do">팀원모집</a></li>
						</ul></li>
					<li class="borderRightLeft"><a href="league.jsp">리그</a></li>
					<li class="borderRightLeft"><a href="galList.bo">팀커뮤니티</a>
						<ul>
							<li><a href="galist.bo">팀갤러리</a></li>
							<li><a href="#">팀게시판</a></li>
							<li><a href="teamlist.do?command=teamlist">팀관리</a></li>
							<li><a href="#">팀가입</a></li>
						</ul></li>
					<li class="borderRightLeft"><a href="qna.jsp">고객센터</a>
						<ul style="width: 210px;">
							<li><a href="notice.jsp">공지사항</a></li>
							<li><a href="qna.jsp">Q&A</a></li>
							<li><a href="futsalground.jsp">구장등록</a></li>
						</ul></li>
				</ul>
			</div>
			<div id="navtop_login">
				<!--회원상태 창-->
				<div id="container" style="float: left;">
					<div id="topnav" class="topnav">
						<a href="logout.jsp"> <span><%=log%></span>
						</a>
					</div>
				</div>
				<a href="login" class="signin" style="float: left; line-height: 27px;"><u style="font-size: 20px; font-weight: 300;"><%=uss%> ∨</u></a>
				<fieldset id="signin_menu">
					<form name="login" method="post" id="signin">

						<p class="forgot">
							<a href="logincom.jsp" id="signin">My Page</a>
						</p>
						<p class="forgot">
							<a id="booking" href="">예약조회 </a>
						</p>
						<p class="forgot">
							<a id="board" href="">환불계좌등록 </a>
						</p>
					</form>
				</fieldset>

				<a href="alampage" class="mypage" style="float: left; line-height: 25px;"><img src="img/alam.png" style="width: 30px; height: 30px; margin-left: 10px;" /></a>
				<fieldset id="mypage_menu">
					<form name="alampage" method="post" id="mypage">

						<p class="forgot">
							<a href="logincom.jsp" id="mypage">내가 쓴 게시물</a>
						</p>
						<p class="forgot">
							<a id="bookingclub" href="">즐겨찾는구장 </a>
						</p>
						<p class="forgot">
							<a id="board" href="">환불계좌등록 </a>
						</p>
					</form>
				</fieldset>




			</div>
		</div>
		</div>

		<div id="navmid">
			<a id="navmid_1" class="slideDown" href="match_apply.jsp">팀매치신청</a>
			
			
				<a id="navmid_2" class="slideDown" href="yonglist_1.jsp">용병등록</a>
			
			
				<a id="navmid_3" class="slideDown" href="teamlist.do?command=teamlist">팀원모집</a>
		</div>
	</header>
</body>

