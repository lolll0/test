<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

	 <script src="../js/jquery.serializejson.min.js"></script>	
	 
<title>Insert title here</title>

<script type="text/javascript">

$(function(){
	
	var xhr = new XMLHttpRequest();
	
	// 아이디 중복체크
	$('#idchk').on('click', function(){
//			event.preventDefault();
		
		// 입력한 값을 가져온다.
		idvalue = $('#uid').val().trim();
		console.log(idvalue);
		// 서버로 전송한다.
		$.ajax({
			url : '<%=request.getContextPath() %>/IdCheck.do',
			type : 'get',
			data : {"member_id" : idvalue},
			success : function(res){
				$('#idspan').html(res.flag).css('color', 'red');	
				
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
	})
	

	


$('form').on('submit', function(){

	fdata1 = $('form').serialize();
	fdata2 = $('form').serializeArray();
	fdata3 = $('form').serializeJSON();
	
// 	console.log(fdata1);
// 	console.log(fdata2);
// 	console.log(fdata3);
	
	idJ = /^[A-Za-z0-9]{4,12}$/; // id는 a-z,0-9로 시작하는 4~12자리 아이디
	pwJ = /^[A-Za-z0-9]{4,12}$/;	// A~Z,a~z,0~9로 시작하는 4~12자리
	nameJ = /^[가-힣]{2,6}$/; // 가~힣, 한글로 이뤄진 문자만으로 2~6자리 이름
	mail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	phone = /^\d{3}-\d{3,4}-\d{4}$/;
	
	
	if($("#pwd").val()!= $("#pwdcheck").val()){
		alert("비밀번호와 비밀번호 확인이 다릅니다. 다시 확인하세요.");
		return false;
	}else{
		if(idJ.test($('#uid').val()) != true){
// 			console.log(t);
			$('#idspan').html("숫자 or 문자로만 4~12자리 입력").css('color', 'red');
			return false;
		}else if(pwJ.test($('#pwd').val()) != true){
			$('#pwdspan').html("숫자 or 문자로만 4~12자리 입력").css('color','red');
			return false;
		}else if(nameJ.test($('#uname').val()) != true){
			$('#namespan').html("한글로 2~6자리 입력").css('color','red');
			return false;
		}else if(mail.test($('#umail').val()) != true){
			$('#mailspan').html("이메일 형식에 맞춰입력").css('color','red');
			return false;
		}else if(phone.test($('#utel').val()) != true){
			$('#phonespan').html("전화번호 형식에 맞춰입력").css('color','red');
			return false;
		}else{
			$.ajax({
				url : '<%=request.getContextPath() %>/Insert.do',
				data : fdata3,
				type : 'post',
				success:function(res){
					
					$('#joinspan').html(res.flag).css('color','red');
					if(res.flag == "회원가입 성공!!"){
						$('#myModal').modal();
					}
				},
				error : function(xhr){
					alert("상태 : " + xhr.status)
				},
				dataType : 'json'
					 
			})
			return false;
		}
	}
	
})
	
})

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
  <a href="../main/mainPage.jsp">
    <img alt="" src="https://img.cgv.co.kr/R2014/images/common/logo/logoRed.png">
  </a>
  <h2>회원가입</h2>
  <br>
  <form action="/action_page.php" class="was-validated">
    <div class="form-group">
      <label for="uid">아이디:</label>
      <button id="idchk" type="button" class="btn btn-secondary btn-sm mb-2 mr-sm-2">중복검사</button>
      <br>
      
      <input type="text" class="form-control col-sm-3" id="uid" placeholder="Enter userid" name="member_id" required>
	  
	  <span id ="idspan"></span>      
      
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">아이디를 입력하세요.</div>
    </div>
  
  	<div class="form-group">
      <label for="pwd">비밀번호:</label>
      <input type="password" class="form-control col-sm-3" id="pwd" placeholder="Enter password" name="member_pass" required>
      
      <span id ="pwdspan"></span> 
      
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">비밀번호를 입력하세요.</div>
    </div>
    
    <div class="form-group">
      <label for="pwd">비밀번호 확인:</label>
      <input type="password" class="form-control col-sm-3" id="pwdcheck" placeholder="Enter password" name="mem_passcheck" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">비밀번호 확인을 입력하세요.</div>
    </div>
  
  
    <div class="form-group">
      <label for="uname">이름:</label>
      <input type="text" class="form-control col-sm-3" id="uname" placeholder="Enter username" name="member_name" required>
     
      <span id="namespan"></span>
     
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">이름을 입력하세요.</div>
    </div>
    
    <div class="form-group">
      <label for="umail">이메일:</label>
      <input type="text" class="form-control col-sm-3" id="umail" placeholder="abcd1234@gmail.com" name="member_mail" required>
     
      <span id="mailspan"></span>
     
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
      
      <span id="phonespan"></span>
      
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">휴대폰 번호를 입력하세요.</div>
    </div>
    
    
    <button type="submit" id="submit" class="btn btn-primary btn-lg">가입신청</button>
    <button type="reset" class="btn btn-primary btn-lg">초기화</button>
    <span id="joinspan"></span>
  </form>
</div>


<!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Modal Heading</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
         <h2 style="color:black;">가입이 완료되었습니다. 메인화면으로 돌아가시겠습니까?</h2>
         <button type="button" class="btn btn-danger" onclick="location.href='../main/mainPage.jsp'">확인</button>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">창닫기</button>
        </div>
        
      </div>
    </div>
  </div>

</body>
</html>