<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
//2020_01_02 수정부분
	String url = request.getServletPath();
	session.setAttribute("url",url);
	String includeurl = "header.jsp";
	String uss = (String)session.getAttribute("id");
	String log = "로그인";
	if(uss==null)
		uss="GUEST";
	 else{
	 	log="로그아웃";
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
  <title>League</title>
<!--기본적인 body등의 css-->
	<link rel="stylesheet" href="css/basicStyle.css" media="screen">
<!--Q&A에 펠요한 css-->
	<link rel="stylesheet" href="css/Q&Astyle.css" media="screen">
<!-- Q&A에 필요한 script -->
	<script type="text/javascript" src="Q&Ascript.js"></script>
<!--주메뉴밑줄기능-->
	<link rel="stylesheet" href="css/borderRightLeft.css" media="screen">
<!-- 광호Q&A -->
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!--2020.01.03 추가 css 분리-->
	<link rel="stylesheet" href="css/logform.css" media="screen">
	<link rel="stylesheet" href="css/leaguestyle.css" media="screen">
<!--2020.01.03 추가 javascript.가입기능 분리-->
	<script type="text/javascript" src="js/signjs.js"></script>	
<!--서브메뉴부르는css-->
	<link rel="stylesheet" href="css/style2.css" media="screen">
<!--배너2 자동슬라이드-->
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.infinitecarousel.js"></script>
<!----------------------------서브메뉴마우스오버기능-------------------------->
	<link rel="stylesheet" type="text/css" href="css/subMenuMouseOver.css">
<!----------------------------회원가입스크립트랑 스타일(따로 빼면 에러)-------------------------->
	<script type='text/javascript'>
		$(function() {
		  $('#forgot_username_link').tipsy({gravity: 'w'});   
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
					if($(e.target).parent("a.signin").length==0) {
						$(".signin").removeClass("menu-open");
						$("fieldset#signin_menu").hide();
					}
				});			
				
			});
		</script>
<!----------------------------회원가입스크립트랑 스타일여기까지------------------------------------>
	<script>
	 /*스크롤 내리면 메뉴 위치 이동하는 기능------따로빼면 작동xxxxxx*/
		$(function(){
			 var shrinkHeader = 30;
			 var shrinkhollow = 465;
			  $(window).scroll(function() {
				var scroll = getCurrentScroll();
				  if ( scroll >= shrinkHeader ) {
					   $('#navtop').addClass('shrink');  
					}
					else {
						$('#navtop').removeClass('shrink');	
					}
				   if(scroll>= shrinkhollow ){
						$('#navtop').addClass('shrinkhollow');  
					}
					else {
						$('#navtop').removeClass('shrinkhollow');	
					}
		});
		function getCurrentScroll() {
			return window.pageYOffset || document.documentElement.scrollTop;
			}
		});
	</script>
 </head>
 <body>
 	<header>
		<jsp:include page="<%=includeurl%>" />
	</header>
	<div id="mainleft">
		<div id="leftbanner">
			<div id="banner1">
				<img src="img/20191211.png" width="100%" height="100%"/>
			</div>	
			<div id="banner3">
				<iframe 
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d25325.265446899888!2d127.02924799651784!3d37.492391917303266!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca5bed583f92d%3A0xc93c837d2875ade6!2z7ZKL7IK07J6l!5e0!3m2!1sko!2skr!4v1575961834128!5m2!1sko!2skr" width="100%" height="100%" frameborder="0" style="border:0;" allowfullscreen="">
				</iframe>
			</div>
		</div>
	</div>
	<section id="main">
		<section id="mainright">
			<div id="matList">
				<div class="sec_ban2">
					<ul class="nav_ban" >
						<li>리그 랭킹</li>
					</ul>
					<table class="table table-striped">
						<thead>
							<tr id="tabletitle">
								<th></th>
								<th scope="col" class="thtitle" style="text-align:center">
									<span >제목</span>		
								</th>
								<th scope="col" class="thname">
									<span >작성자</span>		
								</th>
								<th scope="col" class="thdate">
									<span >작성일</span>		
								</th>
								<th scope="col" class="thview">
									<span >조회</span>		
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="thgongji">공지</td>
								<td class="thtitle"> <a href>필 독 !! 그린컴퓨터 풋살팀 공지사항</a></td>
								<td class="thname">김 팡 호</td>
								<td class="thdate">2019. 12. 10</td>
								<td class="thview">30,589</td>
							</tr>
							<tr>
								<td class="thgongji">공지</td>
								<td class="thtitle"><a href> 사진 깨짐 현상이 일어나는 이유 !</a></td>
								<td class="thname">김 팡 호</td>
								<td class="thdate">2019. 12. 08</td>
								<td class="thview">89,152</td>
							</tr>
							<tr>
								<td class="thgongji">공지</td>
								<td class="thtitle"><a href> 자유롭게 팀의 사진을 올리시면 됩니다 !</a></td>
								<td class="thname">김 팡 호</td>
								<td class="thdate">2019. 12. 05</td>
								<td class="thview">60,895</td>
							</tr>
						</tbody>
					</table>
				</div>
				<a class="btn btn-default pull-right">글쓰기</a>
					<div class="text-center">
						<ul class="pagination">
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>	
						</ul>
					</div>
					<div class="galsearch">
						<img src="img/search.png" id="leaguesearchimg" >
							<select class="form-control" id="leagueyear" name="lyear" >
								<option>2019</option>
								<option>2018</option>
								 <option>2017</option>
							</select>
							<select class="form-control" id="leaguemonth" name="lcode" >
								<option>리그선택</option>
								<option>2019 Green Computer-League</option>
								<option>2018 Green Computer-League</option>
								<option>2017 Green Computer-League</option>
							</select>
							<button type="button" class="btn_search" onclick="this.form.submit();">
								리그선택
							</button>
						</div>
						<div class="teamrank">
							<h4 class="h_bar">
								<strong>TEAM</strong> RANKING
							</h4>
							<div  class="rank">
								<table>
									<caption>TEAM RANKING 테이블</caption>
									<colgroup>
											<col style="width:13%;">
											<col style="">
											<col style="width:11%">
											<col style="width:11%">
											<col style="width:11%">
											<col style="width:11%">
									</colgroup>
									<thead>
										<tr id="rankhead">
											<th scope="col">순위</th>
											<th scope="col">팀명</th>
											<th scope="col">승점</th>
											<th scope="col">승</th>
											<th scope="col">무</th>
											<th scope="col">패</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>
												<div class="emb_wrap">
													<a href="team_info.asp?tcode=T1635">
														<span class="emb"><img src="/files/team/emblem_1635.jpg" alt=""></span>
														<span class="team">기흥FC</span>
													</a>
												</div>
											</td>
											<td>23</td>
											<td>7</td>
											<td>2</td>
											<td>1</td>
										</tr>									
										<tr>
											<td>2</td>
											<td>
												<div class="emb_wrap">
													<a href="team_info.asp?tcode=T1653">
														<span class="emb"><img src="/images/content/default_team.png" alt=""></span>
														<span class="team">NTP FS</span>
													</a>
												</div>
											</td>
											<td>23</td>
											<td>7</td>
											<td>2</td>
											<td>1</td>
										</tr>									
										<tr>
											<td>3</td>
											<td>
												<div class="emb_wrap">
													<a href="team_info.asp?tcode=T1602">
														<span class="emb"><img src="/files/team/emblem_1602.jpg" alt=""></span>
														<span class="team">P.K FC</span>
													</a>
												</div>
											</td>
											<td>16</td>
											<td>5</td>
											<td>1</td>
											<td>4</td>
										</tr>
										<tr>
											<td>4</td>
											<td>
												<div class="emb_wrap">
													<a href="team_info.asp?tcode=T1326">
														<span class="emb"><img src="/files/team/emblem_1326.PNG" alt="">
														</span> <span class="team">FC로이드</span>
													</a>
												</div>
											</td>
											<td>12</td>
											<td>4</td>
											<td>0</td>
											<td>6</td>
										</tr>					
										<tr>
											<td>5</td>
											<td>
												<div class="emb_wrap">
													<a href="team_info.asp?tcode=T1553">
														<span class="emb"><img src="/files/team/emblem_1553.jpg" alt=""></span>
														<span class="team">FC BTC7</span>
													</a>
												</div>
											</td>
											<td>7</td>
											<td>2</td>
											<td>1</td>
											<td>7</td>
										</tr>					
										<tr>
											<td>6</td>
											<td>
												<div class="emb_wrap">
													<a href="team_info.asp?tcode=T1627">
														<span class="emb"><img src="/files/team/emblem_1627.png" alt=""></span> 
														<span class="team">FC이그니스</span>
													</a>
												</div>
											</td>
											<td>6</td>
											<td>2</td>
											<td>0</td>
											<td>8</td>
										</tr>		
									</tbody>
								</table>
							</div>
						</div>
						<div class="playerrank">
							<h4 class="h_bar">
								<strong>PLAYER</strong> RANKING
							</h4>
							<div class="player">
								<table>
									<caption>TEAM RANKING 테이블</caption>
									<tbody>					
										<tr id="rankhead">
											<td >
												<img src="img/son.jpg" width=150px height=140px style="float:left">
											</td>
											<td>
												득점 1위 손흥민
											</td>
										</tr>
										<tr>
											<td>
												<img src="img/son.jpg" width=150px height=140px style="float:left">
											</td>
											<td>
												득점 2위 손흥민
											</td>
										</tr>
									</tbody>
								</table>
							</div>	
						</div>	
						<div class="cbox">
							<div class="text-center">
								<ul class="pagination">
									<li><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#">6</a></li>
									<li><a href="#">7</a></li>
									<li><a href="#">8</a></li>
									<li><a href="#">9</a></li>
									<li><a href="#">10</a></li>
									<li><a href="#">다음 ></a></li>
								</ul>
							</div>
						<form>
							<select class="form-control" style="width:200px; float:left;margin-left : 200px;"><option>
							전체기간</select>
							<select class="form-control" style="width:200px; float:left; margin-left:10px;"><option>
							제목+내용</select>
							<input type="text" class="form-control" id="exampleInputEmail1" placeholder="검색어를 입력하세요" class="form-control" style="width:300px; float:left;margin-left:10px;" >
						</form>
					</div>
				</div>
			</section>
		 </section>
		<img src="img/bot.png">
	</body>
</html>
