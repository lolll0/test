<%@page import="movie.controller.MovieImginsert"%>
<%@page import="movie.vo.MovieVO"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  
  
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
  <style>
  /* 2022-04-23 스타일 추가 내역*/
  a:hover{
  	text-decoration: none;
  	color: white;
  }
  a{
  	color: white;
  	font-size: 1.5em;
  }
  /* 2022-04-23 스타일 추가 내역*/
  
  /* Make the image fully responsive */
   .carousel-inner img {
    max-width: 100%;
    max-height: 100%;
  }
  .memberli{
  	list-style: none;
  	float: right;
  	margin : 10px;
  }
  .navli{
  	list-style: none;
    display:inline-block; 
  	margin: 20px;
	font-size:1.5em;
  }
  .navul{
  	text-align: center;
  }
  h1{
  	text-align: center;
  }
  .navdiv{
  	clear:both;
  }
  body{
  	background: black;
  	
  }
  
  .active{
  	float:left;
  }
  .modal-content{
  	width:1100px;
  	height: 690px;
  }	
  .carousel-inner img {
    width: 100%;
    height: 100%;
  }
   h3{
  	text-align: center;
  }
  

.swiper-container {
	height:520px;
	
	
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


.btn-plus span{
   font-size:1.5em; 
/*   font-size:0.3vw; */
  color:black;
/*   user-select:none; */
}
.btn-plus1 span{
  font-size:1.5em; 
  color:#ffffff;
/*   user-select:none; */
}
.darkness {
  position:absolute;
  top:0;
  left:0;
/*   width:inherit; */
/*   height:inherit; */
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
/* 	background: lightgray; */
	
	max-width: 60px;
	max-height: 30px;
	margin-right: 10px;
}
.img + .btn-plus1 {
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
/*  	width:inherit;  */
/*  	heigth: inherit;  */
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
button{
	
/* 	outline: 0; */
}

/* 추가된 css */
.img{
	border-radius: 30px;
}
.btn-group-vertical button{
	width: 150px;
	height: 30px;
}
/* .btn-group-vertical{ */
/* 	display : none; */
/* } */
/* .btn-group-vertical:hover .btn-plus{ */
/* 	display: block; */
/* } */

.swiper-slide .btn-group-vertical{
	display: none;
}
.swiper-slide:hover .btn-group-vertical{
	display: block;
}
/* swp */

/* nva*/
.btn-primary{
	background-color: black;
	border-color: black;
}
.btn-primary:hover{
	background-color: black;
}
.btn{
	border: 0px;
	
}

.back{
	position: absolute;
}
.front{
	position: absolute;
}

</style>

<script type="text/javascript">
$(function(){
	// 영화진흥원 api를 실행한다.
	$.ajax({
		type: 'get',
		url :"http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=20220419", 
		success : function(response){
 			console.log(response);
 			console.log(response.boxOfficeResult.dailyBoxOfficeList);
 			
 			arr = [];
 			arr1 = [];
 			arr2 = [];
 			arr3 = [];
 			var array = response.boxOfficeResult.dailyBoxOfficeList;
			var result = "";
			$.each(array, function(i,v) {
				 
				 arr.push(v.movieNm);
				 arr1.push(v.movieCd);
				 arr2.push(v.audiAcc);
				 arr3.push(v.openDt);
				
			}) 
			// 값을 가져오면 db에 정보를 넣는다.
			movieInsert();
			
		}
	})	
	
	// ----
	var movieInsert = function(){
		$.ajax({
			type:'post',
			url:'<%=request.getContextPath()%>/MovieInsert.do',
			traditional : true,
			data:{
				"movieName" : arr,
				"movieNo" : arr1,
				"movieAudi" : arr2,
				"movieOpen" : arr3
			},
			success : function(res){
				// db에 자료를 넣는 것을 성공하면 메인페이지 하단에 데이터를 삽입한다.
				imgInsert();
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			}
			
		})
 	}
	
	// ---
		var imgInsert = function(){
		$.ajax({
			type:'post',
			url:'<%=request.getContextPath()%>/MovieImginsert.do',
			traditional : true,
			data:{
				
			},
			success : function(res){
				
				var fImg1 = $('.swiper-wrapper').find('.img');
				var fImg2 = $('.swiper-wrapper').find('.m1');
				var fImg3 = $('.swiper-wrapper').find('.m2');
				var fImg4 = $('.swiper-wrapper').find('.m3');
				var fImg5 = $('.swiper-wrapper').find('.m4');
				var fImg6 = $('.swiper-wrapper').find('.m5');
				var Aid = $('.swiper-wrapper').find('.a');
				
				img = [];
				Mname = [];
				open = [];
				summary = [];
				running = [];
				link = [];
				$.each(res, function(i, v) {
					
					if(fImg1.eq(i).attr('src')==""){
						
						fImg1.eq(i).attr('src', v.movie_img);
						fImg2.eq(i).val(v.movie_name);
						fImg3.eq(i).val(v.movie_open);
						fImg4.eq(i).val(v.movie_summary);
						fImg5.eq(i).val(v.movie_running);
						fImg6.eq(i).val(v.movie_link);
						
						
					}
				})
				for(i = 0; i < 10; i++){
					img.push(fImg1.eq(i).attr('src'));
					open.push(fImg3.eq(i).val());
 					Mname.push(fImg2.eq(i).val());
					summary.push(fImg4.eq(i).val());
					running.push(fImg5.eq(i).val());
					link.push(fImg6.eq(i).val());
				}
// 				alert(img[1]);

			},
			error : function(xhr){
				
				alert("상태 : " + xhr.status);
			},
			dataType: 'json'
			
		})
	}
	
		// 영화 태그
		$('#MovieChart').on('click', function(){
			alert(img[1]);
			MovieChart();
		})
		
		var MovieChart = function(){
			alert(img[1]);
			$.ajax({
				url : "<%=request.getContextPath()%>/MovieChart.do",
				type : 'post',
				traditional : true,
				data : {
	 				"movieName" : Mname,
					"movieOpen" : open,
					"movieSummary" : summary,
					"movieLink" : link,
					"movieImg" : img,
					"movieRunning" : running
				},
				success : function(res){
					
				},
				error : function(xhr){
					alert("상태 : " + xhr.status);
				}
			})
			
		}
	
	
	
	
	
	
	
	// 상세페이지를 누르면 값을 받아서 상세페이지에 값들을 넘긴다.
	$('.btn-plus1').on('click', function(){
		movieName = $(this).parents('.swiper-slide').find('.m1').val();
		movieOpen = $(this).parents('.swiper-slide').find('.m2').val();
		movieSummary = $(this).parents('.swiper-slide').find('.m3').val();
		movieRunning = $(this).parents('.swiper-slide').find('.m4').val();
		movieLink = $(this).parents('.swiper-slide').find('.m5').val();	
		movieImg = $(this).parents('.swiper-slide').find('.img').attr('src');
		detailMovie();
		
	})
	
	var detailMovie = function(){
		
		$.ajax({
			url : '<%=request.getContextPath()%>/MovieDetail.do',
			type : 'get',
			data : {
				"movieName" : movieName,
				"movieOpen" : movieOpen,
				"movieSummary" : movieSummary,
				"movieRunning" : movieRunning,
				"movieLink" : movieLink,
				"movieImg" : movieImg
			},
			success : function(res){
				
			},
			error : function(xhr){
				alert("상태 : " + xhr.status)
			}
			
		})
	}
	
	
	
})
</script>

  
</head>
<body>

<div>
		<h1>
		
		<a href="fix.jsp" class="loadmain">
			<img src="https://img.cgv.co.kr/R2014/images/common/logo/logoRed.png">
		</a>
		</h1>
	</div>
	<div>
		<ul>
			<li class="memberli">
				<!-- 2022-04-23추가내역 -->
				<!-- 2022-04-23추가내역 -->
				<!-- 2022-04-23추가내역 -->
				<a href="../ticketing/NonMember_reservations.jsp"><img src="https://img.icons8.com/ios/50/ffffff/lock--v1.png"/>
					<br><div class="TopDiv" style="text-align: center;"><span>로그인</span></div>
				</a>
				<!-- 2022-04-23추가내역 -->				
				<!-- 2022-04-23추가내역 -->				
				<!-- 2022-04-23추가내역 -->								
			</li>
			<li class="memberli">
				<!-- 2022-04-23추가내역 -->
				<!-- 2022-04-23추가내역 -->
				<a href="../myPage/myPage.jsp"><img src="https://img.icons8.com/pastel-glyph/50/ffffff/person-male--v1.png"/>
					<br><div class="TopDiv" style="text-align:center;"><span>마이페이지</span></div>
				</a>
				<!-- 2022-04-23추가내역 -->
				<!-- 2022-04-23추가내역 -->
			</li >
			<li class="memberli">
				<a href="../member/member.jsp"><img src="https://img.icons8.com/small/50/ffffff/add-user-group-woman-woman.png"/>
					<br><div class="TopDiv" style="text-align:center;"><span>회원가입</span></div>
				</a>
			</li>
		</ul>
	</div>

	<div class="navdiv">
		
		<ul class="navul">
			<li class="navli">
				<a href="../movie/movieChart.jsp" class="btn3" id="MovieChart">영화</a>
			</li>
			<li class="navli">
				<a href="../ticketing/reservation.jsp" class="btn3">예매</a>
			</li>
			<li class="navli">
				<a href="../store/storePage.jsp" class="btn3">스토어</a>
			</li>
			<li class="navli">
				<a href="../user_event.jsp" class="btn3">이벤트</a>
			</li>
			<li class="navli">
				<a href="../user_FAQ.jsp" class="btn3">고객센터</a>
			</li>
		</ul>
		
	</div>


<div id="demo" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  
  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
		 <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal1" id="Modalbtn1">
      		<img src="https://caching2.lottecinema.co.kr/lotte_image/2022/Ani/Ani_1920774.jpg" width="1100" height="500">
		 </button>	
    </div>
    
    <div class="carousel-item">
    	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal2" id="Modalbtn2">
     		 <img src="https://caching2.lottecinema.co.kr/lotte_image/2022/Doctor/0421/Doctor_1920774.jpg" alt="Chicago" width="1100" height="500">
     	</button>
    </div>
    
    <div class="carousel-item">
    	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal3" id="Modalbtn3">
     		 <img src="https://caching2.lottecinema.co.kr/lotte_image/2022/Air/0421/Air_1920774.jpg" alt="Chicago" width="1100" height="500">
     	</button>
    </div>
    
    
    
  </div>
  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>

<br><br>
	
<!--  -->
<!--  -->
<!--  -->
<!--  -->
<!--  -->
<!--  -->

<div class="swiper-container">
	<div class="swiper-wrapper">
		<div class="swiper-slide">
			<img class="img" src="">
<!-- 			<div class="darkness"></div> -->
<!-- 			<div class="btn-plus"><a href="#"><span draggable="false">예매하기</span></a></div><br> -->
<!-- 			<div class="btn-plus1"><a href="../detail/NewFile.jsp" id="" class="a"><span draggable="false">상세보기</span></a></div> -->
			<div class="btn-group-vertical">
				<div class="btn-plus"><button class="btn btn-info" onclick="location.href='../ticketing/reservation.jsp'" class="a">예매하기</button></div><br>
				<div class="btn-plus1"><button class="btn btn-danger" onclick="location.href='../detail/NewFile.jsp'" class="a">상세보기</button></div>
			</div>
			<input type="hidden" class="m1" value="">
			<input type="hidden" class="m2" value="">
			<input type="hidden" class="m3" value="">
			<input type="hidden" class="m4" value="">
			<input type="hidden" class="m5" value="">
			
		</div>
		
		<div class="swiper-slide">
			<img class="img" src="">
			<div class="darkness"></div>
<!-- 			<div class="btn-plus"><a href="#"><span draggable="false">예매하기</span></a></div><br> -->
<!-- 			<div class="btn-plus1"><a href="../detail/NewFile.jsp" id="" class="a"><span draggable="false">상세보기</span></a></div> -->
			<div class="btn-group-vertical">
				<div class="btn-plus"><button class="btn btn-info" onclick="location.href='../ticketing/reservation.jsp'" class="a">예매하기</button></div><br>
				<div class="btn-plus1"><button class="btn btn-danger" onclick="location.href='../detail/NewFile.jsp'" class="a">상세보기</button></div>
			</div>
			<input type="hidden" class="m1" value="">
			<input type="hidden" class="m2" value="">
			<input type="hidden" class="m3" value="">
			<input type="hidden" class="m4" value="">
			<input type="hidden" class="m5" value="">
			
		</div>
		
		<div class="swiper-slide">
			<img class="img" src="">
			<div class="darkness"></div>
<!-- 			<div class="btn-plus"><a href="#"><span draggable="false">예매하기</span></a></div><br> -->
<!-- 			<div class="btn-plus1"><a href="../detail/NewFile.jsp" id="" class="a"><span draggable="false">상세보기</span></a></div> -->
			<div class="btn-group-vertical">
				<div class="btn-plus"><button class="btn btn-info" onclick="location.href='../ticketing/reservation.jsp'" class="a">예매하기</button></div><br>
				<div class="btn-plus1"><button class="btn btn-danger" onclick="location.href='../detail/NewFile.jsp'" class="a">상세보기</button></div>
			</div>
			<input type="hidden" class="m1" value="">
			<input type="hidden" class="m2" value="">
			<input type="hidden" class="m3" value="">
			<input type="hidden" class="m4" value="">
			<input type="hidden" class="m5" value="">
			
		</div>
		
		<div class="swiper-slide">
			<img class="img" src="">
			<div class="darkness"></div>
<!-- 			<div class="btn-plus"><a href="#"><span draggable="false">예매하기</span></a></div><br> -->
<!-- 			<div class="btn-plus1"><a href="../detail/NewFile.jsp" id="" class="a"><span draggable="false">상세보기</span></a></div> -->
			<div class="btn-group-vertical">
				<div class="btn-plus"><button class="btn btn-info" onclick="location.href='../ticketing/reservation.jsp'" class="a">예매하기</button></div><br>
				<div class="btn-plus1"><button class="btn btn-danger" onclick="location.href='../detail/NewFile.jsp'" class="a">상세보기</button></div>
			</div>
			<input type="hidden" class="m1" value="">
			<input type="hidden" class="m2" value="">
			<input type="hidden" class="m3" value="">
			<input type="hidden" class="m4" value="">
			<input type="hidden" class="m5" value="">
			
		</div>

		<div class="swiper-slide">
			<img class="img" src="">
			<div class="darkness"></div>
<!-- 			<div class="btn-plus"><a href="#"><span draggable="false">예매하기</span></a></div><br> -->
<!-- 			<div class="btn-plus1"><a href="../detail/NewFile.jsp" class="a"><span draggable="false">상세보기</span></a></div> -->
			<div class="btn-group-vertical">
				<div class="btn-plus"><button class="btn btn-info" onclick="location.href='../ticketing/reservation.jsp'" class="a">예매하기</button></div><br>
				<div class="btn-plus1"><button class="btn btn-danger" onclick="location.href='../detail/NewFile.jsp'" class="a">상세보기</button></div>
			</div>
			<input type="hidden" class="m1" value="">
			<input type="hidden" class="m2" value="">
			<input type="hidden" class="m3" value="">
			<input type="hidden" class="m4" value="">
			<input type="hidden" class="m5" value="">
			
		</div>
		
		<div class="swiper-slide">
			<img class="img" src="">
			<div class="darkness"></div>
<!-- 			<div class="btn-plus"><a href="#"><span draggable="false">예매하기</span></a></div><br> -->
<!-- 			<div class="btn-plus1"><a href="../detail/NewFile.jsp" id="" class="a"><span draggable="false">상세보기</span></a></div> -->
			<div class="btn-group-vertical">
				<div class="btn-plus"><button class="btn btn-info" onclick="location.href='../ticketing/reservation.jsp'" class="a">예매하기</button></div><br>
				<div class="btn-plus1"><button class="btn btn-danger" onclick="location.href='../detail/NewFile.jsp'" class="a">상세보기</button></div>
			</div>
			<input type="hidden" class="m1" value="">
			<input type="hidden" class="m2" value="">
			<input type="hidden" class="m3" value="">
			<input type="hidden" class="m4" value="">
			<input type="hidden" class="m5" value="">
			
		</div>
		
		<div class="swiper-slide">
			<img class="img" src="">
			<div class="darkness"></div>
<!-- 			<div class="btn-plus"><a href="#"><span draggable="false">예매하기</span></a></div><br> -->
<!-- 			<div class="btn-plus1"><a href="../detail/NewFile.jsp" id="" class="a"><span draggable="false">상세보기</span></a></div> -->
			<div class="btn-group-vertical">
				<div class="btn-plus"><button class="btn btn-info" onclick="location.href='../ticketing/reservation.jsp'" class="a">예매하기</button></div><br>
				<div class="btn-plus1"><button class="btn btn-danger" onclick="location.href='../detail/NewFile.jsp'" class="a">상세보기</button></div>
			</div>
			<input type="hidden" class="m1" value="">
			<input type="hidden" class="m2" value="">
			<input type="hidden" class="m3" value="">
			<input type="hidden" class="m4" value="">
			<input type="hidden" class="m5" value="">
			
		</div>
		
		<div class="swiper-slide">
			<img class="img" src="">
			<div class="darkness"></div>
<!-- 			<div class="btn-plus"><a href="#"><span draggable="false">예매하기</span></a></div><br> -->
<!-- 			<div class="btn-plus1"><a href="../detail/NewFile.jsp" id="" class="a"><span draggable="false">상세보기</span></a></div> -->
			<div class="btn-group-vertical">
				<div class="btn-plus"><button class="btn btn-info" onclick="location.href='../detail/NewFile.jsp'" class="a">예매하기</button></div><br>
				<div class="btn-plus1"><button class="btn btn-danger" onclick="location.href='../detail/NewFile.jsp'" class="a">상세보기</button></div>
			</div>
			<input type="hidden" class="m1" value="">
			<input type="hidden" class="m2" value="">
			<input type="hidden" class="m3" value="">
			<input type="hidden" class="m4" value="">
			<input type="hidden" class="m5" value="">
			
		</div>
		
		<div class="swiper-slide">
			<img class="img" src="">
			<div class="darkness"></div>
<!-- 			<div class="btn-plus"><a href="#"><span draggable="false">예매하기</span></a></div><br> -->
<!-- 			<div class="btn-plus1"><a href="../detail/NewFile.jsp" id="" class="a"><span draggable="false">상세보기</span></a></div> -->
			<div class="btn-group-vertical">
				<div class="btn-plus"><button class="btn btn-info" onclick="location.href='../detail/NewFile.jsp'" class="a">예매하기</button></div><br>
				<div class="btn-plus1"><button class="btn btn-danger" onclick="location.href='../detail/NewFile.jsp'" class="a">상세보기</button></div>
			</div>
			<input type="hidden" class="m1" value="">
			<input type="hidden" class="m2" value="">
			<input type="hidden" class="m3" value="">
			<input type="hidden" class="m4" value="">
			<input type="hidden" class="m5" value="">
			
		</div>
		
		<div class="swiper-slide">
			<img class="img" src="">
			<div class="darkness"></div>
<!-- 			<div class="btn-plus"><a href="#"><span draggable="false">예매하기</span></a></div><br> -->
<!-- 			<div class="btn-plus1"><a href="../detail/NewFile.jsp" id="" class="a"><span draggable="false">상세보기</span></a></div> -->
			<div class="btn-group-vertical">
				<div class="btn-plus"><button class="btn btn-info" onclick="location.href='../detail/NewFile.jsp'" class="a">예매하기</button></div><br>
				<div class="btn-plus1"><button class="btn btn-danger" onclick="location.href='../detail/NewFile.jsp'" class="a">상세보기</button></div>
			</div>
			<input type="hidden" class="m1" value="">
			<input type="hidden" class="m2" value="">
			<input type="hidden" class="m3" value="">
			<input type="hidden" class="m4" value="">
			<input type="hidden" class="m5" value="">
			
		</div>
		
		
		

		
	</div>

	<!-- 네비게이션 -->
	<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	<div class="swiper-button-prev"></div><!-- 이전 버튼 -->

	<!-- 페이징 -->
	<div class="swiper-pagination"></div>
</div>

<!--  -->
<!--  -->
<!--  -->
<!--  -->
<!--  -->
<!--  -->



<div class="modal" id="myModal1" >
    <div class="modal-dialog-center" >
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          	<video autoplay muted loop="999" id="video1">
	      		<source src="http://caching.lottecinema.co.kr//Media/MovieFile/MovieMedia/202204/18542_301_1.mp4" type="video/mp4">
	      	</video>
        </div>

      </div>
    </div>
</div>

<div class="modal" id="myModal2">
    <div class="modal-dialog-center">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          	<video autoplay muted loop="999" id="video1">
	      		<source src="https://adimg.cgv.co.kr/images/202203/Gonggisarin/0412_Gonggisarin_1080x608.mp4" type="video/mp4">
	      	</video>
        </div>

      </div>
    </div>
</div>

<div class="modal" id="myModal3">
    <div class="modal-dialog-center">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          	<video autoplay muted loop="999" id="video1">
	      		<source src="https://adimg.cgv.co.kr/images/202203/Gonggisarin/0412_Gonggisarin_1080x608.mp4" type="video/mp4">
	      	</video>
        </div>

      </div>
    </div>
</div>
  
  <div style="height:200px;">
  
  </div>
<script type="text/javascript">
  new Swiper('.swiper-container', {

		slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
		spaceBetween : 1, // 슬라이드간 간격
		slidesPerGroup : 3, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

		// 그룹수가 맞지 않을 경우 빈칸으로 메우기
		// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
		loopFillGroupWithBlank : false,

		loop : false, // 무한 반복

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
</body>
</html>
