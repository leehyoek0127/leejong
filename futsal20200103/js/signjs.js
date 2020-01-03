

  	


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
	var confirmid
	function confirmId()
	{	
		if(join.id.value == ""){
			alert("ID를 입력하세요.");
			return;
		}
		url = "confirmId.jsp?id=" + join.id.value;
		confirmid=join.id.value;
		
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
		else if(join.hidden.value!=1 || confirmid!=join.id.value){
			alert("아이디중복확인을 하세요.")
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
			document.join.submit();
		}
	}
