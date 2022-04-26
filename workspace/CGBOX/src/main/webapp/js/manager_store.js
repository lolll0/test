/**
 * 
 */
  
  var deleteProd = function(){
	$.ajax({
		url : '/CGBOX/ProdDelete.do',
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
			prodList();
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}
 
  var updateProd = function(){
	$.ajax({
		url : '/CGBOX/ProdUpdate.do',
		type : 'post',
		data : prod,
		success : function(res){
			if(res.sw == "성공"){
				
				alert("수정 성공!!")
				prodList();
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
 
 var insertProd = function(){
	$.ajax({
		url : '/CGBOX/ProdInsert.do',
		type : 'get',
		data : prod,
		success : function(res){
			if(res.sw == "성공"){
				alert("등록 성공!!")
			}else{
				alert("등록 실패@@")
			}
			prodList();
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
			
		},
		dataType : 'json'
	})
}

 
 var prodList = function(){
	
	$.ajax({
				url : "/CGBOX/ProdList.do",
				type : "get",
				data : {
					"category" : category 
				},
				
				success : function(res){
					
					str = storestr + "<hr>";
					
					str += "<ul>";
					$.each(res, function(i,v){
						str += "<li class='liclass'><div class='wrapper'><img class='pimg' src='" + v.prod_source +"' alt='CGV콤보'>";
						str += "<h5 class='pname'><strong>" + v.prod_name+ "</strong></h5>";
						str += "<h6 class='pdetail'><strong>" +v.prod_detail + "</strong></h6>";
						str += "<p class='pprice'><strong>" +v.prod_price+ "원</strong></p>";
						str += "<div class='darkness'></div>";
						str += "<img src='https://cdn-icons-png.flaticon.com/512/618/618552.png' class='buy'>"
						str += "<img src='http://efairplay.img2.kr/moonbanggu/07_site/img/bk_ico.png' class='cart'>"
						str += '<input type="button" class="updateB" name="update" data-toggle="modal" data-target="#modiModal" value="수정">';
						str += '<input idx="'+ v.prod_no+ '" style="float:right;" type="button" class="deleteB" value="삭제">';
						str += "<p style='visibility: hidden;' class='pcategory'><strong>" +v.prod_category+ "</strong></p>";
						str += "<div class='pno' hidden>" + v.prod_no + "</div></div></li>";
					})
					str +="</ul>";
		
					$('#list').html(str);
				},
				error : function(xhr){
					alert("상태 : " + xhr.status);
				},
				dataType : 'json'
			})
			
}

var cartCount = function(){
	$.ajax({
				url : "/CGBOX/CartCount.do",
				type : "get",
				data : {
					"customer_no" : customer_no
				},
				
				success : function(res){
					
					str = res;
		
					$('.cartCount').html(str);
				},
				error : function(xhr){
					alert("상태 : " + xhr.status);
				},
				dataType : 'json'
			})
}

var findCart = function(){
	$.ajax({
				url : "/CGBOX/FindCart.do",
				type : "get",
				data : {
					"customer_no" : customer_no
				},
				
				success : function(res){
					
					if(res <= 0){
						insertCart();
					}
					
					
				},
				error : function(xhr){
					alert("상태 : " + xhr.status);
				},
				dataType : 'json'
			})
}

var insertCart = function(){
	$.ajax({
				url : "/CGBOX/InsertCart.do",
				type : "post",
				data : {
					"customer_no" : customer_no
				},
				
				success : function(res){
					if(res>0){
						console.log("장바구니 생성");
					} else {
						console.log("장바구니 생성 실패");
					}
					
				},
				error : function(xhr){
					alert("상태 : " + xhr.status);
				},
				dataType : 'json'
			})
	
}


var insertCartprod = function(){
	$.ajax({
				url : "/CGBOX/InsertCartprod.do",
				type : "post",
				data : {
					"customer_no" : customer_no,
					"prod_no" : prod_no
				},
				
				success : function(res){
					if(res>0){
						cartCount();
						alert("장바구니 넣기 성공");
					}else {
						alert("장바구니에 있는 상품입니다.");
					}
				},
				error : function(xhr){
					alert("상태 : " + xhr.status);
				},
				dataType : 'json'
			})
	
}


var insertCartprod2 = function(){
	$.ajax({
				url : "/CGBOX/InsertCartprod.do",
				type : "post",
				data : {
					"customer_no" : customer_no,
					"prod_no" : prod_no
				},
				
				success : function(res){
					if(res>0){
						cartCount();
						alert("장바구니에 등록 되었습니다. 구매 페이지로 이동합니다.");
					}else {
						alert("장바구니에 등록 되어 있는 상품입니다. 구매 페이지로 이동합니다.");
					}
				},
				error : function(xhr){
					alert("상태 : " + xhr.status);
				},
				dataType : 'json'
			})
	
}