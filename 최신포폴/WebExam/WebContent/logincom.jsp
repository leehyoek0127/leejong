<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.SignDto"%>
<%request.setCharacterEncoding("UTF-8");%>
<!--마이페이지 접근 위한 css 파일 추가 2020.01.15-->
 

<script type="text/javascript" src="js/signjs.js"></script>
<%
//2020_01_02 수정부분
	String url = request.getServletPath();
	session.setAttribute("url",url);
	String includeurl = "header.jsp";
	//String uss = (String)session.getAttribute("id");
	ArrayList<SignDto> list =(ArrayList<SignDto>)request.getAttribute("data");
	String uss = list.get(0).getId();
	
	String log = "로그인";
	if(uss==null)
		uss="GUEST";
	 else{
	 	log="로그아웃";
		includeurl = "sign_login.jsp";
	 }
		//수정부분 끝
%>
<script>
/* 	function pwchange1(id) {
		
		var pw = document.join.pw.value;
		alert(pw);
		location.href = "mypage.do?command=pwchange&id="+id+"&pw="+pw
	

	} */
	
function pwchange1(){
		
		$.ajax({
			type:"post",
		url:"./mypage.do?command=pwchange",       
		data:{
	
			id:$('#id').val(),
			pw:$('#pw').val()
		},	
		success:whenSuccess,
		error:whenError
		});
	}
	var confirmid = "";
	function whenSuccess(resdata){
		alert("비밀번호 변경이 완료되었습니다.");
	}
	function whenError(){
		alert("Error");
	}
</script>


<!-- <A HREF=userUp.jsp?id=${param.id}>회원정보수정</A>
<A HREF=delete.jsp?id=${param.id}>회원탈퇴</A>
<A HREF=allPrt.jsp>전체유저정보출력</A>
 -->

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
<link rel="stylesheet" type="text/css" href="css\join.css" />
<link rel="stylesheet" href="css/classic.css">
<link rel="stylesheet" href="css/classic.date.css">
<link rel="stylesheet" href="css/classic.time.css">
<link rel="stylesheet" href="css/style2.css" media="screen">
<link rel="stylesheet" href="css/materialFormStyles.css">
<link rel="stylesheet" href="css/borderRightLeft.css" media="screen">
<script src="js/materialForm.js"></script>
<link rel="stylesheet" href="css/signbutton.css">


<!--기본적인 body등의 css-->
<link rel="stylesheet" href="css/basicStyle.css" media="screen">
<link rel="stylesheet" href="css/navmid33.css">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.infinitecarousel.js"></script>

<!----------------------------alam form 추가 2020.01.06-------------------------->
<!----------------------------alam form 추가 2020.01.06-------------------------->

<!--2020.01.03 추가 css 분리-->
<link rel="stylesheet" href="css/logform.css" media="screen">
<!--2020.01.03 추가 javascript.가입기능 분리-->
<script type="text/javascript" src="js/signjs.js"></script>
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
<link href="css/frontlogin.css" media="screen, projection" rel="stylesheet" type="text/css"> 
<script>
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
</script>
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
					if($(e.target).parent("a.mypage").length==0) {
						$(".mypage").removeClass("menu-open");
						$("fieldset#mypage_menu").hide();
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

<TITLE>마이페이지</TITLE>

</head>
<body style="height:96%;">

			<div id="matList">
				<div class="container" id="formOutterWrapper">
					<div class="container" id="formInnerWrapper" style="width: 1200px;">
						<form name="join" id="materialForm" class="form" method="post" action="mypage.do?command=signmodify" role="form" autocomplete="off">
							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-8">
									<label class="labels active" for="id"> 아이디 </label> <input type="text" class="formInput" id="id" name="id" value="<%=list.get(0).getId()%>" readonly>
								</div>

							</div>
							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-8">
									<label class="labels active" for="name"> 이름 </label> <input type="text" class="formInput" id="name" name="name" value="<%=list.get(0).getName()%>" readonly>
								</div>
								<div class="col-xs-2"></div>
							</div>
							
							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-7">
									<label class="labels active" for="pw">비밀번호</label> <input type="password" class="formInput" id="pw" name="pw">
								</div>
								<input type="button" class="btn btn-default" id="pwchange" name="pwchange" value="변경"  onclick="pwchange1()">
								</div>

							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-2">
									<label class="labels active" for="hp1"> 휴대폰번호 </label> <input type="text" class="formInput" id="hp1" name="hp1" value="<%=list.get(0).getHp1()%>">
								</div>
								<div class="col-xs-1" style="position: relative; top: -17px; right: -25px;">
									<h3>-</h3>
								</div>
								<div class="col-xs-2">
									<label class="labels active" for="hp2"></label> <input type="text" class="formInput" id="hp2" name="hp2" value="<%=list.get(0).getHp2()%>">
								</div>
								<div class="col-xs-1" style="position: relative; top: -17px; right: -25px;">
									<h3>-</h3>
								</div>
								<div class="col-xs-2">
									<label class="labels active" for="hp3"></label> <input type="text" class="formInput" id="hp3" name="hp3" value="<%=list.get(0).getHp3()%>">
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-3">
									<label class="labels active" for="em1"> 이메일 </label> <input type="text" class="formInput" id="em1" name="em1" value="<%=list.get(0).getEm1()%>">
								</div>
								<div class="col-xs-3">
									<input type="text" class="formInput" id="em2" name="em2" value="<%=list.get(0).getEm2()%>">
								</div>

							</div>
							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-2"><label class="labels">성별</label></div>
								<div class="col-xs-6 radio">
									<div class="col-xs-3">
									
										<label> <input type="radio" name="gender" value="female"  <%=(list.get(0).getGender().equals("female"))?"checked":""%>>여성								
										
										
										</label>
									</div>
									<div class="col-xs-3">
										<label> <input type="radio" name="gender" value="male"<%=(list.get(0).getGender().equals("male"))?"checked":""%>> 남성
										</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-2" style="font-size: 14px; letter-spacing: 4px; font-weight: 400; width: 182px;">
									<label class="labels">주소</label>
								</div>

								<div class="col-xs-2">
									<label class="labels" for="hp"></label> <input type="text" id="sample6_postcode" class="formInput" id="hp" name="hp" value="<%=list.get(0).getHp()%>" readonly>
								</div>
								<div class="col-xs-2">
									<input type="button" value="우편번호 찾기" class="btn btn-default" onclick="sample6_execDaumPostcode()">
								</div>
								<div class="col-xs-5"></div>

							</div>
							<div class="form-group">
								<div class="col-xs-4"></div>
								<div class="col-xs-2" style="width: 192px; margin-left:-8px;">
									<label class="labels" for="adr0"></label> <input type="text" class="formInput" id="sample6_address" name="adr1" value="<%=list.get(0).getAdr1()%>" readonly>
								</div>
								<div class="col-xs-4" style="width:395px;">
									<label class="labels" for="adr1"></label> <input type="text" class="formInput" id="sample6_detailAddress" name="adr2" value="<%=list.get(0).getAdr2()%>" readonly>
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-1"><label class="labels">생년월일</label></div>
								<div class="col-xs-3" style="margin-top:-3px; margin-left:82px;">
								<select name="yy" class="btn btn-default" value="${yy}">
									
										<option value="1984" <%=(list.get(0).getYy().equals("1984"))?"selected":""%>>1984</option>
										<option value="1985" <%=(list.get(0).getYy().equals("1985"))?"selected":""%>>1985</option>
										<option value="1986" <%=(list.get(0).getYy().equals("1986"))?"selected":""%>>1986</option>
										<option value="1987" <%=(list.get(0).getYy().equals("1987"))?"selected":""%>>1987</option>
										<option value="1988" <%=(list.get(0).getYy().equals("1988"))?"selected":""%>>1988</option>
										<option value="1989" <%=(list.get(0).getYy().equals("1989"))?"selected":""%>>1989</option>
										<option value="1990" <%=(list.get(0).getYy().equals("1990"))?"selected":""%>>1990</option>
										<option value="1991" <%=(list.get(0).getYy().equals("1991"))?"selected":""%>>1991</option>
										<option value="1992" <%=(list.get(0).getYy().equals("1992"))?"selected":""%>>1992</option>
										<option value="1993" <%=(list.get(0).getYy().equals("1993"))?"selected":""%>>1993</option>
										<option value="1994" <%=(list.get(0).getYy().equals("1994"))?"selected":""%>>1994</option>
										<option value="1995" <%=(list.get(0).getYy().equals("1995"))?"selected":""%>>1995</option>
										<option value="1996" <%=(list.get(0).getYy().equals("1996"))?"selected":""%>>1996</option>
										<option value="1997" <%=(list.get(0).getYy().equals("1997"))?"selected":""%>>1997</option>
										<option value="1998" <%=(list.get(0).getYy().equals("1998"))?"selected":""%>>1998</option>
										<option value="1999" <%=(list.get(0).getYy().equals("1999"))?"selected":""%>>1999</option>
										<option value="2000" <%=(list.get(0).getYy().equals("2000"))?"selected":""%>>2000</option>
										<option value="2001" <%=(list.get(0).getYy().equals("2001"))?"selected":""%>>2001</option>
										<option value="2002" <%=(list.get(0).getYy().equals("2002"))?"selected":""%>>2002</option>
										<option value="2003" <%=(list.get(0).getYy().equals("2003"))?"selected":""%>>2003</option>
										<option value="2004" <%=(list.get(0).getYy().equals("2004"))?"selected":""%>>2004</option>
										<option value="2005" <%=(list.get(0).getYy().equals("2005"))?"selected":""%>>2005</option>
									</select>

									<select name="mm" class="btn btn-default" value="${mm}">
										<option value="01" <%=(list.get(0).getMm().equals("01"))?"selected":""%>>01</option>
										<option value="02" <%=(list.get(0).getMm().equals("02"))?"selected":""%>>02</option>
										<option value="03" <%=(list.get(0).getMm().equals("03"))?"selected":""%>>03</option>
										<option value="04" <%=(list.get(0).getMm().equals("04"))?"selected":""%>>04</option>
										<option value="05" <%=(list.get(0).getMm().equals("05"))?"selected":""%>>05</option>
										<option value="06" <%=(list.get(0).getMm().equals("06"))?"selected":""%>>06</option>
										<option value="07" <%=(list.get(0).getMm().equals("07"))?"selected":""%>>07</option>
										<option value="08" <%=(list.get(0).getMm().equals("08"))?"selected":""%>>08</option>
										<option value="09" <%=(list.get(0).getMm().equals("09"))?"selected":""%>>09</option>
										<option value="10" <%=(list.get(0).getMm().equals("10"))?"selected":""%>>10</option>
										<option value="11" <%=(list.get(0).getMm().equals("11"))?"selected":""%>>11</option>
										<option value="12" <%=(list.get(0).getMm().equals("12"))?"selected":""%>>12</option>
									</select>

									<select name="dd" class="btn btn-default" value="${dd}">
										<option value="01" <%=(list.get(0).getDd().equals("01"))?"selected":""%>>01</option>
										<option value="02" <%=(list.get(0).getDd().equals("02"))?"selected":""%>>02</option>
										<option value="03" <%=(list.get(0).getDd().equals("03"))?"selected":""%>>03</option>
										<option value="04" <%=(list.get(0).getDd().equals("04"))?"selected":""%>>04</option>
										<option value="05" <%=(list.get(0).getDd().equals("05"))?"selected":""%>>05</option>
										<option value="06" <%=(list.get(0).getDd().equals("06"))?"selected":""%>>06</option>
										<option value="07" <%=(list.get(0).getDd().equals("07"))?"selected":""%>>07</option>
										<option value="08" <%=(list.get(0).getDd().equals("08"))?"selected":""%>>08</option>
										<option value="09" <%=(list.get(0).getDd().equals("09"))?"selected":""%>>09</option>
										<option value="10" <%=(list.get(0).getDd().equals("10"))?"selected":""%>>10</option>
										<option value="11" <%=(list.get(0).getDd().equals("11"))?"selected":""%>>11</option>
										<option value="12" <%=(list.get(0).getDd().equals("12"))?"selected":""%>>12</option>
										<option value="13" <%=(list.get(0).getDd().equals("13"))?"selected":""%>>13</option>
										<option value="14" <%=(list.get(0).getDd().equals("14"))?"selected":""%>>14</option>
										<option value="15" <%=(list.get(0).getDd().equals("15"))?"selected":""%>>15</option>
										<option value="16" <%=(list.get(0).getDd().equals("16"))?"selected":""%>>16</option>
										<option value="17" <%=(list.get(0).getDd().equals("17"))?"selected":""%>>17</option>
										<option value="18" <%=(list.get(0).getDd().equals("18"))?"selected":""%>>18</option>
										<option value="19" <%=(list.get(0).getDd().equals("19"))?"selected":""%>>19</option>
										<option value="20" <%=(list.get(0).getDd().equals("20"))?"selected":""%>>20</option>
										<option value="21" <%=(list.get(0).getDd().equals("21"))?"selected":""%>>21</option>
										<option value="22" <%=(list.get(0).getDd().equals("22"))?"selected":""%>>22</option>
										<option value="23" <%=(list.get(0).getDd().equals("23"))?"selected":""%>>23</option>
										<option value="24" <%=(list.get(0).getDd().equals("24"))?"selected":""%>>24</option>
										<option value="25" <%=(list.get(0).getDd().equals("25"))?"selected":""%>>25</option>
										<option value="26" <%=(list.get(0).getDd().equals("26"))?"selected":""%>>26</option>
										<option value="27" <%=(list.get(0).getDd().equals("27"))?"selected":""%>>27</option>
										<option value="28" <%=(list.get(0).getDd().equals("28"))?"selected":""%>>28</option>
										<option value="29" <%=(list.get(0).getDd().equals("29"))?"selected":""%>>29</option>
										<option value="30" <%=(list.get(0).getDd().equals("30"))?"selected":""%>>30</option>
										<option value="31" <%=(list.get(0).getDd().equals("31"))?"selected":""%>>31</option>
									</select>

								</div>
								<div class="col-xs-1"><label class="labels">사진</label></div>
								<div class="col-xs-3">
									<input type="file" name="pic" value="<%=list.get(0).getPic()%>">
								</div>
								</div>
								<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-1"><label class="labels">실력</label></div>
								<div class="col-xs-3" style="margin-left:82px;">
									<select name="lv" class=formInput value="<%=list.get(0).getLv()%>">	
										<option value="5" <%=(list.get(0).getLv().equals("5"))?"selected":""%>>상</option>
										<option value="4" <%=(list.get(0).getLv().equals("4"))?"selected":""%>>중상</option>
										<option value="3" <%=(list.get(0).getLv().equals("3"))?"selected":""%>>중</option>
										<option value="2" <%=(list.get(0).getLv().equals("2"))?"selected":""%>>중하</option>
										<option value="1" <%=(list.get(0).getLv().equals("1"))?"selected":""%>>하</option>
									</select>
								</div>

							</div>
							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-2"><label class="labels">소속팀존재유무</label></div>
								<div class="col-xs-6 radio">
							
									<div class="col-xs-3">
									
										<label2> <input type="radio" name="team" id="team" value="teamok" <%=(list.get(0).getTeam().equals("teamok"))?"checked":""%>> 있음 </label2>
									</div>
									

									<div class="col-xs-3">
										<label2> <input type="radio" name="team" id="team" value="teamno" <%=(list.get(0).getTeam().equals("teamok"))?"checked":""%>"> 없음 </label2>
									</div>
									
								</div>
							</div>

							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-2">
								<label class="labels">선호포지션</label>
								</div>
								<div class="col-xs-8 checkbox">
								<div id="checkboxmargin">
									<div class="col-xs-2">
										<label2> <input type="checkbox" name=hobby value="FW" <%=(list.get(0).getHobby().contains("FW"))?"checked":""%>> FW </label2>
									</div>

									<div class="col-xs-2">
										<label2> <input type="checkbox" name=hobby value="MF" <%=(list.get(0).getHobby().contains("MF"))?"checked":""%>> MF </label2>
									</div>
									<div class="col-xs-2">
										<label2> <input type="checkbox" name=hobby value="DF" <%=(list.get(0).getHobby().contains("DF"))?"checked":""%>> DF </label2>
									</div>
									<div class="col-xs-2">
										<label2> <input type="checkbox" name=hobby value="GK" <%=(list.get(0).getHobby().contains("GK"))?"checked":""%>> GK </label2>
									</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-2">
								<label class="labels">비밀번호확인질문</label></div>
								<div class="col-xs-6">
									<select id="passwd2" name="passwd2" size="1" class=formInput style="width:340px; height: 30px; margin-left:-15px;" value="<%=list.get(0).getPasswd2()%>">
										<option value="Q01" <%=(list.get(0).getPasswd2().equals("Q01"))?"selected":""%>>기억에 남는 추억의 장소는?</option>
										<option value="Q02" <%=(list.get(0).getPasswd2().equals("Q02"))?"selected":""%>>자신의 인생 좌우명은?</option>
										<option value="Q03" <%=(list.get(0).getPasswd2().equals("Q03"))?"selected":""%>>자신의 보물 제1호는?</option>
										<option value="Q04" <%=(list.get(0).getPasswd2().equals("Q04"))?"selected":""%>>가장 기억에 남는 선생님 성함은?</option>
										<option value="Q05" <%=(list.get(0).getPasswd2().equals("Q05"))?"selected":""%>>타인이 모르는 자신만의 신체비밀이 있다면?</option>
										<option value="Q06" <%=(list.get(0).getPasswd2().equals("Q06"))?"selected":""%>>받았던 선물 중 기억에 남는 독특한 선물은?</option>
										<option value="Q07" <%=(list.get(0).getPasswd2().equals("Q07"))?"selected":""%>>유년시절 가장 생각나는 친구 이름은?</option>
										<option value="Q08" <%=(list.get(0).getPasswd2().equals("Q08"))?"selected":""%>>인상 깊게 본 축구경기는?</option>
										<option value="Q09" <%=(list.get(0).getPasswd2().equals("Q09"))?"selected":""%>>신었던 축구화 중에서 제일좋은 축구화는?</option>
										<option value="Q10" <%=(list.get(0).getPasswd2().equals("Q10"))?"selected":""%>>자신이 제일 좋아하는 축구팀은?</option>
										<option value="Q11" <%=(list.get(0).getPasswd2().equals("Q11"))?"selected":""%>>공개하지 않는 어릴 적 별명이 있다면?</option>
										<option value="Q12" <%=(list.get(0).getPasswd2().equals("Q12"))?"selected":""%>>초등학교 때 기억에 남는 짝꿍 이름은?</option>
										<option value="Q13" <%=(list.get(0).getPasswd2().equals("Q13"))?"selected":""%>>다시 태어나면 되고 싶은 축구선수는?</option>
										<option value="Q14" <%=(list.get(0).getPasswd2().equals("Q14"))?"selected":""%>>제일 좋아하는 축구선수의 이름은?</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-2">
									<label class="labels">비밀번호확인답변</label>
									</div>
								<div class="col-xs-6" style="margin-left:-10px; width:600px;">
									<input type="text" class="formInput" id="passwd2ans" name="passwd2ans" value="<%=list.get(0).getPasswd2ans()%>">
								</div>
							</div>

							<div class="form-group" style="height:30px;">
								<div class="col-xs-2"></div>
								<div class="col-xs-2">
								<label class="labels">
									환불계좌정보
									</label>
								</div>
							</div>
								<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-2" style="margin-top:5px;">
									<select name="bank" size="1" class=formInput value="<%=list.get(0).getBank()%>" style="width: 130px; height: 30px;">
										<option value="001" <%=(list.get(0).getBank().equals("001"))?"selected":""%>>한국은행</option>
										<option value="002" <%=(list.get(0).getBank().equals("002"))?"selected":""%>>산업은행</option>
										<option value="003" <%=(list.get(0).getBank().equals("003"))?"selected":""%>>기업은행</option>
										<option value="004" <%=(list.get(0).getBank().equals("004"))?"selected":""%>>국민은행</option>
										<option value="005" <%=(list.get(0).getBank().equals("005"))?"selected":""%>>외환은행</option>
										<option value="007" <%=(list.get(0).getBank().equals("007"))?"selected":""%>>수협중앙회</option>
										<option value="008" <%=(list.get(0).getBank().equals("008"))?"selected":""%>>농협중앙회</option>
										<option value="011" <%=(list.get(0).getBank().equals("011"))?"selected":""%>>농.축협</option>
										<option value="020" <%=(list.get(0).getBank().equals("020"))?"selected":""%>>우리은행</option>
										<option value="023" <%=(list.get(0).getBank().equals("023"))?"selected":""%>>SC제일은행</option>
										<option value="027" <%=(list.get(0).getBank().equals("027"))?"selected":""%>>한국씨티은행</option>
										<option value="045" <%=(list.get(0).getBank().equals("045"))?"selected":""%>>새마을금고</option>
										<option value="048" <%=(list.get(0).getBank().equals("048"))?"selected":""%>>신협중앙회</option>
										<option value="071" <%=(list.get(0).getBank().equals("071"))?"selected":""%>>우체국</option>
										<option value="081" <%=(list.get(0).getBank().equals("081"))?"selected":""%>>하나은행</option>
										<option value="088" <%=(list.get(0).getBank().equals("088"))?"selected":""%>>신한은행</option>
									</select>
								</div>
								<div class="col-xs-3" style="margin-left: -9px; width:375px; margin-top:11px;">
									<label class="labels active" for="accountnumber">계좌번호</label> <input type="text" class="formInput" id="accountnumber" name="accountnumber" value="<%=list.get(0).getAccountnumber()%>">
								</div>
								<div class="col-xs-1" style="font-size: 16px; font-weight: 400; width:20px;"></div>
								<div class="col-xs-2" style="width: 203px; margin-top:11px;">
									<label class="labels active" for="accountholder">예금주</label> <input type="text" class="formInput" id="accountholder" name="accountholder" value="<%=list.get(0).getAccountholder()%>">
								</div>

							</div>


							</div>
							<div class="form-group">
								<div class="col-xs-4" style="margin-left:65px;"></div>
								<div class="col-xs-3">
									<input type="submit" value="수정" class="signbutton signbutton5"> <input type="button" value="취소" class="signbutton signbuttoncancel" onClick="script: location.href='sign.jsp'" >
								</div>
							</div>
							<input type="hidden" name="hidden" value="" />
						</form>
					</div>
				</div>
				
				<script src="https://code.jquery.com/jquery-2.2.3.min.js" integrity="sha256-a23g1Nt4dtEYOj7bR+vTu7+T8VP13humZFBJNIYoEJo=" crossorigin="anonymous">
			</script>
				<script src="js/materialForm.js">
			</script>

</body>
</html>