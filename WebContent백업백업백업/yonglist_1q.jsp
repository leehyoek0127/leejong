<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
<title>yonglist</title>
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/borderRightLeft.css" media="screen">
<!-- 광호Q&A -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

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
<style>
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
					<table class="table table-striped">
						<thead>
							<tr id="tabletitle">
								<th scope="col" class="thno"><span>지점</span></th>
								

								<th scope="col" class="thtitle" ><span>매치일자</span></th>
								<th scope="col" class="thname"><span>작성자</span></th>
								
								<th scope="col" class="thview"><span>작성일자</span></th>
								<th scope="col" class="thview"><span>마감</span></th>
							</tr>
						</thead>
						<tbody>
							<input class="btn btn-default" type="button" value="용병등록" style="float: right; margin: 10px;" onClick="location.href='yongsign.html'">
							<tr>
								<td class="thgongji">강남점</td>
								
								<td class="thtitle">2020.01.09(목)20:00 ~ 22:00</td>
								<td class="thname">박**</td>
								
								<td class="thview">2020.01.07</td>
								<td class="thview">마감</td>
							</tr>
							<tr>
								<td class="thgongji">인천점</td>
								
								<td class="thtitle">2020.01.09(목)17:00 ~ 20:00</td>
								<td class="thname">김 팡 호</td>
								
								<td class="thview">2020.01.06</td>
								<td class="thview">진행중</td>
							</tr>
							<tr>
								<td class="thgongji">강남점</td>
							
								<td class="thtitle">2020.01.08(수)14:00 ~ 16:00</td>
								<td class="thname">박**</td>
								
								<td class="thview">2020.01.05</td>
								<td class="thview">마감</td>
							</tr>
							<tr>
								<td class="thgongji">인천점</td>
								
								<td class="thtitle">2020.01.08(수) 17:00 ~ 20:00</td>
								<td class="thname">김 팡 호</td>
								
								<td class="thview">2020.01.04</td>
								<td class="thview">진행중</td>
							</tr>
							<tr>
								<td class="thgongji">강남점</td>
								
								<td class="thtitle">2020.01.08(수) 20:00 ~ 22:00</td>
								<td class="thname">박**</td>
								
								<td class="thview">2020.01.03</td>
								<td class="thview">마감</td>
							</tr>
							<tr>
								<td class="thgongji">인천점</td>
							
								<td class="thtitle">2020.01.08(수) 17:00 ~ 20:00</td>
								<td class="thname">김 팡 호</td>
								
								<td class="thview">2020.01.02</td>
								<td class="thview">진행중</td>
							</tr>
							<tr>
								<td class="thgongji">강남점</td>
							
								<td class="thtitle">2020.01.07(화) 20:00 ~ 22:00</td>
								<td class="thname">박**</td>
								
								<td class="thview">2020.01.01</td>
								<td class="thview">마감</td>
							</tr>
							<tr>
								<td class="thgongji">인천점</td>
							
								<td class="thtitle">2020.01.08(수) 17:00 ~ 20:00</td>
								<td class="thname">김 팡 호</td>
								
								<td class="thview">2020.01.01</td>
								<td class="thview">진행중</td>
							</tr>
							<tr>
								<td class="thgongji">강남점</td>
								
								<td class="thtitle">2020.01.07(화) 20:00 ~ 22:00</td>
								<td class="thname">박**</td>
								
								<td class="thview">2020.01.01</td>
								<td class="thview">마감</td>
							</tr>
							<tr>
								<td class="thgongji">인천점</td>
							
								<td class="thtitle">2020.01.08(수) 17:00 ~ 20:00</td>
								<td class="thname">김 팡 호</td>
								
								<td class="thview">2020.01.01</td>
								<td class="thview">진행중</td>
							</tr>
							<tr>
								<td class="thgongji">강남점</td>
								
								<td class="thtitle">2020.01.07(화) 20:00 ~ 22:00</td>
								<td class="thname">박**</td>
								
								<td class="thview">2020.01.01</td>
								<td class="thview">마감</td>
							</tr>
							<tr>
								<td class="thgongji">인천점</td>
								
								<td class="thtitle">2020.01.08(수) 17:00 ~ 20:00</td>
								<td class="thname">김 팡 호</td>
								
								<td class="thview">2020.01.01</td>
								<td class="thview">진행중</td>
							</tr>
							<tr>
								<td class="thgongji">강남점</td>
								
								<td class="thtitle">2020.01.07(화) 20:00 ~ 22:00</td>
								<td class="thname">박**</td>
								
								<td class="thview">2020.01.01</td>
								<td class="thview">마감</td>
							</tr>
							<tr>
								<td class="thgongji">인천점</td>
						
								<td class="thtitle">2020.01.08(수) 17:00 ~ 20:00</td>
								<td class="thname">김 팡 호</td>
								
								<td class="thview">2020.01.01</td>
								<td class="thview">진행중</td>
							</tr>
							<tr>
								<td class="thgongji">강남점</td>
								
								<td class="thtitle">2020.01.07(화) 20:00 ~ 22:00</td>
								<td class="thname">박**</td>
								
								<td class="thview">2020.01.01</td>
								<td class="thview">마감</td>
							</tr>
							<tr>
								<td class="thgongji">인천점</td>
							
								<td class="thtitle">2020.01.08(수) 17:00 ~ 20:00</td>
								<td class="thname">김 팡 호</td>
								
								<td class="thview">2020.01.01</td>
								<td class="thview">진행중</td>
							</tr>
							<tr>
								<td class="thgongji">강남점</td>
						
								<td class="thtitle">2020.01.07(화) 20:00 ~ 22:00</td>
								<td class="thname">박**</td>
									
								<td class="thview">2020.01.01</td>
								<td class="thview">마감</td>
							</tr>
							<tr>
								<td class="thgongji">인천점</td>
							
								<td class="thtitle">2020.01.08(수) 17:00 ~ 20:00</td>
								<td class="thname">김 팡 호</td>
								
								<td class="thview">2020.01.01</td>
								<td class="thview">진행중</td>
							</tr>
							<tr>
								<td class="thgongji">강남점</td>
						
								<td class="thtitle">2020.01.07(화) 20:00 ~ 22:00</td>
								<td class="thname">박**</td>
								
								<td class="thview">2020.01.01</td>
								<td class="thview">마감</td>
							</tr>
							<tr>
								<td class="thgongji">인천점</td>
							
								<td class="thtitle">2020.01.08(수) 17:00 ~ 20:00</td>
								<td class="thname">김 팡 호</td>
								
								<td class="thview">2020.01.01</td>
								<td class="thview">진행중</td>
							</tr>
							<tr>
								<td class="thgongji">강남점</td>
							
								<td class="thtitle">2020.01.07(화) 20:00 ~ 22:00</td>
								<td class="thname">박**</td>
								
								<td class="thview">2020.01.01</td>
								<td class="thview">마감</td>
							</tr>
							<tr>
								<td class="thgongji">인천점</td>
							
								<td class="thtitle">2020.01.08(수) 17:00 ~ 20:00</td>
								<td class="thname">김 팡 호</td>
								
								<td class="thview">2020.01.01</td>
								<td class="thview">진행중</td>
							</tr>
							<tr>
								<td class="thgongji">강남점</td>
								
								<td class="thtitle">2020.01.07(화) 20:00 ~ 22:00</td>
								<td class="thname">박**</td>
								
								<td class="thview">2020.01.01</td>
								<td class="thview">마감</td>
							</tr>
							<tr>
								<td class="thgongji">인천점</td>
							
								<td class="thtitle">2020.01.08(수) 17:00 ~ 20:00</td>
								<td class="thname">김 팡 호</td>
								
								<td class="thview">2020.01.01</td>
								<td class="thview">진행중</td>
							</tr>
							<tr>
								<td class="thgongji">강남점</td>
								
								<td class="thtitle">2020.01.07(화) 20:00 ~ 22:00</td>
								<td class="thname">박**</td>
								
								<td class="thview">2020.01.01</td>
								<td class="thview">마감</td>
							</tr>
							<tr>
								<td class="thgongji">인천점</td>
							
								<td class="thtitle">2020.01.08(수) 17:00 ~ 20:00</td>
								<td class="thname">김 팡 호</td>
								
								<td class="thview">2020.01.01</td>
								<td class="thview">진행중</td>
							</tr>
							<tr></tr>
						</tbody>
					</table>
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

					<select class="form-control" style="width: 200px; float: left; margin-left: 150px;">
						<option>전체기간
					</select>
					<select class="form-control" style="width: 200px; float: left; margin-left: 10px;">
						<option>제목+내용
					</select>
					<input type="text" class="form-control" id="exampleInputEmail1" placeholder="검색어를 입력하세요" class="form-control" style="width: 300px; float: left; margin-left: 10px;"> <input class="btn btn-default" type="button" value="검 색" style="float: left; margin-left: 10px;">
					</form>
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
