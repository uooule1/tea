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
<title>EEO(티타임): 상품 정보 수정 처리</title>
</head>
<body>
		<%
			request.setCharacterEncoding("utf-8");
	
			String folder = "C:\\JSP\\tea\\src\\main\\webapp\\upload";
// 			String folder = "D:\\JSP\\tea\\src\\main\\webapp\\upload";
			int maxSize = 100*1024*1024;//최대 업로드 파일 크기
			String encType = "utf-8";//인코딩 유형
			MultipartRequest multi = new MultipartRequest(request, folder,maxSize,encType, new DefaultFileRenamePolicy());
			
			Enumeration<?> files = multi.getFileNames();
			String fname = (String)files.nextElement();
			String p_image = multi.getFilesystemName(fname);
			
			String image = multi.getParameter("image");
			if(p_image==null){
				p_image = image;
			}
			
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
				String sql = "UPDATE product set p_name=?,p_price=?,p_info=?,p_image=?,p_stock=?,p_category=?,p_brand=?,p_state=?,p_rate=?,p_editdate=sysdate() where p_code=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,p_name);
				pstmt.setInt(2,p_price);
				pstmt.setString(3,p_info);
				pstmt.setString(4,p_image);
				pstmt.setInt(5,p_stock);
				pstmt.setString(6,p_category);
				pstmt.setString(7,p_brand);
				pstmt.setString(8,p_state);
				pstmt.setInt(9,p_rate);
				pstmt.setString(10,p_code);
				pstmt.executeUpdate();
				
				response.sendRedirect("ProductList.jsp");
			}catch(SQLException e){
				out.println("SQLException"+e.getMessage());
			}finally{
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
	%>
	
</body>
</html>