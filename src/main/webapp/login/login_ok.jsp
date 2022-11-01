<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EEO(티타임): 로그인 처리</title>
<link rel = "stylesheet" href = "../css/index.css">
</head>
<body>
	<%

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String m_id = request.getParameter("m_id");
		String m_passwd = request.getParameter("m_passwd");
		
		try{
			String sql = "select m_id, m_passwd from member where m_id = ? and m_passwd = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, m_passwd);
			rs = pstmt.executeQuery();
			if(rs.next()){
				String id = rs.getString("m_id");
				String passwd = rs.getString("m_passwd");
				
				if(m_id.equals(id) && m_passwd.equals(passwd)){
					session.setAttribute("m_id", m_id);
					out.println("로그인 성공");
					response.sendRedirect("../index.jsp");
				}else{
					out.println("로그인 실패");
					response.sendRedirect("../index.jsp");
				}
	
			}
			else{
	%>
				<script type="text/javascript">
					alert("아이디와 비밀 번호를 다시 확인해주세요.");
					history.back();
				</script>
	<%					
							}	
		}catch(SQLException e){
			out.println("SQLException:"+e.getMessage());
		}finally{
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	%>
</body>
</html>