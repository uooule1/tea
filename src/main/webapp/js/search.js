function search1(){
	if(search.method.value==""){
		alert("검색방법을 선택하세요");
		return false;
	}
	if(!search.keyword.value){
		alert("검색어를 입력하세요!!");
		search.keyword.focus();
		return false;
	}
	search.submit();
}