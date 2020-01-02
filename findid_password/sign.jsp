<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%String uss="GUEST";%>
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
	<link rel="stylesheet" href="css/classic.time.css">
	<link rel="stylesheet" href="css/style2.css" media="screen">
	<link rel="stylesheet" href="css/materialFormStyles.css">
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

  	


	var alerttext
	function idcheck()
	{
		var idlen=join.id.value.length
		if ((idlen >=8) && (idlen <=14))
		{
			alert("입력해주셔서 감사합니다")
		}
		else
		{
			alert("4~14자 사이의 아이디만 유효합니다.")
			
			join.id.focus()
		}
	}

	function mailaddr(maillist)
	{	
	
		for(var i=0; i<maillist.length; i++)
		{
			if(maillist.options[i].selected)
			join.em2.value=maillist.options[i].value
		}
		
	}
	function confirmId()
	{	
		if(join.id.value == ""){
			alert("ID를 입력하세요.");
			return;
		}
		url = "confirmId.jsp?id=" + join.id.value;
		
		open( url, "confirm", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, resizable=no, width=300, height=200");
		
		
		
		
		
	}
	
	
	function joinsubmit()
	{
		
		var idlen=join.id.value.length
		var pwlen=join.pw.value.length
		var namelen=join.name.value.length
		var hp2_len=join.hp2.value.length
		var hp3_len=join.hp3.value.length
		var em1_len=join.em1.value.length
		var em2_len=join.em2.value.length
		
		

		if ((idlen <8) || (idlen >14))
		{
			alert("아이디를 확인하세요. 8~14자 사이의 아이디만 유효합니다.")
			join.id.focus()
			
		}

		
		else if ((pwlen <4) || (pwlen >14))
		{

			alert("비밀번호를 확인하세요. 4~14자 사이의 비밀번호만 유효합니다.")
			join.pw.focus()
		}

		else if(join.pw.value!=join.pwch.value)
		{
			alert("비밀번호일치여부를 다시 확인하세요.")
			join.pwch.focus()
		}

		
		else if(namelen<=0)
		{
			alert("이름을 입력하세요.")
			join.name.focus()
		}

		
		else if(hp2_len<=0||hp3_len<=0)
		{
			alert("전화번호를 입력하세요.")
			join.hp2.focus()
		}

		
		else if(em1_len<=0||em2_len<=0)
		{
			alert("이메일주소를 입력하세요.")
			join.em1.focus()
		}
		else if(join.hidden.value!=1){
			alert("아이디중복확인을 하세요.")
		}
		

		else
		{
			document.join.submit();
		}
	}





  </script>
  <style>
  



@keyframes animButtonSpan {
    0% {
        transform: translateX(0);
        opacity: 1;
    }

    33% {
        transform: translateX(20px);
        opacity: 0;
    }

    66% {
        transform: translateX(-20px);
        opacity: 0;
    }

    100% {
        transform: translateX(0px);
        opacity: 1;
    }
}

.textAnimationLeft {
    height: 40px;
    width: 120px;
    text-align: center;
    overflow: hidden;
    background: #474E51;
    position: relative;
    line-height: 40px;
    color: #fff;
	float:right;
}

.textAnimationLeft:hover::before {
    content: '';
    position: absolute;
    left: 0;
    bottom: 0;
    width: 100%;
    height: 100%;
    transform: translateX(-100%);
    background: #5778F3;
    transition: transform .25s ease-in;
}

.textAnimationLeft:hover::before {
    transform: translateX(0);
}

.textAnimationLeft span {
    position: relative;
    z-index: 1;
    display: block;
}

.textAnimationLeft:hover span {
    animation: animButtonSpan 0.4s;
}

@keyframes animButtonSpan {
    0% {
        transform: translateX(0);
        opacity: 1;
    }

    35% {
        transform: translateX(20px);
        opacity: 0;
    }

    50.001% {
        transform: translateX(-20px);
    }

    60% {
        transform: translateX(0px);
    }

}



	

	





  	



	
	#signtable{
		width:100%; float:left;
	}

	#signlabel {
		
	}

	.form-group {
		height : 70px;
		
	}
	.form-group input {
		float:left;
	}


	
  </style>
 </head>
 <body>
 	<header>
		<jsp:include page="header.jsp"/>
	</header>
	<div id="mainleft">
			

			<div id="leftbanner">
				<div id="banner1">
					<img src="img/20191211.png" width="100%" height="100%"/>
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
<h1>그린풋살파크 회원가입</h1>
        <div class="container" id="formInnerWrapper">
                <form name = "join" id="materialForm" class="form" method="post" action="signInsert.jsp" role="form" autocomplete="off">
                    <div class="form-group">
                        <div class="col-xs-2">
                            
                        </div>
						<div class="col-xs-8">
                            <label class="labels" for="id">아이디</label>
                            <input type="text" class="formInput" id="id" name="id">
                        </div>
						<div class="col-xs-2">
                            <input type="button" value = "중복확인" id="idcheck" name="idcheck" onClick="confirmId()">
                        </div>
					</div>
                    <div class="form-group">
						<div class="col-xs-2">
                            
                        </div>
                        <div class="col-xs-8">
                            <label class="labels" for="name">이름</label>
                            <input type="text" class="formInput" id="name" name="name">
							
                        </div>
						<div class="col-xs-2">
                            
                        </div>
					</div>
                    <div class="form-group">
						<div class="col-xs-2">
                            
                        </div>
                        <div class="col-xs-4">
                            <label class="labels" for="pw">비밀번호</label>
                            <input type="text" class="formInput" id="pw" name="pw">
                        </div>
                        <div class="col-xs-4">
                            <label class="labels" for="pwch">비밀번호재확인</label>
                            <input type="tel" class="formInput" id="pwch" name="pwch">
                        </div>
                    </div>
                    
					<div class="form-group">
						<div class="col-xs-2">
                            
                        </div>
                        <div class="col-xs-2">
                            <label class="labels" for="hp1">휴대폰번호</label>
                            <input type="text" class="formInput" id="hp1" name="hp1">
                        </div>
						<div class="col-xs-1" style="position:relative; top:-17px; right:-25px;">
							<h3>-</h3>
						</div>
						<div class="col-xs-2">
                            <label class="labels" for="hp2"></label>
                            <input type="text" class="formInput" id="hp2" name="hp2">
                        </div>
						<div class="col-xs-1" style="position:relative; top:-17px; right:-25px;">
							<h3>-</h3>
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
                            <label class="labels" for="em1">이메일</label>
                            <input type="text" class="formInput" id="em1" name="em1">
                        </div>
						
						<div class="col-xs-3">
                            
                            <input type="text" class="formInput" id="em2" name="em2">
                        </div>
						<div class="col-xs-2">
                            
                            <select name="mail" class=formInput onChange=mailaddr(join.mail)>
								<option value="">직접입력
								<option>naver.com
								<option>hanmail.net
								<option>gmail.com
							</select>
                        </div>
					</div>
					<div class="form-group">
						<div class="col-xs-2">
                            
                        </div>
						<div class="col-xs-2" style="font-size:18px; font-weight:800;">
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
						
						<div class="col-xs-7">
							<label class="labels" for="hp">우편번호</label>
							<input type="text" class="formInput" id="hp" name="hp">
						</div>
						<div class="col-xs-2">
							<input type="button" value="주소검색" class=btn2>
						</div>
						
					</div>
					<div class="form-group">
						<div class="col-xs-2">
                            
                        </div>
						
						<div class="col-xs-4">
							<label class="labels" for="adr1">기본주소</label>
							<input type="text" class="formInput" id="adr1" name="adr1">
						</div>
						<div class="col-xs-4">
							<label class="labels" for="adr2">상세주소</label>
							<input type="text" class="formInput" id="adr2" name="adr2">
						</div>
						

					</div>
					<div class="form-group">
						<div class="col-xs-2">
                            
                        </div>
						
							<div class="col-xs-2" style="font-size:14px;">
								생년월일
							</div>

							<div class="col-xs-3">
								<select name = "yy" class=btn2>
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
									   <select name = "mm" class=btn2>
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
									  <select name = "dd" class=btn2>
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

						
					</div>
					<div class="form-group">
						
							<div class="col-xs-3" style="font-size:14px;">
								사진
							</div>
							<div class="col-xs-3">
								<input type ="file" name="pic">
							</div>
						
					</div>
					<div class="form-group">
						<div class="col-xs-3" style="font-size:14px;">
							실력
						</div>
						<div class="col-xs-3">
							<select name="lv"  class = formInput><option value="5">상<option value="4">중상<option value="3">중<option value="2">중하<option value="1">하</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-3" style="font-size:14px;">
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
						<div class="col-xs-3" style="font-size:14px;">
							선호포지션
						</div>
						<div class="col-xs-9 checkbox">
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
						<div class="col-xs-3" style="font-size:14px;">
							비밀번호확인질문
						</div>
						<div class="col-xs-6">
							<select name="passwd2" size="1" class = formInput style="width:350px; height:30px;">
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
						<div class="col-xs-6">
							<label class="labels" for="passwd2ans">비밀번호확인답변</label>
                            <input type="text" class="formInput" id="passwd2ans" name="passwd2ans">
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-6">
							<label class="labels" for="chuchun">추천인아이디</label>
                            <input type="text" class="formInput" id="chuchun" name="chuchun">
						</div>
					</div>






                    <div class="form-group">
                        <div class="col-xs-12">
                            <input type ="button" value = "가입" class = fbtn onClick="joinsubmit()">
							<input type = "reset" value="초기화" class = fbtn>
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
	
	

	<img src="img/bot.png">
 </body>
</html>
