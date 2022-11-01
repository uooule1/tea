<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<%@ include file = "../conf/session.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EEO(티타임): 회원게시판 작성</title>
<script type="text/javascript" src = "../js/board.js"></script>
<link rel = "stylesheet" href = "../css/index.css">
</head>
<body onload = "board.b_password.focus();">
<header><%@ include file = "../conf/header2.jsp" %></header>
	<%
		request.setCharacterEncoding("utf-8");
		
		String p_code = request.getParameter("p_code");
	%>
	<main>
	<h3>상품 후기 작성</h3>
	글 수정,삭제 하기위해 반드시 비밀번호가 필요하므로 반드시 비밀번호를 입력하세요.<p>
	<form name = "board" method = "post" action = "write_ok.jsp" method = "post" enctype = "multipart/form-data">
	<input type = "hidden"  name = "p_code" value = "<%=p_code%>">
		<table>
			<tr>
				<td>아이디</td>
				<td><%=id%></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type = "password" name = "b_password"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type = "text" name = "b_title"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows ="5" cols = "50" name = "b_contents"></textarea></td>
			</tr>
			<tr>
				<td>별점</td>
				<td>
					<select name = "b_star" >
						<option value= "5">★★★★★</option>
						<option value= "4">★★★★</option>
						<option value= "3">★★★</option>
						<option value= "2">★★</option>
						<option value= "1">★</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>사진</td>
				<td><input type = "file" name = "b_image" ></td>
			</tr>
			<tr>
				<td colspan = "2">
					<input type = "button" value = "작성" onclick = "checkWrite()" class = "small_button blue">
					<input type = "reset"  value = "리셋"  class = "small_button red">	
					<input type = "button" value = "목록" onclick = "history.back()" class = "small_button yellow">
				</td>
			</tr>
		</table>
	</form>
	</main>
	
	<footer><%@ include file = "../conf/footer2.jsp" %></footer>
	
</body>
</html>