<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EEO(티타임): 회원 탈퇴 처리</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String m_id = (String)session.getAttribute("m_id");
		String m_passwd = request.getParameter("m_passwd");//입력한 비번 
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql1 = "select m_passwd from member where m_id = ?";
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				String passwd = rs.getString("m_passwd");
				if(m_passwd.equals(passwd)){

					String sql2 = "delete from member where m_id = ?";
					pstmt = conn.prepareStatement(sql2);
					pstmt.setString(1, m_id);
					pstmt.executeUpdate();				
	%>
					<script>
						alert("회원탈퇴가 처리 되었습니다.");
						document.location.href = "../login/logout.jsp";//세션이 삭제되면서 로그인창으로감
					</script>
	<% 
				}else{
					//다르면
	%>				
					<script>
						alert("비밀번호를 확인해 주세요");
						history.back();
					</script>
	<%
				}
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