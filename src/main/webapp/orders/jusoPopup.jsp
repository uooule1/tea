<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<% 
	request.setCharacterEncoding("UTF-8");  //한글깨지면 주석제거
	String inputYn = request.getParameter("inputYn"); //구별하는 매개체로 필요함
	String roadAddrPart1 = request.getParameter("roadAddrPart1");
	String zipNo = request.getParameter("zipNo"); 
	String addrDetail = request.getParameter("addrDetail"); 

%>
</head>
<script language="javascript">

function init(){
	var url = location.href;
	var confmKey = "devU01TX0FVVEgyMDIyMTAxODE1MDAwODExMzEwMzc=";//승인키 복사붙여넣기
	var resultType = "4"; // 도로명주소 검색결과 화면 출력내용, 1 : 도로명, 2 : 도로명+지번+상세보기(관련지번, 관할주민센터), 3 : 도로명+상세보기(상세건물명), 4 : 도로명+지번+상세보기(관련지번, 관할주민센터, 상세건물명)
	var inputYn= "<%=inputYn%>";
	if(inputYn != "Y"){
		document.member.confmKey.value = confmKey;
		document.member.returnUrl.value = url;
		document.member.resultType.value = resultType;
		document.member.action="https://business.juso.go.kr/addrlink/addrLinkUrl.do"; //인터넷망
		document.member.submit();
	}else{
		opener.jusoCallBack("<%=roadAddrPart1%>","<%=addrDetail%>","<%=zipNo%>");
		window.close();
		}
}
</script>
<body onload="init();">
	<form id="member" name="member" method="post">
		<input type="hidden" id="confmKey" name="confmKey" value=""/>
		<input type="hidden" id="returnUrl" name="returnUrl" value=""/>
		<input type="hidden" id="resultType" name="resultType" value=""/>
	</form>
</body>
</html>