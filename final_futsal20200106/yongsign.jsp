<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
//2020_01_02 수정부분
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
  <title>yongsign</title>
  <script type="text/javascript" src="/js/libs/jquery.min.js"></script>
	<script type="text/javascript" src="/js/libs/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/js/datepicker.js"></script>
	<script type="text/javascript" src="/js/common/common.js"></script>
	<script type="text/javascript" src="/js/common/form_check.js"></script>
	<link rel="stylesheet" type="text/css" href="css\join.css"/>
	<link rel="stylesheet" href="css/footer.css">
	<link rel="stylesheet" href="css/classic.css">
	<link rel="stylesheet" href="css/classic.date.css">
	<link rel="stylesheet" href="css/classic.time.css">
	<link rel="stylesheet" href="css/style2.css" media="screen">
	<link rel="stylesheet" href="css/borderRightLeft.css" media="screen">
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	




	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
	<link rel="stylesheet" href="yongsign_body.css">
	<!----------------------------바디 스타일------------------------------------>
	<script type="text/javascript" src="jquery.infinitecarousel.js"></script>
	<!--기본적인 body등의 css-->
	<link rel="stylesheet" href="css/basicStyle.css" media="screen">
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
		

		else
		{
			alert("아이디 : "+join.id.value+"\n"
				+ "비밀번호 : "+join.pw.value+"\n"
				+ "이름 : "+join.name.value+"\n"
				+ "휴대폰번호 : "+join.hp1.value+"-"+join.hp2.value+"-"+join.hp3.value+"\n"
				+ "이메일주소 : "+join.em1.value+"@"+join.em2.value+"\n"
				+ "생년월일 : "+join.yy.value+" 년 "+join.mm.value+" 월 "+join.dd.value+"일\n"
				)
		}
	}
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

			<form name="join">

				<table border=1 cellpadding=5 align ="center" class=abc style="line-height:3; margin-left:0px; width:100%;">
	
 
 
 <thead>
 <tr bgcolor=black align = "center">
 <td colspan = 2><font color="white">
 
  용 병 가 입 
 
 </td>
 </tr>
 </thead>
 <tbody>
 <tr>
	 <td class = ff><font color="#FFCC33">
	 * </font>신청자명
	 </td>
	 <td class=ab>
	 <input type ="text" name ="id"  maxlength="10" value="" class = box  onfocus="this.placeholder = ''" onblur="this.placeholder = '본인이름'"> 
	 
	  </td>
  </tr>
  <tr>
		<td class =ff><font color="#FFCC33">
			* </font>
		휴대폰번호</td>
		<td class=ab>
		<select name = "hp1" class=box><option>010<option>011</select> - 
		<input type ="text" name ="hp2"  maxlength="4" class=box> -
		<input type ="text" name ="hp3"  maxlength="4" class=box>
		</td>
	</tr>
  
  <tr>
		<td class=ff>
		실력</td>
		<td class=ab>
		<select name="lv" class = box><option value="">상<option value="">중상<option value="">중<option value="">중하<option value="">하
		</td>
	</tr>




	<tr bgcolor=black align = "center">
	<td colspan=2><font color="white"> 매 치 정 보 	</font></td>
	</tr>
	
	<tr>
		<td class =ff><font color="#FFCC33">
			* </font>
		지점 / 구장</td>
		<td class=ab >
		<select name = "hp1" class=box><option>지점1<option>지점2</select> 구장
		<select name = "hp1" class=box ><option>구장1<option>구장2</select>
		</td>
	</tr>

	<tr>
		<td class=ff>
		성별</td>
		<td class=ab>
		
		<input type ="radio" name="gender" value="1" checked >여성<br>
		<input type ="radio" name="gender" value="2"  >남성
		 
		</td>
	</tr>

<tr>
	 <td class = ff><font color="#FFCC33">
	 * </font>매치일정
	 </td>
	 <td class=ab>
	 <input type ="text" name ="id"  maxlength="10" value="" class = box  onfocus="this.placeholder = ''" onblur="this.placeholder = '달력'"> 
	 
	  </td>
  </tr>

  <tr>
		<td class =ff><font color="#FFCC33">
			* </font>
		시간선택</td>
		<td class=ab >
		<select name = "hp1" class=box><option>오전<option>오후<option>밤</select>
		
		</td>
	</tr>

	

	<tr>
		<td class=ff>
		실력</td>
		<td class=ab>
		<select name="lv" class = box><option value="">상<option value="">중상<option value="">중<option value="">중하<option value="">하
		</td>
	</tr>

	
	<tr>
		<td class=ff>
		소속팀존재유무</td>
		<td class=ab>
		<input type="radio" name="team" value"">있음 <input type="radio" name="team" value"">없음
		</td>
	</tr>

	
	<tr>
		<td class=ff>
		선호포지션</td>
		<td class=ab>
		<input type="checkbox" name=hobby value="FW">FW <input type="checkbox" name=hobby value="MF">MF <input type="checkbox" name=hobby value="DF">DF <input type="checkbox" name=hobby value="GK">GK 
		</td>
	</tr>

<tr>
		<td class=ff>
		마감여부</td>
		<td class=ab>
		<select name="lv" class = box><option value="">선택<option value="">가능<option value="">마감
		</td>
	</tr>


  </tbody>
  </table>
  <br>
   <input type ="button" value = "가입" class = fbtn onClick="joinsubmit()" >
   <input type = "reset" value="초기화" class = fbtn>
  			</form>
			</div>
			
		</section>

		
	</section>
	
	

<footer id="footer">
	<jsp:include page="Footer.jsp" />
	</footer>
 </body>
</html>
