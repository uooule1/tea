<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EEO(티타임): 아이디찾기</title>
<link rel = "stylesheet" href = "../css/index.css">
<link rel = "stylesheet" href = "../css/login.css">
</head>
<body>

<div class = "wrapper">
	<div class = "new">
	<%
		request.setCharacterEncoding("utf-8");
	
		String m_name = request.getParameter("m_name");//입력한 이름
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql = "select m_id, m_name from member where m_name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_name);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				String m_id =rs.getString("m_id");
				String name =rs.getString("m_name");
				String star = "";
				for(int i=0;i<m_id.length()-3;i++){
					star = star +"*";
				}
				if(m_name.equals(name)){
				out.println(m_name+"의 아이디는 "+m_id.substring(0,3)+star+" 입니다.");
	%>
				<p><input type = "button" value = "닫기" onclick = "window.close()"  class = "small_button blue">
	<%
				}
			}else{
	%>
					<script>
						alert("존재하지 않는 이름 입니다. 이름을 확인해 주세요.");
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