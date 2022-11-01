<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 관리자가 아닐 경우 접근제한 파일 -->

	<%
		String a_id = "";
		if(session.getAttribute("m_id")!=null){
			a_id = (String)session.getAttribute("m_id");
		}
		if(!a_id.equals("admin1")){
	%>			<script>
					alert("관리자만 접근 할 수있습니다.");
					history.back();
				</script>
	<%
		} 
	%>