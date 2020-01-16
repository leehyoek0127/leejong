<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Yonglist.YonglistDao"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="Yonglist.YonglistDto"%>
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
<title>yonglist</title>
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
.pagination li a{
	position:unset;
}
</style>
</head>
<body>
	<!-- 유즈빈 사용 -->
	<jsp:useBean id ="yl" class="Yonglist.YonglistDao"/>
	
	
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
					<table class="table table-striped" style="font-size: 15px;">
						<thead>
							<tr id="tabletitle">
								<th scope="col" class="thno" ><span>지점</span></th>		
								<th scope="col" class="thtitle" style=" text-align:center;" ><span>매치일자</span></th>
								<th scope="col" class="thtitle" style=" text-align:center;" ><span>매치시간대</span></th>									
								<th scope="col" class="thname"><span>작성자</span></th>							
								<th scope="col" class="thview"><span>신청</span></th>
							</tr>
						</thead>
						<tbody>
							<input class="btn btn-default" type="button" value="용병등록" style="float: right; margin: 10px;" onClick="location.href='yongsign.jsp'">
							
							<% 
						
							ArrayList<YonglistDto> yong = yl.select();
							for(int i=0;i<yong.size();i++){
							%>
							
							

							
							<tr>
								<td class="thgongji" ><%=yong.get(i).getyBranch()%></td>
								
								<td class="thdate2"  style=" text-align:center;"><a onClick="selectOne(<%=yong.get(i).getyNo() %>,'<%=yong.get(i).getyId() %>'); " class="button" id="listtt">
									<%=yong.get(i).getyMatchdate()%></a></td>
								
								<td class="thdate2"  style=" text-align:center;"><%=yong.get(i).getyTime()%></td>
								
								<td class="thname"><%=yong.get(i).getyMember() %></td>
								
							
								<td class="thview"><%=yong.get(i).getyApply() %></td>
							</tr>
						
							<%}%>
						
						
						</tbody>
					</table>
					<div id="innerpop"></div>
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
				
				</div>
			</div>
			
		</section>
	</section>
	<footer id="footer">
		<jsp:include page="Footer.jsp" />
	</footer>
</body>
</html>
