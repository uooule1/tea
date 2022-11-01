<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EEO(티타임)</title>
<link rel = "stylesheet" href = "./css/index.css">
<link rel = "stylesheet" href = "./css/product.css">
<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
</head>
<body>
	<div class = "wrap">
	
		<header>
			<%@ include file = "../conf/header1.jsp" %>
		</header>
		
		<main>
				<div id = "contents">
					<div id = "slideShow"><%--영역 구분 --%>
						<div id = "slides"><%--이미지담기 --%>
							<img src="images/photo1.jpg" alt = "">
							<img src="images/photo2.jpg" alt = "">
							<img src="images/photo3.jpg" alt = "">
							<button id = "prev">&lang;</button>
							<button id = "next">&rang;</button>
						</div>
					</div>
					<script src = "js/slideshow.js"></script>
				</div>
			
			<div class = "contents">
				<h2>최신상품</h2>
				<%@ include file = "product/Products1.jsp" %>
			</div>
		</main>
	    
	    <footer>
    	<%@ include file = "conf/footer1.jsp" %>
    	</footer>
    
    </div>
</body>
</html>