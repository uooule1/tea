<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문후 장바구니 비우기</title>
</head>
<body>
	
	<%	
			String m_id = (String)session.getAttribute("m_id");
			PreparedStatement pstmt = null, pstmt2=null;
			ResultSet rs=null;
			int o_ordernum = Integer.parseInt(request.getParameter("o_ordernum"));
			
			try{
				String sql = "SELECT i.p_code FROM orderitem i join orders o on o.o_ordernum = i.o_ordernum WHERE m_id=? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,m_id);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					String p_code =  rs.getString("i.p_code");
					String sql2 = "DELETE FROM cart WHERE m_id = ? and p_code= ?";
					pstmt2 = conn.prepareStatement(sql2);
					pstmt2.setString(1,m_id);
					pstmt2.setString(2,p_code);
					pstmt2.executeUpdate();
					
				}
				%>
				<script>
					location.href="../orders/complete.jsp?o_ordernum=<%=o_ordernum%>";
				</script>
				<%
// 				response.sendRedirect("../orders/complete.jsp");
		
			}catch(SQLException e){
				out.println("SQLException: "+e.getMessage());
			}finally{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
		%>
</body>
</html>