/**
 * 
 */
 
  var answerQnA = function(){
	$.ajax({
		url : '/CGBOX/QnAAnswer.do',
		type : 'post',
		data : QnA,
		success : function(res){
			if(res.sw == "성공"){
				alert("답변 완료!!")
			}else{
				alert("실패@@")
			}
			QnAList();
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}
 


 
 var QnAList = function(){
	
	$.ajax({
		 url : '/CGBOX/QnAList.do',
		 type: 'post',
		 
		success : function(res){
			code = '';
			code += '<div class="container mt-3">';
			code += '  <table class="table">';
			code += '    <thead>';
			code += '      <tr>';
			code += '        <th>번호</th>';
			code += '        <th>질문</th>';
			code += '        <th>작성자</th>';
			code += '        <th>작성일</th>';
			code += '        <th>답변하기</th>';
			code += '      </tr>';
			code += '    </thead>';
			code += '    <tbody>';
			$.each(res.datas, function(i, v){
				
				code += '      <tr class="trclass">';
				code += '        <td class="qno">' + v.qna_no + '</td>';
				code += '        <td class="qquestion">' + v.qna_question + '</td>';
				code += '        <td class="qname">' + v.member_name + '</td>';
				code += '        <td class="qdate">' + v.qna_date + '</td>';
				code += '        <td><input type="button" class="answerB" name="answer" data-toggle="modal" data-target="#modiModal" value="답변"></td>';
				code += '      <td style="display:none;" class="qanswer">'+ v.qna_answer +'</td>';
				code += '      </tr>';
			})
			code += '    </tbody>';
			code += '  </table>';
		    code += '</div>';
			$('.QnAList').html(code);
		},
		error : function(xhr){
			alert("상태 : "+xhr.status);
		},
		dataType:'json'
	})
} 