function check(){
	if(member.m_id.value==""){
		alert("아이디를 입력해주세요!");
		member.m_id.select();
		return false;
	}
	if(member.m_passwd.value==""){
		alert("비밀번호를 입력해주세요!");
		member.m_passwd.select();
		return false;
	}
//     비밀번호는 영문대소문자, 숫자,특수문자 조합
    var exp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
    if(!document.member.m_passwd.value.match(exp)){
        alert("비밀번호는 영문, 숫자, 특수문자를 최소 한 가지씩 조합하여 8-16자로 입력해주세요");
        member.m_passwd.select();
        return false;
    }
	if(member.m_passwd1.value==""){
		alert("비밀번호를 한번 더 입력해 주세요!");
		member.m_passwd1.select();
		return false;
	}
	if(member.m_passwd.value!=member.m_passwd1.value){
		alert("비밀번호가 일치하지 않습니다. 다시 입력하세요!");
		member.m_passwd.select();
		member.m_passwd1.select();
		return false;
	}
	if(member.m_name.value==""){
		alert("이름을 입력해주세요!");
		member.m_name.select();
		return false;
	}
	member.submit();
}
function newwin(){
	window.open("idcheck.jsp","_blank","width=550,height=400,left=0,top=0");
}
function goPopup(){
	window.open("jusoPopup.jsp","pop","width=570,height=500, scrollbars=yes, resizable=yes"); 
}
function jusoCallBack(roadAddrPart1,addrDetail,zipNo){
		member.roadAddrPart1.value = roadAddrPart1;
		member.addrDetail.value = addrDetail;
		member.zipNo.value = zipNo;
}