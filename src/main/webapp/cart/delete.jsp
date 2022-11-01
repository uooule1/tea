<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EEO(티타임): 장바구니 삭제 처리</title>
<link rel = "stylesheet" href = "../css/index.css">
<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
</head>
<body>
	<div class = "wrap">
	
	<header><%@ include file = "../conf/header2.jsp" %></header>
	
	<main>
	<%	
		request.setCharacterEncoding("utf-8");
	
		String []c_num = request.getParameterValues("c_num");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			for(int i = 0;i<c_num.length;i++){
				String sql = "DELETE FROM cart where c_num = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,c_num[i]);
				pstmt.executeUpdate();
			}			
			
	%>	<script>
			alert("상품이 정상적으로 장바구니에서 삭제되었습니다.");
			location.href = "cart.jsp";
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
	</main>
		
    <footer><%@ include file = "../conf/footer2.jsp" %></footer>
    
    </div>
</body>
</html>