function check(){
	if(!notice.n_passwd.value){
		alert("비밀번호를 입력하세요");
		notice.n_passwd.focus();
		return false;
	}
	if(!notice.n_title.value){
		alert("제목을 입력하세요");
		notice.n_title.focus();
		return false;
	}
	if(!notice.n_contents.value){
		alert("내용을 입력하세요");
		notice.n_contents.focus();
		return false;
	}
	notice.submit();
}
function checkedit(){
	if(!notice.n_passwd.value){
		alert("현재비밀번호를 입력하세요");
		notice.n_passwd.focus();
		return false;
	}
	if(!notice.n_passwd2.value){
		alert("변경할 비밀번호를 입력하세요");
		notice.n_passwd2.focus();
		return false;
	}
	if(!notice.n_title.value){
		alert("제목을 입력하세요");
		notice.n_title.focus();
		return false;
	}
	if(!notice.n_contents.value){
		alert("내용을 입력하세요");
		notice.n_contents.focus();
		return false;
	}
	notice.submit();
}
function delete1(){
	if(!notice.n_passwd.value){
		alert("현재 비밀번호를 입력하세요");
		notice.n_passwd.focus();
		return false;	
	}
	notice.submit();
}