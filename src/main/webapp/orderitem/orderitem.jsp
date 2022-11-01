<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매한 상품 목록 등록</title>
</head>
<body>
<%	
			String m_id = (String)session.getAttribute("m_id");
			PreparedStatement pstmt = null, pstmt2=null;
			ResultSet rs=null,rs2 = null;
			
			try{
				String sql = "SELECT o_ordernum FROM orders WHERE m_id=? ORDER BY o_ordernum desc limit 1";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,m_id);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					int o_ordernum =  rs.getInt("o_ordernum");
					sql = "SELECT c.c_quantity, p.p_code from  product p join cart c on p.p_code = c.p_code where m_id = ?";
					pstmt2 = conn.prepareStatement(sql);
					pstmt2.setString(1,m_id);
					rs2 = pstmt2.executeQuery();
					
					while(rs2.next()){
						int c_quantity = rs2.getInt("c.c_quantity");
						String p_code = rs2.getString("p.p_code");
						String sql2 = "insert into orderitem(o_quantity,o_ordernum,p_code) values(?,?,?)";
						pstmt2 = conn.prepareStatement(sql2);
						pstmt2.setInt(1,c_quantity);
						pstmt2.setInt(2,o_ordernum);
						pstmt2.setString(3,p_code);
						pstmt2.executeUpdate();
					
					}
					%>
					<script>
						location.href="../cart/cartclear.jsp?o_ordernum=<%=o_ordernum%>";
					</script>
					<%
				}	
		
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