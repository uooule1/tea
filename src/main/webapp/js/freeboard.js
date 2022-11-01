function check(){
	if(!freeboard.f_name.value){
		alert("작성자 이름을 입력하세요");
		freeboard.f_name.focus();
		return false;
	}
	if(!freeboard.f_passwd.value){
		alert("비밀번호를 입력하세요");
		freeboard.f_passwd.focus();
		return false;
	}
	if(!freeboard.f_subject.value){
		alert("제목을 입력하세요");
		freeboard.f_subject.focus();
		return false;
	}
	freeboard.submit();
}
function checkedit(){
	if(!freeboard.f_passwd.value){
		alert("비밀번호를 입력하세요");
		freeboard.f_passwd.focus();
		return false;
	}
	if(!freeboard.f_subject.value){
		alert("제목을 입력하세요");
		freeboard.f_subject.focus();
		return false;
	}
	freeboard.submit();
}
function delete1(){
	if(!freeboard.f_passwd.value){
		alert("비밀번호를 입력하세요");
		freeboard.f_passwd.focus();
		return false;	
	}
	freeboard.submit();
}