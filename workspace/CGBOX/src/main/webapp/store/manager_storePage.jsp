<%@page import="cgbox.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--   <script src="../js/jquery.serializejson.min.js"></script> 	 -->
 <script src="../js/manager_store.js"></script>		
<title>CGBOX STORE 관리</title>


<script>
	customer_no =0;
	customer_no1 = '';
	prod = { };
<% 

MemberVO vo = (MemberVO)session.getAttribute("loginMember");
if(vo != null){
%>
customer_no1 = <%=vo.getCustomer_no() %>;
<%
}
%>

	// 상품 카테고리
	category= "";
	// 회원 고객번호로 장바구니가 있는지 확인하는 변수
	// 세션 
	
	$(function(){
		
		// 스토어 전체항목 소개문구
		storestr = "<h3>CGVBOX STORE<input class='insertB' style='float:right;' data-toggle='modal' data-target='#modiModal2' type='button' value='등록'></h3>";
		if(customer_no != 0){
			findCart();
			cartCount();
		}
		prodList();
		
		//등록버튼
		$('body').on('click', '.insertB', function(){
			$('#modiModal2 #name2').val("");
	 		$('#modiModal2 #category2').val("");
	 		$('#modiModal2 #price2').val("");
	 		$('#modiModal2 #detail2').val("");
	 		$('#modiModal2 #source2').val("");
		})
		
		$('#modisend2').on('click', function(){
			
			name = $('#modiModal2 #name2').val();
			category2 = $('#modiModal2 #category2').val();
			price = $('#modiModal2 #price2').val();
			detail = $('#modiModal2 #detail2').val();
			source = $('#modiModal2 #source2').val();
			
			prod.name = name;
			prod.category = category2;
			prod.price = price;
			prod.detail = detail;
			prod.source = source;
			
			//서버로 보내기
	 		insertProd();
	 		
	 		//창닫기
			$('#modiModal2').modal('hide');
	 		
	 		prodList();
		})
		
		//수정버튼
		$('body').on('click', '.updateB', function(){
		
			//수정창 띄우기 - 수정할 내용(원래 내용)들을 출력 
	    	pcard = $(this).parents('.liclass');
			
			no = pcard.find('.pno').text();
			name = pcard.find('.pname').text();
			category2 = pcard.find('.pcategory').text();
			price = pcard.find('.pprice').text();
			detail = pcard.find('.pdetail').text();
			src = pcard.find('.pimg').attr('src');
			
			$('#modiModal #no').val(no);
			$('#modiModal #name').val(name);
			$('#modiModal #category').val(category2);
			$('#modiModal #price').val(price);
			$('#modiModal #detail').val(detail);
			$('#modiModal #source1').val(src);
			
			
			$('#modiModal #no').prop('disabled', true);
		})
		
		$('#modisend').on('click', function(){
			
			no = $('#modiModal #no').val();
			name2 = $('#modiModal #name').val();
			category2 = $('#modiModal #category').val();
			price = $('#modiModal #price').val();
		
			price = price.slice(0, price.indexOf("원"));
			detail = $('#modiModal #detail').val();
			psource = $('#modiModal #source1').val();
			
			prod.no = no;
			prod.name = name2;
			prod.category = category2;
			prod.price = price;
			prod.detail = detail;
			prod.psource = psource;
			
			updateProd();
			
			//창닫기
			$('#modiModal').modal('hide');
	 		
		})
		
		//삭제버튼
		$('body').on('click', '.deleteB', function(){
			actionIdx = $(this).attr('idx');
			if(confirm("정말 삭제하시겠습니까?")==true){
				deleteProd(this);
			}
 		})
		
		
		$('.menu').on('click',function(){
			category = $(this).attr('id').trim();
				
			switch(category){
			case "영화관람권":
				storestr = "<h3>영화관람권<span> 영화, 모두에게 즐거운 경험</span><input class='insertB' style='float:right;' data-toggle='modal' data-target='#modiModal2' type='button' value='등록'></h3>";
				break;
			case "콤보":
				storestr = "<h3>콤보<span> 맛있으면 0칼로리, 아는 맛이 제일 맛있어요</span><input class='insertB' style='float:right;' data-toggle='modal' data-target='#modiModal2' type='button' value='등록'></h3>";
				break;
			case "팝콘":
				storestr = "<h3>팝콘<span> 영화에는 팝콘이죠! 안먹으면 서운해요</span><input class='insertB' style='float:right;' data-toggle='modal' data-target='#modiModal2' type='button' value='등록'></h3>";
				break;
			case "음료":
				storestr = "<h3>음료<span> 탄산음료부터 에이드까지, 마시는 즐거움!</span><input class='insertB' style='float:right;' data-toggle='modal' data-target='#modiModal2' type='button' value='등록'></h3>";
				break;
			case "스낵":
				storestr = "<h3>스낵<span> 출출할땐 다양한 스낵이 정답이죠</span><input class='insertB' style='float:right;' data-toggle='modal' data-target='#modiModal2' type='button' value='등록'></h3>";
				break;
			default :
				storestr = "<h3>CGVBOX STORE<input class='insertB' style='float:right;' data-toggle='modal' data-target='#modiModal2' type='button' value='등록'></h3>";
			}
			
			prodList();
		})
		
		
		$('.cartMove').on('click',function(){
			if(customer_no == 0){
				if(confirm("로그인이 필요한 서비스입니다.\n로그인 페이지로이동하시겠습니까?")){
					window.location.href= "../myPage/myPage.jsp";
				} else{
				}
			}else{
				alert("장바구니로 이동합니다.");
			}
			

		})
		
		$(document).on('click',".cart",function(){
			if(customer_no == 0){
				if(confirm("로그인이 필요한 서비스입니다.\n로그인 페이지로이동하시겠습니까?")){
					window.location.href= "../myPage/myPage.jsp";
				} else{
				}
			}else{
				prod_no = $(this).next().text();
				insertCartprod();
			}
		})
		
		$(document).on('click',".buy",function(){
			if(customer_no == 0){
				if(confirm("로그인이 필요한 서비스입니다.\n로그인 페이지로이동하시겠습니까?")){
					window.location.href= "../myPage/myPage.jsp";
				} else{
				}
			}else{
				prod_no = $(this).next().next().text();
				insertCartprod2();
			}
			/* window.location.href=""; */
		})
	})
	

</script>

<style>
	body{
 		min-width: 1500px; 
	}
	.nav-item > .active {
	
	color : red !important;
    background-color:white !important;
    text-decoration: underline !important;
    
	}

	span{
		font-size: 15px;
	}
	
	ul {
		list-style: none;
	}
	
	.wrapper{
		float: left; 
		
		margin-right: 40px;
		margin-bottom: 150px;
	}
	
	
	.wrapper{

		position:relative;
		 width:200px;
  		height:200px;
	}
	
	.wrapper img {
		position:relative;
		width:inherit;
	  height:inherit;
	}
	
	.darkness {
  position:absolute;
  top:0;
  left:0;
  width:inherit;
  height:inherit;
  background:#000000;
  /* 추가된 부분 */
  opacity:0;

}
	.wrapper .cart {
  position:absolute;
  top:70px;
  left:30px;
   width:55px;
  height:55px;
  background:white;
  border-radius:30%;
  border : 3px solid black;
  
  /* 추가된 부분 */
  opacity:0;
 
}

.wrapper .buy {
  position:absolute;
  top:70px;
  left:120px;
   width:55px;
  height:55px;
  background:white;
  border-radius:30%;
  border : 3px solid black;
  
  /* 추가된 부분 */
  opacity:0;
 
}
  
	
	
.wrapper:hover .darkness{
  opacity:0.2;
}

/* 추가된 부분 */
.wrapper:hover .cart, .wrapper:hover .buy{
  opacity:1;
  
  
}

  #list{
  	margin: 50px 50px;
  	
  }
  .nav{
  	margin: 20px 50px;
  }
  
  .leftMenu{
  	float:left;
  	width: 70%;
  }

  .rightMenu{
  	float:right;
  	width: 25%;
  }
  
  .menuLine{
  	clear : both;
  }
  
  .cartCount{
  	background-color: red;
  	border-radius: 50%;
  	color: white;
  	width: 25px;
	height: 25px;
	text-align:center;
  }
  
  .cartclick{
  	border-left: 1px solid lightgray;
  }
  input[type="button"]{z-index: -1; }
</style>
</head>
<body>

<div class="container" >
 <div class="leftMenu">
  <ul class="nav menuLine" role="tablist">
    <li class="nav-item">
      <strong class="nav-link active menu" data-toggle="pill" id="">전체</strong>
    </li>
    <li class="nav-item">
      <strong class="nav-link menu" data-toggle="pill" id="영화관람권">영화관람권</strong>
    </li>
    <li class="nav-item">
      <strong class="nav-link menu" data-toggle="pill" id="콤보">콤보</strong>
    </li>
    <li class="nav-item">
      <strong class="nav-link menu" data-toggle="pill" id="팝콘">팝콘</strong>
    </li>
    <li class="nav-item">
      <strong class="nav-link menu" data-toggle="pill" id="음료">음료</strong>
    </li>
    <li class="nav-item">
      <strong class="nav-link menu" data-toggle="pill" id="스낵">스낵</strong>
    </li>
  </ul>
</div>  
<!-- <div class="rightMenu"> -->
<!--   <ul class="nav justify-content-end cartclick" role="tablist"> -->
<!--   	<li> -->
<!--   		 <strong class="nav-link cartMove">장바구니</strong> -->
<!--   	</li> -->
<!--   	<li> -->
<!--   		 <div class="cartCount">0</div> -->
<!--   	</li> -->
<!--   </ul> -->
<!-- </div> -->
 
  <hr class="menuLine" style="border:1px solid red;">
  
  
    <div id="list"></div>
  
   <hr class="menuLine">
</div>

<!-- The Modal -->
<div class="modal" id="modiModal">
  <div class="modal-dialog">
    <div class="modal-content">

<!--       Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">상품 수정</h4>
<!--         <button type="button" class="close" data-dismiss="modal">&times;</button> -->
      </div>

<!--       Modal body -->
      <div class="modal-body">
        <form id="modiForm">
        	<label>상품 번호</label> 
        	<input id="no" type="text" name="no"><br><br>
        
        	<label>상품 이름</label> 
        	<input id="name" type="text" name="name"><br><br>
        
        	<label>상품 분류</label>
        	<input id="category" type="text" name="category"><br><br>
        	
        	<label>가격&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
        	<input id="price" type="text" name="price"><br><br>
        	
        	<label>세부사항&nbsp;</label>
        	<input id="detail" type="text" name="detail"><br><br>
        	
        	<label>이미지소스</label><br>
<!--         	<input id="source1" type="text" name="source1"><br> -->
        	<textarea id="source1" name="source1" rows="3" cols="60"></textarea>
        	<br>
        	<input type="hidden" id="num" name="num">
        	<input  style="float: right;" type="button" id="modisend" value="수정">
        </form>
      </div>

<!--       Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div> 
		
<!-- The Modal2 -->
<div class="modal" id="modiModal2">
  <div class="modal-dialog">
    <div class="modal-content">

<!--       Modal Header2 -->
      <div class="modal-header">
        <h4 class="modal-title">상품 등록</h4>
<!--         <button type="button" class="close" data-dismiss="modal">&times;</button> -->
      </div>

<!--       Modal body2 -->
      <div class="modal-body">
        <form id="modiForm2">
        
        	<label>상품 이름</label> 
        	<input id="name2" type="text" name="name2"><br><br>
        
        	<label>상품 분류</label>
        	<input id="category2" type="text" name="category2"><br><br>
        	
        	<label>가격&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</</label>
        	<input id="price2" type="text" name="price2"><br><br>
        	
        	<label>세부사항&nbsp;</label>
        	<input id="detail2" type="text" name="detail2"><br><br>
        	
        	<label>이미지소스</label><br>
<!--         	<input id="source2" type="text" name="source2"><br> -->
        	<textarea id="source2" name="source2" rows="3" cols="60"></textarea>
        	<br>
        	<input type="hidden" id="num2" name="num">
        	<input style="float: right;" type="button" id="modisend2" value="등록">
        </form>
      </div>

<!--       Modal footer2 -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div> 


</body>
</html>