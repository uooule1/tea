<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src = "../js/search.js"></script>
<form name = "search" method = "get" action = "search_ok.jsp">
	<select name = "method" class = "medium box">
		<option value = "">선택하세요</option>
		<option value = "n_title">제목</option>
		<option value = "n_contents">내용</option>
	</select>
	<input type = "text" name = "keyword" placeholder = "검색어를 입력하세요!!!" class = "large box">
	<input type = "button" value = "검색" onclick = "search1()" class ="small_button blue">
</form>