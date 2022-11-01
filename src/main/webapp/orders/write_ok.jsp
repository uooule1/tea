<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문서 처리</title>
</head>
<body>
<%
		request.setCharacterEncoding("utf-8");
	
		String o_name = request.getParameter("o_name");
		String o_email = request.getParameter("o_email");
		String o_tel = request.getParameter("o_user_phone1")+request.getParameter("o_user_phone2");
		String o_recivername = request.getParameter("o_recivername");
		String o_recivertel = request.getParameter("o_reciever_phone1")+request.getParameter("o_reciever_phone2");
		String o_zipcode = request.getParameter("zipNo");
		String o_addr1 = request.getParameter("roadAddrPart1");
		String o_addr2 = request.getParameter("addrDetail");
		String o_option = request.getParameter("o_option");
		String o_bank = request.getParameter("o_bank");
		String o_accountname = request.getParameter("o_accountname");
		String m_id = (String)session.getAttribute("m_id");
		
		PreparedStatement pstmt = null;
		
		try{
			String sql = "insert into orders(o_name,o_email,o_tel,o_recivername,o_recivertel,o_zipcode,o_addr1,o_addr2,o_option,o_bank,o_accountname,o_orderdate,o_cancelstate,m_id) ";
			sql = sql+" values(?,?,?,?,?,?,?,?,?,?,?,sysdate(),1,?)";
			//정상주문이면 1 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,o_name);
			pstmt.setString(2,o_email);
			pstmt.setString(3,o_tel);
			pstmt.setString(4,o_recivername);
			pstmt.setString(5,o_recivertel);
			pstmt.setString(6,o_zipcode);
			pstmt.setString(7,o_addr1);
			pstmt.setString(8,o_addr2);
			pstmt.setString(9,o_option);
			pstmt.setString(10,o_bank);
			pstmt.setString(11,o_accountname);
			pstmt.setString(12,m_id);
			
			pstmt.executeUpdate();
			
			response.sendRedirect("../orderitem/orderitem.jsp");
		}catch(SQLException e){
			out.println("SQLException"+e.getMessage());
		}finally{
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	%>
</body>
</html>