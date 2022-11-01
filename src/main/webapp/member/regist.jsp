<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EEO(티타임): 회원가입</title>
<script src = "../js/regist.js">
</script>
<link rel = "stylesheet" href = "../css/index.css">
<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
<link rel = "stylesheet" href = "../css/input.css">
<style>
td span{
	color:red;
}
</style>
</head>
<body>
	<div class = "wrap">
	<header></header>
	
	<main>
	<form method = "post" name = "member" action = "regist_ok.jsp" id = "member">
		<h2>회원가입</h2>
		<hr>
		<table>
			<tr>
				<td>아이디 <span>*</span></td>
				<td><input type = "text" name = "m_id" readonly placeholder = "영문, 숫자 조합 4-12자" class = "large box gray">
					<input type = "button" value = "중복 확인" onclick = "newwin()" class = "medium_button blue">
				</td>
			</tr>
			<tr>
				<td>비밀번호 <span>*</span></td>
				<td><input type = "password" name = "m_passwd" placeholder = "영문 소문자, 숫자, 특수문자 조합 8-16자" class = "large box"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type = "password" name = "m_passwd1" placeholder = "비밀번호 확인" class = "large box"></td>
			</tr>
			<tr>
				<td>이름 <span>*</span></td>
				<td><input type = "text" name = "m_name" class = "large box"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td>
					<input type = "text" name = "m_year" placeholder = "년(4자)"  size = "4" class = "small box">
					<select name = "m_month" class = "small box">
						<option value = "">월</option>
						<option value = "01">1월</option>
						<option value = "02">2월</option>
						<option value = "03">3월</option>
						<option value = "04">4월</option>
						<option value = "05">5월</option>
						<option value = "06">6월</option>
						<option value = "07">7월</option>
						<option value = "08">8월</option>
						<option value = "09">9월</option>
						<option value = "10">10월</option>
						<option value = "11">11월</option>
						<option value = "12">12월</option>
					</select>
					<input type = "text" name = "m_day" placeholder = "일"  size = "2" class = "small box">
				</td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td>
					<input type="text" id="zipNo"  name="zipNo" class = "medium  box gray">
					<input type = "button" value = "우편번호 찾기" onClick="goPopup();" class = "large_button blue">
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" id="roadAddrPart1"  name="roadAddrPart1" placeholder = "기본주소" size = "5" class = "large box gray"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="text"  id="addrDetail"  name="addrDetail" placeholder = "상세주소" class = "large box gray" /></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input type = "email" placeholder = "E-mail 주소를 입력해 주세요" name = "m_email" class = "large box">
				</td>
			</tr>
			<tr>
				<td>휴대전화</td>
				<td>
					<select name = "m_tel1" class = "small box">
						<option value = "010">010</option>
						<option value = "011">011</option>
						<option value = "016">016</option>
						<option value = "017">017</option>
						<option value = "019">019</option>
					</select>
					- <input type = "text" name = "m_tel2" size = "4" maxlength = "4" class = "small box">
					- <input type = "text" name = "m_tel3" size = "4" maxlength = "4" class = "small box">
				</td>
			</tr>
			<tr>
				<td colspan ="2">
					<input type = "button" value = "가입" onclick = "check()" class = "small_button blue">
					<input type = "button" value = "취소" onclick = "history.back()" class = "small_button gray">
				</td>
			</tr>
		</table>
	</form>
	</main>
	
	<footer></footer>
	
	</div>
</body>
</html>