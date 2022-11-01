<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EEO(티타임): 아이디 중복조회 처리</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String m_id = request.getParameter("m_id");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql = "select m_id from member where m_id =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,m_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				String id = rs.getString("m_id");
				
				if(m_id.equals(id)){
	%>
				<script>
					alert("이미가입된 아이디입니다.다시 입력해주세요.");
					history.back();
				</script>
	<%
				}
			}
			else{
	%>
				<script>
					alert("가입할 수 있는 아이디입니다.");
					location.href = "idcheck.jsp?m_id=<%=m_id%>";
				</script>
	<%			
		 		}
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