<%@page import="kr.or.ddit.basic.fileupload.FileInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- upload한 결과가 출력될 jsp -->
<%
String userName = (String)request.getAttribute("userName");
List<FileInfo> fileList = 
	(List<FileInfo>)request.getAttribute("fileList");
%>

<%
if(userName!=null){
%>
	<h3><%=userName %>님이 방금 업로드한 파일 목록</h3>
<% 
}else{
%>
	<h3>전체 업로드한 파일 목록</h3>
<% 	
}
%>

<table border='1'>
<thead>
	<tr>
		<td>파일이름</td>
		<td>파일크기</td>
		<td>업로드상태</td>
		<td>비고</td>
	</tr>
</thead>
<tbody>
<% 
for(FileInfo finfo : fileList){
%>
	<tr>
		<td><%=finfo.getFileName() %></td>
		<td><%=finfo.getFileSize() %>KB</td>
		<td><%=finfo.getStatus() %></td>
		<td><a href="<%=request.getContextPath() %>/fileDownload.do?filename=<%=finfo.getFileName()%>">downLoad</a></td>
	</tr>
<% 
}
%>

</tbody>	

</table>

<a href="<%=request.getContextPath() %>/basic/upload/fileuploadMain.jsp">
	파일 업로드 시작문서로 가기
</a>

</body>
</html>