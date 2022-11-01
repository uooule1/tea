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
<title>EEO(티타임): 공지사항 수정 처리</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String folder = "C:\\JSP\\tea\\src\\main\\webapp\\upload";
// 		String folder = "D:\\JSP\\tea\\src\\main\\webapp\\upload";
		int maxSize = 100*1024*1024;//최대 업로드 파일 크기
		String encType = "utf-8";//인코딩 유형
		MultipartRequest multi = new MultipartRequest(request, folder,maxSize,encType, new DefaultFileRenamePolicy());
		
		Enumeration<?> files = multi.getFileNames();
		
		String nfile1 = (String)files.nextElement();
		String n_image = multi.getFilesystemName(nfile1);		
		
		//없으면 원래 이미지 대체 
		String image = multi.getParameter("image");
		if(n_image==null){
			n_image = image;
		}
		
		String id = (String)session.getAttribute("m_id");//세션에서 가져온 아이디
		int n_num = Integer.parseInt(multi.getParameter("n_num"));
		String n_passwd = multi.getParameter("n_passwd");//현재비번
		String n_passwd2 = multi.getParameter("n_passwd2");//새로 변경할 비밀번호
		String n_title = multi.getParameter("n_title");
		String n_contents = multi.getParameter("n_contents");
		
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql1 = "SELECT n_passwd FROM notice WHERE n_num = ?";
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, n_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				String dbpasswd = rs.getString("n_passwd");
				
					if(n_passwd.equals(dbpasswd)){
						String sql2 = "UPDATE notice SET n_passwd =?, n_title= ?, n_contents=?, n_image=? WHERE n_num = ?";
						pstmt = conn.prepareStatement(sql2);
						pstmt.setString(1,n_passwd2);
						pstmt.setString(2,n_title);
						pstmt.setString(3,n_contents);
						pstmt.setString(4,n_image);
						pstmt.setInt(5, n_num);
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