<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<%@ include file = "../conf/session.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 검색 목록</title>
</head>
<body>
	<h3>회원전용 게시판 글 목록</h3>
	<table>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
	<%
		request.setCharacterEncoding("utf-8");
		String method = "b_"+request.getParameter("method");
		String keyword = "%"+request.getParameter("keyword")+"%";
 		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql = "select b_num, b_id, b_title, b_date, b_readnum from board ";
			sql = sql+"where "+method+" like ? order by b_num desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);//여기 주의 해야함. sql과 다르게 ''안들어감
			rs = pstmt.executeQuery();
			
			int i = 1;
			
			while(rs.next()){
				int b_num = rs.getInt("b_num");
				String b_id = rs.getString("b_id");
				String b_title = rs.getString("b_title");
				String b_date = rs.getString("b_date");
				int b_readnum = rs.getInt("b_readnum");
				
				if(b_title.length()>=5){
					b_title= b_title.substring(0,5) +"...";
				}
	%>
				<tr>
					<td><%=i%></td>
					<td><%=b_id%></td>
					<td><a href ="readnum.jsp?b_num=<%=b_num%>"><%=b_title%></a></td>
					<td><%=b_date%></td>
					<td><%=b_readnum%></td>
				</tr>
	<%			
			i++;
			}
	%>
			</table>
			
			<p><input type = "button" onclick = "location.href='write.jsp'" value = "글 작성">
			<input type = "button" onclick = "location.href='list.jsp'" value = "글 전체목록">
	<%		
		}catch(SQLException e){
			out.println("SQLException: "+e.getMessage());
		}finally{
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	%>
</body>
</html>