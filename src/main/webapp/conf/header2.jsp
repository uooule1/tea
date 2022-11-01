<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header1</title>
</head>
<body>
<div class = "top_area">
	<div class = "left_area">
		<h1 class = "logo_area">
			<a href = "../index.jsp">EEO(티타임)</a>
		</h1>
		<ul class = "main_menu">
			<li>
				<a href = "../product/Products2.jsp" class = "text_link">상품</a>
			</li>
			<li>
				<a href = "noticelist.do">공지사항</a>
			</li>
		</ul>
	</div>
	<div class = "right_area">
		<%
			String id = "";
			if(session.getAttribute("m_id") != null){
			id = (String)session.getAttribute("m_id");
			}
			//관리자로 로그인했다면
			if(id.equals("admin1")){
		%>		
		<div class = "util_area">
			<ul class = "main_menu">
				<li>
					<a href = "#">관리자 <i class="fa-solid fa-bars"></i></a>
					<ul class = "sub_menu">
						<li><a href = "../member/list.jsp" class = "text_link">회원목록보기</a></li>
						<li><a href = "../member/edit.jsp" class = "text_link">관리자정보수정</a></li>
						<li><a href = "../product/controlProduct.jsp" class = "text_link">상품관리</a></li>
					</ul>
				</li>
			</ul>
		</div>
		
		<div class = "login_area">
			<a href = "../login/logout.jsp" class = "text_link"><i class="fa-solid fa-right-from-bracket" > 로그아웃</i></a>
		</div>
		
		<%
			}
			//아이디 로그인
			else if(!id.equals("")){
		%>
		<div class = "util_area">
			<ul class = "main_menu">
				<li>
					<a href = "#"> <%=id%></a>
					<ul class = "sub_menu">
						<li><a href = "../cart/cart.jsp" class = "text_link">장바구니</a></li>
						<li><a href = "../orders/list.jsp" class = "text_link">주문내역</a></li>
						<li><a href = "../board/list.jsp" class = "text_link">나의 후기</a></li>
						<li><a href = "../member/edit.jsp" class = "text_link">회원정보수정</a></li>
						<li><a href = "../member/delete.jsp" class = "text_link">회원탈퇴</a></li>
					</ul>
				</li>
			</ul>
		</div>			
		<div class = "login_area">
			<a href = "../login/logout.jsp" class = "text_link"><i class="fa-solid fa-right-from-bracket"> 로그아웃</i></a>
		</div>
		<%
			}
			//로그인하지 않았다면
			else {
		%>
		<div class = "util_area">
		</div>
		<div class = "login_area">
			<ul class = "main_menu">
				<li>
					<a href = "#"><i class="fa-solid fa-right-to-bracket"> 로그인</i></a>
					<ul class = "sub_menu">
						<li><a href="../login/login.jsp" class = "text_link">로그인</a></li>
						<li><a href="../member/term.jsp" class = "text_link" >회원가입</a></li>
					</ul>
				</li>
			</ul>
		</div>				
		<%
			}
		%>	
	</div>
</div>
</body>
</html>