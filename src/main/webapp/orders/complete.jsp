<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ include file = "../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 목록</title>
<link rel = "stylesheet" href = "../css/index.css">
<link rel = "stylesheet" href = "../css/list.css">
</head>
<body>
		<div class = "wrap">
		<header><%@ include file = "../conf/header2.jsp" %></header>
		
		<main>
		<h2>주문 내역</h2>
		<form name = "order" action = "#" method = "post">
		
		<%	
			String m_id = (String)session.getAttribute("m_id");
			PreparedStatement pstmt = null;
			ResultSet rs=null,rs1 = null;
			
			int o_ordernum = Integer.parseInt(request.getParameter("o_ordernum"));
		%>
			<p>주문번호 :<%=o_ordernum%>
			<table>
			<tr>
				<th>번호</th>
				<th>상품정보</th>
				<th></th>
				<th>수량</th>
				<th>판매가격</th>
				<th>후기 작성</th>
			</tr>
		<%	
			 
			try{
				String sql = "SELECT o.o_ordernum ,o.o_orderdate , p.p_name, p.p_image, p.p_price, i.o_quantity , p.p_code FROM product p join orderitem i ON p.p_code = i.p_code ";
				sql += " join orders o ON i.o_ordernum = o.o_ordernum WHERE o.o_ordernum = ?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,o_ordernum);
				rs = pstmt.executeQuery();
				
				int i=0,sum=0,amount=0;
				while(rs.next()){
					i++;
					int price = rs.getInt("p.p_price");
					int qty = rs.getInt("i.o_quantity");
					amount = price*qty;
					sum+=amount;
		%>
			<tr>
				<td><%=i %></td>
				<td><img src = "../upload/<%=rs.getString("p.p_image") %>" width = "100px"></td>
				<td><%=rs.getString("p.p_name") %></td>
				<td><%=qty %></td>
				<td><%=amount%></td>
				<td><input type = "button" value = "작성" onclick = "location.href='../board/write.jsp?p_code=<%=rs.getString("p_code")%>'" class = "small_button yellow"></td>
			</tr>
		<%			
				
				}
				
		%>
		</table>
			<h2>총 금액: <%=sum%></h2>
		<p>주문자 정보 
		<%
		 
		String sql1 = "SELECT * from orders WHERE o_ordernum = ?";

		pstmt = conn.prepareStatement(sql1);
		pstmt.setInt(1,o_ordernum);
		rs1 = pstmt.executeQuery();
		
		if(rs1.next()){
		%>
		<table>
			<tr>
				<th>보내는 사람</th>
				<th>연락처</th>
			</tr>
			<tr>
				<td><%=rs1.getString("o_name") %></td>
				<td><%=rs1.getString("o_tel") %></td>
			</tr>
		</table>
		
		<p>배송 정보
		<table>
			<tr>
				<th>받는 사람</th>
				<th>주소</th>
				<th>연락처</th>
				<th>요청사항</th>
			</tr>
			<tr>
				<td><%=rs1.getString("o_recivername") %></td>
				<td>[<%=rs1.getString("o_zipcode") %>]<%=rs1.getString("o_addr1") %> <%=rs1.getString("o_addr2") %></td>
				<td><%=rs1.getString("o_recivertel") %></td>
				<td><%=rs1.getString("o_option") %></td>
			</tr>
		</table>
		<p>결제 정보
		<table>
			<tr>
				<th>무통장 입금</th>
				<th>입금자명</th>
				<th>결제 금액</th>
			</tr>
			<tr>
				<td>
				<%
				if(rs1.getString("o_bank").equals("KB")){
					out.println("국민은행:570202-02-234567");
				}else{
					out.println("신한은행:110-532-1239876");
				}
				%>
				</td>
				<td><%=rs1.getString("o_accountname") %></td>
				<td><%=sum%></td>
			</tr>
		</table>
			
		<%
		}
			}catch(SQLException e){
				out.println("SQLException: "+e.getMessage());
			}finally{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
		%>
		</form>
		<input type = "button" value = "목록" class = "small_button blue" onclick = "location.href='list.jsp'">
		<input type = "button" value = "메인" class = "small_button yellow" onclick = "location.href='../index.jsp'">
		</main>
			
	    <footer><%@ include file = "../conf/footer2.jsp" %></footer>
    </div>
</body>
</html>