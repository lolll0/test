<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>     
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<script> //회원의 좌석선택 페이지에서 결제 페이지로 정보를 넘겨주고 다음의 서블릿을 실행한다 
location.href = "<%=request.getContextPath()%>/MemberPay.do";
</script>





</body>
</html>