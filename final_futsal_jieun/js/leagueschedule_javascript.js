$(function() {
		  $('#forgot_username_link').tipsy({gravity: 'w'});   
		});

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

function leagueinfor(){
		var button_len=formname.id.value.length

		if((button_len<=8) || (id_len>=30)){
			alert("아이디를 다시 입력해주세요. 8자 이상만 유효합니다.")
			}else{
			alert ("아이디:"+formname.id.value+"\n"
			}
			}
		}

		  	$(function(){
    var shrinkHeader = 30;
    $(window).scroll(function() {
    var scroll = getCurrentScroll();
    if ( scroll >= shrinkHeader ) {
    $('#navtop').addClass('shrink');	   
    }else {
    $('#navtop').removeClass('shrink');	
    }
});
    function getCurrentScroll() {
    return window.pageYOffset || document.documentElement.scrollTop;
    }
});

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

	$(window).load(function() {
	$('#featured').orbit();
	});

	function sign(){
		var id_len=formname.id.value.length
		var pass_len=formname.pw.value.length
		var passcon_len=formname.pwch.value.length
		var name_len=formname.name.value.length
		var phone_len1=formname.hp2.value.length
		var phone_len2=formname.hp3.value.length
		var email_len1=formname.em1.value.length
		var email_len2=formname.em2.value.length
		var addr_len1=formname.hp.value.length
		var addr_len2=formname.adr1.value.length
		var addr_len3=formname.adr2.value.length
		var position_len=(formname.hobby1.value.length)+(formname.hobby2.value.length)+(formname.hobby3.value.length)+(formname.hobby4.value.length)
		var sosok_len=(formname.team1.value.length)+(formname.team2.value.length)
		var id2_len=formname.chuchun.value.length
		var passanswer_len=formname.passwd2ans.value.length 

		if((id_len<=8) || (id_len>=30)){
			alert("아이디를 다시 입력해주세요. 8자 이상만 유효합니다.")
			formname.id.focus()
			formname.id.value =""
			}
		else if((pass_len<=6) || (pass_len>=10)){
			alert("비밀번호를 다시 입력해주세요. 6~10자 사이의 암호만 유효합니다.")
			}
		else if((passcon_len<=0) || passcon_len != pass_len){
			alert("비밀번호 확인이 틀렸습니다. 다시 입력해주세요.")
			formname.pwch.focus()
			formname.pwch.value =""
			}
		else if(name_len <= 0){
			alert("이름을 입력해주세요.")
			formname.name.focus()
			formname.name.value =""
			}
		else if(phone_len1 <= 0 || phone_len2 <= 0){
			alert("전화번호를 제대로 입력해주세요.")
			}
		else if(email_len1 <= 0 || email_len2 <= 0 ){
			alert("이메일을 제대로 입력해주세요.")
			}
		else if(addr_len1 <= 0 || addr_len2 <= 0 || addr_len3 <= 0 ){
			alert("주소를 제대로 입력해주세요.")
			}
		else if(!formname.team1.checked && !formname.team2.checked){
			alert("소속팀 존재유무를 선택하세요.")
			formname.hobby.focus()
			}
		else if(!formname.hobby1.checked && !formname.hobby2.checked && !formname.hobby3.checked && !formname.hobby4.checked){
			alert("선호 포지션을 선택하세요.")
			formname.hobby.focus()
			}
		else if(id2_len <= 0){
			alert("추천인 ID를 입력해주세요.")
			formname.chuchun.focus()
			formname.chuchun.value =""
			}
		else if(passanswer_len <=0){
			alert("비밀번호 확인답변을 입력해주세요.")
			formname.passwd2ans.focus()
			formname.passwd2ans.value =""
			}
			else{
			alert ("아이디:"+formname.id.value+"\n"
				  +"비밀번호:"+formname.pw.value+"\n"
				  +"비밀번호 확인:"+formname.pwch.value+"\n"
				  +"이름:"+formname.name.value+"\n"
				  +"휴대폰번호:"+formname.hp2.value+"-"+formname.hp3.value+"\n"
				  +"이메일주소:"+formname.em1.value+"-"+formname.em2.value+"\n"
				  +"주소:"+formname.hp.value+formname.adr1.value+"-"+formname.adr2.value+"\n"
				  +"소속팀:"+(formname.team1.value)+(formname.team2.value)+"\n"
				  +"선호포지션:"+(formname.hobby1.value)+(formname.hobby2.value)+(formname.hobby3.value)+(formname.hobby4.value)+"\n"
				  +"추천인:"+formname.chuchun.value+"\n"
				  +"비밀번호확인답변:"+formname.passwd2ans.value+"\n")
				}
		 }

		function emailbox(a){
				for(var i=0; i<a.length; i++)
					{
					if(a.options[i].selected){
				   	formname.em2.value=a.options[i].value
					}
		}
		}

function schedulebutton(){
	window. open("../leaguepopup.html", "popup01", "width=500, height=600");
	}