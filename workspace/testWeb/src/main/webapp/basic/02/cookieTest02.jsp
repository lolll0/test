<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>


<a href="<%=request.getContextPath() %>/cookieCountServlet.do">Cookie Count증가하기</a><br><br>
<a href="<%=request.getContextPath() %>/cookieCountDelServlet.do">Cookie Count초기화하기</a>


</body>
</html>