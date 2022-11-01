function findID(){
	if(!member.m_name.value){
		alert("이름을 입력하세요");
		member.m_name.focus();
		return false;
	}
	member.submit();
}
function findPW(){
	if(!member.m_id.value){
		alert("아이디를 입력하세요");
		member.m_id.focus();
		return false;
	}
	member.submit();	
}	
