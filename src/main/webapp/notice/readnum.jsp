<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조회수 증가</title>
</head>
<body>
	<%
		int n_num = Integer.parseInt(request.getParameter("n_num"));
		
		PreparedStatement pstmt= null;
		
		try{//조회수 증가
			String sql = "update notice set n_readnum = n_readnum+1 where n_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, n_num);
			pstmt.executeUpdate();
			
			response.sendRedirect("content.jsp?n_num="+n_num);
			
		}catch(SQLException e){
			out.println("SQLException: "+e.getMessage());
		}finally{
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	%>
</body>
</html>