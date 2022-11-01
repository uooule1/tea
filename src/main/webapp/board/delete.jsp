<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/session.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 삭제</title>
<script src = "../js/board.js"></script>
<link rel = "stylesheet" href = "../css/index.css">
<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
</head>
<body onload = board.b_password.focus()>
<div class = "wrap">
	
	<header><%@ include file = "../conf/header2.jsp" %></header>
	
	<main>
	<%
		int b_num = Integer.parseInt(request.getParameter("b_num"));
	%>
	<h3>게시물 삭제</h3>
	글 삭제를 위해 작성시 입력한 비밀번호를 입력하세요!!!
	<form name = "board" method = "post" action = "delete_ok.jsp">
		<p>비밀번호 : <input type = "password" name = "b_password">
		<p><input type = "button" value = "삭제" onclick = "delete1()" class = "small_button red">
			<input type = "button" value = "취소" onclick = "history.back()" class = "small_button yellow">
			<input type = "hidden" value = "<%=b_num%>" name = "b_num">
	</form>
	</main>
		
    <footer><%@ include file = "../conf/footer2.jsp" %></footer>
    
    </div>
	
</body>
</html>