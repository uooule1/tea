<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<%@ include file = "../conf/session.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 내용 수정</title>
<script type="text/javascript" src = "../js/board.js"></script>
<link rel = "stylesheet" href = "../css/index.css">
<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
</head>
<body>
<div class = "wrap">
	
	<header><%@ include file = "../conf/header2.jsp" %></header>
	
	<main>
	<%
		request.setCharacterEncoding("utf-8");
		
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
	try{
		String sql = "select * from board where b_num = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,b_num);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			String m_id = rs.getString("m_id");
			String b_title = rs.getString("b_title");
			String b_contents = rs.getString("b_contents");
			int b_star = rs.getInt("b_star");
	%>
	<h3>회원 게시판</h3>
	게시판 수정을 위해 반드시 비밀번호를 입력하세요.
	<form name = "board" method = "post" action = "edit_ok.jsp" enctype = "multipart/form-data">
		<input type = "hidden" value = "<%=b_num%>" name = "b_num">
		<table>
			<tr>
				<td>아이디</td>
				<td><%=m_id%></td>
			</tr>
			<tr>
				<td>현재비밀번호</td>
				<td><input type = "password" name = "b_password"></td>
			</tr>
			<tr>
				<td>변경할비밀번호</td>
				<td><input type = "password" name = "b_password2"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type = "text" name = "b_title" value = "<%=b_title%>"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows ="5" cols = "50" name = "b_contents" ><%=b_contents%></textarea></td>
			</tr>
			<tr>
				<td>별점</td>
				<td>
					<select name = "b_star" >
						<option value= "5" <% if(b_star==5){%>	selected <% } %>>★★★★★</option>
						<option value= "4" <% if(b_star==4){%>	selected <% } %>>★★★★</option>
						<option value= "3" <% if(b_star==3){%>	selected <% } %>>★★★</option>
						<option value= "2" <% if(b_star==2){%>	selected <% } %>>★★</option>
						<option value= "1" <% if(b_star==1){%>	selected <% } %>>★</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>사진</td>
				<td><input type = "file" name = "b_image" ></td>
			</tr>
			<tr>
				<td colspan = "2">
					<input type = "button" value = "수정" onclick = "checkedit()" class = "small_button blue">
					<input type = "button" value = "작성취소" onclick = "history.back()" class = "small_button yellow">
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