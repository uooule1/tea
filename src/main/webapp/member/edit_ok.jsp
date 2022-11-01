<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EEO(티타임): 회원정보 수정 처리</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		String m_id = (String)session.getAttribute("m_id");
		
		String m_passwd = request.getParameter("m_passwd");
		String m_birth = request.getParameter("m_year")+"-"+request.getParameter("m_month")+"-"+request.getParameter("m_day");
		String m_zipcode = request.getParameter("zipNo");
		String m_addr1 = request.getParameter("roadAddrPart1");
		String m_addr2 = request.getParameter("addrDetail");
		String m_email = request.getParameter("m_email");
		String m_tel = request.getParameter("m_tel1")+"-"+request.getParameter("m_tel2")+"-"+request.getParameter("m_tel3");
		
		PreparedStatement pstmt= null;
		ResultSet rs = null;
	
		try{
			String sql1 = "select m_passwd from member where m_id = ?";
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				String passwd = rs.getString("m_passwd");
				if(m_passwd.equals(passwd)){
					
						String sql2 = "update member set m_birth=?,m_zipcode=?,m_addr1=?,m_addr2=?,m_email=?,m_tel=? where m_id =?";
						pstmt = conn.prepareStatement(sql2);
						pstmt.setString(1,m_birth);
						pstmt.setString(2,m_zipcode);
						pstmt.setString(3,m_addr1);
						pstmt.setString(4,m_addr2);
						pstmt.setString(5,m_email);
						pstmt.setString(6,m_tel);
						pstmt.setString(7,m_id);
						pstmt.executeUpdate();
					
	%>
					<script>
						alert("회원정보 수정이 정상적으로 처리되었습니다.");
						location.href = "../index.jsp";
					</script>
	<% 
				}else{
	%>				
					<script>
						alert("비밀번호가 틀립니다. 다시 확인해 주세요.");
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