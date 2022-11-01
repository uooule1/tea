<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 내용</title>
<link rel = "stylesheet" href = "../css/index.css">
<link rel = "stylesheet" href = "../css/input.css">
<link rel = "stylesheet" href = "../css/contents.css">
<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
</head>
<body>	
	<div class = "wrap">
		<header><%@ include file = "../conf/header2.jsp" %></header>
		
		<main>
		<h2>게시글</h2>
	<%
		request.setCharacterEncoding("utf-8");
		
		int n_num = Integer.parseInt(request.getParameter("n_num"));//포장클래스임 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql = "select n_title,n_contents,n_image, n_readnum, n_createdate from notice where n_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,n_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				
				String n_title = rs.getString("n_title");
				String n_contents = rs.getString("n_contents");
				String n_image = rs.getString("n_image");
				String n_createdate = rs.getString("n_createdate");
				int n_readnum = rs.getInt("n_readnum");

	%>		
			<table>
				<tr>
					<td>번호</td>
					<td><%=n_num%></td>
					<td>작성일</td>
					<td><%=n_createdate%></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>관리자</td>
					<td>조회</td>
					<td><%=n_readnum%></td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan = "3"><%=n_title%></td>
				</tr>
				<tr>
					<td colspan = "4" style = "white-space:pre-Line; background:white;" class = "maxlarge text_contents"><img src = "../upload/<%=rs.getString("n_image")%>" width = "600px"><%=n_contents%></td>
				</tr>
			
	<%		
			}
	%>
			</table>
	<%		
			//관리자로 로그인했다면 글 작성 버튼 보이게 하기 
			if(id.equals("admin1")){
	%>		
			<p>
			<input type = "button" value = "수정" onclick = "location.href = 'edit.jsp?n_num=<%=n_num%>'" class = "small_button blue">
			<input type = "button" value = "삭제" onclick = "location.href = 'delete.jsp?n_num=<%=n_num%>'" class = "small_button red">
			<input type = "button" value = "목록" onclick = "location.href = 'list.jsp'" class = "small_button yellow">
					
	<%		}else{
	%>		
			<p><input type = "button" value = "목록" onclick = "location.href = 'list.jsp'" class = "small_button yellow">
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