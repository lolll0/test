<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	
	$('#insertcon').on('click',function(){
	
		prodno=	$('#conno').val();
	
	console.log(prodno);
	
	$.ajax({
		url : '<%=request.getContextPath()%>/Insertcon.do',
		type : 'get',
		data : {"prodno" : prodno},
		
		success : function(res){ //res = "성공"
		     str = "";
		    
			if(res=='성공'){
		     str+="등록이 완료되었습니다";
			}else if(res =='없는 상품'){
				str+="입력하신 상품번호는 없는 상품입니다";
			}else if(res=='보유상품'){
				str+="등록이 완료되었습니다";
			}
			
		     $('#inserts').text(str);
	
		},
		error : function(xhr){
		
			
		},
		dataType : 'text'
		
		
	})
	
		
		
	})
	
	$('#close').on('click',function(){
		//window.open('','_self').close();
		
		self.opener = self;
		window.close();
		//윈도우 닫고
		//다시 보유한 상품출력해줘야해 
   
		location.href = "<%=request.getContextPath()%>/MemberPay.do";

	})
	
	
	
	
})




</script>


</head>
<body>

<div>
CGV 영화관람권 등록하기 
</div>
<br><br><br>소지하고 계신 CGV영화 관람권을 등록해 주세요<br>
CGV 영화관람권 비밀번호를 입력해주세요.
<br><br>
<label>영화관람권번호 :</label>
<input type = "text" id = "conno">
<label>비밀번호 :</label>
<input type = "text" id = "conpw">
<br><br>

<img src = "http://img.cgv.co.kr/CGV_RIA/Ticket/image/reservation/popup/image_cgvticket.png" alt = "영화관람권 안내.png">
<br><br>
<p id="inserts"></p>
<br><br>
 <button type="button" id="insertcon" class="btn btn-secondary">등록하기</button>
  <button type="button" id="close" class="btn btn-secondary">닫기</button>




</body>
</html>