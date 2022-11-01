<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ include file = "../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 목록</title>
<link rel = "stylesheet" href = "../css/index.css">
<link rel = "stylesheet" href = "../css/list.css">
</head>
<body>
		<div class = "wrap">
		<header><%@ include file = "../conf/header2.jsp" %></header>
		
		<main>
		<h2>주문 내역</h2>
		<form name = "order" action = "update.jsp" method = "post">
		<table>
			<tr>
				<th></th>
				<th>상품목록</th>
				<th>주문자</th>
				<th>주문일</th>
				<th>주문상태</th>
				<th>주문취소</th>
			</tr>
		<%	
			String m_id = (String)session.getAttribute("m_id");
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try{
				String sql = "SELECT o_ordernum , o_name ,o_orderdate , o_cancelstate FROM orders WHERE m_id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,m_id);
				rs = pstmt.executeQuery();
				int i=0;
				while(rs.next()){
					String o_cancelstate = rs.getString("o_cancelstate");
					i++;
		%>
			<tr>
				<td><%=i %></td>
				<td>
					<a href = "complete.jsp?o_ordernum=<%=rs.getString("o_ordernum") %>">주문내역보기</a>
				</td>
				<td>
					<%=rs.getString("o_name") %>
				</td>
				<td>
					<%=rs.getString("o_orderdate") %>
				</td>
				<td>
				<%
					if(o_cancelstate.equals("1")){
						out.println("주문완료");	
					}else{
						out.println("주문취소");
					}
				 %>	
				</td>
				<td><a href = "cancel.jsp?o_ordernum=<%=rs.getString("o_ordernum") %>">주문취소</a></td>
			</tr>
		<%			
				
				}
		%>
				</table>
		<%		
		
			}catch(SQLException e){
				out.println("SQLException: "+e.getMessage());
			}finally{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
		%>
		</form>
		</main>
			
	    <footer><%@ include file = "../conf/footer2.jsp" %></footer>
    </div>
</body>
</html>