<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EEO(티타임): 상품별점 수정</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	String p_code = request.getParameter("p_code");
	String m_id = (String)session.getAttribute("m_id");

	try{
		String sql = "SELECT avg(b_star) FROM board where p_code = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,p_code);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			double b_star = rs.getDouble("avg(b_star)");

			String sql1 = "UPDATE product set p_star = ? where p_code=?";
			pstmt = conn.prepareStatement(sql1);
			pstmt.setDouble(1,b_star);
			pstmt.setString(2,p_code);
			pstmt.executeUpdate();
			
			response.sendRedirect("../board/list.jsp");
		}
	}catch(SQLException e){
		out.println("SQLException"+e.getMessage());
	}finally{
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}
	%>
</body>
</html>