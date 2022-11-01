function addProduct(){
	if(!product.p_code.value){
		alert("상품코드를 입력하세요");
		product.p_code.focus();
		return false;
	}
	if(!product.p_name.value){
		alert("상품명을 입력하세요");
		product.p_name .focus();
		return false;
	}
	if(!product.p_price.value){
		alert("상품가격을 입력하세요");
		product.p_price.focus();
		return false;
	}
	//가격 숫자로만 입력하기
	if(isNaN(product.p_price.value)){
		alert("숫자만 입력하세요	");
		product.p_price.focus();
		return false;
	}
	if(!product.p_info.value){
		alert("상품 상세 정보를 입력하세요");
		product.p_info.focus();
		return false;
	}	
	if(!product.p_image.value){
		alert("상품 이미지를 등록하세요");
		product.p_image.focus();
		return false;
	}		
	if(!product.p_stock.value){
		alert("재고수를 입력하세요");
		product.p_stock.focus();
		return false;
	}	
	//재고수 숫자 입력 
	if(isNaN(product.p_stock.value)){
		alert("숫자만 입력하세요	");
		product.p_stock.focus();
		return false;
	}
	if(!product.p_category.value){
		alert("카테고리를 입력하세요");
		product.p_category.focus();
		return false;
	}	
	if(!product.p_brand.value){
		alert("브랜드를 입력하세요");
		product.p_brand.focus();
		return false;
	}
	product.submit();
}

function editProduct(){
	if(!product.p_code.value){
		alert("상품코드를 입력하세요");
		product.p_code.focus();
		return false;
	}
	if(!product.p_name.value){
		alert("상품명을 입력하세요");
		product.p_name.focus();
		return false;
	}
	if(!product.p_price.value){
		alert("상품가격을 입력하세요");
		product.p_price.focus();
		return false;
	}
	if(!product.p_info.value){
		alert("상품 상세 정보를 입력하세요");
		product.p_info.focus();
		return false;
	}	
	
	if(!product.p_stock.value){
		alert("재고수를 입력하세요");
		product.p_stock.focus();
		return false;
	}	
	if(!product.p_category.value){
		alert("카테고리를 입력하세요");
		product.p_category.focus();
		return false;
	}	
	if(!product.p_brand.value){
		alert("브랜드를 입력하세요");
		product.p_brand.focus();
		return false;
	}
	product.submit();
}


function confirmDelete(){
	var result = confirm("상품을 삭제하시겠습니까?");
	if(result){
		document.product.submit();
	}else{
		document.product.reload();
	}
	return false;
}

function substract(){
	var val = parseInt(product.c_quantity.value);
	if(val<=1){
		alert("해당 상품은 최소구매 수량이 1개 입니다.");
	}else{
	val = val-1;
	product.c_quantity.value=val;	
	}
}

function plus(){
	var val = parseInt(product.c_quantity.value);
	if(val<1){
		alert("해당 상품은 최소구매 수량이 1개 입니다.");
	}else{
	val = val+1;
	product.c_quantity.value=val;	
	}
}
