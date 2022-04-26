/**
 * 
 */
 
 
 var FAQDetail = function(){
	$.ajax({
		 url : '/CGBOX/FAQDetail.do',
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
				code += '        <th>&nbsp;제목 : ' + v.faq_question + '</th>';
				code += ' <th></th>'
				code += '        <th style="float:right;">카테고리: ' + v.faq_category + '</th>';
				code += '      </tr>';
				code += '    </thead>';
				code += '    <tbody>';
				code += '     <tr>';
				code += '       <td colspan="3">' + v.faq_answer.replace(/\r/g,"").replace(/\n/g,"<br>").replace(/ /g,"&nbsp;") + '</td>';
				code += '     </tr>';
				code += '    </tbody>';
				code += '  </table>';
				code += '</div>';
				code += '<div><input style="float: right; margin: 20px;" class="backB" type="button" value="목록" onclick="location.href=' + '&#39;user_FAQ.jsp&#39;' + '"></div>';
			})
			
			$('.FAQDetail').html(code);
		},
		error : function(xhr){
			alert("상태 : "+xhr.status);
		},
		dataType:'json'
	})
}
 
 var FAQList = function(){
	
	$.ajax({
		 url : '/CGBOX/FAQList.do',
		 type: 'post',
		 data: {
			'page' : currentPage,
			'stype' : typevalue,
			'sword' :  wordvalue
		},
		success : function(res){
			code = '';
			code += '<div class="container mt-3">';
			code += '  <table class="table">';
			code += '    <thead>';
			code += '      <tr>';
			code += '        <th>번호</th>';
			code += '        <th>카테고리</th>';
			code += '        <th>제목</th>';
			code += '      </tr>';
			code += '    </thead>';
			code += '    <tbody>';
			$.each(res.datas, function(i, v){
				code += '      <tr class="trclass">';
				code += '        <td class="fno">' + v.faq_no + '</td>';
				code += '        <td class="fcategory">' + v.faq_category + '</td>';
				code += '        <td idx="'+v.faq_no+'" style="cursor:pointer;" class="fquestion">' + v.faq_question + '</td>';
				code += '        <td style="display: none;" class="fanswer">' + v.faq_answer + '</td>';
				code += '      </tr>';
			})
			code += '    </tbody>';
			code += '  </table>';
		    code += '</div>';
			$('.FAQList').html(code);
			
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