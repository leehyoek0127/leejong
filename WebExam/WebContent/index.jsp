<%@page import="model.BranchDto"%>
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

<%
	ArrayList<BranchDto> BranchList = (ArrayList<BranchDto>)request.getAttribute("BranchList");
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
.close {position: absolute;top: -168px;right: -138px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
.close:hover {cursor: pointer;}
.info .body {position: relative;overflow: hidden;}
.info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
.desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
.desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
.info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
.info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.info .link {color: #5085BB;}


.custom_zoomcontrol {position:absolute;top:150px;right:10px;width:36px;height:80px;overflow:hidden;z-index:1;background-color:#f5f5f5;-webkit-box-sizing: unset;box-sizing: unset;} 
.custom_zoomcontrol span {display:block;width:36px;height:40px;text-align:center;cursor:pointer;}     
.custom_zoomcontrol span img {width:15px;height:15px;padding:12px 0;border:none;-webkit-box-sizing: unset;box-sizing: unset;}             
.custom_zoomcontrol span:first-child{border-bottom:1px solid #bfbfbf;}
.radius_border{border:1px solid #919191;border-radius:5px;}





.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}

#menu_wrap {background: rgba(255, 255, 255, 0.92);position:absolute;top:61px;left:0;bottom:0;width:348px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info2 {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info2{padding:10px 0 10px 55px;}
#placesList .info2 .gray {color:#8a8a8a;}
#placesList .info2 .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info2 .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:50px;margin:10px 0 0 10px;background:url(img/markup.png) no-repeat;}

#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}

::-webkit-scrollbar{width: 16px;}

::-webkit-scrollbar-thumb {background-color:#003f71;border-radius: 10px;}

::-webkit-scrollbar-button:start:decrement,::-webkit-scrollbar-button:end:increment {
width:16px;height:16px;background:#003f71;} 




#placesList {
	padding:0;
}
#logologo{
	position: fixed;
    z-index: 1;
    top: 68px;
    left: 363px;
}





<!------------------------------------------------------------------->




</style>
</head>
<body>
	<header>
		<jsp:include page="<%=includeurl%>" />
	</header>
	<div class="map_wrap">
		<div id="map" style="width:100%;height:100%;"></div>
		
		
		<div id="menu_wrap" class="bg_white">
	
	        <ul id="placesList">
	        
	        <%for(int i=0; i<BranchList.size(); i++){ %>
	        <a href="javascript:void(0);" onclick="setcenter('<%=BranchList.get(i).getBranch_location()%>');"><li class="item"><span class="markerbg marker_<%=i%>"></span><div class="info2">   <h5><%=BranchList.get(i).getBranch_name()%></h5>    <span><%=BranchList.get(i).getBranch_location()%></span>   <span class="jibun gray">경기 성남시 분당구 백현동 580-8</span>  
	        <span class="tel"><%=BranchList.get(i).getBranch_tel()%></span></div></li></a>
	        <%} %>
	        
	        </ul>
	        <div id="pagination"></div>
	    </div>
	    <div id="logologo">
	    
	    </div>
		
		<div class="custom_zoomcontrol radius_border"> 
	        <span onclick="zoomIn()"><img src="img/ico_plus.png" alt="확대"></span>  
	        <span onclick="zoomOut()"><img src="img/ico_minus.png" alt="축소"></span>
	    </div>
	</div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a72b187c29bce7d6ae23e29d39cc3a6a&libraries=services"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(37.49705, 127.02818), // 지도의 중심좌표
        level: 9 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

/* 시작지점 콘솔출력에서 위도경도 얻기
var geocoder0 = new kakao.maps.services.Geocoder();
geocoder0.addressSearch("서울 강남구 역삼동 858", function(result, status) {
    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {
        var startlocation = new kakao.maps.LatLng(result[0].y, result[0].x);
        console.log(startlocation);
    } 
});
*/

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();


// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
	
	<%
	for(int i=0; i<BranchList.size(); i++){
	%>

    {
    	content: '<div class="wrap">' + 
			     '    <div class="info">' + 
			     '        <div class="title">' + 
			     '            <%=BranchList.get(i).getBranch_name()%>' + 
			     '        </div>' + 
			     '        <div class="body">' + 
			     '            <div class="img">' +
			     '                <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
			     '           </div>' + 
			     '            <div class="desc">' + 
			     '                <div class="ellipsis"><%=BranchList.get(i).getBranch_location()%></div>' + 
			     '                <div class="jibun ellipsis">Tel: <%=BranchList.get(i).getBranch_tel()%></div>' + 
			     '                <div><a href="branchlist.do?command=branchdetail&branch_no=<%=BranchList.get(i).getBranch_no()%>" target="_blank" class="link">시설소개</a></div>' + 
			     '            </div>' + 
			     '        </div>' + 
			     '    </div>' +    
			     '</div>' ,
				 
        title: '카카오', 
        latlng: new kakao.maps.LatLng(37.55799, 127.08698),
        addr: '<%=BranchList.get(i).getBranch_location()%>'
    }<%if(i+1<BranchList.size()){%>,
    <%
    }
	}
    %>
];

// 마커 이미지의 이미지 주소입니다
var imageSrc = "img/markup.png"; 

positions.forEach(function(element){
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(35,45); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    
 // 주소로 좌표를 검색합니다
    geocoder.addressSearch(element.addr, function(result, status) {
    	var coords;
    	// 정상적으로 검색이 완료됐으면 
        if (status === kakao.maps.services.Status.OK) {

           coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        }
    	
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: coords, // 마커를 표시할 위치
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
        position: coords      
    });
    
    var content = document.createElement('div');
    
    var info = document.createElement('div');
    info.innerHTML=element.content;
    content.appendChild(info);
    
    var closeBtn = document.createElement('div');
    closeBtn.innerHTML='<div class="close" onclick="closeOverlay()" title="닫기"></div>';
    closeBtn.onclick = function() { overlay.setMap(null); };
    
    
    
    
    
    content.appendChild(closeBtn);

    overlay.setContent(content);

    kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, overlay));
    
 	// 마커에 표시할 인포윈도우를 생성합니다 
    
 	/*
 	var infowindow = new kakao.maps.InfoWindow({
        content: element.content // 인포윈도우에 표시할 내용
    });
 	
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, overlay));
    
    kakao.maps.event.addListener(marker, 'click', makeOutListener(map, marker, overlay));
    
    */
    
    
    //kakao.maps.event.addListener(marker, 'click', function() {
    //    overlay.setMap(map);
    //});

        });
});

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
/*
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
*/


//지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomIn() {
    map.setLevel(map.getLevel() - 1);
}

// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomOut() {
    map.setLevel(map.getLevel() + 1);
}


function setcenter(addr){
	
	var geocoder2 = new kakao.maps.services.Geocoder();
	geocoder2.addressSearch(addr, function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
	
	
}



</script>
</body>
</html>