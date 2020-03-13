<%@page import="model.QnaSearchDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String logid = (String) session.getAttribute("id");

	//2020_01_02 수정부분
	String url = request.getServletPath();
	session.setAttribute("url", url);
	String includeurl = "index_header.jsp";
	String uss = (String) session.getAttribute("id");
	String log = "로그인";
	if (uss == null)
		uss = "GUEST";
	else {
		log = "로그아웃";
		includeurl = "index_header_login.jsp";
	}
	//수정부분 끝
%>
<script>
function loginajax() {
	$.ajax({
		type:"post",
	url:"./login.do?command=loginbutton",       
	data:{

		username:$('#username').val(),
		password:$('#password').val()
	},	
	success:whenSuccesslogin,
	error:whenErrorlogin
	});
}
function whenSuccesslogin(resdata){
	
	$("#LoginAjax").html(resdata);
	
	if(resdata.includes("ok")){
		
		location.reload();
	}
	
	else{
		
		
		
		
		
	}
}
function whenErrorlogin(){
	alert("Error");
}





</script>
<script>console.log("index.jsp");</script>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/basicStyle.css" media="screen">
<link rel="stylesheet" href="css/style2.css" media="screen">
<link href="css/front.css" media="screen, projection" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/borderRightLeft.css" media="screen">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
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
<style>
body{
	margin:0;
	padding:0;
	width:100%;
	height:100%;
}
#header {
	height: auto;
}
#navtop {
    background-color: #363636;
    top:0;
}
#navtop_logo {
    top: 3px;
}

.wrap {position: absolute;left: 3px;bottom: 43px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
.wrap * {padding: 0;margin: 0;}
.wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
.wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
.info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
.info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
.info .close:hover {cursor: pointer;}
.info .body {position: relative;overflow: hidden;}
.info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
.desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
.desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
.info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
.info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.info .link {color: #5085BB;}
</style>
</head>
<body>
	<header>
		<jsp:include page="<%=includeurl%>" />
	</header>
	<div id="map" style="width:100%;height:100%;"></div>
	
	
	
	
	
	
	
	
	
	
	
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a72b187c29bce7d6ae23e29d39cc3a6a"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(37.54699, 127.09598), // 지도의 중심좌표
        level: 7 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {
    	content: '<div class="wrap">' + 
			     '    <div class="info">' + 
			     '        <div class="title">' + 
			     '            카카오 스페이스닷원' + 
			     '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
			     '        </div>' + 
			     '        <div class="body">' + 
			     '            <div class="img">' +
			     '                <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
			     '           </div>' + 
			     '            <div class="desc">' + 
			     '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' + 
			     '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
			     '                <div><a href="http://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
			     '            </div>' + 
			     '        </div>' + 
			     '    </div>' +    
			     '</div>' ,
				 
        title: '카카오', 
        latlng: new kakao.maps.LatLng(37.55799, 127.08698)
    },
    {
    	content: '<div class="wrap">' + 
			     '    <div class="info">' + 
			     '        <div class="title">' + 
			     '            카카오 스페이스닷원' + 
			     '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
			     '        </div>' + 
			     '        <div class="body">' + 
			     '            <div class="img">' +
			     '                <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
			     '           </div>' + 
			     '            <div class="desc">' + 
			     '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' + 
			     '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
			     '                <div><a href="http://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
			     '            </div>' + 
			     '        </div>' + 
			     '    </div>' +    
			     '</div>' ,
				 
        title: '생태연못', 
        latlng: new kakao.maps.LatLng(37.53799, 127.08398)
    },
    {
    	content: '<div class="wrap">' + 
			     '    <div class="info">' + 
			     '        <div class="title">' + 
			     '            카카오 스페이스닷원' + 
			     '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
			     '        </div>' + 
			     '        <div class="body">' + 
			     '            <div class="img">' +
			     '                <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
			     '           </div>' + 
			     '            <div class="desc">' + 
			     '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' + 
			     '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
			     '                <div><a href="http://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
			     '            </div>' + 
			     '        </div>' + 
			     '    </div>' +    
			     '</div>' ,
				 
        title: '텃밭', 
        latlng: new kakao.maps.LatLng(37.53799, 127.10598)
    },
    {
    	content: '<div class="wrap">' + 
			     '    <div class="info">' + 
			     '        <div class="title">' + 
			     '            카카오 스페이스닷원' + 
			     '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
			     '        </div>' + 
			     '        <div class="body">' + 
			     '            <div class="img">' +
			     '                <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
			     '           </div>' + 
			     '            <div class="desc">' + 
			     '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' + 
			     '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
			     '                <div><a href="http://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
			     '            </div>' + 
			     '        </div>' + 
			     '    </div>' +    
			     '</div>' ,
				 
        title: '근린공원',
        latlng: new kakao.maps.LatLng(37.55599, 127.10398)
    }
];

// 마커 이미지의 이미지 주소입니다
var imageSrc = "http://localhost:8080/WebExam/img/starmarker.png"; 
    
    
    
    
    
for (let i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(30,45); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
         // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
    
    
    
    
    /*
    
    var closeBtn = document.createElement('button');
    closeBtn.innerHTML = '<div>닫기</div>';
    closeBtn.onclick = function () {
        overlay.setMap(null);
    };
    
    positions[i].content.appendChild(closeBtn);
    */
    var overlay = new kakao.maps.CustomOverlay({
        content: positions[i].content,
        map: map,
        position: positions[i].latlng      
    });
    
    
    
    //overlay.setContent(content);
    
    overlay.setMap(null);
    
 	// 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content // 인포윈도우에 표시할 내용
    });
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, overlay));
    
    kakao.maps.event.addListener(marker, 'click', makeOutListener(map, marker, overlay));
    //kakao.maps.event.addListener(marker, 'click', function() {
    //    overlay.setMap(map);
    //});
    
}





//var closemarker = document.getElementByClassName('close');
//closemarker.onclick=function(){
//	alert(1);
//}
//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, overlay) {
    return function() {
    	
    	overlay.setMap(map);
    	
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(map, marker, overlay) {
    return function() {
    	overlay.setMap(null);
    };
}
//커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
function closeOverlay() {
        overlay.setMap(null);        
}

</script>


</body>
</html>