<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="../js/jquery.serializejson.min.js"></script>

<%
	//로그인이 되어 있으면 이 페이지로 못옴. 세션이 있으면 메인으로 보냄
	if(session.getAttribute("loginmember")!=null){
%>
		<script type='text/javascript'>alert('이미 로그인이 되었습니다.');location.href = "../main/mainPage.jsp";</script>
<%	
	}

	String msg = request.getParameter("msg");
	if(msg==null) msg = "";
	String exist = request.getParameter("exist");
	if(exist == null) exist = "";
%>
<script>

if("<%=msg%>"!=""){
	alert("예매정보가 존재하지 않습니다");
}

if("<%=exist%>" != ""){
	alert("이미 예약내역이 존재합니다")
}


$(function(){

	// 로그인 되지않은 회원만 접근하는 파일이므로
	// 로그인 세션이 있는 경우 에러가 날 수 있으니 세션을 삭제해준다.
	
// 	session.removeAttribute("loginmember");
					

	
  //네비게이션 탭 페이지 전환 메소드
  $(".nav-tabs a").click(function(){
    $(this).tab('show');
  })
  
  //회원 로그인
  $('#loginForm').on('submit', function() {
	 
	  //관리자 아이디면 관리자
	  var inId = $('#inputId').val();
	  var inPw = $('#inputPw').val();
	  if(inId == "admin" && inPw == "admin"){
		  location.href = "../notice.jsp";
		  return false;
	  }
	  
	  
	  var fdata = $('#loginForm').serializeJSON();
	 console.log(fdata);
	 
	 $.ajax({
		url : '<%=request.getContextPath()%>/memberLogin.do',
		data : fdata,
		type : 'post',
		success : function(res) {
			alert(res.flag);
			if(res.chk){
				location.href="../main/mainPage.jsp";
			}
			
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status)
		},
		dataType : 'json'
	})
	
	return false;
		
  })
  
  //비회원 예매하기 비밀번호 체크
  $('#nonMemRebtn').on('click', function() {
	  var fdata = $('#nonMemForm').serializeJSON(); 
	  
	  if(fdata.nonmember_pass != fdata.nonmember_passchk){
	  	  alert('비밀번호가 일치하지 않습니다');
		  return false;
	  }

  })
  
  
  

})

	var code = ""; 

  //이메일 인증 관련 함수 -----
  function emailAuthentication(){
	  if($('#mailBirth').val() == ""){
		  alert('생년월일을 입력해주세요 !');
		  return false;
	  }
	  
	  
		console.log(document.signUpForm.email.value);
		$.ajax({
			url : '<%=request.getContextPath()%>/sendMail.do',
			type : 'get',
			data : {
				"mail" : document.signUpForm.email.value
			},
			success : function(res) {
				console.log(res);
				code = res;
				$('#mailcodeInput').removeAttr('disabled');
				$('#mailcodeInput').next('button').removeAttr('disabled');
			},
			error : function(xhr) {
				alert('상태 : ' + xhr.status);
			},
			dataType : 'json'
			
			
		})
	}
	
  //메일 인증코드 체크
	function mailcodeChk() {
		
		if($('#mailcodeInput').val() == code){
			var birth = $('#mailBirth').val();
			var bmail = $('#inputEmailForm').val();
			$.ajax({
				url : '<%=request.getContextPath()%>/selectNonPass.do',
				type : 'get',
				data : {
					"bdata" : birth,
					"bmail" : bmail
				},
				success : function(res) {
					console.log(res);
					
					if(res == null){
						alert('예매정보가 존재하지 않습니다');
					}else{
						alert('인증에 성공했습니다');
						$('#passPrint').text( '비밀번호 : ' + res);
					}
					
					
					return false;
				},
				error : function(xhr) {
					alert('상태 : ' + xhr.status);
				},
				dataType : 'json'
				
			})
			

		}else{
			alert('인증번호가 올바르지 않습니다');
		}
	}
	
	
</script>

<script> 
//입력 체크
(function() {
  'use strict';
  window.addEventListener('load', function() {
    var forms = document.getElementsByClassName('needs-validation');
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();
</script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
	//	카카오 로그인
	// afb060f5bfe58f467e8f0fddb9673a4a
	window.Kakao.init("afb060f5bfe58f467e8f0fddb9673a4a");
	// 	console.log(kaka.isInitialized()); // 실패시 삭제코드
	function kakaoLogin(){
		window.Kakao.Auth.login({
			scope:'profile_nickname, profile_image, account_email, gender',
			success : function(authObj){
				console.log(authObj);
				window.Kakao.API.request({
					url: '/v2/user/me',  
					success: res => {
							const kakao_account = res.kakao_account;
							console.log(kakao_account);
							console.log(kakao_account.email);
							var email = kakao_account.email;
							var name = kakao_account.profile.nickname
							console.log(name);
							 $.ajax({
								url : '<%=request.getContextPath()%>/selectKakao.do',
								type : 'get',
								data : {
									"kmail" : email,
									"kname" : name
								},
								success : function(res) {
									location.href= '../main/mainPage.jsp';
								},
								error : function(xhr) {
									alert('상태 : ' + xhr.status);
								},
								dataType : 'json'
							}) 
							
							
					}
				});
			}
		});
	}
	

	
	
</script>




<style type="text/css">

#contents{
	border : 0px solid lightgray;
	margin-top: 200px;
}

#loginbtn, #kakaobtn{
	margin-bottom: 5px;
	height: 60px;
}
.nontb td:nth-child(1){
/* 	background: lightgray; */
 	width: 150px;
 	vertical-align : middle;
 	font-weight: bold;
}

#nonMemCheck .col{
	border: 2px solid lightgray; 
	margin: 5px;
	padding-bottom: 20px;
}

#nonMemCheck .col h4{
	margin-top : 20px;
	padding : 5px;
	text-align:center;
	/* background:lightgray;  */
}

nav{
	background: rgb(220,53,69);
	background: linear-gradient(90deg, rgba(220,53,69,1) 0%, rgba(220,53,69,1) 29%, rgba(255,66,0,1) 100%);
}

</style>

</head>
<body>

<!-- 네비게이션 바 -->
<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
  <!-- Brand -->
  <a class="navbar-brand" href="../main/mainPage.jsp">CGBOX</a>

  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="../movie/movieChart.jsp">영화</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="reservation.jsp">예매</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="../store/storePage.jsp">스토어</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="../user_event.jsp">이벤트</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="../user_FAQ.jsp">고객센터</a>
    </li>


  </ul>
</nav>

<!-- ///////////////////////////////////////////////////////////// -->

<div class="container pt-3" id="contents">
<!-- Nav tabs -->
  <ul class="nav nav-tabs">
    <li class="nav-item">
      <a class="nav-link active" data-toggle="tab" href="#login">로그인</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#nonMemRes">비회원예매</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#nonMemCheck">비회원예매 확인</a>
    </li>
  </ul>


  <!-- Tab panes -->
  <div class="tab-content">
    <div id="login" class="container tab-pane active"><br>
     <!--  <h3>로그인</h3> -->
      <p style="color : gray">아이디 비밀번호를 입력하신 후, 로그인 버튼을 클릭해 주세요</p>
      <form id="loginForm" class="needs-validation" novalidate>
		  <div class="input-group mb-3">
		    <div class="input-group-prepend">
		      <span class="input-group-text">
		      	<img src="https://img.icons8.com/fluency-systems-filled/20/000000/guest-male.png"/>
		      </span>
		    </div>
		    <input id="inputId" name="member_id" type="text" class="form-control" placeholder="아이디" required>
		    <div class="valid-feedback">입력되었습니다</div>
    		<div class="invalid-feedback">아이디를 입력해주세요</div>
		  </div>
		  
		  <div class="input-group mb-3">
		    <div class="input-group-prepend">
		      <span class="input-group-text">
		        <img src="https://img.icons8.com/material/20/000000/lock--v1.png"/>
		      </span>
		    </div>
		    <input id="inputPw" name="member_pass" type="password" class="form-control" placeholder="비밀번호" required autoComplete="on">
		    <div class="valid-feedback">입력되었습니다</div>
    		<div class="invalid-feedback">비밀번호를 입력해주세요</div>
		  </div>
		  
		  <button type="submit" class="btn btn-danger btn-block">로그인</button>
		 	
		  <br>
			
		  <!-- 카카오 로그인 api 사용 -->
		  <button id="kakaobtn" type="button" class="btn btn-warning btn-block" onclick="kakaoLogin()">카카오 로그인</button>

	  </form>
	  <hr>
	  <div id="join">
	  	<p>
	  	  계정이 없으신가요?&nbsp;&nbsp;&nbsp;<a href="../member/member.jsp">회원가입하기</a>
	  	</p>
	  </div>

    </div>
    
    <div id="nonMemRes" class="container tab-pane fade"><br>
      <!-- 
      
      <h3>비회원예매</h3> 
      
      -->
	  <div class="container">
	    <form id="nonMemForm" action="<%=request.getContextPath()%>/nonmemberReservation.do" method="post" class="needs-validation" novalidate>
			<table class="table table-borderless">
			  <thead class="thead-light">
			    <tr>
			      <th colspan="2">개인정보 입력</th>
			    </tr>
			  </thead>
			  <tbody class="nontb">
			    <tr>
			      <td>이메일</td>
			      <td>
			       <div class="input-group">
					<input name="mail1" type="text" class="form-control" placeholder="ex) abc123" required>
					<div class="input-group-append">
					   <span class="input-group-text">@</span>
					</div>
					<input name="mail2" type="text" class="form-control" placeholder="exmaple.com" required>
				   </div>
	 			 </td>
			    </tr>
			    <tr>
			      <td>생년월일(8자리)</td>
			      <td>
					<input name="nonmember_birth" type="text" class="form-control" placeholder="ex) 19000101" required>
					<div class="valid-feedback">입력되었습니다</div>
    				<div class="invalid-feedback">생년월일을 입력해주세요</div>
				  </td>
			    </tr>
			    <tr>
			      <td>비밀번호</td>
			      <td>
			        <input name="nonmember_pass" type="password" class="form-control" autoComplete="on" required>
			        <div class="valid-feedback">입력되었습니다</div>
    				<div class="invalid-feedback">비밀번호를 입력해주세요</div>
			      </td>
			    </tr>
			    <tr>
			      <td>비밀번호확인</td>
			      <td>
			        <input name="nonmember_passchk" type="password" class="form-control" required>
			        <div class="valid-feedback">입력되었습니다</div>
    				<div class="invalid-feedback">비밀번호확인을 입력해주세요</div>
			      </td>
			    </tr>
			  </tbody>
			</table>
			<hr>
			<div class="d-flex justify-content-center">
			  <button type="submit" class="btn btn-danger" id="nonMemRebtn" >비회원 예매하기</button>
			</div>
	    </form>

	  </div>

    </div>
    
    <div id="nonMemCheck" class="container tab-pane fade"><br>
      <!-- <h4>비회원예매 확인</h4> -->
      <p style="color: gray">비회원으로 예매하신 고객님은 개인정보(이메일, 생년월일, 비밀번호)를 입력해주세요</p>
      <div class="row" >
      
		  <div class="container col">  
		  
		  <form action="<%=request.getContextPath()%>/nonmemberReservationCheck.do" method="post" class="needs-validation" novalidate>
		  	<h4 style="font-weight : bold">비회원 예매확인</h4>
		  	<table class="table table-borderless">
			  <thead>
			    <tr>
			      <th colspan="2">
			        <p style="color : gray; font-weight:lighter">모든항목은 필수 입력사항입니다</p>
			      	<hr>
			      </th>
			    </tr>
			  </thead>
			  <tbody class="nontb">
			    <tr>
			      <td>생년월일(8자리)</td>
			      <td>
			      	<input type="text" class="form-control" placeholder="ex) 19000101" required name="nonmember_birth">
			      	<div class="valid-feedback">입력되었습니다</div>
    				<div class="invalid-feedback">생년월일을 입력해주세요</div>
			      </td>
			    </tr>
			    <tr>
			      <td>이메일</td>
			      <td>
			      	<div class="input-group">
					   <input type="text" class="form-control inputmail" placeholder="ex) abc123" required name="mail1">
					   <div class="input-group-append">
					     <span class="input-group-text">@</span>
					   </div>
					   <input type="text" class="form-control inputmail" placeholder="exmaple.com" required name="mail2">
					 </div>
			      </td>
			    </tr>
			    <tr>
			      <td>비밀번호</td>
			      <td>
		          	<input type="password" class="form-control" required name="nonmember_pass">
		          	<div class="valid-feedback">입력되었습니다</div>
    				<div class="invalid-feedback">비밀번호확인을 입력해주세요</div>
		      	  </td>
			    </tr>
			  </tbody>
			</table>
			
			<hr>
			
			<div class="d-flex justify-content-center">
		  		<button type="submit" class="btn btn-danger">비회원 예매확인</button>
			</div>
		  </form>
		  
		  </div>
		  
		  <div class="container col">
		  	<h4 style="font-weight : bold">비회원 예매 비밀번호 찾기</h4>
		  	<p style="color : gray; font-weight:lighter; margin-top:20px;">비회원 예매 시 입력한 이메일 번호로 인증을 하면 비회원 예매 비밀번호를 찾으실수 있습니다.</p>
		  	<hr>
		  	<!-- 
		  	[인증절차] 
		  	 - 인증하기 버튼 클릭시 모달창(#mailModal)이 생긴다
		  	 - 모달 창에는 이메일을 입력하여 전송하기 버튼이 있다
		  	 - 전송하기 버튼을 누르면 해당 메일로 랜덤 인증번호가 발송되고 인증번호 입력칸이 활성화 되며
		  	 	인증번호 입력칸에 랜덤 인증번호와 같은 번호를 입력하면 alert로 비밀번호를 알려주고 창이 닫힌다.
		  	 - 인증번호를 틀릴 경우 alert로 틀렸습니다를 출력해준다
		  	 - 3:00이내로 입력하지 않을 경우 닫히며 인증 절차가 취소된다.
		  	-->
		  	<div class="d-flex justify-content-center">
		  		<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#mailModal">이메일로 인증하기</button>
			</div>
		  </div>
		  
	  </div>
    </div>
    
  </div>
</div>



<!-- Modal -->
  <div class="modal fade" id="mailModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">이메일 인증</h4>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <form name="signUpForm">
          
			<label>생년월일</label>
			<input id="mailBirth" type="text" class="form-control" placeholder="ex) 19000101">
			<br>
			
			<label>이메일</label>
				<div class="input-group">
					<input type="text" class="form-control inputmail" placeholder="ex) abc123@exmaple.com"  name="email" id="inputEmailForm">
					<button type="button" class="btn btn-outline-primary" onclick="emailAuthentication()">인증번호 받기</button>
				</div>

			<br>
			
			<label>인증번호</label>
			<div class="input-group">
				<input id="mailcodeInput" type="text" class="form-control" disabled>
	            <button type="button" class="btn btn-primary" disabled onclick="mailcodeChk()">확인</button>
			</div>
			<p style="font-size: 13px; color: gray; margin-top: 10px;">*이메일이 도착하는데 1~2분정도 소요될 수 있습니다.</p>
			
			<p style="color: red; font-weight: bold;" id="passPrint"></p>
			<br>
						

          </form>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
        </div>
        
      </div>
    </div>
  </div>


</body>
</html>