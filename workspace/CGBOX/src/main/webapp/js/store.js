/**
 * 
 */
 
 
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
						str += "<li><div class='wrapper'><img src='" + v.prod_source +"' alt='CGV콤보'>";
						str += "<h5><strong>" + v.prod_name+ "</strong></h5>";
						str += "<h6><strong>" +v.prod_detail + "</strong></h6>";
						str += "<p><strong>" +v.prod_price+ "원</strong></p>";
						str += "<div class='darkness'></div>";
						str += "<img src='https://cdn-icons-png.flaticon.com/512/618/618552.png' class='buy'>"
						str += "<img src='http://efairplay.img2.kr/moonbanggu/07_site/img/bk_ico.png' class='cart'>"
						str += "<div hidden>" + v.prod_no + "</div></div></li>";
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