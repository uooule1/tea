<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<%@ include file = "../conf/session.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EEO(티타임): 공지사항 작성</title>
<script type="text/javascript" src = "../js/notice.js"></script>
<link rel = "stylesheet" href = "../css/index.css">
<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
</head>
<body onload = "notice.n_password.focus();">
	<div class = "wrap">
		<header><%@ include file = "../conf/header2.jsp" %></header>
		
		<main>
		
		<h2>공지사항 작성</h2>
		글 수정,삭제 하기위해 반드시 비밀번호가 필요하므로 반드시 비밀번호를 입력하세요.<p>
		<form name = "notice" method = "post" action = "write_ok.jsp" enctype = "multipart/form-data">
			<table>
				<tr>
					<td>작성자</td>
					<td><%=id%></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type = "password" name = "n_passwd" class = "large box"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type = "text" name = "n_title" class = "maxlarge box"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea rows ="5" cols = "50" name = "n_contents" class = "text_contents maxlarge"></textarea></td>
				</tr>
				<tr>
					<td>이미지 등록</td>
					<td><input type = "file" name = "n_image"></td>
				</tr>
			</table>
			<input type = "button" value = "작성" onclick = "check()" class = "small_button blue">
			<input type = "reset" value =  "리셋" class = "small_button gray">	
			<input type = "button" value = "목록" onclick = "history.back()" class = "small_button yellow">
		</form>
		</main>
		
    	<footer><%@ include file = "../conf/footer2.jsp" %></footer>
    </div>
</body>
</html>