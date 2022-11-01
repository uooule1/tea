function editForm(){
	if(member.m_passwd.value==""){
		alert("회원정보를 수정 하려면 비밀번호를 입력해 주세요");
		member.m_passwd.focus();
		return false;	
	}
	var reply = confirm("정말 수정하시겠습니까?");
	if(reply){
		document.member.submit();
	}else{
		document.member.reload();
	}return false;
}
function goPopup(){
	window.open("jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}
function jusoCallBack(roadAddrPart1,addrDetail,zipNo){
		member.roadAddrPart1.value = roadAddrPart1;
		member.addrDetail.value = addrDetail;
		member.zipNo.value = zipNo;
}