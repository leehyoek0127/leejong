/*스크롤 내리면 메뉴 위치 이동하는 기능*/
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