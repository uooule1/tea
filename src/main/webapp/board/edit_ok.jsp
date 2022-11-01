<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<%@ include file = "../conf/session.jsp" %>
<%@ page import = "com.oreilly.servlet.*"%>
<%@ page import = "com.oreilly.servlet.multipart.*"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정완료</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String folder = "C:\\JSP\\tea\\src\\main\\webapp\\upload";
	//		String folder = "D:\\JSP\\tea\\src\\main\\webapp\\upload";
		int maxSize = 100*1024*1024;//최대 업로드 파일 크기
		String encType = "utf-8";//인코딩 유형
		MultipartRequest multi = new MultipartRequest(request, folder,maxSize,encType, new DefaultFileRenamePolicy());
		
		Enumeration<?> files = multi.getFileNames();
		
		String bfile1 = (String)files.nextElement();
		String b_image = multi.getFilesystemName(bfile1);		
		
		//없으면 원래 이미지 대체 
		String image = multi.getParameter("b_image");
		if(b_image==null){
			b_image = image;
		}
		
		
		String id = (String)session.getAttribute("m_id");//세션에서 가져온 아이디
		int b_num = Integer.parseInt(multi.getParameter("b_num"));
		String b_password = multi.getParameter("b_password");//현재비번
		String b_password2 = multi.getParameter("b_password2");//새로 변경할 비밀번호
		String b_title = multi.getParameter("b_title");
		String b_contents = multi.getParameter("b_contents");
		String b_star = multi.getParameter("b_star");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		
		try{
			String sql1 = "select m_id, b_password from board where b_num = ?";
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, b_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				String dbpasswd = rs.getString("b_password");
				String dbid = rs.getString("m_id");
				
					if(id.equals(dbid)&& b_password.equals(dbpasswd)){
						String sql2 = "update board set b_title= ?, b_contents=?, b_password =? ,  b_image = ? ,b_star = ? where b_num = ?";
						pstmt = conn.prepareStatement(sql2);
						pstmt.setString(1,b_title);
						pstmt.setString(2,b_contents);
						pstmt.setString(3,b_password2);
						pstmt.setString(4,b_image);
						pstmt.setString(5,b_star);
						pstmt.setInt(6, b_num);
						pstmt.executeUpdate();
		%>	
					<script>
						alert("게시물을 성공적으로 수정했습니다.");
						location.href = "list.jsp";
					</script>
		<%			
					}else{
		%>			
					<script>
						alert("비밀번호를 확인하고 다시 입력해주세요");
						history.back();
					</script>
		<%
					}	
			}			
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