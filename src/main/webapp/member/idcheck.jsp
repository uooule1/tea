<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String m_id = request.getParameter("m_id"); 		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EEO(티타임): 아이디 중복 조회</title>
<link rel = "stylesheet" href = "../css/login.css">
<script type="text/javascript" >
function checkid(){
	if(member.m_id.value==""){
		alert("아이디를 입력해주세요!");
		member.m_id.focus();
		return false;
	}
	//아이디 영문 , 숫자 4-12자
	var exp = /^(?=.*[a-zA-z])(?=.*[0-9]).{4,12}$/;
    if(!document.member.m_id.value.match(exp)){
        alert("아이디는 영문자와 숫자를 사용하여 4자리 이상 12자리 이하로 입력해주세요.");
        member.m_id.select();
        return false;
    }
	member.submit();
}
function closewin(){
	opener.member.m_id.value = "<%=m_id%>";
	window.close();
}
</script>
</head>
<body>
	<div class = "wrapper">
	<div class = "new">
	<%
		if(m_id == null){
	%>		
				<h3>아이디 중복 조회</h3>
					<form name = "member" method = "post" action = "idcheck_ok.jsp">
						<p>아이디를 입력하세요!
						<p><input type = "text" name = "m_id" placeholder = "영문, 숫자 조합 4-12자">
						<p><input type = "button" value = "아이디중복검사" onclick = "checkid()" >
					</form>	
	<%	
			} 
		else{
	%>
			<h4><%=m_id%>는 가입할 수 있는 아이디입니다.</h4>
			<input type = "button" value = "닫기" onclick = "closewin()">
	<%
		}
	%>
	</div>
	</div>
</body>
</html>