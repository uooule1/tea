<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<%@ include file = "../conf/session.jsp" %>
<%@ page import = "com.oreilly.servlet.*"%>
<%@ page import = "com.oreilly.servlet.multipart.*"%>
<%@ page import = "java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EEO(티타임): 게시판 작성 처리 </title>
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
		String fname = (String)files.nextElement();
		String b_image = multi.getFilesystemName(fname);

		String m_id =(String)session.getAttribute("m_id");
		String b_title = multi.getParameter("b_title");
		String b_password = multi.getParameter("b_password");
		String b_contents = multi.getParameter("b_contents");
		double b_star = Double.parseDouble(multi.getParameter("b_star"));
		String p_code = multi.getParameter("p_code");
		PreparedStatement pstmt = null;
		
		try{
			String sql = "INSERT INTO board(m_id,b_password,b_date,b_title,b_contents,b_star,b_image,p_code,b_readnum) values(?,?,sysdate(),?,?,?,?,?,0)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,m_id);
			pstmt.setString(2,b_password);
			pstmt.setString(3,b_title);
			pstmt.setString(4,b_contents);
			pstmt.setDouble(5,b_star);
			pstmt.setString(6,b_image);
			pstmt.setString(7,p_code);
			pstmt.executeUpdate();
			
	%>
		<script>
			alert("글이 정상적으로 등록 되었습니다.");
			location.href = "../product/updateStar.jsp?p_code=<%=p_code%>"; 
		</script>		
	<%		
		}catch(SQLException e){
			out.println("SQLException: "+e.getMessage());
		}finally{
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}
	%>
</body>
</html>