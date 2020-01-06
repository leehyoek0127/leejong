 var sel_files = [];
 
        $(document).ready(function() {
            $("#input_imgs").on("change", handleImgsFilesSelect);
        }); 
 
        function handleImgsFilesSelect(e) {
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);
 
            filesArr.forEach(function(f) {
                if(!f.type.match("image.*")) {
                    alert("확장자는 이미지 확장자만 가능합니다.");
                    return;
                }
 
                sel_files.push(f);
 
                var reader = new FileReader();
                reader.onload = function(e) {
                    var img_html = "<img src=\"" + e.target.result + "\" />";
                    $(".imgs_wrap").append(img_html);
                }
                reader.readAsDataURL(f);
            });
        }

		function groundsubmit()
	{
		
		var placelen=ground.place.value.length
		var placenamelen=ground.placename.value.length
		var placesizelen=ground.placesize.value.length
		var placeinfolen=ground.placeinfo.value.length
		var inforlen=ground.infor.value.length
		

		if ((placelen <4) || (placelen >30))
		{
			alert("위치를 정확하게 입력해주세요.")
			ground.place.focus()
			
		}

		else if ((placenamelen <4) || (placenamelen >30))
		{

			alert("풋살장 이름을 정확하게 입력해주세요. 4자 이상의 이름만 사용이 가능합니다.")
			ground.placename.focus()
		}

		else if(placesizelen<=0)
		{
			alert("구장 사이즈을 입력하세요.")
			ground.placesize.focus()
		}

		
		else if(placeinfolen<=0||placeinfolen<=0)
		{
			alert("시설정보를 입력하세요.")
			ground.placeinfo.focus()
		}

		
		else if(inforlen<=0||inforlen<=0)
		{
			alert("구장소개를 입력하세요.")
			ground.infor.focus()
		}
		else
		{
			document.ground.submit();
		}
	}