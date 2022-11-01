<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EEO(티타임): 비밀번호 찾기 </title>
<script type="text/javascript" src = "../js/find.js"></script>
<link rel = "stylesheet" href = "../css/login.css">
</head>
<body onload = "member.m_id.select()">
<div class = "wrapper">
	<div class = "new">
		<h3>비밀번호 찾기</h3>
		<form name = "member" method ="post" action = "findpw_ok.jsp">
			<p>아이디를 입력하세요 
			<p><input type = "text" name = "m_id">
			<p><input type = "button" value = "비밀번호 찾기" onclick = "findPW()">
		</form>	
	</div>
</div>
</body>
</html>