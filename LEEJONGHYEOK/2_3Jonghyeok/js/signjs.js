	(function ($) {
		  // custom css expression for a case-insensitive contains()
		  jQuery.expr[':'].Contains = function(a,i,m){
			  return (a.textContent || a.innerText || "").toUpperCase().indexOf(m[3].toUpperCase())>=0;
		  };
		 
		  function filterList(header, list) { 
		  // header is any element, list is an unordered list
			// create and add the filter form to the header
			var form = $("<form>").attr({"class":"filterform","action":"#"}),
				input = $("<input>").attr({"class":"filterinput","type":"text"});
			$(form).append(input).appendTo(header);
		 
			$(input)
			  .change( function () {
				var filter = $(this).val();
				if(filter) {
			  
				  $matches = $(list).find('a:Contains(' + filter + ')').parent();
				  $('subli', list).not($matches).slideUp();
				  $matches.slideDown();
					
				} else {
				  $(list).find("subli").slideDown();
				}
				return false;
			  })
			.keyup( function () {
				// fire the above change event after every letter
				$(this).change();
			});
		  }
		 
		 
		  //ondomready
		  $(function () {
			filterList($("#form"), $("#list"));
		  });
		}(jQuery));
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

  	$(function(){
 var shrinkHeader = 30;
  $(window).scroll(function() {
    var scroll = getCurrentScroll();
      if ( scroll >= shrinkHeader ) {
           $('#navtop').addClass('shrink');
		   
        }
        else {
            $('#navtop').removeClass('shrink');
			
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












$(function(){
	$('#carousel1').infiniteCarousel();
});