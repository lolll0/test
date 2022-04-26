<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>

  <title>회원가입</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
 
  <script src="../js/jquery.serializejson.min.js"></script>	
	
<script type="text/javascript">
	$(function(){
		
		var xhr = new XMLHttpRequest();
		
		// 아이디 중복체크
		$('#idchk').on('click', function(){
			event.preventDefault();
			
			// 입력한 값을 가져온다.
			idvalue = $('#uid').val().trim();
			// 서버로 전송한다.
			$.ajax({
				url : '<%=request.getContextPath() %>/member/memberIdCheck.ddit',
				type : 'get',
				data : {"mem_id" : memId},
				success : function(res){
// 					alert(res.flag);
					$('#idspan').html(res.flag).css('color', 'red');	
					
				},
				error : function(xhr){
					alert("상태 : " + xhr.status);
				},
				dataType : 'json'
			})
		})
		
// // 		$('submit').on('click', function(){
// // 			pwd = $('#pwd').val().trim();
// // 			pwdcheck = $('#pwdcheck').val().trim();
// // 			if(pwd != pwdcheck){
// // 				alert("비밀번호 다름");
// // 			}
// // 		})
		

	
// 	$('form').on('submit', function(){
// 		// 입력한 모든 값을 가져온다.
// 		/* id = $('#uid').val()
// 		name = $('#uname').val()
// 		date = $('#udate').val()
// 		pwd = $('#pwd').val()
// 		tel = $('#utel').val()
// 		mail = $('#umail').val()
// 		zip = $('#uzip').val()
// 		add1 = $('#uadd1').val()
// 		add2 = $('#uadd2').val() */
		
		
// 		// 여러데이터를 한번에 받을 때 serialize를 사용한다. form의 name을 db와 일치시켜서 써야된다.
// 		fdata1 = $('form').serialize();
// 		fdata2 = $('form').serializeArray();
// 		// 외부스크립트 추가해야함 ../js/jquery.serializejson.min.js
// 		fdata3 = $('form').serializeJSON();
		
// 		console.log(fdata1);
// 		console.log(fdata2);
// 		console.log(fdata3);
		

		
// 		 $.ajax({
<%-- 			url : '<%=request.getContextPath() %>/Insert.do', --%>
// 			data : fdata3,
// 			type : 'post',
// 			success:function(res){
// 				alert(res.flag);
// 				$('#joinspan').html(res.flag).css('color','red');
// 			},
// 			error : function(xhr){
// 				alert("상태 : " + xhr.status)
// 			},
// 			dataType : 'json'
				 
// 		})
		
// 		return false;
		
// 	})
		
 })
// $(function(){
// 	$('#idchk').on('click', function(){
// 		$.ajax({
<%-- 	    	 url : '<%=request.getContextPath()%>/member/memberIdCheck.ddit', --%>
// 	    	 data : { "member_id" : memId },
// 	    	 dataType : 'json',
// 	    	 success : function(result){
// 	    		 if(result=="OK"){
// 	    			 $("#idchk").html("사용가능");
// 	    		 }else{
// 	    			 $("#idchk").html("ID 중복 - 사용불가");
// 	    		 }
// 	    	 },
// 	    	 error : function(xhr){
// 	    		 alert("status :" + xhr.status);
// 	    	 }
// 	     })
		
// 	})
// })
	
</script>

<style type="text/css">
.container{
	margin : 0px auto;
}
#dong{
	margin-left: 20px;
}
.ziptr:hover{
	background : lime;
}
form div{
	margin : 0px auto;
}
body{
	background: black;
	color: white;
}

</style>

</head>
<body>

<div class="container">
  <br>
  <img alt="" src="https://img.cgv.co.kr/R2014/images/common/logo/logoRed.png">
  <h2>회원가입</h2>
  <br>
  <form class="needs-validation" novalidate>
  
  	<div class="form-group">
      <label for="uid">아이디:</label>
      <button id="idchk" type="button" class="btn btn-secondary btn-sm mb-2 mr-sm-2 " >
<!--       	 <span class="spinner-border spinner-border-sm"></span> -->
      중복검사</button>
      <br>
      
      <input type="text" class="form-control col-sm-3" id="uid" placeholder="Enter userid" name="member_id" required>
	  
	  <span id = "idspan"></span>      
      
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">아이디를 입력하세요.</div>
    </div>
  
  	<div class="form-group">
      <label for="pwd">비밀번호:</label>
      <input type="password" class="form-control col-sm-3" id="pwd" placeholder="Enter password" name="member_pass" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">비밀번호를 입력하세요.</div>
    </div>
    
<!--     <div class="form-group"> -->
<!--       <label for="pwd">비밀번호 확인:</label> -->
<!--       <input type="password" class="form-control col-sm-3" id="pwdcheck" placeholder="Enter password" name="mem_passcheck" required> -->
<!--       <div class="valid-feedback">Valid.</div> -->
<!--       <div class="invalid-feedback">비밀번호 확인을 입력하세요.</div> -->
<!--     </div> -->
  
  
    <div class="form-group">
      <label for="uname">이름:</label>
      <input type="text" class="form-control col-sm-3" id="uname" placeholder="Enter username" name="member_name" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">이메일을 입력하세요.</div>
    </div>
    
    <div class="form-group">
      <label for="umail">이메일:</label>
      <input type="text" class="form-control col-sm-3" id="umail" placeholder="abcd1234@gmail.com" name="member_mail" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">이메일을 입력하세요.</div>
    </div>
    
    <div class="form-group">
      <label for="udate">생년월일:</label>
      <input type="date" class="form-control col-sm-3" id="udate" placeholder="1997.02.13" name="member_birth" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">생년월일을 선택하세요.</div>
    </div>
    
    <div class="form-group">
      <label for="utel">휴대폰번호:</label>
      <input type="text" class="form-control col-sm-3" id="utel" placeholder="010-1234-5678" name="member_tel" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">휴대폰 번호를 입력하세요.</div>
    </div>
    
    
    <button type="submit" id="submit" class="btn btn-primary btn-lg">가입신청</button>
    <button type="reset" class="btn btn-primary btn-lg">초기화</button>
    <span id="joinspan"></span>
  </form>
</div>





<script>
// Disable form submissions if there are invalid fields
// (function() {
//   'use strict';
//   window.addEventListener('load', function() {
//     // Get the forms we want to add validation styles to
//     var forms = document.getElementsByClassName('needs-validation');
//     // Loop over them and prevent submission
//     var validation = Array.prototype.filter.call(forms, function(form) {
//       form.addEventListener('submit', function(event) {
//         if (form.checkValidity() === false) {
//           event.preventDefault();
//           event.stopPropagation();
//         }
//         form.classList.add('was-validated');
//       }, false);
//     });
//   }, false);
// })();
</script>

</body>
</html>
