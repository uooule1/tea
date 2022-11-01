function check(){
	if(!login.m_id.value){
		alert("아이디를 입력하세요");
		login.m_id.focus();
		return false;
	}
	if(!login.m_passwd.value){
		alert("비밀번호를 입력하세요");
		login.m_passwd.focus();
		return false;
	}
	login.submit();
}
function newID(){
	window.open("../member/findid.jsp","_blank","width=550,height=400,left=900,top=100");
}
function newPW(){
	window.open("../member/findpw.jsp","_blank","width=550,height=400,left=900,top=100");
}