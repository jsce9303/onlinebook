function formCheck() {

	// 입력 값이 비어 있는지 검사
	if(frm.id.value=="") {
		alert("아이디를 입력하세요");
		frm.id.focus();
		return false;
	}
	if(frm.passwd.value=="") {
		alert("비밀번호를 입력하세요");
		frm.passwd.focus();
		return false;
	}
	if(frm.passwd1.value=="") {
		alert("비밀번호를 입력하세요");
		frm.passwd1.focus();
		return false;
	}
	if(frm.passwd2.value=="") {
		alert("비밀번호 확인을 입력하세요");
		frm.passwd2.focus();
		return false;
	}
	if(passwd1!=passwd2) {
		alert("비밀번호가 같지 않습니다");
		return false;
	}
	
	if(frm.email.value=="") {
		alert("이메일을 입력하세요");
		frm.email.focus();
		return false;
	}
	if(frm.phone.value=="") {
		alert("휴대번호를 입력하세요");
		frm.phone.focus();
		return false;
	}
	if(frm.birth.value=="") {
		alert("생년월일을 입력하세요");
		frm.birth.focus();
		return false;
	}
}