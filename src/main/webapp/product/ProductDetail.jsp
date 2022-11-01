<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EEO(티타임): 상품상세정보</title>
<link rel = "stylesheet" href = "../css/index.css">
<link rel = "stylesheet" href = "../css/list.css">
<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
<script src = "../js/product.js"></script>
</head>
<body>
	<div class = "wrap">
		<header><%@ include file = "../conf/header2.jsp" %></header>

		<main>
		
		<%
		request.setCharacterEncoding("utf-8");
		
		String p_code = request.getParameter("p_code");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql = "SELECT p_code,p_image,p_name,p_info,p_category,p_brand,p_state,p_price, p_star FROM product where p_code = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,p_code);
			rs = pstmt.executeQuery();
			
			//별점 표시 
			if(rs.next()){
				String p_star = String.valueOf(rs.getInt("p_star"));
				if(p_star.equals("0")){
					p_star = "";
					}
		%>	
		
		<form name ="product" action = "../cart/addcart.jsp" method = "post">
		<input type = "hidden" value = "<%= rs.getString("p_code")%>" name = "p_code">
		<div class = "flexbox">
			<div class = "wrapitem">
				<img src = "../upload/<%=rs.getString("p_image")%>" width = "400px">
			</div>
			<div class = "wrapitem">
				<table>
					<tr>
						<td>상품명 : </td>
						<td><%=rs.getString("p_name")%></td>
					</tr>
					<tr>
						<td>제품 상세 설명 : </td>
						<td><%=rs.getString("p_info")%></td>
					</tr>
					<tr>
						<td>별점 :  </td>
						<td><%=p_star%></td>
					</tr>		
					<tr>
						<td>카테고리 :  </td>
						<td><%= rs.getString("p_category")%></td>
					</tr>
					<tr>
						<td>브랜드 :  </td>
						<td><%= rs.getString("p_brand")%></td>
					</tr>
					<tr>
						<td>상품상태 :	 </td>
						<td><%=rs.getString("p_state")%></td>
					</tr>
					<tr>
						<td>상품가격:  </td>
						<td><%=rs.getInt("p_price")%>원</td>
					</tr>
					<tr>
						<td>구매 수량  </td>
						<td>
							<input type = "button" onclick = "substract()" value ="-">
							<input type = "text" name = "c_quantity" value = "1" size = "2">
							<input type = "button" onclick = "plus()" value ="+">
						</td>
					</tr>
					<tr>
						<td colspan = "2">
							<input type = "submit" value = "장바구니 담기" class = "large_button blue">
							<input type = "reset" value = "취소" onclick="history.back();" class = "small_button red">
						</td>
					</tr>
				</table>
			</div>
		</div>
	
		</form>
		
		<h3>해당상품 후기 </h3>
		<table>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		
		
		<%
				}
			
			String sql2 = "select b_num, m_id, b_title, b_date, b_readnum from board ";
			sql2 = sql2+"where p_code = ? order by b_num desc";
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, p_code);
			rs = pstmt.executeQuery();
			
			int i = 1;
			
			while(rs.next()){
				int b_num = rs.getInt("b_num");
				String m_id = rs.getString("m_id");
				String b_title = rs.getString("b_title");
				String b_date = rs.getString("b_date");
				int b_readnum = rs.getInt("b_readnum");
				
				if(b_title.length()>=10){
					b_title= b_title.substring(0,10) +"...";
				}
	%>
				<tr>
					<td><%=i%></td>
					<td><%=m_id%></td>
					<td><a href ="../board/readnum.jsp?b_num=<%=b_num%>"><%=b_title%></a></td>
					<td><%=b_date%></td>
					<td><%=b_readnum%></td>
				</tr>
	<%			
			i++;
			}
	%>
			</table>
	<%		
	
		}catch(SQLException e){
			out.println("SQLException"+e.getMessage());
		}finally{
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();	
		}
		%>
		</main>
		
    	<footer><%@ include file = "../conf/footer2.jsp" %></footer>
    	
    </div>
</body>
</html>