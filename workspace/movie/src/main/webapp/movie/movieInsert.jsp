<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.imgdiv{
	width: 150px;
	heigth: 200px;
	position: relative;
	float: left;
	margin : 15px;
	cursor:pointer;
}
.imgdiv img{
	width:inherit;
	heigth: inherit;
	position: absolute;
}
/* 추가된 부분 */
.imgdiv:hover .btn-plus {
  opacity:1;
  transform:scale(1);
}
/* 추가된 부분 */
.imgdiv:hover .btn-plus1{
  opacity:1;
  transform:scale(1);
}
/* 추가된 부분 */
.img-div:hover .darkness{
  opacity:0.4;
}
.btn-plus span {
  font-size:0.8em;
  color:#ffffff;
/*   user-select:none; */
}
.btn-plus1 span {
  font-size:0.8em;
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

.btn-plus {
  position:relative;
  top:50px;
  left:50px;
  background:red;
  width:60px;
  height:30px;
/*   border-radius:25%;  */
  text-align:center;
  /* 추가된 부분 */
  opacity:0;
  transform:scale(2);
  transition:all .3s linear;
}
.btn-plus1 {
  position:relative;
  top:90px;
  left:50px;
  background:red;
  width:60px;
  height:30px;
/*   border-radius:25%;  */
  text-align:center;
  /* 추가된 부분 */
  opacity:0;
  transform:scale(2);
  transition:all .3s linear;
}
</style>
</head>
<script src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	
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
				result += i + "번째영화제목 : " + v.movieNm + 
				" 영화번호 : " + v.movieCd + " 관객수 : " + v.audiAcc + " 개봉일 : " + v.openDt
	
// 				$('.h1').append(i + ":" +v.movieNm + "<br>");
//  				$('.h1').append(v.movieCd + "<br> ")
//  				$('.h1').append(v.openDt + "<br> ")
//  				$('.h1').append(v.audiAcc + "<br> ")
 				
//  				 movieNm = v.movieNm; // 제목
//  			     movieCd = v.movieCd; // 영화번호
// 				 movieAcc= v.audiAcc; // 관객수
// 				 movieOpen = v.openDt; // 개봉일
// 				 console.log(movieNm);
				  
				 
				 arr.push(v.movieNm);
				 arr1.push(v.movieCd);
				 arr2.push(v.audiAcc);
				 arr3.push(v.openDt);
// 				 $.ajaxSettings,traditional = true;
				 console.log(arr);
				 console.log(arr1);
			}) 
		}
	})	
	
// 	movieNm = "";
// 	movieCd= "";
// 	movieAcc=0;
// 	movieOpen="";
	$('#btn').on('click', function(){
		console.log(arr);
		console.log("test : " + arr1);
		console.log("test : " + arr2);
		console.log("test : " + arr3);
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
				alert("success");
				
			},
			error : function(xhr){
				
				alert("상태 : " + xhr.status);
			},
			
		})
	})
	
	// 페이지 전환 시 특정 태그만 load
	//    $("#contents").load("/test/test.do #target");

	
	// main페이지에서 영화포스터 창이 로딩되면
	// .wrapper위에 div를 하나 더 만들고 그 아래에 정보들을 출력해준다.
<%-- 	$('.wrapper').load("<%=request.getContextPath()%>/MovieInsert.do .wrapper") --%>
	
//     $.ajax({
<%--     	url : "<%=request.getContextPath() %>/MovieInsert.do", --%>
//     	type : 'get',
//     	data : {
//     		"movieNm" : movieNm
//     	},
//     	success : function(res){
    		
//     	},
//     	error : function(xhr){
//     		alert("상태 : " + xhr.status)
//     	},
//     	dataType : 'json'
//     })  
	
})
</script>
<body>
<h1 class="h1"></h1>
<input type="button" value="save" id="btn">
<div id="wrapper">
	<div id="iframe">
	<div class="imgdiv">
		<img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85791/85791_320.jpg">
		<div id="darkness"></div>
		 <div class="btn-plus"><a href=""><span draggable="false">예매하기</span></a></div>
      	 <div class="btn-plus1"><a href=""><span draggable="false">상세보기</span></a></div>
	</div>
	<div class="imgdiv">
		<img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85791/85791_320.jpg">
		<div id="darkness"></div>
		 <div class="btn-plus"><a href=""><span draggable="false">예매하기</span></a></div>
      <div class="btn-plus1"><a href=""><span draggable="false">상세보기</span></a></div>
	</div>
	<div class="imgdiv">
		<img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85791/85791_320.jpg">
		<div id="darkness"></div>
		 <div class="btn-plus"><a href=""><span draggable="false">예매하기</span></a></div>
      <div class="btn-plus1"><a href=""><span draggable="false">상세보기</span></a></div>
	</div>
	<div class="imgdiv">
		<img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85791/85791_320.jpg">
		<div id="darkness"></div>
		 <div class="btn-plus"><a href=""><span draggable="false">예매하기</span></a></div>
      <div class="btn-plus1"><a href=""><span draggable="false">상세보기</span></a></div>
	</div>
	<div class="imgdiv">
		<img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85791/85791_320.jpg">
		<div id="darkness"></div>
		 <div class="btn-plus"><a href=""><span draggable="false">예매하기</span></a></div>
      <div class="btn-plus1"><a href=""><span draggable="false">상세보기</span></a></div>
	</div>
	<div class="imgdiv">
		<img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85791/85791_320.jpg">
		<div id="darkness"></div>
		 <div class="btn-plus"><a href=""><span draggable="false">예매하기</span></a></div>
      <div class="btn-plus1"><a href=""><span draggable="false">상세보기</span></a></div>
	</div>
	<div class="imgdiv">
		<img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85791/85791_320.jpg">
		<div id="darkness"></div>
		 <div class="btn-plus"><a href=""><span draggable="false">예매하기</span></a></div>
      <div class="btn-plus1"><a href=""><span draggable="false">상세보기</span></a></div>
	</div>
	<div class="imgdiv">
		<img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85791/85791_320.jpg">
		<div id="darkness"></div>
		 <div class="btn-plus"><a href=""><span draggable="false">예매하기</span></a></div>
      <div class="btn-plus1"><a href=""><span draggable="false">상세보기</span></a></div>
	</div>
	<div class="imgdiv">
		<img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85791/85791_320.jpg">
		<div id="darkness"></div>
		 <div class="btn-plus"><a href=""><span draggable="false">예매하기</span></a></div>
      <div class="btn-plus1"><a href=""><span draggable="false">상세보기</span></a></div>
	</div>
	<div class="imgdiv">
		<img src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85791/85791_320.jpg">
		<div id="darkness"></div>
		 <div class="btn-plus"><a href=""><span draggable="false">예매하기</span></a></div>
      <div class="btn-plus1"><a href=""><span draggable="false">상세보기</span></a></div>
	</div>
	</div>
</div>
</body>
</html>