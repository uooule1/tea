<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<%@ include file = "../conf/admin.jsp" %> 
<%@ page import = "com.oreilly.servlet.*"%>
<%@ page import = "com.oreilly.servlet.multipart.*"%>

<%@ page import = "java.util.*" %>
<%@ page import = "java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EEO(티타임): 공지사항 작성 처리</title>
</head>
<body>
		<main>
		<%
		request.setCharacterEncoding("utf-8");
		
// 		String folder = "D:\\JSP\\tea\\src\\main\\webapp\\upload";
		String folder = "C:\\JSP\\tea\\src\\main\\webapp\\upload";
		int maxSize = 100*1024*1024;//최대 업로드 파일 크기
		String encType = "utf-8";//인코딩 유형
		MultipartRequest multi = new MultipartRequest(request, folder,maxSize,encType, new DefaultFileRenamePolicy());
		
		Enumeration<?> files = multi.getFileNames();
		
		String nfile1 = (String)files.nextElement();
		String n_image = multi.getFilesystemName(nfile1);		
		
		String n_passwd = multi.getParameter("n_passwd");
		String n_title =  multi.getParameter("n_title");
		String n_contents =  multi.getParameter("n_contents");
		
		PreparedStatement pstmt = null;
		
		try{
			String sql = "INSERT INTO notice(n_passwd,n_title,n_contents,n_image,n_readnum,n_createdate) ";
			sql = sql +"values(?,?,?,?,0,sysdate())";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,n_passwd);
			pstmt.setString(2,n_title);
			pstmt.setString(3,n_contents);
			pstmt.setString(4,n_image);
			
			pstmt.executeUpdate();
	%>
		<script>
			alert("글이 정상적으로 등록 되었습니다.");
			location.href = "../noticelist.do";
		</script>		

	<%		
		}catch(SQLException e){
			out.println("SQLException: "+e.getMessage());
		}finally{
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}
	%>
		</main>
</body>
</html>