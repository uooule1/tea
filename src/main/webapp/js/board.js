function checkWrite(){
	if(!board.b_password.value){
		alert("비밀번호를 입력하세요");
		board.b_password.focus();
		return false;
	}
	if(!board.b_title.value){
		alert("제목을 입력하세요");
		board.b_title.focus();
		return false;
	}
	board.submit();
}
function checkedit(){
	if(!board.b_password.value){
		alert("비밀번호를 입력하세요");
		board.b_password.focus();
		return false;
	}
	if(!board.b_password2.value){
		alert("변경할 비밀번호를 입력하세요");
		board.b_password2.focus();
		return false;
	}
	if(!board.b_title.value){
		alert("제목을 입력하세요");
		board.b_title.focus();
		return false;
	}
	board.submit();
}
function delete1(){
	if(!board.b_password.value){
		alert("비밀번호를 입력하세요");
		board.b_password.focus();
		return false;	
	}
	board.submit();
}