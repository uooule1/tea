<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EEO(티타임): 상품정보 수정</title>
<link rel = "stylesheet" href = "../css/index.css">
<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
<script  src = "../js/product.js"></script>
</head>
<body>
	<div class = "wrap">
		<header><%@ include file = "../conf/header2.jsp" %></header>
		
		<main>
		<h2>상품정보</h2>
		<%
		request.setCharacterEncoding("utf-8");
		
		String p_code = request.getParameter("p_code");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql = "SELECT * FROM product where p_code = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,p_code);
			rs = pstmt.executeQuery();
				if(rs.next()){
		%>
			
				<form name = "product" action ="editProduct_ok.jsp" method = "post" enctype = "multipart/form-data">
				<input type = "hidden" name = "p_code" value = "<%= rs.getString("p_code") %>">
				<input type = "hidden" name = "image" value = "<%=rs.getString("p_image")%>">
				
				
				<div class = "flexbox">
					<div class = "wrapitem">
						<img src = "../upload/<%=rs.getString("p_image")%>" width = "400px">
						<p> 상품 이미지 수정: <input type = "file" name = "p_image" class = "large"></p>
						<p><input type = "button" value= "수정" onclick = "editProduct()" class = "small_button blue">
						<input type = "button" value= "취소" onclick = "history.back()" class = "small_button yellow">
					</div>
					<div class = "wrapitem">
						<table>
							<tr>
								<td>상품명 : </td>
								<td><input type = "text" name = "p_name" value = "<%=rs.getString("p_name")%>"></td>
							</tr>
							<tr>
								<td>제품 상세 설명 : </td>
								<td><textarea name = "p_info" cols = "50" rows = "2" ><%=rs.getString("p_info")%></textarea></td>
							</tr>
							<tr>
								<td>상품 코드 :  </td>
								<td><%= rs.getString("p_code") %></td>
							</tr>
							<tr>
								<td>상품등록일 :  </td>
								<td><%= rs.getString("p_createdate")%></td>
							</tr>
							<tr>
								<td>상품수정일 :  </td>
								<td><%= rs.getString("p_editdate")%></td>
							</tr>
							<tr>
								<td>재고수 :  </td>
								<td><input type = "text" name = "p_stock" value = "<%= rs.getInt("p_stock")%>">개</td>
							</tr>
							<tr>
								<td>카테고리 :  </td>
								<td><input type = "text" name = "p_category" value = "<%= rs.getString("p_category")%>" ></td>
							</tr>
							<tr>
								<td>브랜드 :  </td>
								<td><input type = "text" name = "p_brand" value = "<%= rs.getString("p_brand")%>" ></td>
							</tr>
							<tr>
								<td>별점 :  </td>
								<td><%= rs.getInt("p_star")%></td>
							</tr>
							<tr>
								<td>상품상태 :	 </td>
								<td>
									판매가능<input type = "radio" name = "p_state" value = "판매가능" <%if(rs.getString("p_state").equals("판매가능")){%> checked <%}%>>
									품절<input type = "radio" name = "p_state" value = "품절" <%if(rs.getString("p_state").equals("품절")){%> checked <%}%>>
									할인<input type = "radio" name = "p_state" value = "할인" <%if(rs.getString("p_state").equals("할인")){%> checked <%}%>>
								</td>
							</tr>
							<tr>
								<td>할인율 :  </td>
								<td><input type = "text" name = "p_rate" value = "<%= rs.getString("p_rate")%>" ></td>
							</tr>
							<tr>
								<td>상품가격:  </td>
								<td><input type = "text" name = "p_price" value = "<%=rs.getInt("p_price") %>" >원</td>
							</tr>
						</table>
					</div>
				</div>
				
				</form>
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
		</main>
		
    	<footer><%@ include file = "../conf/footer2.jsp" %></footer>
    </div>
</body>
</html>