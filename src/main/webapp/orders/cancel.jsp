<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 취소 </title>
</head>
<body>
	<%	
		request.setCharacterEncoding("utf-8");
	
		String []o_itemnum = request.getParameterValues("o_itemnum");
		String []o_cancelstate = request.getParameterValues("o_cancelstate");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			for(int i = 0;i<o_itemnum.length;i++){
				
				String sqlUpdate = "UPDATE cart SET o_cancelstate = 0 where o_itemnum = ?";				
				pstmt = conn.prepareStatement(sqlUpdate);
				pstmt.setString(1,o_itemnum[i]);
				pstmt.executeUpdate();
			}			
			
	%>	<script>
			location.href = "list.jsp";
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