/**
 * 
 */
 
var memberInsert = function(){
	
	$.ajax({
		url : '/CGBOX/MemberInsert.do',
		type : 'post',
		data : member,
		success : function(res){
			if(res.sw == "성공"){
				alert("등록 성공!!")
			}else{
				alert("등록 실패@@")
			}
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
} 
 
var memberUpdate = function(){
	
	$.ajax({
		url : '/CGBOX/MemberUpdate.do',
		type : 'post',
		data : member,
		success : function(res){
			if(res.sw == "성공"){
				mcard.find('.cno').text(no);
				mcard.find('.mgrade').text(gr);
		    	mcard.find('.mid').text(id);
		    	mcard.find('.mname').text(name);
		    	mcard.find('.mmail').text(mail);
		    	mcard.find('.mpass').text(pass);
		    	mcard.find('.mbirth').text(bir);
		    	mcard.find('.mtel').text(tel);
		    	mcard.find('.mpoint').text(point);
				alert("수정 성공!!")
			}else{
				alert("수정 실패@@")
			}
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
} 
 
var memberList = function(){
	
	$.ajax({
		 url : '/CGBOX/MemberList.do',
		 type: 'post',
		 data: {
			'page' : currentPage,
			'stype' : typevalue,
			'sword' :  wordvalue
		},
		success : function(res){
			code = '';
			code += '<div class="container">';
			code +=	'<header class="major">';
//			code +=		'<h2>회원목록</h2>';
			code +=		'</header>';
//			code += '  <h2>회원목록</h2>'
//			code += '<input type="button" id="insertB" name="insert" data-toggle="modal" data-target="#modiModal2" value="등록">';
//			code += '<input type="button" class="updateB" name="update" data-toggle="modal" data-target="#modiModal" value="수정">';
			code += '  <table class="table">';
			code += '    <thead>';
			code += '      <tr class="trclass">';
		//	회원번호 이름 등급 메일 전화번호 포인트 생일  아이디 비밀번호 
			code += '        <th>회원번호</th>';
			code += '        <th>이름</th>';
			code += '        <th>등급</th>';
			code += '        <th>이메일</th>';
			code += '        <th>Tel</th>';
			code += '        <th>포인트</th>';
			code += '        <th>생년월일</th>';
			code += '        <th>ID</th>';
			code += '        <th>비밀번호</th>';
			code += '        <th>수정</th>';
			code += '      </tr>';
			code += '    </thead>';
			code += '    <tbody>';
			$.each(res.datas, function(i, v){
				code += '      <tr class="trclass">';
				code += '        <td class="cno">' + v.customer_no + '</td>';
				code += '        <td class="mname">' + v.member_name + '</td>';
				code += '        <td class="mgrade">' + v.grade_no + '</td>';
				code += '        <td class="mmail">' + v.member_mail + '</td>';
				code += '        <td class="mtel">' + v.member_tel + '</td>';
				code += '        <td class="mpoint">' + v.member_point + '</td>';
				code += '        <td class="mbirth">' + v.member_birth + '</td>';
				code += '        <td class="mid">' + v.member_id + '</td>';
				code += '        <td class="mpass">' + v.member_pass + '</td>';
				code += '        <td class="mbutton"><input type="button" class="updateB" name="update" data-toggle="modal" data-target="#modiModal" value="수정"></td>';
				code += '      </tr>';
			})
			code += '    </tbody>';
			code += '  </table>';
			code += '</div>';
			code += '<br>';
			$('.memberList').html(code);
			
			pcode="";
			pcode = '<ul class="pagination">';
			if(res.startp > 1){ //1보다 클 때만 이전버튼 만들어라
			pcode +='<li class="page-item"><a class="page-link prev" href="#">Previous</a></li>';
			pcode += '</li>'; 
			pcode += '</ul>';  
			       
			} 
			//페이지 목록 출력 $$$%%
		    pcode += '<ul  class="pagination pager">';
			for(i= res.startp ; i<=res.endp; i++){
			    if(currentPage==i){
				pcode+='<li class="page-item active "><a class="page-link pnum" href="#">'+i+'</a></li>';
				
			}else{
			pcode+=	 '<li class="page-item "><a class="page-link pnum" href="#">'+i+'</a></li>';
			  }
			}
             pcode +='</ul>'
             //다음 버튼 출력			 
            if(res.endp <res.totalp) {
	        pcode += '<ul class="pagination">';
			pcode +='<li class="page-item"><a class="page-link next" href="#">Next</a></li>';
			pcode += '</li>'; 
			pcode += '</ul>';
			}	
			
			$('#pagelist').html(pcode);
		},
		error : function(xhr){
			alert("상태 : "+xhr.status);
		},
		dataType:'json'
	})
} 
 