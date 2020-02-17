 var sel_files = [];
 
        $(document).ready(function() {
            $("#input_imgs").on("change", handleImgsFilesSelect);
        }); 
 
        function handleImgsFilesSelect(e) {
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);
 
            filesArr.forEach(function(f) {
                if(!f.type.match("image.*")) {
                    alert("Ȯ���ڴ� �̹��� Ȯ���ڸ� �����մϴ�.");
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
			alert("��ġ�� ��Ȯ�ϰ� �Է����ּ���.")
			ground.place.focus()
			
		}

		else if ((placenamelen <4) || (placenamelen >30))
		{

			alert("ǲ���� �̸��� ��Ȯ�ϰ� �Է����ּ���. 4�� �̻��� �̸��� ����� �����մϴ�.")
			ground.placename.focus()
		}

		else if(placesizelen<=0)
		{
			alert("���� �������� �Է��ϼ���.")
			ground.placesize.focus()
		}

		
		else if(placeinfolen<=0||placeinfolen<=0)
		{
			alert("�ü������� �Է��ϼ���.")
			ground.placeinfo.focus()
		}

		
		else if(inforlen<=0||inforlen<=0)
		{
			alert("����Ұ��� �Է��ϼ���.")
			ground.infor.focus()
		}
		else
		{
			document.ground.submit();
		}
	}