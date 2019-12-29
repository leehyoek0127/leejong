/* Common */
jQuery(function($){
	/* select */
	var select = $("select");

	select.change(function(){
		var select_name = $(this).children("option:selected").text();
		$(this).siblings("label").text(select_name);
	});

	$(document).on('change', 'select', function () {
		var select_name = $(this).children("option:selected").text();
		$(this).siblings("label").text(select_name);
	});

	/* Gnb */
	$(window).scroll(function(){
		if ($(this).scrollTop() > 0) {
			$("#header").addClass("fixed");
		} else {
			$("#header").removeClass("fixed");
		};
	});

	$(document).ready(function() {
		var duration = 500;
		
		$('.btn_top').click(function(event) {
			event.preventDefault();
			jQuery('html, body').animate({scrollTop: 0}, duration);
			return false;
		});

		$('.btn_nav').on('click', function() {
			$('body').toggleClass('hidden');
			$(this).parent('.header').toggleClass('open');
		});

		// Layer popup
		$('.layer_popup .close, .layer_popup .cancel').on('click', function() { 
			$('.layer_popup').fadeOut();
			$('.layer_dim').fadeOut();
			if($('#mask').length) {
				$('#mask').fadeOut(200, function() {
					$(this).remove();
				});
			}
		});

		$(".select_box").each(function(e) {
			var select_name = $('option:selected',this).text();
			$(this).siblings("label").text(select_name);
		});

		$(document).on('each', '.select_box2', function () {
			var select_name = $('option:selected',this).text();
			$(this).siblings("label").text(select_name);
		});

		
	});

	$(".numberOnly").keyup(function(event){
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[^0-9]/gi,''));
        }
    });

});

var stCommon = {
	ajaxCall : function(pTarget, pMethod, pType, pParam, pErrorCallback, pCallback)
	{
		var szData = "";
		var oCallback = eval(pCallback);
		var oErrorCallback = eval(pErrorCallback);

		if (typeof(pParam) == 'object')
		{
			if (pParam != null && pParam.length > 0)
			{
				for(i=0 ; i<pParam.length ; ++i)
					szData += "&" + pParam[i][0] + "=" + pParam[i][1];

				szData = szData.substr(1, szData.length);
			}
		}
		else
		{
			szData = pParam;
		}


		$.ajax({
			type : pMethod,
			url : pTarget,
			dataType : pType,
			timeout : false,
			cache : false,
			data : szData,

			error : function(data) {
				oErrorCallback.call(this, data);
			},
			success : function(data) {
				oCallback.call(this, data);
			}
		});
	}
};
function fileTypeCheck(obj, type){
	if(type == 'image') return /([^\s]+(?=\.(jpg|gif|png))\.\2)/i.test(obj);
	else if(type == 'doc') return /([^\s]+(?=\.(hwp|pdf|doc|ppt|pptx|docx|xls|xlsx|zip))\.\2)/i.test(obj);
	else if(type == 'media') return /([^\s]+(?=\.(avi|mpg|mpeg|asf|wma|flv))\.\2)/i.test(obj);
	else if(type == 'all') return /([^\s]+(?=\.(jpg|gif|png|hwp|pdf|doc|ppt|pptx|docx|xls|xlsx|zip|avi|mpg|mpeg|asf|wma|flv))\.\2)/i.test(obj);
	else false;
}

// 파일첨부
function fileTypeChk(fileObj){
	if(fileTypeCheck($(fileObj).val(), "image")){
		$(fileObj).parent().find(".name").html($(fileObj).val());
	}else{
		$(fileObj).replaceWith($(fileObj).clone(true));
		$(fileObj).siblings(".txt").html("이미지를 등록해 주세요");
		alert("이미지 파일이 아닙니다.");
		return;
	}
}


// LAYER POPUP
function openLayer(el) { 
    var temp = $('#' + el);  

    if(!$('.layer_popup:visible').length) {
        $("<div/>", {
            "id": "mask",
        }).appendTo('body').fadeIn(200);
    }
    temp.show(); 
    return false;
}

function popupPosInit(){
    if($('.layer_popup').length) {
        $('.layer_popup').each(function() {
            $(this).css({
                'left': ($(window).scrollLeft() + ($(window).width() - $(this).outerWidth())/2) + 'px',
                'top': (($(window).height() - $(this).outerHeight())/2) + 'px'
            });
        });

    }
}

function PhonNumStr( str ){
	var RegNotNum  = /[^0-9]/g;
	var RegPhonNum = "";
	var DataForm   = "";

	// return blank    
	if( str == "" || str == null ) return "";
	// delete not number
	str = str.replace(RegNotNum,'');

	if( str.length < 4 ) return str;

	if( str.length > 3 && str.length < 7 ) {
	   	DataForm = "$1-$2";
		RegPhonNum = /([0-9]{3})([0-9]+)/;

	} else if(str.length == 7 ) {
		DataForm = "$1-$2";
		RegPhonNum = /([0-9]{3})([0-9]{4})/;

	} else if(str.length == 9 ) {
		DataForm = "$1-$2-$3";
		RegPhonNum = /([0-9]{2})([0-9]{3})([0-9]+)/;

	} else if(str.length == 10){

		if(str.substring(0,2)=="02"){
			DataForm = "$1-$2-$3";
			RegPhonNum = /([0-9]{2})([0-9]{4})([0-9]+)/;

		}else{
			DataForm = "$1-$2-$3";
			RegPhonNum = /([0-9]{3})([0-9]{3})([0-9]+)/;
		}
	} else if(str.length == 11){
		DataForm = "$1-$2-$3";
		RegPhonNum = /([0-9]{3})([0-9]{4})([0-9]+)/;
	} else if(str.length > 11){
		DataForm = "$1-$2-$3";
		RegPhonNum = /([0-9]{4})([0-9]{4})([0-9]+)/;
	}
	while( RegPhonNum.test(str) ) { 
		str = str.replace(RegPhonNum, DataForm); 
	}
	
	str = str.substring(0, 14);

	return str;
}

function ltrim(str) {
	var i;
	var ch;
	var retStr = '';
	if (str.length == 0)
		return str;
	for (i=0;i<str.length;i++) {
		ch = str.charAt(i);
		if (retStr.length == 0 && (ch == ' ' || ch == '\r' || ch == '\n')) 
			continue;
		retStr += ch;
	}
	return retStr;
}

function rtrim(str) {
	var i;
	var ch;
	var retStr = '';
	if (str.length == 0)
		return str;
	for (i=str.length-1;i>=0;i--) {
		ch = str.charAt(i);
		if (ch != ' ' && ch != '\r' && ch != '\n') {
			break;
		}
	}
	retStr = str.substring(0, i+1);
	return retStr;
}

function trim(str) {
	var retStr;
	retStr = ltrim(str);
	retStr = rtrim(retStr);
	return retStr;
}

function alltrim(str) {
	var i;
	var ch;
	var retStr = '';
	var retStr1 = '';
	if (str.length == 0)
		return str;
	for (i=0;i<str.length;i++) {
		ch = str.charAt(i);
		if (ch == ' ' || ch == '\r' || ch == '\n') 
			continue;
		retStr += ch;
	}
	return retStr;
}

function Fn_Search() {
	document.frm_search.submit();
}

function Start_Loading_Mask() {
    //화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height(); 
    var maskWidth = window.document.body.clientWidth;
     
    var mask = "<div id='loadingmask' style='position:fixed; z-index:9000; background-color:#ffffff; display:none; left:0; top:0;'></div>";
    var loadingImg = '';
     
    loadingImg += "<div id='loadingImg' style='position:fixed; left:50%; top:50%; display:none; z-index:10000;'>";
    loadingImg += " <img src='/images/Progress_Loading.gif' style='margin-top:-50%;margin-left:-50%'/>";
    loadingImg += "</div>";  
 
    //화면에 레이어 추가
    $('body')
        .append(mask)
        .append(loadingImg)
       
    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
    $('#loadingmask').css({
            'width' : maskWidth
            , 'height': maskHeight
            , 'opacity' : '0.3'
    }); 
 
    //마스크 표시
    $('#loadingmask').show();   
 
    //로딩중 이미지 표시
    $('#loadingImg').show();
}
function Stop_Loading_Mask() {
    $('#loadingmask, #loadingImg').hide();
    $('#loadingmask, #loadingImg').remove();  
}