function delCheck(){
	document.cart.action = "delete.jsp";
	document.cart.submit();
}
function orderCheck(){
	document.cart.action = "update.jsp";
	document.cart.submit();
}

function substract(i){
	var val = eval("cart.c_quantity"+i+".value");
	val --;
	eval("cart.c_quantity"+i+".value=val");
}

function plus(i){
	var val = eval("cart.c_quantity"+i+".value");
	val++;
	eval("cart.c_quantity"+i+".value=val");
}
