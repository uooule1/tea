<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EEO(티타임): 상품 삭제 처리</title>
<link rel = "stylesheet" href = "../css/index.css">
<link rel = "stylesheet" href = "../css/product.css">
<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
</head>
<body>
	<%	
		request.setCharacterEncoding("utf-8");
		String p_code = request.getParameter("p_code");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql = "DELETE FROM product where p_code = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,p_code);
			pstmt.executeUpdate();
	%>	<script>
			alert("상품이 정상적으로 삭제되었습니다.");
			document.location.href = "ProductList.jsp";
		</script>
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