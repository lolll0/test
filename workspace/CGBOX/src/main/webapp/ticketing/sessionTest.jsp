<%@page import="vo.NonMemberVO"%>
<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
 <%
 	// jsp문서에는 세션객체가 'session'이라는 이름으로 이미 생성되어 있다.
 	NonMemberVO vo = (NonMemberVO) session.getAttribute("nonMember");
 %>
<%
	if(vo == null){	//세션이 없을 때
%>
	<h2>세션이 존재하지 않습니다</h2>
	<p>오류이므로 관련코드를 확인해주세요</p>
<% 		
	}else{	//세션이 있을 때 
		//예매페이지 진행해야함 SS-RC-01-00-06
%>
<div style="text-align:center;">
	<h3><%=vo.getCustomer_no()%>번 회원님의 세션정보</h3>
	<table border='1'>
		<tr>
			<td>생년월일</td>
			<td><%=vo.getNonmember_birth() %></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><%=vo.getNonmember_mail() %></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><%=vo.getNonmember_pass() %></td>
		</tr>
	</table>
</div>
<% 
	}
%>
</body>
</html>