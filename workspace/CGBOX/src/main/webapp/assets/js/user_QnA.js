/**
 * 
 */
var insertQnA = function(){
	$.ajax({
		url : '/CGBOX/QnAInsert.do',
		type : 'post',
		data : QnA,
		success : function(res){
			if(res.sw == "성공"){
				alert("등록 성공!!")
			}else{
				alert("등록 실패@@")
			}
			memberInfo();
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}

 
 var memberInfo = function(){
	
	$.ajax({
		 url : '/CGBOX/QnAmember.do',
		 type: 'post',
		 data: {
			"customer_no" : customer_no
		},
		success : function(res){
			code = '';
			code += '<div id="ccc" class="container mt-3">';
			code += '  <table class="table">';
			code += '    <thead>';
			code += '      <tr>';
			code += '        <th style="text-align:center;" colspan="3">회원정보</th>';
			code += '      </tr>';
			code += '      <tr>';
			code += '        <th>이름</th>';
			code += '        <th>이메일</th>';
			code += '        <th>전화번호</th>';
			code += '      </tr>';
			code += '    </thead>';
			code += '    <tbody>';
			$.each(res.datas, function(i, v){
				
				code += '      <tr class="trclass">';
				code += '        <td class="qname">' + v.member_name + '</td>';
				code += '        <td class="qmail">' + v.member_mail + '</td>';
				code += '        <td class="qtel">' + v.member_tel + '</td>';
				code += '      </tr>';
			})
			code += '    </tbody>';
			code += '  </table>';
			
			code += '<div style="text-align:center;" id="asd"><button type="button" class="questionB" data-toggle="modal" data-target="#modiModal2" >질문하기</button></div>'
		    code += '</div>';
			$('.memberInfo').html(code);
		},
		error : function(xhr){
			alert("상태 : "+xhr.status);
		},
		dataType:'json'
	})
} 