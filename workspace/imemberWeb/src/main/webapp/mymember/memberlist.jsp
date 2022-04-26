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
	$.ajax({
		url:"<%=request.getContextPath()%>/member.do",
		type:'post',
		success : function(data){
			str = "<table border='1'>";
			str += "<tr><td>" + ID + "</td>";
			str += "<td>" + 비밀번호 + "</td>";
			str += "<td>" + 전화 + "</td>";
			str += "<td>" + 주소 + "</td></tr>";
			
			$.each(data, function(i, v){
				str += "<tr><td><a href=''>" + v.mem_id + "</a></td>";
				str += "<td>" + v.mem_pass + "</td>";
				str += "<td>" + v.mem_name + "</td>";
				str += "<td>" + v.mem_tel + "</td>";
				str += "<td>" + v.mem_addr + "</td></tr>";
			})
			$('#result').html(str);
		},
		error : function(){
			alert("오류")
		},
		dataType : 'json'
	})
})

</script>	
</head>

<body>
<div id="result"></div>
</body>
</html>