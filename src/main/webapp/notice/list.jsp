<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EEO(티타임): 공지사항</title>
<link rel = "stylesheet" href = "/tea/css/index.css">
<link rel = "stylesheet" href = "/tea/css/list.css">
<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
<script src = "/tea/js/notice.js"></script>
</head>
<body>
	<div class = "wrap">
		<header><%@ include file = "../conf/header2.jsp" %></header>
		
		<main>
		<table>
				<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
				</thead>
				
				<c:forEach var="list" items="${list}">
					<tr>
						<td>${list.n_num }</td>
						<td class="l">
						<a href="/tea/notice/readnum.jsp?n_num=${list.n_num}">${list.n_title}</a></td>
						<td>관리자</td>
						<td>${list.n_createdate }</td>
						<td>${list.n_readnum }</td>
					</tr>
				</c:forEach>
			</table>
			<%@ include file = "search.jsp"%>
		<%	
		//관리자로 로그인했다면 글 작성 버튼 보이게 하기 
			if(id.equals("admin1")){
		%>		
				<div class = "right">
				<input type = "button" onclick = "location.href='/tea/notice/write.jsp'" value = "작성" class ="small_button blue">
				</div>
				
		<%		
				}
		%>
			<div class="page">
				<jsp:include page="page.jsp" flush="true" />
			</div>
			
		</main>
		
    	<footer><%@ include file = "../conf/footer2.jsp" %></footer>
    </div>
</body>
</html>