<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Swiper 쉬운 예제 모음 : Swiper 그룹 다중 슬라이드 (Multiple Slides Per Group)</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>






<!-- 예제 시작 -->

<!-- 이 예제에서는 필요한 js, css 를 링크걸어 사용 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<style type="text/css">

.swiper-container {
	height:420px;
	border:5px solid silver;
	border-radius:7px;
	box-shadow:0 0 20px #ccc inset;
	
}
.swiper-slide {
	text-align:center;
	display:flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
	align-items:center; /* 위아래 기준 중앙정렬 */
	justify-content:center; /* 좌우 기준 중앙정렬 */
}
.swiper-slide img {
	box-shadow:0 0 5px #555;
	max-width:100%; /* 이미지 최대너비를 제한, 슬라이드에 이미지가 여러개가 보여질때 필요 */
	/* 이 예제에서 필요해서 설정했습니다. 상황에따라 다를 수 있습니다. */
}


.btn-plus span {
/*   font-size:0.8em; */
  font-size:0.1vw;
  color:black;
/*   user-select:none; */
}
.btn-plus1 span {
  font-size:0.1vw;
  color:#ffffff;
/*   user-select:none; */
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
  transition:all .6s linear;
}

img + .btn-plus {
  position:absolute;
  top:50px;
  left:50px;
  background:red;
  max-width:60px;
  max-height:30px;
/*   border-radius:25%;  */
  text-align:center;
  /* 추가된 부분 */
  opacity:0;
  transform:scale(2);
  transition:all .3s linear;
}
.btn-plus{
	background: lightgray;
	
	max-width: 60px;
	max-height: 30px;
	margin-right: 10px;
}
img + .btn-plus1 {
  position:absolute; 
  top:auto;
  left:auto;
  background:red;
  
  max-width:60px;
  max-height:30px;
  
/*   border-radius:25%;  */
  text-align:center;
  /* 추가된 부분 */
  opacity:0;
  transform:scale(2);
  transition:all .3s linear;
}


.swiper-slide{
	width: 150px;
	heigth: 200px;
 	position: relative; 
	float: left;
	margin : 15px;
	cursor:pointer;
}
.swiper-slide img{
/* 	width:inherit; */
/* 	heigth: inherit; */
	position: absolute;
}
/* 추가된 부분 */
.swiper-slide:hover .btn-plus {
  opacity:1;
  transform:scale(1);
}
/* 추가된 부분 */
.swiper-slide:hover .btn-plus1{
  opacity:1;
  transform:scale(1);
}
/* 추가된 부분 */
img:hover .darkness{
  opacity:0.4;
}
a{
	text-decoration: none;
}
</style>

</head>
<body>
<!-- 클래스명은 변경하면 안 됨 -->
<div class="swiper-container">
	<div class="swiper-wrapper">
		<div class="swiper-slide">
			<img class=img src="http://ktsmemo.cdn3.cafe24.com/p/0128.jpg">
			<div class="darkness"></div>
			<div class="btn-plus"><a href="#"><span draggable="false">예매하기</span></a></div><br>
			<div class="btn-plus1"><a href="#"><span draggable="false">상세보기</span></a></div>
		</div>
		
		<div class="swiper-slide">
			<img src="http://ktsmemo.cdn3.cafe24.com/p/0128.jpg">
			<div class="darkness"></div>
			<div class="btn-plus"><a href="#"><span draggable="false">예매하기</span></a></div>
			<div class="btn-plus1"><a href="#"><span draggable="false">상세보기</span></a></div>
		</div>
		
		<div class="swiper-slide">
			<img src="http://ktsmemo.cdn3.cafe24.com/p/0128.jpg">
			<div class="darkness"></div>
			<div class="btn-plus"><a href="#"><span draggable="false">예매하기</span></a></div>
			<div class="btn-plus1"><a href="#"><span draggable="false">상세보기</span></a></div>
		</div>
		
		<div class="swiper-slide">
			<img src="http://ktsmemo.cdn3.cafe24.com/p/0128.jpg">
			<div class="darkness"></div>
			<div class="btn-plus"><a href="#"><span draggable="false">예매하기</span></a></div>
			<div class="btn-plus1"><a href="#"><span draggable="false">상세보기</span></a></div>
		</div>

		<div class="swiper-slide">
			<img src="http://ktsmemo.cdn3.cafe24.com/p/0128.jpg">
			<div class="darkness"></div>
			<div class="btn-plus"><a href="#"><span draggable="false">예매하기</span></a></div>
			<div class="btn-plus1"><a href="#"><span draggable="false">상세보기</span></a></div>
		</div>
		
		<div class="swiper-slide">
			<img src="http://ktsmemo.cdn3.cafe24.com/p/0128.jpg">
			<div class="darkness"></div>
			<div class="btn-plus"><a href="#"><span draggable="false">예매하기</span></a></div>
			<div class="btn-plus1"><a href="#"><span draggable="false">상세보기</span></a></div>
		</div>
		
		<div class="swiper-slide">
			<img src="http://ktsmemo.cdn3.cafe24.com/p/0128.jpg">
			<div class="darkness"></div>
			<div class="btn-plus"><a href="#"><span draggable="false">예매하기</span></a></div>
			<div class="btn-plus1"><a href="#"><span draggable="false">상세보기</span></a></div>
		</div>
		
		<div class="swiper-slide">
			<img src="http://ktsmemo.cdn3.cafe24.com/p/0128.jpg">
			<div class="darkness"></div>
			<div class="btn-plus"><a href="#"><span draggable="false">예매하기</span></a></div>
			<div class="btn-plus1"><a href="#"><span draggable="false">상세보기</span></a></div>
		</div>
		
		<div class="swiper-slide">
			<img src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202203/18504_103_1.jpg">
			<div class="darkness"></div>
			<div class="btn-plus"><a href="#"><span draggable="false">예매하기</span></a></div>
			<div class="btn-plus1"><a href="#"><span draggable="false">상세보기</span></a></div>
		</div>
		
		<div class="swiper-slide">
			<img src="http://ktsmemo.cdn3.cafe24.com/p/0128.jpg">
			<div class="darkness"></div>
			<div class="btn-plus"><a href="#"><span draggable="false">예매하기</span></a></div>
			<div class="btn-plus1"><a href="#"><span draggable="false">상세보기</span></a></div>
		</div>
		
		<div class="swiper-slide">
			<img src="http://ktsmemo.cdn3.cafe24.com/p/0128.jpg">
			<div class="darkness"></div>
			<div class="btn-plus"><a href="#"><span draggable="false">예매하기</span></a></div>
			<div class="btn-plus1"><a href="#"><span draggable="false">상세보기</span></a></div>
		</div>
		
		<div class="swiper-slide">
			<img src="http://ktsmemo.cdn3.cafe24.com/p/0128.jpg">
			<div class="darkness"></div>
			<div class="btn-plus"><a href="#"><span draggable="false">예매하기</span></a></div>
			<div class="btn-plus1"><a href="#"><span draggable="false">상세보기</span></a></div>
		</div>
		
		<div class="swiper-slide">
			<img src="http://ktsmemo.cdn3.cafe24.com/p/0128.jpg">
			<div class="darkness"></div>
			<div class="btn-plus"><a href="#"><span draggable="false">예매하기</span></a></div>
			<div class="btn-plus1"><a href="#"><span draggable="false">상세보기</span></a></div>
		</div>
		
		<div class="swiper-slide">
			<img src="http://ktsmemo.cdn3.cafe24.com/p/0128.jpg">
			<div class="darkness"></div>
			<div class="btn-plus"><a href="#"><span draggable="false">예매하기</span></a></div>
			<div class="btn-plus1"><a href="#"><span draggable="false">상세보기</span></a></div>
		</div>
		
		<div class="swiper-slide">
			<img src="http://ktsmemo.cdn3.cafe24.com/p/0128.jpg">
			<div class="darkness"></div>
			<div class="btn-plus"><a href="#"><span draggable="false">예매하기</span></a></div>
			<div class="btn-plus1"><a href="#"><span draggable="false">상세보기</span></a></div>
		</div>
		
	</div>

	<!-- 네비게이션 -->
	<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	<div class="swiper-button-prev"></div><!-- 이전 버튼 -->

	<!-- 페이징 -->
	<div class="swiper-pagination"></div>
</div>


<script>

new Swiper('.swiper-container', {

	slidesPerView : 5, // 동시에 보여줄 슬라이드 갯수
	spaceBetween : 30, // 슬라이드간 간격
	slidesPerGroup : 3, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

	// 그룹수가 맞지 않을 경우 빈칸으로 메우기
	// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
	loopFillGroupWithBlank : true,

	loop : true, // 무한 반복

	pagination : { // 페이징
		el : '.swiper-pagination',
		clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
	},
	navigation : { // 네비게이션
		nextEl : '.swiper-button-next', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
	},
});

</script>

<!-- 예제 종료 -->


</body>
</html>