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
	
 <script src="../js/store.js"></script>		
<title>CGBOX STORE</title>


<script>
	customer_no =0;
	
<% 

MemberVO vo = (MemberVO)session.getAttribute("loginmember");
if(vo != null){
%>
customer_no = <%=vo.getCustomer_no() %>;
<%
}
%>

	// 상품 카테고리
	category= "";
	// 회원 고객번호로 장바구니가 있는지 확인하는 변수
	// 세션 
	
	$(function(){
		
		// 스토어 전체항목 소개문구
		storestr = "<h3>CGVBOX STORE</h3>";
		if(customer_no != 0){
			findCart();
			cartCount();
		}
		prodList();
		
		
		$('.menu').on('click',function(){
			category = $(this).attr('id').trim();
				
			switch(category){
			case "영화관람권":
				storestr = "<h3>영화관람권<span> 영화, 모두에게 즐거운 경험</span></h3>";
				break;
			case "콤보":
				storestr = "<h3>콤보<span> 맛있으면 0칼로리, 아는 맛이 제일 맛있어요</span></h3>";
				break;
			case "팝콘":
				storestr = "<h3>팝콘<span> 영화에는 팝콘이죠! 안먹으면 서운해요</span></h3>";
				break;
			case "음료":
				storestr = "<h3>음료<span> 탄산음료부터 에이드까지, 마시는 즐거움!</span></h3>";
				break;
			case "스낵":
				storestr = "<h3>스낵<span> 출출할땐 다양한 스낵이 정답이죠</span></h3>";
				break;
			default :
				storestr = "<h3>CGVBOX STORE</h3>";
			}
			
			prodList();
		})
		
		
		$('.cartMove').on('click',function(){
			if(customer_no == 0){
				if(confirm("로그인이 필요한 서비스입니다.\n로그인 페이지로이동하시겠습니까?")){
					window.location.href= "../ticketing/NonMember_reservations.jsp";
				} else{
				}
			}else{
				alert("장바구니로 이동합니다.");
				// 장바구니 경로
				window.location.href="<%=request.getContextPath()%>/CartServlet.do";
			}
			

		})
		
		$(document).on('click',".cart",function(){
			if(customer_no == 0){
				if(confirm("로그인이 필요한 서비스입니다.\n로그인 페이지로이동하시겠습니까?")){
					window.location.href= "../ticketing/NonMember_reservations.jsp";
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
					window.location.href= "../ticketing/NonMember_reservations.jsp";
				} else{
				}
			}else{
				prod_no = $(this).next().next().text();
				insertCartprod2();
				// 장바구니 경로
				window.location.href="<%=request.getContextPath()%>/CartServlet.do";
			}
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
		margin-bottom: 80px;
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
   .container{ 
	margin-top: 50px; 
  } 
  nav{
	background: rgb(220,53,69);
	background: linear-gradient(90deg, rgba(220,53,69,1) 0%, rgba(220,53,69,1) 29%, rgba(255,66,0,1) 100%);
}
</style>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top" >
  <!-- Brand -->
  <a class="navbar-brand" href="../main/mainPage.jsp">CGBOX</a>

  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="../movie/movieChart.jsp">영화</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">극장</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="../ticketing/reservation.jsp">예매</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="storePage.jsp">스토어</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="../user_event.jsp">이벤트</a>
    </li>
  </ul>
  
  <ul class="navbar-nav" style="margin-left:1300px;" >
    <li class="nav-item">
      <a class="nav-link" href="../ticketing/NonMember_reservations.jsp" style="float:right;">로그인</a>
      </li>
      <li class="nav-item">
      <a class="nav-link" href="../myPage/myPage.jsp" style="float:right;">MyPage</a>
      </li>
      <li class="nav-item">
      <a class="nav-link" href="../user_FAQ.jsp" style="float:right;">고객센터</a>
      </li>
      </ul>
</nav>
  
  
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
<div class="rightMenu">
  <ul class="nav justify-content-end cartclick" role="tablist">
  	<li>
  		 <strong class="nav-link cartMove">장바구니</strong>
  	</li>
  	<li>
  		 <div class="cartCount">0</div>
  	</li>
  </ul>
</div>
 
  <hr class="menuLine" style="border:1px solid red;">
  
  
    <div id="list"></div>
  
   <hr class="menuLine">
</div>


</body>
</html>