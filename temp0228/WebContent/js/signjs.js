var alerttext
function idcheck() {
	var idlen = join.id.value.length
	if ((idlen >= 8) && (idlen <= 14)) {
		alert("입력해주셔서 감사합니다")
	} else {
		alert("4~14자 사이의 아이디만 유효합니다.")

		join.id.focus()
	}
}

function mailaddr(maillist) {

	for (var i = 0; i < maillist.length; i++) {
		if (maillist.options[i].selected)
			join.email2.value = maillist.options[i].value
	}

}
var confirmid
function confirmId() {
	if (join.id.value == "") {
		alert("ID를 입력하세요.");
		return;
	}
	// url = "confirmId.jsp?id=" + join.id.value;
	confirmid = join.id.value;

	// open( url, "confirm", "toolbar=no, location=no, status=no, menubar=no,
	// scrollbars=no, resizable=no, resizable=no, width=300, height=200");

}

function joinsubmit() {

	var idlen = join.id.value.length
	var pwlen = join.pw.value.length
	var namelen = join.name.value.length
	var tel2len = join.tel2.value
	var tel3len = join.tel3.value
	var email1len = join.email1.value.length
	var email2len = join.email2.value.length
	var telReg2 = /^[0-9]+[0-9]{2,5}$/g;
	var telReg3 = /^[0-9]+[0-9]{2,5}$/g;

	if (join.hidden.value == 0 || confirmid != join.id.value) {
		alert("아이디중복확인을 하세요.")
	}

	else if ((pwlen < 4) || (pwlen > 14)) {

		alert("비밀번호를 확인하세요. 4~14자 사이의 비밀번호만 유효합니다.")
		join.pw.focus()
	}

	else if (join.pw.value != join.pwch.value) {
		alert("비밀번호일치여부를 다시 확인하세요.")
		join.pwch.focus()
	}

	else if (namelen <= 0) {
		alert("이름을 입력하세요.")
		join.name.focus()
	}

	else if (!telReg2.test(tel2len)) {
		alert("전화번호를 입력해주세요.")
		join.tel2.focus()
	}

	else if (!telReg3.test(tel3len)) {
		alert("전화번호를 입력해주세요.")
		join.tel3.focus()
	}

	else if (email1len <= 0 || email2len <= 0) {
		alert("이메일주소를 입력하세요.")
		join.email1.focus()
	}

	else {
		document.join.submit();
	}
}

function sample6_execDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수

			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
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