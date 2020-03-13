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
					if($(e.target).parent("a.mypage").length!=1) {
						$(".mypage").removeClass("menu-open");
						$("fieldset#mypage_menu").hide();
					}
				});			
				
			});
	</script>

<!--마이페이지 접근 위한 css 파일 추가 2020.01.15-->
<link href="css/frontlogin.css" media="screen, projection" rel="stylesheet" type="text/css">  


<body>
	<jsp:include page="quickbar.jsp" />
	<header id="header">

		<video id="video01" autoplay="" playsinline="" muted="" loop="" height="460" width="100%" title="video element">
			<source src="img/video element.mp4" type="video/mp4">
		</video>
		<div id="navtop">
			<div id="navtop_logo">
				<a href="index.do?command=index"><img src="img/logo2.png" width="95px" height="120px"></a>
			</div>
			<div id="navtop_menu">
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
					<li class="borderRightLeft"><a href="league.jsp">리그</a>
						<ul>
							<li><a href="league.jsp">리그랭킹</a></li>
							<li><a href="league.do?command=league_team_step1">리그접수</a></li>
							<li><a href="league.do?command=league_join_step1">선수등록</a></li>
						</ul>
					
					</li>
					<li class="borderRightLeft"><a href="galList.bo">팀커뮤니티</a>
						<ul>
							<li><a href="galList.bo">팀갤러리</a></li>
							<li><a href="#">팀게시판</a></li>
							<li><a href="teamlist.do?command=teamlist">팀관리</a></li>
							<li><a href="#">팀가입</a></li>
						</ul></li>
					<li class="borderRightLeft"><a href="qna.jsp">고객센터</a>
						<ul style="width: 210px;">
							<li><a href="notice.jsp">공지사항</a></li>
							<li><a href="qna.jsp">Q&A</a></li>
							<li><a href="branch.jsp">지점등록</a></li>
							<li><a href="groundlistview2.do?command=groundlistview2">구장등록</a></li>
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
				<a href="login" class="signin" style="float: left; line-height: 25px;"><u style="font-size: 17px; font-weight: 300;"><%=uss%></u> ∨</a>
				<fieldset id="signin_menu">
					<form name="login" method="post" id="signin">

						<p class="forgot">
							<a href="Mypage.jsp" id="signin">My Page</a>
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
			<div id="navmid_1" class="slideDown">
				<a href="match_apply.jsp">팀매치신청</a>
			</div>
			<div id="navmid_2" class="slideDown">
				<a href="yonglist_1.jsp">용병등록</a>
			</div>
			<div id="navmid_3" class="slideDown">
				<a href="teamlist.do?command=teamlist">팀원모집</a>
			</div>
		</div>
	</header>
</body>

