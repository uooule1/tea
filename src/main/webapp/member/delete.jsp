<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EEO(티타임): 회원 탈퇴</title>
<script>
function check(){
	if(member.m_passwd.value==""){
		alert("회원탈퇴를 하려면 비밀번호를 입력해 주세요");
		member.m_passwd.focus();
		return false;	
	}
		var reply = confirm("정말 탈퇴 하겠습니까?");
		
		if(reply) member.submit();
		else member.reload();
}
</script>
<link rel = "stylesheet" href = "../css/index.css">
<link rel = "stylesheet" href = "../css/input.css">
<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
</head>
<body onload = "member.m_passwd.focus();">
	<div class = "wrap">
	<header><%@ include file = "../conf/header2.jsp" %></header>
		<h1>회원탈퇴</h1>
		<p> - 회원탈퇴를 하기 위해 <span>비밀번호</span>가 필요합니다.
		<form name = "member" method = "post" action = "delete_ok.jsp">
			<p> 비밀번호 : <input type = "password" name = "m_passwd" class = "large box">
			<p><input type = "button" value = "탈퇴" onclick = "check()" class = "small_button blue">
			<input type = "button" value = "취소" onclick = "history.back()" class = "small_button gray">
		</form>
		
	<footer><%@ include file = "../conf/footer2.jsp" %></footer>
	</div>
</body>
</html>