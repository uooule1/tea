<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<%@ include file = "../conf/session.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EEO(티타임): </title>
<link rel = "stylesheet" href = "../css/index.css">
<link rel = "stylesheet" href = "../css/list.css">
</head>
<body>
		<div class = "wrap">
		<header><%@ include file = "../conf/header2.jsp" %></header>
		
		<main>
		<h2>작성한 상품 후기</h2>
		<table>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>상품명</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String m_id = (String)session.getAttribute("m_id");
			
			
			try{
				String sql = "select b.b_num, b.b_date, b.b_title, b.b_readnum, p.p_name from board b join product p on b.p_code = p.p_code WHERE m_id = ? ORDER BY b_num desc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, m_id);
				rs = pstmt.executeQuery();
				
				int i = 1;
				
				while(rs.next()){
					int b_num = rs.getInt("b.b_num");
					String b_title = rs.getString("b.b_title");
					String b_date = rs.getString("b.b_date");
					int b_readnum = rs.getInt("b.b_readnum");					
					String p_name = rs.getString("p.p_name");
					if(b_title.length()>=10){
						b_title= b_title.substring(0,10) +"...";
					}
		%>
			<tr>
				<td><%=b_num%></td>
				<td><%=m_id%></td>
				<td><a href ="readnum.jsp?b_num=<%=b_num%>"><%=b_title%></a></td>
				<td><%=p_name%></td>
				<td><%=b_date%></td>
				<td><%=b_readnum%></td>
			</tr>
		<%			
				i++;//증감식
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
		</main>
		
    	<footer><%@ include file = "../conf/footer2.jsp" %></footer>
    </div>
</body>
</html>