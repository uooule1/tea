<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EEO(티타임): 장바구니 수정처리</title>
</head>
<body>
	<%	
		request.setCharacterEncoding("utf-8");
	
		String []c_num = request.getParameterValues("c_num");
		String []c_quantity = request.getParameterValues("c_quantity");
			
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			for(int i = 0;i<c_num.length;i++){
				String sqlUpdate = "UPDATE cart SET c_quantity = "+c_quantity[i]+" where c_num = ?";				
				pstmt = conn.prepareStatement(sqlUpdate);
				pstmt.setString(1,c_num[i]);
				pstmt.executeUpdate();
			}			
			
	%>	<script>
			location.href = "../orders/write.jsp";
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