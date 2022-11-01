<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 검색 목록</title>
<link rel = "stylesheet" href = "../css/index.css">
<link rel = "stylesheet" href = "../css/list.css">
<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
</head>
<body>
	<div class = "wrap">
	<header><%@ include file = "../conf/header2.jsp" %></header>
		
		<main>
		<h2>공지사항</h2>
		<%
		request.setCharacterEncoding("utf-8");
		String method = request.getParameter("method");
		String keyword = "%"+request.getParameter("keyword")+"%";
 		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			String sql = "select n_num, n_title, n_createdate, n_readnum from notice ";
			sql = sql+"where "+method+" like ? order by n_num desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			rs = pstmt.executeQuery();
			int i = 1;
			
		%>
				<table>
					<tr>
						<th>번호</th>
						<th>작성자</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
					<%
					while(rs.next()){
						int n_num = rs.getInt("n_num");
						String n_title = rs.getString("n_title");
						String n_createdate = rs.getString("n_createdate");
						int n_readnum = rs.getInt("n_readnum");
												
						%>
						<tr>
							<td><%=i%></td>
							<td>관리자</td>
							<td><a href ="readnum.jsp?n_num=<%=n_num%>"><%=n_title%></a></td>
							<td><%=n_createdate%></td>
							<td><%=n_readnum%></td>
						</tr>
						<%
						i++;
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
		<p><input type = "button" value = "목록" onclick = "location.href='list.jsp'" class ="small_button blue">
		
		</main>
	<footer><%@ include file = "../conf/footer2.jsp" %></footer>
	</div>
</body>
</html>