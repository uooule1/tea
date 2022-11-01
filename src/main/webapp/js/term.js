
function check(){
	if(term.check2.checked==false){
		alert("이용약관 동의에 동의해주세요.");
		return false;
	}
	if(term.check3.checked==false){
		alert("개인정보 수집 및 이용에 동의해주세요.");
		return false;
	}
	term.submit();
}
//약관
function checkall(){
	//document.term.check1.checked = true;
	//document.term.check2.checked = true;
	//document.term.check3.checked = true;
	//document.term.check4.checked = true;
	
	for(var i=0;i<document.term.length;i++){
		document.term.elements[i].checked = true;
	}
}

function clear_check(){
	if(document.term.check4.checked==false){
		document.term.check1.checked = false;
	}if(document.term.check4.checked==true){
		document.term.check1.checked = true;
	}
}