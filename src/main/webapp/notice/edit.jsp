<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<%@ include file = "../conf/session.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EEO(티타임): 공지사항 수정</title>
<link rel = "stylesheet" href = "../css/index.css">
<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
<script type="text/javascript" src = "../js/notice.js"></script>
</head>
<body>
	<div class = "wrap">
		<header><%@ include file = "../conf/header2.jsp" %></header>
		
		<main>
		<%
			request.setCharacterEncoding("utf-8");
			
			int n_num = Integer.parseInt(request.getParameter("n_num"));

			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
		try{
			String sql = "select n_title,n_contents,n_image from notice where n_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,n_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				String n_title = rs.getString("n_title");
				String n_contents = rs.getString("n_contents");
				String n_image = rs.getString("n_image");
				
		%>
		
		<h2>공지사항 게시판 수정</h2>
		공지사항 게시물을 수정하기 위해 반드시 비밀번호를 입력하세요.<p>
		<form name = "notice" method = "post" action = "edit_ok.jsp" enctype = "multipart/form-data">
			<input type = "hidden" value = "<%=n_num%>" name = "n_num" >
			<input type = "hidden" name = "image" value = "<%=n_image%>">
			<table>
				<tr>
					<td>아이디</td>
					<td>admin1</td>
				</tr>
				<tr>
					<td>현재비밀번호</td>
					<td><input type = "password" name = "n_passwd" class = "large box"></td>
				</tr>
				<tr>
					<td>변경할비밀번호</td>
					<td><input type = "password" name = "n_passwd2" class = "large box"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type = "text" name = "n_title" value = "<%=n_title%>" class = "large box"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea rows ="5" cols = "50" name = "n_contents" class = "text_contents"><%=n_contents%></textarea></td>
				</tr>
				<tr>
					<td>이미지 등록</td>
					<td><input type = "file" name = "n_image"></td>
				</tr>
				<tr>
					<td colspan = "2">
						<input type = "button" value = "수정" onclick = "checkedit()" class = "small_button blue">
						<input type = "button" value = "취소" onclick = "history.back()" class = "small_button yellow">
					</td>
				</tr>
			</table>
		</form>
		<%		}
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