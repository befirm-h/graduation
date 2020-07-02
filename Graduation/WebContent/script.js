function inputCheck() {
	
	if (document.regFrm.id.value == "") {
		alert("아이디를 입력해 주세요.");
		document.regFrm.id.focus();
		return false;
	}
	if (document.regFrm.joongbokID.value == 0) {
		alert("아이디를 중복체크 해주세요.");
		return false;
	}
	
	
	if (document.regFrm.passwd.value == "") {
		alert("비밀번호를 입력해 주세요.");
		document.regFrm.passwd.focus();
		return false;
	}

	if(document.regFrm.passwd.value.length<6 )
	{
		alert("비밀번호는 6~16자리로 입력해주세요.");
		document.regFrm.passwd.value = "";
		document.regFrm.passwd.focus();
		return false;
	}
	if (document.regFrm.repass.value == "") {
		alert("비밀번호를 확인해 주세요");
		document.regFrm.repass.focus();
		return false;
	}
	if (document.regFrm.passwd.value != document.regFrm.repass.value) {
		alert("비밀번호가 일치하지 않습니다.");
		document.regFrm.repass.value = "";
		document.regFrm.repass.focus();
		return false;
	}
	
	if (document.regFrm.phone.value == "") {
		alert("전화번호를 입력해주세요.");
		document.regFrm.phone.focus();
		return false;
	}
	
	if(!(document.regFrm.phone.value >= '0' && document.regFrm.phone.value <= '9'))
		{
			alert("전화번호는 숫자로 입력해주세요.");
			document.regFrm.phone.value="";
			document.regFrm.phone.focus();
			return false;
		}

	if (document.regFrm.mail.value == "") {
		alert("이메일을 입력해주세요.");
		document.regFrm.mail.focus();
		return false;
	}

	document.regFrm.submit();
}
	
	function win_close() { self.close(); }

	
