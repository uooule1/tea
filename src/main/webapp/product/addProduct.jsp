<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "com.oreilly.servlet.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EEO(티타임): 상품등록</title>
<link rel = "stylesheet" href = "../css/index.css">
<link rel = "stylesheet" href = "../css/input.css">
<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
<script  src = "../js/product.js"></script>
</head>
<body>
	<div class = "wrap">
		<header><%@ include file = "../conf/header2.jsp" %></header>
		
		<main>
		<h2>상품등록</h2>
			<form name = "product" action ="addProduct_ok.jsp" method = "post" enctype = "multipart/form-data">
				<table>
					<tr>
						<td>상품코드 <span>*</span></td>
						<td><input type = "text" name = "p_code" class = "large"></td>
					</tr>
					<tr>
						<td>상품명 <span>*</span></td>
						<td><input type = "text" name = "p_name" class = "large"></td>
					</tr>
					<tr>
						<td>상품가격 <span>*</span></td>
						<td><input type = "text" name = "p_price" class = "large"></td>
					</tr>
					<tr>
						<td>상품 상세 정보 <span>*</span></td>
						<td><textarea name = "p_info" cols = "50" rows = "2" class = "text_contents"></textarea></td>
					</tr>
					<tr>
						<td>상품이미지등록 <span>*</span></td>
						<td><input type = "file" name = "p_image" ></td>
					</tr>
					<tr>
						<td>재고수 <span>*</span></td>
						<td><input type = "text" name = "p_stock" class = "large"></td>
					</tr>
					<tr>
						<td>카테고리 <span>*</span></td>
						<td><input type = "text" name = "p_category" class = "large"></td>
					</tr>
					<tr>
						<td>브랜드 <span>*</span></td>
						<td><input type = "text" name = "p_brand" class = "large"></td>
					</tr>
					<tr>
						<td>상품상태</td>
						<td>
							<input type = "radio" name = "p_state" value = "판매가능">판매가능
							<input type = "radio" name = "p_state" value = "품절">품절
							<input type = "radio" name = "p_state" value = "할인">할인
						</td>
					</tr>
					<tr>
						<td>할인율</td>
						<td><input type = "text" name = "p_rate" class = "large"></td>
					</tr>
				</table>
				<p><input type = "button" value= "등록" onclick = "addProduct()" class = "small_button blue">
					<input type = "button" value= "뒤로" onclick = "history.back()" class = "small_button yellow">
			</form>
		</main>
		
		<footer><%@ include file = "../conf/footer2.jsp" %></footer>
	</div>
</body>
</html>