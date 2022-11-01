<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 내용</title>
<link rel = "stylesheet" href = "../css/index.css">
<link rel = "stylesheet" href = "../css/contents.css">
<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
</head>
<body>	
<div class = "wrap">
	
	<header><%@ include file = "../conf/header2.jsp" %></header>
	
	<main>
	
		<h3>상품 후기</h3>
	<%
		request.setCharacterEncoding("utf-8");
		
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql = "select b_title,b_contents, m_id,b_date,b_image, b_readnum , b_star from board where b_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,b_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				
				String b_title = rs.getString("b_title");
				String b_contents = rs.getString("b_contents");
				String m_id = rs.getString("m_id");
				String b_date = rs.getString("b_date");
				String b_image = rs.getString("b_image");
				int b_readnum = rs.getInt("b_readnum");
				int b_star = rs.getInt("b_star");

	%>		
			<table>
				<tr>
					<td>번호</td>
					<td><%=b_num%></td>
					<td>작성일</td>
					<td><%=b_date%></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><%=m_id%></td>
					<td>조회수</td>
					<td><%=b_readnum%></td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan = "3"><%=b_title%></td>
				</tr>
				<tr>
					<td>후기 이미지</td>
					<td colspan = "3" ><img src = "../upload/<%=rs.getString("b_image")%>" width = "400px"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan = "3" style = "white-space:pre-Line"><%=b_contents%></td>
				</tr>
				<tr>
					<td>별점</td>
					<td><%=b_star%> 점</td>
				</tr>
			</table>
			<% if(id!=null){
			%>	<input type = "button" value = "뒤로" onclick = "history.back()" class = "small_button yellow">
			<%	}
			%>
			
			
			<%
	}
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