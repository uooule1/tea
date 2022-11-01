<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<%@ page import = "com.oreilly.servlet.*"%>
<%@ page import = "com.oreilly.servlet.multipart.*"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EEO(티타임): 상품등록처리</title>
</head>
<body>
		<%
		request.setCharacterEncoding("utf-8");

		
// 		String folder = "D:\\JSP\\tea\\src\\main\\webapp\\upload";
		String folder = "C:\\JSP\\tea\\src\\main\\webapp\\upload";
		int maxSize = 100*1024*1024;//최대 업로드 파일 크기
		String encType = "utf-8";//인코딩 유형
		MultipartRequest multi = new MultipartRequest(request, folder,maxSize,encType, new DefaultFileRenamePolicy());
		
		Enumeration<?> files = multi.getFileNames();
		
		String fname = (String)files.nextElement();
		String p_image = multi.getFilesystemName(fname);
		
		
		String p_code = multi.getParameter("p_code");
		String p_name = multi.getParameter("p_name");
		int p_price = Integer.parseInt(multi.getParameter("p_price"));
		String p_info = multi.getParameter("p_info");
		int p_stock = Integer.parseInt(multi.getParameter("p_stock"));
		String p_category = multi.getParameter("p_category");
		String p_brand = multi.getParameter("p_brand");
		String p_state = multi.getParameter("p_state");
		int p_rate = Integer.parseInt(multi.getParameter("p_rate"));
		
		PreparedStatement pstmt = null;
		
		try{
			String sql = "INSERT INTO product(p_code,p_name,p_price,p_info,p_image,p_stock,p_category,p_brand,p_state,p_rate,p_createdate) values(?,?,?,?,?,?,?,?,?,?,sysdate())";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,p_code);
			pstmt.setString(2,p_name);
			pstmt.setInt(3,p_price);
			pstmt.setString(4,p_info);
			pstmt.setString(5,p_image);
			pstmt.setInt(6,p_stock);
			pstmt.setString(7,p_category);
			pstmt.setString(8,p_brand);
			pstmt.setString(9,p_state);
			pstmt.setInt(10,p_rate);
			pstmt.executeUpdate();
			
			response.sendRedirect("controlProduct.jsp");
		}catch(SQLException e){
			out.println("SQLException"+e.getMessage());
		}finally{
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	%>
	
</body>
</html>