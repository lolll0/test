<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Servlet 파일 업로드 연습</title>
</head>
<body>
<h2>File Upload 연습</h2>
<!-- 
	파일을 업로드하기 위한 form태그 구성 방법
	1. method는 반드시 'post'방식이여야 한다.
	2. enctype속성에 'multipart/form-data'값을 설정해야 한다.
 -->
<form action="<%=request.getContextPath()%>/fileUploadTest.do"
	method="post" enctype="multipart/form-data">
	이 름 : <input type="text" name="username"><br><br>
	Upload File1 : <input type="file" name="fileUpload1"><br><br>
	Upload File2 : <input type="file" name="fileUpload2" multiple><br><br>
	<input type="submit" value="Upload">
	
</form>
<hr>
<a href="<%=request.getContextPath() %>/uploadFileList.do">전체 upload파일 목록 보기</a>



</body>
</html>