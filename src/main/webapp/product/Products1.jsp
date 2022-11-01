<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EEO(티타임): 최신 상품 3개 - index에 </title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql = "SELECT p_image,p_name,p_price,p_code FROM product order by p_code desc limit 3";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
	%>	
	
	<table>
	<tr>
		
	<% 		while(rs.next()){ %>
	<td>
		<ul>
			<li class = "items">
				<div class = "thumbnail">
					<a href = "product/ProductDetail.jsp?p_code=<%=rs.getString("p_code")%>">
						<img src = "upload/<%=rs.getString("p_image")%>" width = "400px">
					</a>
				</div>
				<div class = "description">
					<strong class = "name">
						<a href = "product/ProductDetail.jsp?p_code=<%=rs.getString("p_code")%>">
							<span>
								<span>상품명:</span>
								<span><%= rs.getString("p_name")%></span>
							</span>
						</a>
					</strong>
					<ul>
						<li>
							<strong>
								<span>판매가 :</span>
								<span><%= rs.getInt("p_price")%> 원</span>
							</strong>
							
						</li>
					</ul>
				</div>
			</li>		
		</ul>
	</td>
	<%
			}
	%>
	</tr>
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
</body>
</html>