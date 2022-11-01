<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<%@ include file = "../conf/admin.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EEO(티타임): 회원 목록 보기</title>
<link rel = "stylesheet" href = "../css/index.css">
<link rel = "stylesheet" href = "../css/list.css">
<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
</head>
<body>
	<div class = "wrap">
		<header><%@ include file = "../conf/header2.jsp" %></header>

		<main>
	<%
		request.setCharacterEncoding("utf-8");
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql = "select m_id, m_name , m_birth,m_zipcode,m_addr1,m_addr2,m_email,m_tel,m_createdate from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
	%>	
			<h2>회원 목록</h2>
			<table>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>우편번호</th>
					<th>주소</th>
					<th>이메일</th>
					<th>연락처</th>
					<th>가입일</th>
				</tr>
	<% 		while(rs.next()){ %>			
				<tr>
					<td><%= rs.getString("m_id")%></td>
					<td><%= rs.getString("m_name")%></td>
					<td><%= rs.getString("m_birth")%></td>
					<td><%= rs.getString("m_zipcode")%></td>
					<td><%= rs.getString("m_addr1")%> <%=rs.getString("m_addr2")%></td>
					<td><%= rs.getString("m_email")%></td>
					<td><%= rs.getString("m_tel")%></td>
					<td><%= rs.getString("m_createdate")%></td>
				</tr>			
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
			</table>
			</main>
	   
    <footer>
    	<%@ include file = "../conf/footer1.jsp" %>
    </footer>
    
    </div>
    
</body>
</html>