<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
//2020_01_02 수정부분
	String uss = (String)session.getAttribute("id");
	String log = "로그인";
	if(uss==null)
		uss="GUEST";
	 else
	 	log="로그아웃";
		//수정부분 끝
%>
<body>
	<header id="header">
	<video id="video01" autoplay="" playsinline="" muted="" loop="" height="460" width="100%" title="video element"> 
					<source src="img/video element.mp4" type="video/mp4"> 
				</video>
		<div id="navtop">
			<div id="navtop_logo">
				 <a href="" ><img src="img/logo2.png" width="95px" height="120px"></a>
			</div>
			<div id="navtop_menu">
				<ul class="menu">
					<li class="borderRightLeft"><a href="reservation.html" >대관</a>
						<ul>
							<li><a href="#" >시설검색</a></li>
							<li><a href="#" >대관신청</a></li>
							<li><a href="#" >시설소개</a></li>
						</ul>
					</li>
					<li class="borderRightLeft"><a href="yonglist_1.html" >매치/용병</a>
						<ul>
							<li><a href="#" >팀매치신청</a></li>
							<li><a href="#" >용병등록</a></li>
							<li><a href="#" >팀원모집</a></li>
						</ul>
					
					</li>
					<li class="borderRightLeft"><a href="" >리그</a></li>
					<li class="borderRightLeft"><a href="gal.html" >팀커뮤니티</a>
						<ul>
							<li><a href="#" >팀갤러리</a></li>
							<li><a href="#" >팀게시판</a></li>
							<li><a href="#" >팀관리</a></li>
							<li><a href="#" >팀가입하기</a></li>
						</ul>
					</li>
					<li class="borderRightLeft"><a href="qna.html" >고객센터</a>
						<ul style="width:210px;">
							<li><a href="#" >공지사항</a></li>
							<li><a href="#" >Q&A</a></li>
							<li><a href="#" >풋살구장등록</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<div id="navtop_login">
			<!--회원상태 창-->
			<a href="logincom.jsp" style="float:left;line-height:25px;"><%=uss%>&nbsp&nbsp&nbsp</a>

			<a href="sign.html" style="float:left; line-height:25px;">회원가입</a>

				<div id="container" style="float:left;">
					 <div id="topnav" class="topnav"><a href="login" class="signin"><span><%=log%></span></a></div>
  
  
						  <fieldset id="signin_menu">
							<form name = "login" method="post" id="signin" action="login.jsp">
							  <label for="username">아이디</label>
							  <input id="username" name="username" value="" title="username" tabindex="4" type="text">
							  </p>
							  <p>
								<label for="password">비밀번호</label>
								<input id="password" name="password" value="" title="password" tabindex="5" type="password">
							  </p>
							  <p class="remember">
								<input id="signin_submit" value="로그인" tabindex="6" type="submit">
								<input id="remember" name="remember_me" value="1" tabindex="7" type="checkbox">
								<label for="remember">로그인상태유지</label>
							  </p>
							  <p class="forgot"> <a href="#" id="resend_password_link">비밀번호찾기</a> </p>
							  <p class="forgot-username"> <A id=forgot_username_link 
						title="If you remember your password, try logging in with your email" 
						href="#">아이디찾기</A> </p>
											</form>
										  </fieldset>
				</div>		
			</div>
		</div>

		</div>
		<div id="navmid">
				<div id="navmid_1" class="slideDown"><a href="">팀매치신청</a></div>
				<div id="navmid_2" class="slideDown"><a href="">용병등록</a></div>
				<div id="navmid_3" class="slideDown"><a href="">팀원모집</a></div>
		</div>
	</header>
</body>