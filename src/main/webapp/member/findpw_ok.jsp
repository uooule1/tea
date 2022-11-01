<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EEO(티타임): 비밀번호 찾기</title>
<link rel = "stylesheet" href = "../css/index.css">
<link rel = "stylesheet" href = "../css/login.css">
</head>
<body>
<div class = "wrapper">
	<div class = "new">
	<%
		request.setCharacterEncoding("utf-8");
	
		String m_id = request.getParameter("m_id");//입력한 id
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql = "select m_passwd ,m_id from member where m_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				String id = rs.getString("m_id");//저장된 id
				String m_passwd = rs.getString("m_passwd");
				String star = "";
				for(int i=0;i<m_passwd.length()-3;i++){
					star = star +"*";
				}
				if(m_id.equals(id)){	
					out.println(m_id+"의 비밀번호는 "+m_passwd.substring(0,3)+star+" 입니다.");
	%>
				<p><input type = "button" value = "닫기" onclick = "window.close()" class = "small_button blue">
	<%
				}
			}else{
	%>
					<script>
						alert("존재하지 않는 id 입니다. id를 확인해 주세요.");
						history.back();
					</script>
	<%
			}
		}catch(SQLException e){
			out.println("SQLException"+e.getMessage());
		}finally{
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}
	%>
	</div>
	</div>
</body>
</html>