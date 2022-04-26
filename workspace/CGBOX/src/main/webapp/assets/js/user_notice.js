/**
 * 
 */
 
  var updateNotice = function(){
	$.ajax({
		url : '/CGBOX/NoticeUpdate.do',
		type : 'post',
		data : notice,
		success : function(res){
			if(res.sw == "성공"){
				ncard.find('.ntitle').text(title);
				ncard.find('.ndate').text(date);
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
 
  var insertNotice = function(){
	$.ajax({
		url : '/CGBOX/NoticeInsert.do',
		type : 'post',
		data : notice,
		success : function(res){
			if(res.sw == "성공"){
				alert("등록 성공!!")
			}else{
				alert("등록 실패@@")
			}
			noticeList();
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}
 
  var deleteNotice = function(){
	$.ajax({
		url : '/CGBOX/NoticeDelete.do',
		type : 'post',
		data : { 
			"no" : actionIdx
		},
		success : function(res){
			if(res.sw == "성공"){
				
				alert("삭제 성공!!")
			}else{
				alert("삭제 실패@@")
			}
			noticeList();
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}
 var noticeDetail = function(){
	$.ajax({
		 url : '/CGBOX/NoticeDetail.do',
		 type: 'post',
		 data: {
			"no" : actionIdx
		 },
		 success : function(res){
			code = '';
			code += '<div class="container mt-3">';
			code += '  <table class="table">';
			code += '    <thead>';
			$.each(res.datas, function(i, v){
				code += '      <tr>';
				code += '        <th>&nbsp;제목 : ' + v.notice_title + '</th>';
				code += ' <th></th>'
				code += '        <th style="float:right;">작성일: ' + v.notice_date + '</th>';
				code += '      </tr>';
				code += '    </thead>';
				code += '    <tbody>';
				code += '     <tr>';
				code += '       <td colspan="3">' + v.notice_content.replace(/\r/g,"").replace(/\n/g,"<br>").replace(/ /g,"&nbsp;") + '</td>';
				code += '     </tr>';
				code += '    </tbody>';
				code += '  </table>';
				code += '</div>';
				code += '<div><input style="float: right; margin: 20px;" class="backB" type="button" value="목록" onclick="location.href=' + '&#39;notice.jsp&#39;' + '"></div>';
			})
			
			$('.noticeDetail').html(code);
		},
		error : function(xhr){
			alert("상태 : "+xhr.status);
		},
		dataType:'json'
	})
}
 
 var noticeList = function(){
	
	$.ajax({
		 url : '/CGBOX/NoticeList.do',
		 type: 'post',
		 data: {
			'page' : currentPage,
			'stype' : typevalue,
			'sword' :  wordvalue
		},
		success : function(res){
			code = '';
			code += '<div class="container mt-3">';
//			code += '  <h2>공지사항</h2>';
//			code += '  <p>The .table class adds basic styling (light padding and horizontal dividers) to a table:</p>';            
			code += '  <table class="table">';
			code += '    <thead>';
			code += '      <tr>';
			code += '        <th>번호</th>';
			code += '        <th>제목</th>';
			code += '        <th>작성일</th>';
			code += '      </tr>';
			code += '    </thead>';
			code += '    <tbody>';
			$.each(res.datas, function(i, v){
				code += '      <tr class="trclass">';
				code += '        <td class="nno">' + v.notice_no + '</td>';
				code += '        <td idx="'+v.notice_no+'" style="cursor:pointer;" class="ntitle">' + v.notice_title + '</td>';
				code += '        <td style="display: none;" class="ncontent">' + v.notice_content + '</td>';
				code += '        <td class="ndate">' + v.notice_date + '</td>';
				code += '      </tr>';
			})
			code += '    </tbody>';
			code += '  </table>';
		    code += '</div>';
			$('.noticeList').html(code);
			
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