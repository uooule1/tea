<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
		String s_id = "";
	
		if(session.getAttribute("m_id")!=null){
			s_id = (String)session.getAttribute("m_id");
		}
		//로그인 하지 않았다면
		if(s_id.equals("")){
	%>
		<script>
			alert("사용을 위해 로그인을 해주세요");
			location.href = "../login/login.jsp";
		</script>
	<%		
		}
	%>
