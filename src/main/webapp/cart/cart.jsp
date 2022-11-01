<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
<link rel = "stylesheet" href = "../css/index.css">
<link rel = "stylesheet" href = "../css/list.css">
<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
<script src = "../js/cart.js"></script>
</head>
<body>
		<div class = "wrap">
		<header><%@ include file = "../conf/header2.jsp" %></header>
		
		<main>
		<h2>장바구니</h2>
		<form name = "cart" action = "update.jsp" method = "post">
		<table>
			<tr>
				<th>선택</th>
				<th></th>
				<th>상품명</th>
				<th>단가</th>
				<th>수량</th>
				<th>금액</th>
			</tr>
		<%	
			String m_id = (String)session.getAttribute("m_id");
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try{
				String sql = "SELECT p.p_image, p.p_name, c.c_quantity, p.p_price, p.p_code, c.c_num FROM product p join cart c WHERE p.p_code = c.p_code and m_id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,m_id);
				rs = pstmt.executeQuery();
				

				int i=0,sum=0,amount=0;
				
				while(rs.next()){
					i++;
					int price = rs.getInt("p.p_price");
					int qty = rs.getInt("c.c_quantity");
					amount = price*qty;
					sum+=amount;
		%>
					<tr>
						<td><input type = "checkbox" value = "<%=rs.getString("c.c_num")%>" name = "c_num"></td>
						<td>
							<a href = "../product/Product.jsp?p_code=<%=rs.getString("p.p_code")%>">
								<img src = "../upload/<%=rs.getString("p.p_image") %>" width = "100px">
							</a>
						</td>
						<td><%=rs.getString("p.p_name")%></td>
						<td><%=rs.getInt("p.p_price")%>
							<input type = "hidden" value = "<%=price%>" id = "p_price<%=i%>" name = "p_price">
						</td>
						<td>
							<input type = "button" onclick = "substract(<%=i%>)" value ="-" >
							<input type = "text" value = "<%=qty%>" id = "c_quantity<%=i%>" name = "c_quantity" class = "small">
							<input type = "button" onclick = "plus(<%=i%>)" value ="+">
						</td>
						<td><%=amount%></td>
					</tr>
		<%			
				
				}
		%>
				</table>
				<p>
				<h2>총 금액:  <%=sum %> 원</h2>
				<input type = "button" value = "선택 주문" class = "medium_button blue" onclick = "orderCheck()">
				<input type = "button" value = "선택 삭제" class = "medium_button red" onclick = "delCheck()">
		<%		
		
			}catch(SQLException e){
				out.println("SQLException: "+e.getMessage());
			}finally{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
		%>
		</form>
		</main>
			
	    <footer><%@ include file = "../conf/footer2.jsp" %></footer>
    </div>


</body>
</html>