<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file = "../conf/dbconn.jsp" %>
<%@ include file = "../conf/session.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>EEO(티타임): 회원가입</title>
<script src = "../js/orders.js">
</script>
<link rel = "stylesheet" href = "../css/index.css">
</head>
<body>
	<div class = "wrap">
	<header><%@ include file = "../conf/header2.jsp" %></header>
	
	<main>
	<table>
	<caption>주문 상품</caption>
			<tr>
				<th></th>
				<th>상품명</th>
				<th>단가</th>
				<th>수량</th>
				<th>금액</th>
			</tr>
		<%	
			String m_id = (String)session.getAttribute("m_id");
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try{
				String sql = "SELECT p.p_image, p.p_name, c.c_quantity, p.p_price, p.p_code, c.c_num FROM product p join cart c WHERE p.p_code = c.p_code and m_id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,m_id);
				rs = pstmt.executeQuery();
				
				int i=0,sum=0,amount=0;
				
				while(rs.next()){
					i++;
					int price = rs.getInt("p.p_price");
					int qty = rs.getInt("c.c_quantity");
					amount = price*qty;
					sum+=amount;
		%>
					<tr>
						<td>
							<a href = "../product/Product.jsp?p_code=<%=rs.getString("p.p_code")%>">
								<img src = "../upload/<%=rs.getString("p.p_image") %>" width = "100px">
							</a>
						</td>
						<td><%=rs.getString("p.p_name")%></td>
						<td><%=price%></td>
						<td><%=qty%></td>
						<td><%=amount%></td>
					</tr>
					
		<%			
				
				}
		%>
				</table>
				<h2>총 금액: <%=sum %></h2>
				<p>
				
		<%		
		
			}catch(SQLException e){
				out.println("SQLException: "+e.getMessage());
			}finally{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
		%>
	
	<form method = "post" name = "order" action = "write_ok.jsp" id = "member">
		<h2>주문서 작성</h2>
		
		<table>
		<tr>
			<th colspan = "2">주문고객 정보</th>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type = "text" name = "o_name"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<input type = "email" name = "o_email">
			</td>
		</tr>
		<tr>
			<th>휴대전화</th>
			<td>
				<select name = "o_user_phone1">
					<option value = "010">010</option>
					<option value = "011">011</option>
					<option value = "016">016</option>
					<option value = "017">017</option>
					<option value = "018">018</option>
					<option value = "019">019</option>
				</select>
			<input type = "text" name = "o_user_phone2"></td>
		</tr>
		<tr>
			<th colspan = "2">배송지 정보</th>
		</tr>
		<tr>
			<th>받는분</th>
			<td><input type = "text" name = "o_recivername"></td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>
				<select name = "o_reciever_phone1">
					<option value = "010">010</option>
					<option value = "011">011</option>
					<option value = "016">016</option>
					<option value = "017">017</option>
					<option value = "018">018</option>
					<option value = "019">019</option>
				</select>
			<input type = "text" name = "o_reciever_phone2"></td>
		</tr>
		<tr>
			<th colspan = "2">주소</th>
		</tr>
		<tr>
			<td colspan = "2">
				<input type="text" id="zipNo"  name="zipNo" size = 5/>
				<input type = "button" value = "우편번호 찾기" onClick="goPopup();">
			</td>
		</tr>
		<tr>
			<td colspan = "2"><input type="text" id="roadAddrPart1"  name="roadAddrPart1" placeholder = "기본주소" /></td>
		</tr>
		<tr>
			<td colspan = "2"><input type="text"  id="addrDetail"  name="addrDetail" placeholder = "상세주소입력" /></td>
		</tr>
		<tr>
			<th colspan = "2">
				<select name = "o_option">
					<option value = "">배송요청사항선택</option>
					<option value = "경비실에 맡겨주세요">경비실에 맡겨주세요</option>
					<option value = "배송전에 미리 연락주세요">배송전에 미리 연락주세요</option>
				</select>
			</th>
		</tr>
		<tr>
			<th colspan = "2">결제수단</th>
		</tr>
		<tr>
			<td>무통장입금</td>
			<td>입금자명 : <input type = "text" name = "o_accountname"></td>
		</tr>
		<tr>
			<td>입금은행</td>
			<td><select name = "o_bank">
					<option value = "">은행선택</option>
					<option value = "KB">국민은행:570202-02-234567</option>
					<option value = "SOL">신한은행:110-532-1239876</option>
				</select></td>
		</tr>
			</table>
	<input type = "submit" value = "결제" class = "small_button blue">
	<input type = "button" value = "취소" onclick = "history.back()" class = "small_button yellow">				
	</form>
	</main>
	
	<footer><%@ include file = "../conf/footer2.jsp" %></footer>
	</div>
</body>
</html>