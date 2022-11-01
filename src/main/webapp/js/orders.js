function confirmUpdate(){
	var result = confirm("상품 주문을 취소 하시겠습니까?");
	if(result){
		document.order.submit();
	}
	return false;
}
function goPopup(){
	window.open("jusoPopup.jsp","pop","width=570,height=500, scrollbars=yes, resizable=yes"); 
}
function jusoCallBack(roadAddrPart1,addrDetail,zipNo){
		order.roadAddrPart1.value = roadAddrPart1;
		order.addrDetail.value = addrDetail;
		order.zipNo.value = zipNo;
}