<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<%@ include file = "../conf/admin.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EEO(티타임): 등록한 상품 목록</title>
<script src = "../js/product.js"></script>
<link rel = "stylesheet" href = "/tea/css/index.css">
<link rel = "stylesheet" href = "/tea/css/list.css">
<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
</head>
<body>
	<div class = "wrap">
		<header><%@ include file = "../conf/header2.jsp" %></header>
		
		<main>
		<form method = "post" name = "product" action = "deleteProduct.jsp">
		<%
		request.setCharacterEncoding("utf-8");
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql = "SELECT * FROM product";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
	%>	
		
			<h2>상품 목록 보기</h2>
			<table>
				<tr>
					<th>상품코드</th>
					<th>카테고리</th>
					<th>브랜드</th>
					<th>상품이미지</th>
					<th>상품명</th>
					<th>상품등록일</th>
					<th>가격</th>
					<th>재고수</th>
					<th>상품상태</th>
					<th>할인율</th>
					<th>상품 정보 수정/삭제</th>
				</tr>
	<% 		while(rs.next()){ %>			
				<tr>
					<td><%= rs.getString("p_code")%></td>
					<td><%= rs.getString("p_category")%></td>
					<td><%= rs.getString("p_brand")%></td>
					<td><img src = "../upload/<%=rs.getString("p_image")%>" width = "200px"></td>
					<td><%= rs.getString("p_name")%></td>
					<td><%= rs.getString("p_createdate")%></td>
					<td><%= rs.getInt("p_price")%></td>
					<td><%= rs.getInt("p_stock")%></td>
					<td><%= rs.getString("p_state")%></td>
					<td><%= rs.getString("p_rate")%></td>
					<td>
						<input type = "button" value = "수정" onclick = "location.href='editProduct.jsp?p_code=<%=rs.getString("p_code")%>'" class = "blue small_button">
						<input type = "button" value = "삭제" onclick = "confirmDelete()" class = "red small_button">
						<input type = "hidden" value = "<%= rs.getString("p_code")%>" name = "p_code">
					</td>
				</tr>
	<%	
			}
		}catch(SQLException e){
			out.println("SQLException"+e.getMessage());
		}finally{
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();	
		}
	%>
	</table>
		<p><input type = "button" class = "small_button blue" value = "뒤로" onclick = "history.back()">
	</form>
	</main>
    	<footer><%@ include file = "../conf/footer2.jsp" %></footer>
	</div>
</body>
</html>