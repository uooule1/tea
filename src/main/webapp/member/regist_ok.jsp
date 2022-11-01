<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %><%--..은 상위폴더 . 현재폴더 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EEO(티타임): 회원가입처리</title>
<script type="text/javascript" src = "../js/regist.js"></script>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String m_id = request.getParameter("m_id");
		String m_passwd = request.getParameter("m_passwd");
		String m_passwd1 = request.getParameter("m_passwd1");
		String m_name = request.getParameter("m_name");
		String m_birth = request.getParameter("m_year")+"-"+request.getParameter("m_month")+"-"+request.getParameter("m_day");
		String m_zipcode = request.getParameter("zipNo");
		String m_addr1 = request.getParameter("roadAddrPart1");
		String m_addr2 = request.getParameter("addrDetail");
		String  m_email = request.getParameter("m_email");
		String m_tel = request.getParameter("m_tel1")+"-"+request.getParameter("m_tel2")+"-"+request.getParameter("m_tel3");
		String m_ip = request.getRemoteAddr();
		PreparedStatement pstmt = null;
		
		try{
			String sql = "insert into member(m_id,m_passwd,m_name,m_birth,m_zipcode,m_addr1,m_addr2,m_email,m_tel,m_createdate) values(?,?,?,?,?,?,?,?,?,sysdate())";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,m_id);
			pstmt.setString(2,m_passwd);
			pstmt.setString(3,m_name);
			pstmt.setString(4,m_birth);
			pstmt.setString(5,m_zipcode);
			pstmt.setString(6,m_addr1);
			pstmt.setString(7,m_addr2);
			pstmt.setString(8,m_email);
			pstmt.setString(9,m_tel);
			pstmt.executeUpdate();
			
			response.sendRedirect("../index.jsp");
		}catch(SQLException e){
			out.println("SQLException"+e.getMessage());
		}finally{
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	%>
</body>
</html>