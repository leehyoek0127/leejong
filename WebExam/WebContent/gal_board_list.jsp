<%@page import="vo.GalBoardDto"%>
<%@page import="vo.PageInfo"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
	ArrayList<GalBoardDto> articleList = (ArrayList<GalBoardDto>) request.getAttribute("articleList");
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
%>

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
<title>게시판</title>
<link rel="stylesheet" href="css/galboardstyle.css">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/signbutton.css">
<!--기본적인 body등의 css-->
<link rel="stylesheet" href="css/basicStyle.css" media="screen">
<link rel="stylesheet" href="css/navmid33.css">
<!--Q&A에 펠요한 css-->
<link rel="stylesheet" href="css/Q&Astyle.css" media="screen">
<!-- Q&A에 필요한 script -->
<script type="text/javascript" src="Q&Ascript.js"></script>

<!--주메뉴밑줄기능-->
<link rel="stylesheet" href="css/borderRightLeft.css" media="screen">
<!-- 광호Q&A -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!--2020.01.03 추가 css 분리-->
<link rel="stylesheet" href="css/logform.css" media="screen">
<link rel="stylesheet" href="css/galstyle.css" media="screen">
<!--2020.01.03 추가 javascript.가입기능 분리-->
<script type="text/javascript" src="js/signjs.js"></script>
<!--서브메뉴부르는css-->
<link rel="stylesheet" href="css/style2.css" media="screen">
<!--배너2 자동슬라이드-->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.infinitecarousel.js"></script>
<!--footer css 파일 추가-->
<link rel="stylesheet" href="css/footer.css">

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
				//console.log($(e.target).parent("a.mypage").length);

			}
		});

	});
</script>
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
			if ($(e.target).parent("a.mypage").length == 0) {
				$(".mypage").removeClass("menu-open");
				$("fieldset#mypage_menu").hide();
				console.log($(e.target).parent("a.signin").length);
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


.subli ul {
	float: left;
	border: 1px;
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
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d25325.265446899888!2d127.02924799651784!3d37.492391917303266!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca5bed583f92d%3A0xc93c837d2875ade6!2z7ZKL7IK07J6l!5e0!3m2!1sko!2skr!4v1575961834128!5m2!1sko!2skr" width="100%" height="100%" frameborder="0" style="border: 0;" allowfullscreen=""> </iframe>
			</div>
		</div>
	</div>
	<section id="main">
		<section id="mainright">
			<div id="matList">
				<div class="sec_ban2 margin2">

					<div class="writeboardtitle">공지사항</div>

					<table class="table table-striped margin2">

						<thead>
							<tr id="tabletitle">
								<th></th>
								<th scope="col" class="thtitle" style="text-align: center"><span>제목</span></th>
								<th scope="col" class="thname"><span>작성자</span></th>
								<th scope="col" class="thdate"><span>작성일</span></th>
								<th scope="col" class="thview"><span>조회</span></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="thgongji">공지</td>
								<td class="thtitle"><a href>필 독 !! 그린컴퓨터 풋살팀 공지사항</a></td>
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
				<input type="button" value="글쓰기" class="signbutton signbutton5 buttonmargin" onClick="script: location.href='galWriteForm.bo'">
				
				<div class="container">
					<aside style="margin-left: -25px;">
						<div id="wrap">
							<div class="product-head">

								<div id="form"></div>
								<div class="subli logolistmargin">
									<li><img src="img/liverpool.jpg" align="absmiddle" class="subli_img" /> <a href="#/Liverpool/">Green Computer</a></li>
									<li><img src="img/mu.png" align="absmiddle" class="subli_img" /> <a href="#/Manchester United/">Blue Computer</a></li>
									<li><img src="img/mcity.png" align="absmiddle" class="subli_img" /> <a href="#/Manchester City/">Red Computer</a></li>
									<li><img src="img/chelsea.png" align="absmiddle" class="subli_img" /> <a href="#/Chelsea/">White Computer</a></li>
									<li><img src="img/tottenham.png" align="absmiddle" class="subli_img" /> <a href="#/Chelsea/">Yellow Computer</a></li>
									<li><img src="img/arsenal.png" align="absmiddle" class="subli_img" /> <a href="#/Arsenal/">Super Computer</a></li>
									<li><img src="img/liverpool.jpg" align="absmiddle" class="subli_img" /> <a href="#/Arsenal/">Super Computer</a></li>
									<li><img src="img/mcity.png" align="absmiddle" class="subli_img" /> <a href="#/Arsenal/">Super Computer</a></li>
									<li><img src="img/tottenham.png" align="absmiddle" class="subli_img" /> <a href="#/Arsenal/">Super Computer</a></li>
									
								</div>
							</div>
						</div>
					</aside>

					<table class="table table-striped" style="width: 850px; float: left; margin-left:44px;">

						<%
							if (articleList != null && listCount > 0) {
						%>

						<tbody>
							<%
								for (int i = 0; i < articleList.size(); i++) {
							%>
							<tr class="picli" style="font-size: 15px; font-family: -webkit-pictograph; text-align:center;">
								<td><%=articleList.get(i).getG_b_no()%><br>
								
								<a href="boardDetail.bo?board_num=<%=articleList.get(i).getG_b_no()%>&page=<%=nowPage%>"> <img src="boardUpload/<%=articleList.get(i).getG_b_file()%>" class="Fileimg"></a><br>
								<a href="boardDetail.bo?board_num=<%=articleList.get(i).getG_b_no()%>&page=<%=nowPage%>" style="font-size:20px;"> <%=articleList.get(i).getG_b_subject()%></a><br>
								 글쓴이:<%=articleList.get(i).getId()%><br> 작성일:<%=articleList.get(i).getG_b_date()%><br> 조회수:<%=articleList.get(i).getG_b_readcount()%>
								</td>
							</tr>

							<%
								}
							%>
						</tbody>

					</table>


					<section id="pageList" style="clear:both; text-align: center;">
					<ul class="pagination">
						<%
							if (nowPage <= 1) {
						%>
						<li><a style="color:black;">이전</a></li>&nbsp;
						<%
							} else {
						%>
						
						<li><a href="boardList.bo?page=<%=nowPage - 1%>">이전</a></li>&nbsp;
						<%
							}
						%>

						<%
							for (int a = startPage; a <= endPage; a++) {
									if (a == nowPage) {
						%>
						<li><a style="color:black;"><%=a%></a></li>
						<%
							} else {
						%>
						<li><a href="boardList.bo?page=<%=a%>"><%=a%>
						</a></li>&nbsp;
						<%
							}
						%>
						<%
							}
						%>

						<%
							if (nowPage >= maxPage) {
						%>
						<li><a style="color:black;">다음</a></li>
						<%
							} else {
						%>
						<li><a href="boardList.bo?page=<%=nowPage + 1%>">다음</a></li>
						<%
							}
						%>
						</ul>
					</section>
					<%
						} else {
					%>
					<section id="emptyArea">등록된 글이 없습니다.</section>
					<%
						}
					%>
			
															

				</div>
			</div>
			</div>
			</div>
		</section>
	</section>

	<footer id="footer" style="margin-top:200px;">
		<jsp:include page="Footer.jsp" />
	</footer>
	<jsp:include page="quickbar.jsp" />
</body>
</html>