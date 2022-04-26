/**
 * 
 */
 
 
 var findMember = function(){
	$.ajax({
				url : "/CGBOX/FindMember.do",
				type : "get",
				data : {
					"customer_no" : customer_no

				},
				
				success : function(res){
					str = "<strong style='font-size:2.5em;'>" + res.member_name + "님</strong>";
					str += "<span style='font-size:1.7em;'> " + res.member_id + "</span>";
					
					$('.nameId').html(str);
					findGrade(res.grade_no);
					findProduct();
					findPoint();
					findFavorite();
				},
				error : function(xhr){
					alert("상태 : " + xhr.status);
				},
				dataType : 'json'
			})
	
}

var findGrade = function(grade_no){
	$.ajax({
		url : "/CGBOX/FindGrade.do",
		type : "get",
		data : {
			"grade_no" : grade_no
		},
		success : function(res){
			str = res
			
			
			$('.grade1').html(str);
			$('.grade').html(str);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : "json"
		
	})
	
}

var findProduct = function(){
	$.ajax({
		url : "/CGBOX/FindProduct.do",
		type : "get",
		data : {
			"customer_no" : customer_no
		},
		success : function(res){
			str = "영화관람권&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"
				+ "<strong>" + res + "개</strong>"
			
			
			$('.giftli').html(str);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : "json"
		
	})
	
}

var findPoint = function(){
	$.ajax({
		url : "/CGBOX/FindPoint.do",
		type : "get",
		data : {
			"customer_no" : customer_no
		},
		success : function(res){
			str = "보유 포인트&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"
				+ "<strong>" + res + "점</strong>"
			
			
			$('.pointli').html(str);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : "json"
		
	})
	
}


var selectAllMtheater = function(){
	$.ajax({
		url : "/CGBOX/SelectAllMtheater.do",
		type : "get",
		success : function(res){
		
			str="<option>극장선택</option>";
			$.each(res,function(i,v){
				
				str += "<option>" + v.mtheater_name + "</option>"
				
			})
			
			$('.mtlist').html(str);
			
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : "json"
		
	})
	
}

var findFavorite = function(){
	$.ajax({
		url : "/CGBOX/FindFavorite.do",
		type : "get",
		data : {
			
			"customer_no" : customer_no
		},
		success : function(res){
			if(res == null){
				str= "지정된 영화관이 없습니다."				
			}else{
				str= res;
			}
			
			$('.mt1').html(str);
			
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : "json"
		
	})
	
}


var updateFavorite = function(){
	$.ajax({
		url : "/CGBOX/UpdateFavorite.do",
		type : "post",
		data : {
			"mtheater_name" : mtheater_name,
			"customer_no" : customer_no,
			"mset" : mset
		},
		success : function(res){
			
			if(res > 0){
				console.log("영화관 지정 성공");
				findFavorite();
			}else{
				console.log("영화관 지정 실패");
			}
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : "json"
		
	})
	
}



var memberOutput = function(member){
	$.ajax({
				url : "/CGBOX/FindMember.do",
				type : "get",
				data : {
					"customer_no" : customer_no

				},
				
				success : function(res){
					
					str = "<div class='memContainer'>";
					str +="  <table class='table table-hover'>";                   
					str +="    <thead>           ";                     
					str +="      <tr>              ";                   
					str +="        <th colspan='2' style='text-align:center; background-color:lightgray;'><h3>회원정보</h3></th>";          
					str +="      </tr>";   
					str +="    </thead>";                               
					str +="    <tbody>";                                
					str +="      <tr>              ";                   
					str +="        <th class='ta1'>이름</th>";          
					str +="        <td class='ta2 name'>" + res.member_name + "</td>";      
					str +="      </tr>";                                
					str +="      <tr>";                                 
					str +="        <th class='ta1'>아이디</th>";        
					str +="        <td class='ta2 id'>" + res.member_id + "</td>";           
					str +="      </tr>";                                
					str +="      <tr>";                                 
					str +="        <th class='ta1'>비밀번호</th>";      
					str +="        <td class='ta2'>**************";
					str +="        <input type='hidden' class='pass' value='" + res.member_pass + "'></td>";
					str +="      </tr>";                                
					str +="      <tr>";                                 
					str +="        <th class='ta1'>생년월일</th>";      
					str +="        <td class='ta2 birth'>" + res.member_birth + "</td>";           
					str +="      </tr>";                                
					str +="      <tr>";                                 
					str +="        <th class='ta1'>휴대전화</th>";      
					str +="        <td class='ta2 tel'>" + res.member_tel + "</td>";           
					str +="      </tr>";                                
					str +="      <tr>";                                 
					str +="        <th class='ta1'>메일</th>";          
					str +="        <td class='ta2 mail'>" + res.member_mail + "</td>";        
					str +="      </tr>";                                
					str +="      <tr>";                                 
					str +="        <th class='ta1'>포인트</th>";        
					str +="        <td class='ta2 point'>" + res.member_point + "점</td>";        
					str +="      </tr>"; 
					str +="        <th class='ta1'>등급</th>";        
					str +="        <td class='ta2 grade'>" + $('.grade1').text() + "</td>";        
					str +="      </tr>";                               
					str +="    </tbody>";                               
					str +="  </table>";  
					str +="  <input type='hidden' id='customer_no' name='" + res.customer_no + "'>"                               
					str +="  <button type='button' class='btn btn-outline-danger modimem' data-toggle='modal' data-target='#moModal'>수정</button>"                               
					str +="  <button type='button' class='btn btn-outline-danger modimem' data-toggle='modal' data-target='#delModal'>회원탈퇴</button>"                               
					str +="</div>";                                    
					
					$('.content').html(str);
				},
				error : function(xhr){
					alert("상태 : " + xhr.status);
				},
				dataType : 'json'
			})
}


var updateMember = function(){
	$.ajax({
		url : "/CGBOX/UpdateMember.do",
		type : "post",
		data : member,
		success : function(res){
			
			if(res > 0){
				console.log("회원정보 수정 성공");
					findMember();
			}else{
				console.log("회원정보 수정 실패");
			}
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : "json"
		
	})
}

var deleteFavorite = function(){
	$.ajax({
		url : "/CGBOX/DeleteFavorite.do",
		type : "post",
		data : {
			"customer_no" : customer_no
		},
		success : function(res){
			
			if(res > 0){
				console.log("자주가는 영화관 삭제 성공");
				findFavorite();
			}else{
				console.log("자주가는 영화관 삭제 실패");
			}
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : "json"
		
	})
	
}

var deleteMember = function(){
	$.ajax({
		url : "/CGBOX/DeleteMember.do",
		type : "post",
		data : {
			"customer_no" : customer_no
		},
		success : function(res){
			
			
				console.log("회원 탈퇴 성공");
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : "json"
		
	})
}

var reserveList = function(){
	$.ajax({
		url : "/CGBOX/ReserveList.do",
		type : "get",
		data : {
			"customer_no" : customer_no
		},
		success : function(res){
			
			str = "<div class='rehistory'>";
			str += "<table class='table table-hover' style='text-align:center;'>"
			str += " <thead>                     "
			str += " <tr>                     "
			str += " <th colspan='9' style='background-color:lightgray;'><h3>예매내역</h3> </th>                    "
			str += " </tr>                     "
			str += "      <tr>                   "
			str += "        <th class ='rh1'>티켓번호</th>      "
			str += "        <th class ='rh2'>영화관</th>      "
			str += "        <th class ='rh3'>영화이름</th>    "
			str += "        <th class ='rh2'>상영관</th>      "
			str += "        <th class ='rh1'>좌석번호</th>     "
			str += "        <th class ='rh1'>시작시간</th>    "
			str += "        <th class ='rh1'>종료시간</th>    "
			str += "        <th class ='rh1'>금액</th>        "
			str += "        <th class ='rh1'>상영일</th>      "
			str += "      </tr>                  "
			str += "  </thead>                  "
			if(res.length > 0){
				$.each(res, function(i,v){
				   str += " <tbody>            "
				   str += "   <tr>             "
				   str += "     <td>" + v.TICKET_NO + "</td>     "
				   str += "     <td>" + v.MTHEATER_NAME + "</td>     "
				   str += "     <td style = 'word-break: break-all'>" + v.MOVIE_NAME + "</td>     "
				   str += "     <td>" + v.THEATER_NAME + "관</td>     "
				   str += "     <td>" + v.SEAT_ROW + v.SEAT_COL+ "</td>     "
				   str += "     <td>" + v.SCREEN_START + "</td>     "
				   str += "     <td>" + v.SCREEN_END + "</td>     "
				   str += "     <td>" + v.THEATER_PRICE + "원</td>     "
				   str += "     <td>" + v.SCREEN_DAY + "</td>     "
				   str += "   </tr>            "
				   str += " </tbody>           "
		 
				})	
		}else{
			 str += " <tbody>            "
			 str += "   <tr>             "
			 str += "  <td colspan='9'>고객님의 예매내역이 존재하지 않습니다.</td>             "
			 str += "   </tr>            "
			 str += " </tbody>           "
		}					
			str += "</table>";
			str += "</div>";
			$('.content').html(str);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : "json"
		
	})
	
}

var haveProduct = function(){
	$.ajax({
		url : "/CGBOX/HaveProduct.do",
		type : "get",
		data : {
			"customer_no" : customer_no
		},
		success : function(res){
			
			str = "<div class='havePro'>";
			str += "<table class='table table-hover' style='text-align:center;'>"
			str += " <thead>                     "
			str += " <tr>                     "
			str += " <th colspan='3' style='background-color:lightgray;'><h3>보유상품</h3> </th>                    "
			str += " </tr>                     "
			str += "      <tr>                   "
			str += "        <th class='hp1'>상품번호</th>      "
			str += "        <th class='hp2'>상품명</th>      "
			str += "        <th class='hp1'>보유수량</th>      "
			str += "      </tr>                  "
			str += "  </thead>                  "
			if(res.length > 0){
				$.each(res, function(i,v){
				   str += " <tbody>            "
				   str += "   <tr>             "
				   str += "     <td class='hp1'>" + v.PROD_NO + "</td>     "
				   str += "     <td class='hp2'>" + v.PROD_NAME + "</td>     "
				   str += "     <td class='hp1'>" + v.MYPROD_COUNT + "</td>     "
				   str += "   </tr>            "
				   str += " </tbody>           "
				})	
		}else{
			 str += " <tbody>            "
			 str += "   <tr>             "
			 str += "  <td colspan='3'>고객님의 보유상품이 존재하지 않습니다.</td>             "
			 str += "   </tr>            "
			 str += " </tbody>           "
		}					
			str += "</table>";
			str += "</div>";
			$('.content').html(str);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : "json"
		
	})
	
}


var reviewList = function(){
	$.ajax({
		url : "/CGBOX/ReviewList.do",
		type : "get",
		data : {
			"customer_no" : customer_no
		},
		success : function(res){
			
			str = "<div class='reviewList'>";
			str += "<table class='table table-hover' style='text-align:center;'>"
			str += " <thead>                     "
			str += " <tr>                     "
			str += " <th colspan='3' style='background-color:lightgray;'><h3>리뷰내역</h3> </th>                    "
			str += " <th><button type='button' id='delreview' class='btn btn-outline-danger'>삭제</button></th>                    "
			str += " </tr>                     "
			str += "      <tr>                   "
			str += "        <th><input type='checkbox' id='checkAll'></th>      "
			str += "        <th class='re1'>영화</th>      "
			str += "        <th class='re2'>리뷰</th>      "
			str += "        <th class='re3'>평점</th>      "
			str += "      </tr>                  "
			str += "  </thead>                  "
			if(res.length > 0){
				$.each(res, function(i,v){
					
					
				   str += " <tbody class='par'>            "
				   str += "   <tr>             "
				   str += "     <td><input type='checkbox' name='check'></td>     "
				   str += "     <td >" + v.MOVIE_NAME + "</td>     "
				   str += "     <td style = 'word-break: break-all'>" + v.REVIEW_CONTENT + "</td>     "
				   str += "     <td >" + v.REVIEW_GRADE + "</td>     "
				   str += "     <input type='hidden' id='mno' name='" + v.MOVIE_NO + "'>    "
				   str += "     <input type='hidden' id='cno' name='" + v.CUSTOMER_NO + "'>    "
				   str += "   </tr>            "
				   str += " </tbody>           "
				})	
		}else{
			 str += " <tbody>            "
			 str += "   <tr>             "
			 str += "  <td colspan='4'>고객님의 리뷰내역이 존재하지 않습니다.</td>             "
			 str += "   </tr>            "
			 str += " </tbody>           "
		}					
			str += "</table>";
			str += "</div>";
			$('.content').html(str);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : "json"
		
	})
	
}


var deleteReview = function(){
	$.ajax({
		url : "/CGBOX/DeleteReview.do",
		type : "post",
		data : {
			"mno" : mno,
			"cno" : cno
		},
		success : function(res){
			if(res > 0){
				console.log("리뷰 삭제 성공");
				reviewList();
			}else{
				console.log("리뷰 삭제 실패");
			}
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : "json"
		
	})
	
}

var getQna = function(){
	$.ajax({
		url : "/CGBOX/GetQna.do",
		type : "get",
		data : {
			"customer_no" : customer_no
		},
		success : function(res){
			str = "<div class='qnaList'>";
			str += "<table class='table table-hover' style='text-align:center;'>"
			str += " <thead>                     "
			str += " <tr >                     "
			str += " <th colspan='4' style='background-color:lightgray;'><h3>문의내역</h3> </th>                    "
			str += " <th><button type='button' id='delqna' class='btn btn-outline-danger'>삭제</button></th>                    "
			str += " </tr>                     "
			str += "      <tr>                   "
			str += "        <th><input type='checkbox' id='qnacheckAll'></th>      "
			str += "        <th class='qna1'>문의번호</th>      "
			str += "        <th class='qna2'>질문</th>      "
			str += "        <th class='qna3'>답변</th>      "
			str += "        <th class='qna4'>등록일</th>      "
			str += "      </tr>                  "
			str += "  </thead>                  "
			if(res.length > 0){
				$.each(res, function(i,v){
					if(v.qna_answer == null){
						v.qna_answer = '답변이 작성되지 않았습니다.'
					}
					
				   str += " <tbody class='qnapar'>            "
				   str += "   <tr>             "
				   str += "     <td ><input type='checkbox' name='qnacheck'></td>     "
				   str += "     <td class='qnainfo' id='qnano'>" + v.qna_no + "</td>     "
					if(v.qna_question.length > 25){
						qu = v.qna_question.substr(0,25);
						qu += '.....';
						
						str += "     <td class='qnainfo' style = 'word-break: break-all' data-toggle='modal' data-target='#qnaModal'>" + qu + "</td>     "
					}else{
						str += "     <td class='qnainfo' style = 'word-break: break-all' data-toggle='modal' data-target='#qnaModal'>" + v.qna_question + "</td>     "
					}
					
					if(v.qna_answer.length > 25){
						an = v.qna_answer.substr(0,25);
						an += '.....';
					   str += "     <td class='qnainfo' style = 'word-break: break-all' id='a'data-toggle='modal' data-target='#qnaModal'>" + an + "</td>     "
					}else{
					   str += "     <td class='qnainfo' style = 'word-break: break-all' id='a'data-toggle='modal' data-target='#qnaModal'>" + v.qna_answer + "</td>     "
					}
					
				   str += "     <td class='qnainfo' id='qdate' data-toggle='modal' data-target='#qnaModal'>" + v.qna_date + "</td>     "
				   str += " <input type='hidden' id='que' value='" + v.qna_question + "'>"
				   str += " <input type='hidden' id='ans' value='" + v.qna_answer + "'>"
				   str += "   </tr>            "
				   str += " </tbody>           "
				})	
		}else{
			 str += " <tbody>            "
			 str += "   <tr>             "
			 str += "  <td colspan='5'>고객님의 문의내역이 존재하지 않습니다.</td>             "
			 str += "   </tr>            "
			 str += " </tbody>           "
		}					
			str += "</table>";
			str += "</div>";
			$('.content').html(str);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : "json"
		
	})
	
}


var deleteQna = function(){
	
	$.ajax({
		url : "/CGBOX/DeleteQna.do",
		type : "post",
		data : {
			"qnano" : qnano
		},
		success : function(res){
			if(res > 0){
				console.log("문의 삭제 성공");
				getQna();
			}else{
				console.log("문의 삭제 실패");
			}
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : "json"
		
	})
	
}


var payList = function(){
	$.ajax({
		url : "/CGBOX/PayList.do",
		type : "get",
		data : {
			"customer_no" : customer_no
		},
		success : function(res){
			
			str = "<div class='paylist'>";
			str += "<table class='table table-hover' style='text-align:center;'>"
			str += " <thead>                     "
			str += " <tr>                     "
			str += " <th colspan='4' style='background-color:lightgray;'><h3>결제내역</h3> </th>                    "
			str += " </tr>                     "
			str += "      <tr>                   "
			str += "        <th class ='p11'>결제번호</th>      "
			str += "        <th class ='pl1'>상품명</th>      "
			str += "        <th class ='pl1'>결제금액</th>    "
			str += "        <th class ='pl1'>결제일자</th>      "
			str += "      </tr>                  "
			str += "  </thead>                  "
			if(res.length > 0){
				$.each(res, function(i,v){
				   str += " <tbody>            "
				   str += "   <tr>             "
				   str += "     <td>" + v.PAY_NO + "</td>     "
				   str += "     <td>" + v.PROD_NAME + "</td>     "
				   str += "     <td>" + v.PAY_AMOUNT + "</td>     "
				   str += "     <td>" + v.PAY_DATE + "</td>     "
				   str += "   </tr>            "
				   str += " </tbody>           "
		 
				})	
		}else{
			 str += " <tbody>            "
			 str += "   <tr>             "
			 str += "  <td colspan='4'>고객님의 결제내역이 존재하지 않습니다.</td>             "
			 str += "   </tr>            "
			 str += " </tbody>           "
		}					
			str += "</table>";
			str += "</div>";
			$('.content').html(str);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : "json"
		
	})
	
}


