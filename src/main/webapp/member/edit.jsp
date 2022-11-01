<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EEO(티타임): 회원정보수정</title>
<script src = "../js/edit.js"></script>
<link rel = "stylesheet" href = "../css/index.css">
<link rel = "stylesheet" href = "../css/input.css">
<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
</head>
<body onload = "member.m_passwd.focus();">	
	<div class = "wrap">
	
	<header><%@ include file = "../conf/header2.jsp" %></header>
	
	<%
		String m_id = (String)session.getAttribute("m_id");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{	
			String sql = "select * from member where m_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				String m_name = rs.getString("m_name");
				String[] m_tel = rs.getString("m_tel").split("-", 3);
				String m_tel1 = m_tel[0];
				String m_tel2 = m_tel[1];
				String m_tel3 = m_tel[2];
				String[] m_birth = rs.getString("m_birth").split("-", 3);
				String m_year = m_birth[0];
				String m_month = m_birth[1];
				String m_day = m_birth[2];
				String m_zipcode = rs.getString("m_zipcode");
				String m_addr1 = rs.getString("m_addr1");
				String m_addr2 = rs.getString("m_addr2");
				String m_email = rs.getString("m_email");
				
				
	%>
	<h2>회원정보수정</h2>
		<form method = "post" name = "member" action = "edit_ok.jsp">
			<table>
					<tr>
						<td>아이디</td>
						<td><%=m_id%></td>
					</tr>
					<tr>
						<td>현재 비밀번호 <span>*</span></td>
						<td><input type = "password" name = "m_passwd" class = "large box"></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><%=m_name%></td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td>
							<input type = "text" name = "m_year" size = "4" value = "<%=m_year%>" class = "small box">
							<select name = "m_month" class = "small box">
								<option value = "" <% if(m_month.equals("")){%>	selected <% } %>>월</option>
								<option value = "01" <% if(m_month.equals("01")){%>	selected <% } %>>1월</option>
								<option value = "02" <% if(m_month.equals("02")){%>	selected <% } %>>2월</option>
								<option value = "03" <% if(m_month.equals("03")){%>	selected <% } %>>3월</option>
								<option value = "04" <% if(m_month.equals("04")){%>	selected <% } %>>4월</option>
								<option value = "05" <% if(m_month.equals("05")){%>	selected <% } %>>5월</option>
								<option value = "06" <% if(m_month.equals("06")){%>	selected <% } %>>6월</option>
								<option value = "07" <% if(m_month.equals("07")){%>	selected <% } %>>7월</option>
								<option value = "08" <% if(m_month.equals("08")){%>	selected <% } %>>8월</option>
								<option value = "09" <% if(m_month.equals("09")){%>	selected <% } %>>9월</option>
								<option value = "10" <% if(m_month.equals("10")){%>	selected <% } %>>10월</option>
								<option value = "11" <% if(m_month.equals("11")){%>	selected <% } %>>11월</option>
								<option value = "12" <% if(m_month.equals("12")){%>	selected <% } %>>12월</option>
							</select>
							<input type = "text" name = "m_day" size = "2" value = "<%=m_day%>" class = "small box">
						</td>
					</tr>
					<tr>
						<td>우편번호</td>
						<td>
							<input type="text" id="zipNo"  name="zipNo" size = 5 value = "<%=m_zipcode%>" class = "small box">
							<input type = "button" value = "우편번호 검색" onClick="goPopup();" class = "large_button blue">
						</td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" id="roadAddrPart1"  name="roadAddrPart1" value = "<%=m_addr1%>" class = "large box gray"/></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="text"  id="addrDetail"  name="addrDetail"  value = "<%=m_addr2%>" class = "large box gray"/></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>
							<input type = "email" name = "m_email" value = "<%=m_email%>" class = "large box">
						</td>
					</tr>
					<tr>
						<td>휴대전화</td>
						<td>
							<select name = "m_tel1"  class = "small box">
											<option value = "010" <% if(m_tel1.equals("010")){%> selected <%}%>>010</option>
											<option value = "011" <% if(m_tel1.equals("011")){%> selected <%}%>>011</option>
											<option value = "016" <% if(m_tel1.equals("016")){%> selected <%}%>>016</option>
											<option value = "017" <% if(m_tel1.equals("017")){%> selected <%}%>>017</option>
											<option value = "019" <% if(m_tel1.equals("019")){%> selected <%}%>>019</option>
											</select>
								- <input type = "text" name = "m_tel2" size = "4" maxlength = "4" value = "<%=m_tel2%>"  class = "small box">
								- <input type = "text" name = "m_tel3" size = "4" maxlength = "4" value = "<%=m_tel3%>"  class = "small box">
						</td>
					</tr>
					<tr>
						<td colspan ="2">
							<input type = "button" value = "수정" onclick = "editForm()" class = "small_button blue">
							<input type = "reset" value = "리셋" class = "small_button gray">
							<input type = "button" value = "취소" onclick = "history.back()" class = "small_button yellow">
						</td>
					</tr>
			</table>
		</form>
	<% 				
			}
		}catch(SQLException e){
			out.println("SQLException"+e.getMessage());
		}finally{
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}
	%>
	
	<footer><%@ include file = "../conf/footer2.jsp" %></footer>
	</div>
</body>
</html>