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
	
	//수정사항 2020.01.14 로그인 ID에 대한 정보.
	String logid = (String) session.getAttribute("id");
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<title>yongsign</title>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/datepicker.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/common/form_check.js"></script>
<link rel="stylesheet" type="text/css" href="css\join.css" />
<link rel="stylesheet" href="css/classic.css">
<link rel="stylesheet" href="css/classic.date.css">
<link rel="stylesheet" href="css/signbutton.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/signformrelocation.css">
<link rel="stylesheet" href="css/classic.time.css">
<link rel="stylesheet" href="css/style2.css" media="screen">
<link rel="stylesheet" href="css/materialFormStyles2.css">
<link rel="stylesheet" href="css/borderRightLeft.css" media="screen">
<script src="js/materialForm.js"></script>



<!--기본적인 body등의 css-->
<link rel="stylesheet" href="css/basicStyle.css" media="screen">
<link rel="stylesheet" href="css/navmid33.css">
	<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.infinitecarousel.js"></script>

<!--2020.01.03 추가 css 분리-->
<link rel="stylesheet" href="css/logform.css" media="screen">
	<!--2020.01.03 추가 javascript.가입기능 분리-->
<script type="text/javascript" src="js/signjs.js"></script>
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
					if($(e.target).parent("a.mypage").length!=0) {
						$(".mypage").removeClass("menu-open");
						$("fieldset#mypage_menu").hide();
					}
				});			
				
			});
	</script>
<!----------------------------회원가입스크립트랑 스타일여기까지------------------------------------>
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
<!-- -----------------다음 주소 api ----------------------------------------->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- ------------------------------------------------------------------------- -->
<!-- -------------------------ID 중복확인에 대한 ajax--------------------------------- -->
<script type="text/javascript">
	$(document).ready(function(){
		$("#id").blur(function(){
			var idReg = /^[a-zA-z]+[a-zA-z0-9]{5,13}$/g;
			if(idReg.test(join.id.value))
				callAjax();
			else{
				$("#ajaxReturn").html("6~14자 사이의 영문 대소문자와 숫자만 사용가능합니다");
			}
		});
		$("#name").blur(function(){
			if(join.name.value.length!=0)
				$("#nameReturn").html("");
			else{     
				$("#nameReturn").html("이름을 입력해주세요.");
			}
		});
		
		$("#hp2").blur(function(){
			if(join.hp2.value.length!=0)
				$("#hpReturn").html("");
			else{
				$("#hpReturn").html("휴대폰번호를 입력하세요.");
			}
		});
		$("#hp3").blur(function(){
			if(join.hp3.value.length!=0)
				$("#hpReturn").html("");
			else{
				$("#hpReturn").html("휴대폰번호를 입력하세요.");
			}
		});
		$("#em1").blur(function(){
			if(join.em1.value.length!=0)
				$("#emReturn").html("");
			else{
				$("#emReturn").html("이메일을 입력하세요.");
			}
		});
	});
	
	function callAjax(){
		
		$.ajax({
			type:"post",
		url:"./confirmId.jsp",       
		data:{
	
			id:$('#id').val()
		},	
		success:whenSuccess,
		error:whenError
		});
	}
	var confirmid = "";
	function whenSuccess(resdata){
		
		var x=document.getElementById("ajaxReturn");
		$("#ajaxReturn").html(resdata);
		
		if(resdata.includes("이미 사용중인 ID입니다")){
			document.join.hidden.value="0";
			x.style.color="red";
		}
		
		else{
			document.join.hidden.value="1";
			x.style.color="blue";
			confirmid = join.id.value;
			
			
		}
	}
	function whenError(){
		alert("Error");
	}
	
//	<!--js 파일 분리가 안돼서 어쩔수없이 이곳에 사용한 용병가입 창 js 파일 2020.01.09-->
	function yongjoinsubmit()
	{
		
		var yMemberlen=yongjoin.yMember.value.length
		
		if(yMemberlen<=0)
		{
			alert("이름을 입력하세요.");
			yongjoin.yMember.focus();
		}else
		{
			document.yongjoin.submit();
		}

	}
</script>
<!-- 비밀번호 체크 ajax -->
<script type="text/javascript">
function callAjax2(){
	if(join.pw.value!=join.pwch.value){
		$("#pwReturn").html("비밀번호가 일치하지 않습니다");
	}else{
		$("#pwReturn").html("");
	}
}
</script>
<script type="text/javascript">

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

				<div class="container" id="formOutterWrapper">
					<center>
						<h2>용병 등록</h2>
					</center>
					<div class="container" id="formInnerWrapper">
						<form name="yongjoin" id="materialForm" class="form" method="post" action="yongsignInsert.jsp?fn=1" role="form" autocomplete="off">
							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-4">
									<select name="yBranch" class=formInput>
										<option value="">지점선택</option>
										<option>동대문점</option>
										<option>안산 고진점</option>
										<option>서수원점</option>
										<option>일산점</option>
										<option>대전 탄방점</option>
										<option>동대전점</option>
										<option>부산 가야점</option>
										<option>울산 남구점</option>
										<option>창원점</option>
										<option>전주 완산점</option>
										<option>울산 북구점</option>
										<option>GLOBAL ARENA(Japan)</option>
										<option>부산 북구점</option>
										<option>Seogwipo. JEJU</option>
										<option>가천대학교 운동장</option>
									</select>
								</div>
								<div class="col-xs-4">
									<select name="yGround" class=formInput>
										<option value="">구장선택</option>
										<option>A구장</option>
										<option>B구장</option>
										<option>C구장</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-4">
									<label class="labels" for="yMember">신청자명</label> <input type="text" class="formInput" id="yMember" name="yMember" style="font-size:18px;">
								</div>
								<div class="col-xs-1">
									<label class="labels" for="">연락처</label>
									</div>
								<div class="col-xs-1">
									<select class="formInput" id="yTel1" name="yTel1">
										<option value="">선택</option>
										<option>010</option>
										<option>011</option>
										<option>016</option>
										<option>017</option>
										<option>018</option>
										<option>019</option>
									</select>
								</div>
								<div style="float: left;">-</div>
								<div class="col-xs-1">
									<label class="labels" for="yTel2"></label> <input type="text" class="formInput" id="yTel2" name="yTel2" style="font-size:18px;">
								</div>
								<div style="float: left;">-</div>
								<div class="col-xs-1">
									<label class="labels" for="yTel3"></label> <input type="text" class="formInput" id="yTel3" name="yTel3" style="font-size:18px;">
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-1" style="font-size:18px; width:120px; letter-spacing:4px;">
								매치일정
								</div>
								<div class="col-xs-3">
								<input type="text" class="formInput" id="yMatchdate" name="yMatchdate" style="font-size:18px; width:200px;" placeholder="ex)2020-08-20">
								</div>
								<div class="col-xs-4" style="margin-left:-25px;">
									<select class="formInput" id="yTime" name="yTime">
										<option value="">시간선택</option>
										<option>13:00 - 15:00</option>
										<option>16:00 - 18:00</option>
										<option>18:00 - 20:00</option>
										<option>20:00 - 22:00</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-4">
									<select name="yApply" id="yApply" class=formInput>
										<option value="">마감여부</option>
										<option>가능</option>
										<option>마감</option>
									</select>
								</div>
								<div class="col-xs-4">
									<select name="yTeam" id="yTeam" class=formInput>
										<option value="">팀수준선택</option>
										<option>상</option>
										<option>중상</option>
										<option>중</option>
										<option>중하</option>
										<option>하</option>
									</select>
								</div>
							</div>
							<div class="form-group" style="height:284px;">
								<div class="col-xs-2"></div>
								<div class="col-xs-4">
									<label class="labels" for="yContents"></label>
									<textarea name="yContents" id="yContents" style="width:730px;resize:none; height:200px;" placeholder="메모를 입력하세요." ></textarea>
								</div>
								
							</div>
							
							
							
							
							
							
							
							




							<input type ="hidden" id="yId" name ="yId" value="<%=logid%>"/>
							<div class="form-group" style="">
								<div class="col-xs-4" style="font-size: 14px;"></div>

								<div class="col-xs-4" style="margin-left: 45px;">
									
									<input type="button" value="등록" class="signbutton signbutton5" onClick="yongjoinsubmit()" style="font-size:18px; width:140px; letter-spacing:5px;">
									<input type="button" value="취소" class="signbutton signbuttoncancel" style="font-size:18px; width:140px; letter-spacing:5px;" onClick="script: location.href='yonglist_1.jsp'">
								</div>


							</div>
							

						</form>
					</div>
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
