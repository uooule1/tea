<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EEO(티타임): 아이디 찾기 </title>
<script src = "../js/find.js"></script>
<link rel = "stylesheet" href = "../css/login.css">
</head>
<body onload = "member.m_name.select()">
<div class = "wrapper">
	<div class = "new">
		<h3>아이디 찾기</h3>
		<form name = "member" method ="post" action = "findid_ok.jsp">
			<p>이름을 입력하세요 
			<p><input type = "text" name = "m_name">
			<p><input type = "button" value = "ID찾기" onclick = "findID()">
		</form>
	</div>
</div>
</body>
</html>