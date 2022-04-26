<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>

  <title>Bootstrap Example</title>
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
				url : '<%=request.getContextPath() %>/IdCheck.do',
				type : 'get',
				data : {"key" : idvalue},
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
		
		// 우편번호 검색
		$('#zipsearch').on('click', function(){
			event.preventDefault();
			// 새로운 창을 열게 한다. window.open()
			window.open("zipsearch.html", "우편번호", "width=500 height=400");
		})
		
		
		// 우편번호 찾기 - modal로 수행
	$('#btn1').on('click', function(){
		// 입력한 값 가져온다.
		dongvalue = $('#dong').val().trim();
		
		
		// 서버로 전송
		$.ajax({
			url : '/jqpro/ZipSearch.do',
			type : 'get',
			data : {"pwd" : dongvalue},
			success : function(res){
				str = "<table>";
				str += "<tr><td>우편번호</td>";
				str += "<td>주소</td>";
				str += "<td>번지</td></tr>";
				
				
				
				$.each(res, function(i, v){
					
					var bunji = v.bunji;
// 					if(bunji == null)
					// typeof 연산자는 피연산자의 평가 전 자료형을 나타내는 문자열을 반환합니다.
					if(typeof bunji == "undefined")
						bunji = "";
					
					str += "<tr class='ziptr'><td>" + v.zipcode + "</td>";
					str += "<td>"+ v.sido + v.gugun + v.dong + "</td>";
					str += "<td>" + bunji + "</td></tr>"; 
				})
				
				str += "</table>"
				
				
				
				$('#result1').html(str);
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
		
	})
	// ziptr이 처음부터 있는 것이 아니기떄문에 실행이 되지 않는다.
// 	$('.ziptr').on('click', function({}))
	
	// modal은 부모창이 아니다.
	// result1은 처음부터 존재했기 때문에 document대신에 사용해도 된다.
	$('#result1').on('click', '.ziptr', function(){
		zipcode = $("td:eq(0)", this).text();
		addr = $('td:eq(1)', this).text();
		
		$('#uzip').val(zipcode);
		$('#uadd1').val(addr);
		
		// modal에 들어와 있는 값을 지운다.(검색결과 안남게한다.)
		$('#dong').val("");
		$('#result1').empty();
		
		// 값을 선택하고 나면 modal창이 안보이게 한다.
		$('#myModal').modal('hide');
	})
	
	$('form').on('submit', function(){
		// 입력한 모든 값을 가져온다.
		/* id = $('#uid').val()
		name = $('#uname').val()
		date = $('#udate').val()
		pwd = $('#pwd').val()
		tel = $('#utel').val()
		mail = $('#umail').val()
		zip = $('#uzip').val()
		add1 = $('#uadd1').val()
		add2 = $('#uadd2').val() */
		
		
		// 여러데이터를 한번에 받을 때 serialize를 사용한다. form의 name을 db와 일치시켜서 써야된다.
		fdata1 = $('form').serialize();
		fdata2 = $('form').serializeArray();
		// 외부스크립트 추가해야함 ../js/jquery.serializejson.min.js
		fdata3 = $('form').serializeJSON();
		
		console.log(fdata1);
		console.log(fdata2);
		console.log(fdata3);
		

		
		 $.ajax({
			url : '<%= request.getContextPath() %>/Insert.do',
			data : fdata3,
			type : 'post',
			success:function(res){
// 				alert(res.flag);
				$('#joinspan').html(res.flag).css('color','red');
			},
			error : function(xhr){
				alert("상태 : " + xhr.status)
			},
			dataType : 'json'
				 
		})
		
		return false;
		
	})
		
})
	
</script>

<style type="text/css">

#dong{
	margin-left: 20px;
}
.ziptr:hover{
	background : lime;
}


</style>

</head>
<body>

<div class="container">
  <h2>회원가입</h2>
  
  <form class="needs-validation" novalidate>
  
  	<div class="form-group">
      <label for="uid">아이디:</label>
      <button id="idchk" type="button" class="btn btn-info btn-sm mb-2 mr-sm-2" >
      	 <span class="spinner-border spinner-border-sm"></span>
      중복검사</button>
      <br>
      
      <input type="text" class="form-control col-sm-3" id="uid" placeholder="Enter userid" name="mem_id" required>
	  
	  <span id = "idspan"></span>      
      
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
  
    <div class="form-group">
      <label for="uname">이름:</label>
      <input type="text" class="form-control col-sm-3" id="uname" placeholder="Enter username" name="mem_name" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="udate">생년월일:</label>
      <input type="date" class="form-control col-sm-3" id="udate" placeholder="1997.02.13" name="mem_bir" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="pwd">비밀번호:</label>
      <input type="password" class="form-control col-sm-3" id="pwd" placeholder="Enter password" name="mem_pass" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="utel">휴대폰번호:</label>
      <input type="text" class="form-control col-sm-3" id="utel" placeholder="010-1234-5678" name="mem_hp" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group">
      <label for="umail">이메일:</label>
      <input type="text" class="form-control col-sm-3" id="umail" placeholder="abcd1234@gmail.com" name="mem_mail" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
     <div class="form-group">
      <label for="uzip">우편번호:</label>
       <button type="button" class="btn btn-info btn-sm mb-2 mr-sm-2" data-toggle="modal" data-target="#myModal">
      우편번호검색modal</button>
      
      <button type="button" id="zipsearch" class="btn btn-info btn-sm mb-2 mr-sm-2" >
      	 <span class="spinner-border spinner-border-sm"></span>
      우편번호검색</button>
      
      <input type="text" class="form-control col-sm-3" id="uzip" name="mem_zip" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
     <div class="form-group">
      <label for="uadd1">주소:</label>
      <input type="text" class="form-control col-sm-5" id="uadd1" name="mem_add1" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
     <div class="form-group">
      <label for="uadd2">상세주소:</label>
      <input type="text" class="form-control col-sm-5" id="uadd2" name="mem_add2" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    <div class="form-group form-check">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox" name="remember" required> I agree on blabla.
        <div class="valid-feedback">Valid.</div>
        <div class="invalid-feedback">Check this checkbox to continue.</div>
      </label>
    </div>
    
    <button type="submit" class="btn btn-primary btn-lg">제출</button>
    <button type="reset" class="btn btn-primary btn-lg">초기화</button>
    <span id="joinspan"></span>
  </form>
</div>


<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">우편번호찾기</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <input type="text" id="dong">
		<input type="button" value="확인" id="btn1">
		<div id="result1"></div>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>


<script>
// Disable form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Get the forms we want to add validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
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

</body>
</html>
