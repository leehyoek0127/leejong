<%@page import="model.BranchDto"%>
<%@page import="model.GroundDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	ArrayList<BranchDto> BranchList = (ArrayList<BranchDto>) request.getAttribute("BranchList");
	ArrayList<GroundDto> GroundList = (ArrayList<GroundDto>) request.getAttribute("GroundList");
	String[] convenarr = BranchList.get(0).getBranch_convenience().split(",");
	String[] picarr = GroundList.get(0).getGround_pic().split(",");
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
<title>지점소개</title>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/datepicker.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/common/form_check.js"></script>
<link rel="stylesheet" type="text/css" href="css\find.css" />
<link rel="stylesheet" href="css/signbutton.css">
<link rel="stylesheet" href="css/branchdetail.css">
<link rel="stylesheet" href="css/find.css">
<link rel="stylesheet" href="css/classic.css">
<link rel="stylesheet" href="css/classic.date.css">
<link rel="stylesheet" href="css/classic.time.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/style2.css" media="screen">
<link rel="stylesheet" href="css/borderRightLeft.css" media="screen">
<script src="js/materialForm.js"></script>
<!--기본적인 body등의 css-->
<link rel="stylesheet" href="css/basicStyle.css" media="screen">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
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

<!-- --------- -->
<!-- 한글글씨체적용 /아이디찾기 제목-->
<link rel="stylesheet" href="css/galboardstyle.css">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap" rel="stylesheet">
<!-- 닫기가 가능한 커스텀 오버레이 -->
<style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 102px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 14px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 90px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 16px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 20px 0 0 25px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
</style>
<!-- 이미지 슬라이더 -->
 <style>

body { background-color: #fff; color: #000; padding: 0; margin: 0; }

.container { width: 1170px; margin: auto; padding-top: 1em; }

.container .ism-slider { margin-left: auto; margin-right: auto; }

</style>



<link rel="stylesheet" href="css/my-slider.css"/>
<script src="js/myslider.js"></script>
<!-- ---------- -->
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
				<div class="container" id="formOutterWrapper">
					<center>
						<div class="writeboardtitle" style="text-align: center; font-size: 45px; margin-bottom: 70px;">시설 상세정보</div>
					</center>
					<!-- @@@@@@@@@@이미지슬라이더진짜22 -->
					<div class='container'>
<div class="ism-slider" data-transition_type="fade" data-interval="10000" id="my-slider">
  <ol>
    <%
								if (BranchList != null && GroundList != null) {
									for (int i = 0; i < picarr.length; i++) {
							%>
    <li>
   
      <img src="img/<%=picarr[i]%>" style="width: 1170px; height: 448px;" />
      
    </li>
    <%
									}}
      %>
  </ol>
</div>
</div>
					
					
					<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->

					<table>
						<%
							if (BranchList != null && GroundList != null) {
						%>
						<tbody>
							<tr>
								<td colsplan="2" class="branchnamebig"><%=BranchList.get(0).getBranch_name()%>
								</td>
							</tr>
							<tr>
								<td colsplan="2" class="branchsubject"><img src="img/iconlocation.png" style="width: 24px; height: 24px; margin-right: 10px;">지점주소</td>
							</tr>
							<tr>
								<td colsplan="2" class="telfont"><%=BranchList.get(0).getBranch_location()%></td>
							</tr>
							<tr>
								<td colsplan="2" class="branchsubject"><img src="img/iconphone.png" style="width: 24px; height: 24px; margin-right: 10px;">문의전화</td>
							</tr>
							<tr>
								<td colsplan="2" class="telfont"><%=BranchList.get(0).getBranch_tel()%></td>
							</tr>
							<tr>
								<td class="tdbranch3"><pre class="prebranch4">
<label style="float: left; font-size: 20px; font-weight: bold; color: #a7a7a7d9;">■ 구장안내</label>
<%
								for (int i = 0; i < GroundList.size(); i++) {
							%>

<%=GroundList.get(i).getGround_name()%>구장 : (<%=GroundList.get(i).getGround_size()%>)
<%
	}
%>

<label style="float: left; font-size: 20px; font-weight: bold; color: #a7a7a7d9;">■ 편의시설</label>
<div style="display: inline-flex;margin-left: -98px;margin-top: 20px;">
<img src=<%if (convenarr[0].contains("o")) {%> "img/parking_o.png"<%} else if (convenarr[0].contains("x")) {%>"img/parking_x.png"<%}%> alt="주차장" class="branchdetailicon" />
<img src=<%if (convenarr[1].contains("o")) {%> "img/aircon_o.png"<%} else if (convenarr[1].contains("x")) {%>"img/aircon_x.png"<%}%> alt="냉난방" class="branchdetailicon" />
<img src=<%if (convenarr[2].contains("o")) {%> "img/shower_o.png"<%} else if (convenarr[2].contains("x")) {%>"img/shower_x.png"<%}%> alt="샤워실" class="branchdetailicon" />
<img src=<%if (convenarr[3].contains("o")) {%> "img/ball_o.png"<%} else if (convenarr[3].contains("x")) {%>"img/ball_x.png"<%}%> alt="공대여" class="branchdetailicon" />
<img src=<%if (convenarr[4].contains("o")) {%> "img/vest_o.png"<%} else if (convenarr[4].contains("x")) {%>"img/vest_x.png"<%}%> alt="팀조끼대여" class="branchdetailicon" />
<img src=<%if (convenarr[5].contains("o")) {%> "img/shoes_o.png"<%} else if (convenarr[5].contains("x")) {%>"img/shoes_x.png"<%}%> alt="풋살화대여" class="branchdetailicon" />
</div>
</pre></td>

<td style="float: left;"><pre class="prebranch3">
<label style="float: left; font-size: 20px; font-weight: bold; color: #a7a7a7d9;">■ 예약비용 </label>
<%
									for (int i = 0; i < GroundList.size(); i++) {
								%>
▷<%=GroundList.get(i).getGround_name()%> (<%=GroundList.get(i).getGround_field()%>) (<%=GroundList.get(i).getGround_size()%>)
<div style="font-size: 15px;">평일주간 (10:00~18:00) : <%=GroundList.get(i).getGround_weekdaydaytime_charge()%>원
평일야간 (18:00~24:00) : <%=GroundList.get(i).getGround_weekdaynight_charge()%>원
주말, 공휴일주간 (10:00~18:00) : <%=GroundList.get(i).getGround_weekenddaytime_charge()%>원
주말, 공휴일야간 (18:00~24:00) : <%=GroundList.get(i).getGround_weekendnight_charge()%>원
<%
									}
								%>
</div>
</div>
</pre></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td colsplan="2"><label style="float: left; font-size: 20px; font-weight: bold; color: #a7a7a7d9;">■ 위치안내</label> <br> <br>
									<div id="map" style="width: 1180px; height: 550px; margin-bottom:40px;"></div> <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2dcf6e7e6b9117069f51425f20cfe014&libraries=services"></script>
<%
 for (int i = 0; i < BranchList.size(); i++) {
 %> <script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
		
		// 지도에 확대 축소 컨트롤을 생성한다
		var zoomControl = new kakao.maps.ZoomControl();

		// 지도의 우측에 확대 축소 컨트롤을 추가한다
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('<%=BranchList.get(i).getBranch_location()%>', function(result, status) {
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {

		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });

		     // 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
		     // 별도의 이벤트 메소드를 제공하지 않습니다 
		     var content = '<div class="wrap">' + 
		                 '    <div class="info">' + 
		                 '        <div class="title">' + 
		                 '            <%=BranchList.get(i).getBranch_name()%>' + 
		                 '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
		                 '        </div>' + 
		                 '        <div class="body">' + 
		                 '            <div class="desc">' + 
		                 '                <div class="ellipsis"><%=BranchList.get(i).getBranch_location()%></div>' + 
		                 '                </div>' + 
		                 '        </div>' + 
		                 '    </div>' +    
		                 '</div>';

		     // 마커 위에 커스텀오버레이를 표시합니다
		     // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
		     var overlay = new kakao.maps.CustomOverlay({
		         content: content,
		         map: map,
		         position: marker.getPosition()       
		     });

		     // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
		     kakao.maps.event.addListener(marker, 'click', function() {
		         overlay.setMap(map);
		     });

		     // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
		     function closeOverlay() {
		         overlay.setMap(null);     
		     }
		        

				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				map.setCenter(coords);
				}
				});

	</script> 
	<%
 	}
 %>
 </td>
							</tr>
							<tr>

								<td class="tdbranch1"><pre class="prebranch1">	
<label style="font-size: 20px; font-weight: bold; margin-top: -24px; color: #a7a7a7d9;">■ 안내사항/이용규칙</label>
<%=GroundList.get(0).getGround_rule()%>
</pre></td>

						
								<td class="tdbranch2"><pre class="prebranch2">
<label style="font-size: 20px; font-weight: bold; margin-top: -10px; color: #a7a7a7d9;">■ 환불규정</label>

- 이용 5일 전까지 : 100% 환불
- 4일 전 ~ 3일 전: 50% 환불
- 2일 전 ~ 대관 당일 : 환불 불가

** 해당 환불 규정은 구장 이용 날짜(대관 날짜)를 기준으로 합니다.

** 날짜변경은 상단 환불 규정 기준 100% 환불인 경우에만 가능합니다.
그 외에는 변경이 불가능합니다. (1회 한정)

** 1회 이상 날짜변경된 예약건은 환불 처리가 불가능 합니다.

** 다음과 같은 경우에는 <b style="color: #ff3c28;">상단 규정</b>대로만 처리되니
구장 예약은 <b style="color: #4285f4;">신중</b>하게 진행해주시길 바랍니다.

-> 이용자의 사정으로 예약된 날짜에 구장 이용을 하지 못하는 경우
-> 구장, 날짜, 시간 등을 실수로 잘못 선택하였을 경우
-> 단순변심으로 인하여 환불 혹은 날짜 / 시간변경을 요청하는 경우
					</pre></td>
							</tr>
							<tr>
							<%
 							for (int i = 0; i < BranchList.size(); i++) {
 							%>
							<td colsplan="2"><input type="button" value="대관하기" onClick="script: location.href='branchlist.do?command=reservationclick&branch_no=<%=BranchList.get(i).getBranch_no()%>'" style="float: right;width: 150px;height: 55px;font-size: 18px;letter-spacing: 3px;color: white; background-color: #2c5d88;border-radius: 5px;border: none;margin-top: 28px; margin-bottom: 34px;"></td>
							<%
 							} }
							%>
							</tr>
							
						</tbody>
					</table>

				</div>
				<script src="https://code.jquery.com/jquery-2.2.3.min.js" integrity="sha256-a23g1Nt4dtEYOj7bR+vTu7+T8VP13humZFBJNIYoEJo=" crossorigin="anonymous"></script>
				<script src="js/materialForm.js"></script>



			</div>
		</section>
	</section>
	<footer id="footer">
		<jsp:include page="Footer.jsp" />
	</footer>
</body>
</html>
