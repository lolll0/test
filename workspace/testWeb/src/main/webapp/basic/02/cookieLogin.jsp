<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
// jsp문서 (Login폼이 있는 문서)에서 쿠키를 확인해서 값을 셋팅하는 작업을 수행한다.
	
	String cookieUserId = ""; // 쿠키값이 저장될 변수
	String chk = ""; // 체크박스 체크용

	Cookie[] cookieArr = request.getCookies(); // 쿠키정보 가져오기
	if(cookieArr!=null){
		for(Cookie cookie : cookieArr){
			if("id".equals(cookie.getName())){
				cookieUserId = cookie.getValue(); // 쿠키값 구하기
				chk = "checked";
			}
		}
	}

%>
<body>
<form action="/testWeb/cookieLoginServlet.do">
ID : <input type="text" name="id" 
	value="<%=cookieUserId %>"><br>
PASS : <input type="password" name="pass"><br>
<input type="checkbox" name="chkid" value="check" <%=chk %>> id기억하기<br>
<input type="submit" value="login" name="login">
</form>
</body>
</html>