/**
 * 
 */
 
 var eventList = function(){
	
	$.ajax({
		url : '/CGBOX/EventList.do',
		type : 'post',
		data : {
			'page' : currentPage,
			'stype' : typevalue,
			'sword' :  wordvalue
		},
		success : function(res){
			code = '';
			$.each(res.datas, function(i, v){
				 
				code += '<article class="arclass">';
				code += '	<a href="' + v.event_detail + '" class="image"><img src="' + v.event_src + '" alt="' + v.event_title + '" /></a>';
				code += '	<h3 class="etitle">' + v.event_title + '</h3>';
//				code += '	<p>' + v.event_content + '</p>';
				code += '	<p style="visibility: hidden;" class="eno">' + v.event_no + '</p>';
				code += '	<p>기간 : <span class="estart">' + v.event_start +'</span> ~ <span class="eend">' + v.event_end + '</span></p>';
//				code += '	<ul class="actions">';
//				code += '		<li><a href="#" class="button">More</a></li>';
//				code += '	</ul>';
				code += '</article>';
			})

//			code += '<article>';
//			code += '	<a href="#" class="image"><img src="images/pic06.jpg" alt="" /></a>';
//			code += '	<h3>Amet varius aliquam</h3>';
//			code += '	<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>';
//			code += '	<ul class="actions">';
//			code += '		<li><a href="#" class="button">More</a></li>';
//			code += '	</ul>';
//			code += '</article>';
			
			$('.posts').html(code);
			
			//이전버튼 출력
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