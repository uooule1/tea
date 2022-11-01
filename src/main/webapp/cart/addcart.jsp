<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<%@ include file = "../conf/session.jsp" %>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "javax.servlet.http.HttpServletRequest" import = "javax.servlet.http.HttpServletResponse"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
	
		int c_quantity = Integer.parseInt(request.getParameter("c_quantity"));//입력한 수량
		String p_code = request.getParameter("p_code");//장바구니에 추가하는 상품 코드
		String m_id = (String)session.getAttribute("m_id");//세션에서 아이디 가져오기

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql = "SELECT p_code FROM cart where m_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			
			String sql2 = "INSERT INTO cart(c_quantity, m_id, p_code) VALUES(?,?,?)";
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1,c_quantity);
			pstmt.setString(2,m_id);
			pstmt.setString(3,p_code);
			pstmt.executeUpdate();
			

			response.sendRedirect("cart.jsp");
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	%>
	
	

</body>
</html>



