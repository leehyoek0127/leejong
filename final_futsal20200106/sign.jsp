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
  <title>sign</title>
  <script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/js/datepicker.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript" src="/js/common/form_check.js"></script>
  <link rel="stylesheet" type="text/css" href="css\join.css"/>
  <link rel="stylesheet" href="css/classic.css">
	<link rel="stylesheet" href="css/classic.date.css">
	<link rel="stylesheet" href="css/signbutton.css">
	<link rel="stylesheet" href="css/footer.css">
	<link rel="stylesheet" href="css/signformrelocation.css">
	<link rel="stylesheet" href="css/classic.time.css">
	<link rel="stylesheet" href="css/style2.css" media="screen">
	<link rel="stylesheet" href="css/materialFormStyles.css">
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
 </head>
 <body>
 	<header>
		<jsp:include page="<%=includeurl%>" />
	</header>
	<div id="mainleft">
			

			<div id="leftbanner">
				<div id="banner1">
					<img src="img/20191211.jpg" width="100%" height="100%"/>
				</div>
			
				<div id="banner3">
					<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d25325.265446899888!2d127.02924799651784!3d37.492391917303266!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca5bed583f92d%3A0xc93c837d2875ade6!2z7ZKL7IK07J6l!5e0!3m2!1sko!2skr!4v1575961834128!5m2!1sko!2skr" width="100%" height="100%" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
				</div>
			</div>


		</div>
	<section id="main">
		

		<section id="mainright">
			<div id="matList">
				<div class="container" id="formOutterWrapper">
<center><h2>그린풋살파크 회원가입</h2></center>
        <div class="container" id="formInnerWrapper">
                <form name = "join" id="materialForm" class="form" method="post" action="signInsert.jsp" role="form" autocomplete="off">
                    <div class="form-group">
                        <div class="col-xs-2">
                            
                        </div>
						<div class="col-xs-7">
                            <label class="labels" for="id">아이디<img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수"></label>
                            <input type="text" class="formInput" id="id" name="id">
                        </div>
						<div class="col-xs-2">
                            <input type="button" value = "중복확인" id="idcheck" name="idcheck" onClick="confirmId()" class="btn btn-default">
                        </div>
					</div>
                    <div class="form-group">
						<div class="col-xs-2">
                            
                        </div>
                        <div class="col-xs-8">
                            <label class="labels" for="name">이름<img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수"></label>
                            <input type="text" class="formInput" id="name" name="name">
							
                        </div>
						<div class="col-xs-2">
                            
                        </div>
					</div>
                    <div class="form-group">
						<div class="col-xs-2">
                            
                        </div>
                        <div class="col-xs-4">
                            <label class="labels" for="pw">비밀번호<img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수"></label>
                            <input type="password" class="formInput" id="pw" name="pw">
                        </div>
                        <div class="col-xs-4">
                            <label class="labels" for="pwch">비밀번호재확인<img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수"></label>
                            <input type="password" class="formInput" id="pwch" name="pwch">
                        </div>
                    </div>
                    
					<div class="form-group">
						<div class="col-xs-2">
                            
                        </div>
						<div class="col-xs-2" style="font-size:12px; letter-spacing:4px; font-weight:400; width:182px;">
                            휴대폰번호<img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
                        </div>
                        <div class="col-xs-2">
						<select class="formInput" id="hp1" name="hp1">
						<option>010</option>
						<option>011</option>
						<option>016</option>
						<option>017</option>
						<option>018</option>
						<option>019</option>
						</select>
                        </div>
						<div style="float:left;">
							-
						</div>
						<div class="col-xs-2">
                            <label class="labels" for="hp2"></label>
                            <input type="text" class="formInput" id="hp2" name="hp2">
                        </div>
						<div style="float:left;">
							-
						</div>
						<div class="col-xs-2">
                            <label class="labels" for="hp3"></label>
                            <input type="text" class="formInput" id="hp3" name="hp3">
                        </div>
                    </div>

					<div class="form-group">
						<div class="col-xs-2">
                            
                        </div>
						<div class="col-xs-3">
                            <label class="labels" for="em1">이메일<img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수"></label>
                            <input type="text" class="formInput" id="em1" name="em1">
                        </div>
						
						<div class="col-xs-3">
                            
                            <input type="text" class="formInput" id="em2" name="em2">
                        </div>
						<div class="col-xs-2">
                            
                            <select name="mail" class=formInput onChange=mailaddr(join.mail)>
								<option value="">직접입력</option>
								<option>naver.com</option>
								<option>hanmail.net</option>
								<option>gmail.com</option>
							</select>
                        </div>
					</div>
					<div class="form-group">
						<div class="col-xs-2">
                            
                        </div>
						<div class="col-xs-2" style="font-size:12px; letter-spacing:4px; font-weight:400;">
                            성별
                        </div>
						<div class="col-xs-6 radio">
							<div class="col-xs-3">
								<label>
									<input type ="radio" name="gender" value="female" checked>여성
								</label>
							</div>
							<div class="col-xs-3">
								<label>
									<input type ="radio" name="gender" value="male">남성
								</label>
							</div>
						</div>

						
					</div>
					<div class="form-group">
						<div class="col-xs-2">
                            
                        </div>
						<div class="col-xs-2" style="font-size:12px; letter-spacing:4px; font-weight:400; width:182px;">
                            주소<img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
                        </div>
						
						<div class="col-xs-2">
							<label class="labels" for="hp"></label>
							<input type="text" id="sample6_postcode" class="formInput" id="hp" name="hp" placeholder="우편번호" readonly>
						</div>
						<div class="col-xs-2">
							<input type="button" value="우편번호 찾기" class="btn btn-default" onclick="sample6_execDaumPostcode()">
						</div>
						<div class="col-xs-5">
						</div>
						
					</div>
					 <div class="form-group">
						<div class="col-xs-4">
                            
                        </div>
                        <div class="col-xs-2" style="width:200px;">
                            <label class="labels" for="adr0"></label>
                            <input type="text" class="formInput" id="sample6_address" name="adr1" placeholder="주소" readonly>
							
                        </div>
						<div class="col-xs-4">
                            <label class="labels" for="adr1"></label>
							<input type="text" class="formInput" id="sample6_detailAddress" name="adr2" placeholder="상세주소">
                        </div>
					</div>
					
					<div class="form-group">
						<div class="col-xs-2">
                            
                        </div>
						
							<div class="col-xs-1" style="font-size:12px; letter-spacing:4px; font-weight:400;">
								생년월일
							</div>

							<div class="col-xs-3">
								<select name = "yy" class="btn btn-default">
									  <option >1984
									  <option >1985
									  <option >1986
									  <option >1987
									  <option >1988
									  <option>1989
									  <option>1990
									  <option >1991
									  <option >1992
									  <option >1993
									  <option >1994
									  <option>1995
									  <option >1996
									  <option >1997
									  <option >1998
									  <option >1999
									  <option >2000
									  <option >2001
									  <option>2002
									  <option >2003
									  <option >2004
									  <option >2005
									  </select>
									   <select name = "mm" class="btn btn-default">
									  <option >01
									  <option >02
									  <option >03
									  <option>04
									  <option >05
									  <option >06
									  <option >07
									  <option >08
									  <option>09
									  <option >10
									  <option>11
									  <option >12
									  </select>
									  <select name = "dd" class="btn btn-default">
									  <option >01
									  <option >02
									  <option >03
									  <option >04
									  <option >05
									  <option >06
									  <option >07
									  <option >08
									  <option >09
									  <option >10
									  <option >11
									  <option>12
									  <option >13
									  <option >14
									  <option >15
									  <option >16
									  <option>17
									  <option >18
									  <option >19
									  <option >20
									  <option >21
									  <option >22
									  <option >23
									  <option value="24">24
									  <option value="25">25
									  <option value="26">26
									  <option value="27">27
									  <option value="28">28
									  <option value="29">29
									  <option value="30">30
									  <option value="31">31

								  </select>
							</div>
							<div class="col-xs-1" style="font-size:12px; letter-spacing:4px; font-weight:400;">
								사진
							</div>
							<div class="col-xs-3">
								<input type ="file" name="pic">
							</div>

						
					</div>
					
					<div class="form-group">
						<div class="col-xs-2" style="font-size:14px;">
								
						</div>
						<div class="col-xs-1" style="font-size:12px; letter-spacing:4px; font-weight:400;">
							실력
						</div>
						<div class="col-xs-3">
							<select name="lv"  class = formInput><option value="5">상<option value="4">중상<option value="3">중<option value="2">중하<option value="1">하</select>
						</div>
						
					</div>
					<div class="form-group">
						<div class="col-xs-2" style="font-size:14px;">
								
						</div>
						<div class="col-xs-2" style="font-size:12px; letter-spacing:4px; font-weight:400;">
							소속팀존재유무
						</div>
						<div class="col-xs-6 radio">
							<div class="col-xs-3">
								<label>
									<input type="radio" name="team" id="team" value="teamok" checked>
									있음
								</label>
							</div>

							<div class="col-xs-3">
								<label>
									<input type="radio" name="team" id="team" value="teamno">
									없음
								</label>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-xs-2" style="font-size:14px;">
								
						</div>
						<div class="col-xs-2" style="font-size:12px; letter-spacing:4px; font-weight:400;">
							선호포지션
						</div>
						<div class="col-xs-8 checkbox">
							<div class="col-xs-2">
								<label>
									<input type="checkbox" name=hobby value="FW">
									FW
								</label>
							</div>

							<div class="col-xs-2">
								<label>
									<input type="checkbox" name=hobby value="MF">
									MF
								</label>
							</div>
							<div class="col-xs-2">
								<label>
									<input type="checkbox" name=hobby value="DF">
									DF
								</label>
							</div>
							<div class="col-xs-2">
								<label>
									<input type="checkbox" name=hobby value="GK">
									GK
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-2" style="font-size:14px;">
								
						</div>
						<div class="col-xs-2" style="font-size:12px; letter-spacing:4px; font-weight:400;">
							비밀번호확인질문
						</div>
						<div class="col-xs-6">
							<select name="passwd2" size="1" class = formInput style="width:350px; height:30px;">
								<option value="Q00">기억에 남는 추억의 장소는?
								<option value="Q01">기억에 남는 추억의 장소는?
								<option value="Q02">자신의 인생 좌우명은?
								<option value="Q03">자신의 보물 제1호는?
								<option value="Q04">가장 기억에 남는 선생님 성함은?
								<option value="Q05">타인이 모르는 자신만의 신체비밀이 있다면?
								<option value="Q06">받았던 선물 중 기억에 남는 독특한 선물은?
								<option value="Q07">유년시절 가장 생각나는 친구 이름은?
								<option value="Q08">인상 깊게 본 축구경기는?
								<option value="Q09">신었던 축구화 중에서 제일좋은 축구화는?
								<option value="Q10">자신이 제일 좋아하는 축구팀은?
								<option value="Q11">친구들에게 공개하지 않은 어릴 적 별명이 있다면?
								<option value="Q12">초등학교 때 기억에 남는 짝꿍 이름은?
								<option value="Q13">다시 태어나면 되고 싶은 축구선수는?
								<option value="Q14">제일 좋아하는 축구선수의 이름은?
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-2" style="font-size:14px;">
								
						</div>
						<div class="col-xs-8">
							<label class="labels" for="passwd2ans">비밀번호확인답변</label>
                            <input type="text" class="formInput" id="passwd2ans" name="passwd2ans">
						</div>
					</div>
	
					<div class="form-group">
						<div class="col-xs-2" style="font-size:14px;">
								
						</div>
						<div class="col-xs-2" style="font-size:12px; letter-spacing:4px; font-weight:400; width:182px;">
                            환불계좌정보<img src="//img.echosting.cafe24.com/skin/base/common/ico_required.gif" alt="필수">
                        </div>
						<div class="col-xs-1" style="font-size:12px; letter-spacing:4px; font-weight:400;">
							은행명
						</div>
						<div class="col-xs-7">
							<select name="bank" size="1" class = formInput style="width:350px; height:30px;">
										<option value="001">한국은행
										<option value="002">산업은행
										<option value="003">기업은행
										<option value="004">국민은행
										<option value="005">외환은행
										<option value="007">수협중앙회
										<option value="008">농협중앙회
										<option value="011">농.축협
										<option value="020">우리은행
										<option value="023">SC제일은행
										<option value="027">한국씨티은행
										<option value="045">새마을금고
										<option value="048">신협중앙회
										<option value="071">우체국
										<option value="081">하나은행
										<option value="088">신한은행
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-4" style="font-size:14px;">
								
						</div>
					
				
						<div class="col-xs-3" style="margin-left:-10px;">
							<label class="labels" for="accountnumber">계좌번호</label>
                            <input type="text" class="formInput" id="accountnumber" name="accountnumber">
						</div>
						<div class="col-xs-1" style="font-size:16px; font-weight:400;">
							
						</div>
						<div class="col-xs-2" style="width:203px;">
							<label class="labels" for="accountholder">예금주</label>
                            <input type="text" class="formInput" id="accountholder" name="accountholder">
						</div>

					</div>





                    <div class="form-group" style="margin-4">
						<div class="col-xs-4" style="font-size:14px;">
								
						</div>
					
                        <div class="col-xs-3" style="margin-left:90px;">
				
                            <input type ="button" value = "가입" class="signbutton signbutton5" onClick="joinsubmit()">
							 <input type ="button" value = "취소" class="signbutton signbuttoncancel" onClick="script: location.href='sign.jsp'">
							
                        </div>
						
				
                    </div>
					<input type="hidden" name="hidden" value="" />

                </form>
        </div>
  </div>
    <script src="https://code.jquery.com/jquery-2.2.3.min.js" integrity="sha256-a23g1Nt4dtEYOj7bR+vTu7+T8VP13humZFBJNIYoEJo="   crossorigin="anonymous"></script>
    <script src="js/materialForm.js"></script>


			
			</div>
			
		</section>

		
	</section>
	

	<footer id="footer">
	<jsp:include page="Footer.jsp" />
	</footer>
	
 </body>

</html>
	