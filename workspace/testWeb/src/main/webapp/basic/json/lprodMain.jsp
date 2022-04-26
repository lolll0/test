<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" 
	src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
$(function(){
	$("#lprodBtn").on('click', function(){
		// 비동기 방식
		$.ajax({
			url : "<%=request.getContextPath() %>/lprodController.do",
			type: "post",
			success : function(data){
				let str = "<table border='1'>";
				str += "<tr><td>LPROD_ID</td>"
				str += "<td>LPROD_GU</td>"
				str += "<td>LPROD_NM</td></tr>"
				$.each(data, function(i,v){
					str += "<tr><td>" + v.lprod_id + "</td>";
					str += "<td>" + v.lprod_gu + "</td>";
					str += "<td>" + v.lprod_nm + "</td></tr>";
				})
				str += "</table>";
				$('#result').html(str);
			},
			error : function(){
				alert("오류");
			},
			dataType : "json"
	
		})
		
	})
	
		// 동기 방식
		$('#lprodBtn2').on('click', function(){
			location.href = "<%=request.getContextPath() %>/lprodList2.do";
			
	})
	
	
})
</script>
</head>
<body>
<!-- 
	DB의 LPROD테이블의 전체 데이터를 가져와 화면에 출력하시오.
 -->
 
<form>
	<input type="button" id="lprodBtn" value="Lprod자료 가져오기(Ajax)"> 
	<input type="button" id="lprodBtn2" value="Lprod자료 가져오기(Non Ajax)"> 
</form>
<h3>Lprod자료 목록</h3>
<div id="result"></div>
</body>
</html>