<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EEO(티타임): 로그인</title>
<script type="text/javascript" src = "../js/login.js"></script>
<link rel = "stylesheet" href = "../css/index.css">
<link rel = "stylesheet" href = "../css/login.css">
<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
</head>
<body onload = login.m_id.focus()>
	<div class = "wrap">
	
	<header><%@ include file = "../conf/header2.jsp" %></header>
	
	<main>
		<form name = "login" method = "post" action = "login_ok.jsp">
			<table class = "login">
				<tr>
					<td><h1><i class="fa-solid fa-right-to-bracket"></i> Login</h1></td>
				</tr>
				<tr>
					<td><input type = "text" name = "m_id" placeholder="아이디 입력"></td>
				</tr>
				<tr>
					<td><input type = "password" name = "m_passwd" placeholder="비밀번호입력(영문,숫자,특수문자 조합)"></td>
				</tr>
				<tr>
					<td><input type = "button" value = "로그인" onclick = "check()"></td>
				</tr>
				<tr>
					<td >
						<a href = "../member/term.jsp" >회원가입</a>
						<a onclick = "newID()">아이디 찾기</a>
						<a onclick = "newPW()">비밀번호 찾기</a>
					</td>
				</tr>
				</table>
			</form>
	</main>
	
	<footer><%@ include file = "../conf/footer2.jsp" %></footer>
	
	</div>
</body>
</html>