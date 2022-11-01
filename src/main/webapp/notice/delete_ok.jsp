<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<%@ include file = "../conf/session.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EEO(티타임): 공지사항 삭제 처리</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		int n_num = Integer.parseInt(request.getParameter("n_num"));
		String n_passwd = request.getParameter("n_passwd");//입력받은비번
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql1 = "select n_passwd from notice where n_num = ?";
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, n_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				String dbpasswd = rs.getString("n_passwd");
				
				if(n_passwd.equals(dbpasswd)){
					String sql2 = "delete from notice where n_num = ?";
					pstmt = conn.prepareStatement(sql2);
					pstmt.setInt(1, n_num);
					pstmt.executeUpdate();
	%>	
				<script>
					alert("게시물을 성공적으로 삭제했습니다.");
					location.href = "list.jsp";
				</script>
	<%			
				}else{
	%>			
				
				<script>
					alert("비밀번호를 확인하고 다시 입력해주세요");
					history.back();
				</script>
	
	<%			
				}
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