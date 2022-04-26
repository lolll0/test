
<%@page import="cgbox.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
  
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<title>Insert title here</title>

<script type="text/javascript">
$(function(){
	// ��ȭ����� api�� �����Ѵ�.
	$.ajax({
		type: 'get',
		url :"http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=20220424", 
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
			// ���� �������� db�� ������ �ִ´�.
			movieInsert();
			$('.event').load('test.jsp');
			$('.gift').load('gift.jsp')
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
				// db�� �ڷḦ �ִ� ���� �����ϸ� ���������� �ϴܿ� �����͸� �����Ѵ�.
				imgInsert();
			},
			error : function(xhr){
				alert("���� : " + xhr.status);
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
				
				alert("���� : " + xhr.status);
			},
			dataType: 'json'
			
		})
	}
	
		// ��ȭ �±�
		$('#MovieChart').on('click', function(){
			
			MovieChart();
		})
		
		var MovieChart = function(){
			
			
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
					alert("���� : " + xhr.status);
				}
			})
			
		}
	
	
	
	
	
	
	
	// ���������� ������ ���� �޾Ƽ� ���������� ������ �ѱ��.
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
				alert("���� : " + xhr.status)
			}
			
		})
	}
	
	
	
	<% 
	MemberVO vo = (MemberVO)session.getAttribute("loginmember");
	if(vo != null){
	%>
	$('.loginTest').css('display', 'none');
	$('.logout').before('<li class="topli" style="margin-left: 10px"><a href="mainPage.jsp" class="Alogout"><div style="text-align: center;"><img class="topimg" src="https://img.icons8.com/ios/36/ffffff/exit.png"/ width="36" height="36"><br><span>�α׾ƿ�</span></div></a></li>');
	
	<%
	}
	%>	
	
	
	$('.Alogout').on('click', function(){
 		
 		$.ajax({
 			url : '<%=request.getContextPath()%>/Logout.do',
 			success : function() {
		 		window.location.href='<%=request.getContextPath()%>/main/mainPage.jsp';
			},
			error : function(xhr) {
				alert('���� : ' + xhr.status);
			}
			
 		})
	})

})






</script>




<style type="text/css">
hr{
	color: red;
}
*{
	font-family: 'Noto Sans KR', sans-serif;
}
.topimg{
	vertical-align: middle;
}
.topli{
	list-style: none;
	display: list-item;
	text-align: -webkit-match-parent;
}
.memberul{
	margin: 0;
	padding: 0;
	display: flex;
}
/* div�� ����� ���� ���� */
.contents{
	align-items: center;
	margin: 0 15px;
}
.header-content .contents {
    display: flex;
    justify-content: space-between;
/*     padding: 30px 6px 25px 5px; */
    background-color: black;
}

 a:hover{
  	text-decoration: none;
  	color: white;
  }
  a{
  	color: black;
  }

.nav-menu{
	margin: 0;
	padding: 0;
	display: flex;
	text-align: center;
}
.nav{
	left:0;
	top: 113px;
	width: 100%;
	padding: 5px 0;
	background-color: #fff;
	height: 80px;
}
.nav-menu > li {
	padding: 20px 0;
	margin: 20px;
}

/*��� css*/
/*��� css*/
/*��� css*/



/* Make the image fully responsive */
  .carousel-inner img {
    width: 100%;
    height: 100%;
  }
  
  
  
  .swiper-container {
	height:520px;
	background: black;
	
}
.swiper-slide {
	text-align:center;
	display:flex; /* ������ �߾����� �ϱ����� flex ��� */
	align-items:center; /* ���Ʒ� ���� �߾����� */
	justify-content:center; /* �¿� ���� �߾����� */
}
.swiper-slide img {
	box-shadow:0 0 5px #555;
	max-width:100%; /* �̹��� �ִ�ʺ� ����, �����̵忡 �̹����� �������� �������� �ʿ� */
	/* �� �������� �ʿ��ؼ� �����߽��ϴ�. ��Ȳ������ �ٸ� �� �ֽ��ϴ�. */
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
  /* �߰��� �κ� */
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
  /* �߰��� �κ� */
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
  /* �߰��� �κ� */
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
/* �߰��� �κ� */
.swiper-slide:hover .btn-plus {
  opacity:1;
  transform:scale(1);
}
/* �߰��� �κ� */
.swiper-slide:hover .btn-plus1{
  opacity:1;
  transform:scale(1);
}
/* �߰��� �κ� */
img:hover .darkness{
  opacity:0.4;
}
a{
	text-decoration: none;
	color: white;
}
button{
	
/* 	outline: 0; */
}

/* �߰��� css */
.img{
	border-radius: 30px;
	max-height: 302px;
	max-width: 224px;
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
body {
	background: black;
}
*{
	color: white;
}
em{
	
    position: absolute;
    display: block;  
    height: 50px;
    padding-left: 10px;
    color: #fff;
    font-weight: bold;
    font-size: 40px;
    font-style: italic;
    font-family: 'Roboto', "Noto Sans KR";
    text-align: left;
    margin-top: 270px;
    margin-right: 150px;
    
}
</style>

</head>

<body>

	<div class="bodyDiv">
			<div class="header">
				<div class="header-content" style="clear: both;">
					<div class="contents">
						
							<a href="mainPage.jsp">
								<img class="topimg" src="../images/logo_transparent.png" width="200" height="200">
							</a>
						
						<ul class="memberul">
							<div class="adDiv">
								<a href="../user_event.jsp">
									<img class="topimg" src="https://img.cgv.co.kr/WingBanner/2022/0303/16462658373950.png">
								</a>
							</div>
							<li class="topli loginTest" style="margin-left: 10px">
								<a href="../ticketing/NonMember_reservations.jsp">
									
									
										<img  class="topimg" src="https://img.icons8.com/material-outlined/36/ffffff/lock--v1.png"/ width="36" height="36"><br>
										<span>�α���</span>
									
								</a>
							</li>
							<li class="topli loginTest" style="margin-left: 10px">
								<a href="../member/member.jsp">
									<div style="text-align: center;">
										<img class="topimg" src="https://img.icons8.com/small/36/ffffff/add-user-group-woman-woman.png"/ width="36" height="36"><br>
										<span>ȸ������</span>
									</div>
								</a>
							</li>
							<li class="topli logout" style="margin-left: 10px">
								<a href="../myPage/myPage.jsp">
									<div style="text-align: center;">
										<img class="topimg" src="https://img.icons8.com/material-outlined/36/ffffff/user-male-circle.png"/ width="36" height="36"><br>
										<span>My cgv</span>
									</div>
								</a>
							</li>
							<li class="topli" style="margin-left: 10px">
								<a href="../user_FAQ.jsp">
									<div style="text-align: center;">
										<img class="topimg" src="https://img.icons8.com/external-nawicon-glyph-nawicon/36/ffffff/external-call-center-communication-nawicon-glyph-nawicon.png"/ width="36" height="36"><br>
										<span>������</span>
									</div>
								</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="nav" style="background: black;">
					<div class="contents">
						<ul class="nav-menu">
							<li class="topli">
								<h2>
									<a href="../movie/movieChart.jsp" id="MovieChart">��ȭ</a>
								</h2>
							</li>
							<li class="topli">
								<h2>
									<a href="../ticketing/reservation.jsp">����</a>
								</h2>
							</li>
							<li class="topli">
								<h2>
									<a href="../store/storePage.jsp">�����</a>
								</h2>
							</li>
							<li class="topli">
								<h2>
									<a href="../user_event.jsp">�̺�Ʈ</a>
								</h2>
							</li>
							<li class="topli">
								<h2>
									<a href="../user_FAQ.jsp">��������</a>
								</h2>
							</li>
						</ul>
					</div>
				</div>
						<br>
			</div>
			<hr>
			
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
			
			
			
			<div class="swiper-container">
	<div class="swiper-wrapper">
		<div class="swiper-slide">
			<img class="img" src="">
			<em>1</em>
<!-- 			<div class="darkness"></div> -->
<!-- 			<div class="btn-plus"><a href="#"><span draggable="false">�����ϱ�</span></a></div><br> -->
<!-- 			<div class="btn-plus1"><a href="../detail/NewFile.jsp" id="" class="a"><span draggable="false">�󼼺���</span></a></div> -->
			<div class="btn-group-vertical">
				<div class="btn-plus"><button class="btn btn-info" onclick="location.href='../ticketing/reservation.jsp'" class="a">�����ϱ�</button></div><br>
				<div class="btn-plus1"><button class="btn btn-danger" onclick="location.href='../detail/NewFile.jsp'" class="a">�󼼺���</button></div>
			</div>
			<input type="hidden" class="m1" value="">
			<input type="hidden" class="m2" value="">
			<input type="hidden" class="m3" value="">
			<input type="hidden" class="m4" value="">
			<input type="hidden" class="m5" value="">
			
		</div>
		
		<div class="swiper-slide">
			<img class="img" src="">
			<em>2</em>	
			<div class="darkness"></div>

<!-- 			<div class="btn-plus"><a href="#"><span draggable="false">�����ϱ�</span></a></div><br> -->
<!-- 			<div class="btn-plus1"><a href="../detail/NewFile.jsp" id="" class="a"><span draggable="false">�󼼺���</span></a></div> -->
			<div class="btn-group-vertical">
				<div class="btn-plus"><button class="btn btn-info" onclick="location.href='../ticketing/reservation.jsp'" class="a">�����ϱ�</button></div><br>
				<div class="btn-plus1"><button class="btn btn-danger" onclick="location.href='../detail/NewFile.jsp'" class="a">�󼼺���</button></div>
			</div>
	
			<input type="hidden" class="m1" value="">
			<input type="hidden" class="m2" value="">
			<input type="hidden" class="m3" value="">
			<input type="hidden" class="m4" value="">
			<input type="hidden" class="m5" value="">
			
		</div>
		
		<div class="swiper-slide">
			<img class="img" src="">
			<em>3</em>
			<div class="darkness"></div>
<!-- 			<div class="btn-plus"><a href="#"><span draggable="false">�����ϱ�</span></a></div><br> -->
<!-- 			<div class="btn-plus1"><a href="../detail/NewFile.jsp" id="" class="a"><span draggable="false">�󼼺���</span></a></div> -->
			<div class="btn-group-vertical">
				<div class="btn-plus"><button class="btn btn-info" onclick="location.href='../ticketing/reservation.jsp'" class="a">�����ϱ�</button></div><br>
				<div class="btn-plus1"><button class="btn btn-danger" onclick="location.href='../detail/NewFile.jsp'" class="a">�󼼺���</button></div>
			</div>
			<input type="hidden" class="m1" value="">
			<input type="hidden" class="m2" value="">
			<input type="hidden" class="m3" value="">
			<input type="hidden" class="m4" value="">
			<input type="hidden" class="m5" value="">
			
		</div>
		
		<div class="swiper-slide">
			<img class="img" src="">
			<em>4</em>
			<div class="darkness"></div>
<!-- 			<div class="btn-plus"><a href="#"><span draggable="false">�����ϱ�</span></a></div><br> -->
<!-- 			<div class="btn-plus1"><a href="../detail/NewFile.jsp" id="" class="a"><span draggable="false">�󼼺���</span></a></div> -->
			<div class="btn-group-vertical">
				<div class="btn-plus"><button class="btn btn-info" onclick="location.href='../ticketing/reservation.jsp'" class="a">�����ϱ�</button></div><br>
				<div class="btn-plus1"><button class="btn btn-danger" onclick="location.href='../detail/NewFile.jsp'" class="a">�󼼺���</button></div>
			</div>
			<input type="hidden" class="m1" value="">
			<input type="hidden" class="m2" value="">
			<input type="hidden" class="m3" value="">
			<input type="hidden" class="m4" value="">
			<input type="hidden" class="m5" value="">
			
		</div>

		<div class="swiper-slide">
			<img class="img" src="">
			<em>5</em>
			<div class="darkness"></div>
<!-- 			<div class="btn-plus"><a href="#"><span draggable="false">�����ϱ�</span></a></div><br> -->
<!-- 			<div class="btn-plus1"><a href="../detail/NewFile.jsp" class="a"><span draggable="false">�󼼺���</span></a></div> -->
			<div class="btn-group-vertical">
				<div class="btn-plus"><button class="btn btn-info" onclick="location.href='../ticketing/reservation.jsp'" class="a">�����ϱ�</button></div><br>
				<div class="btn-plus1"><button class="btn btn-danger" onclick="location.href='../detail/NewFile.jsp'" class="a">�󼼺���</button></div>
			</div>
			<input type="hidden" class="m1" value="">
			<input type="hidden" class="m2" value="">
			<input type="hidden" class="m3" value="">
			<input type="hidden" class="m4" value="">
			<input type="hidden" class="m5" value="">
			
		</div>
		
		<div class="swiper-slide">
			<img class="img" src="">
			<em>6</em>
			<div class="darkness"></div>
<!-- 			<div class="btn-plus"><a href="#"><span draggable="false">�����ϱ�</span></a></div><br> -->
<!-- 			<div class="btn-plus1"><a href="../detail/NewFile.jsp" id="" class="a"><span draggable="false">�󼼺���</span></a></div> -->
			<div class="btn-group-vertical">
				<div class="btn-plus"><button class="btn btn-info" onclick="location.href='../ticketing/reservation.jsp'" class="a">�����ϱ�</button></div><br>
				<div class="btn-plus1"><button class="btn btn-danger" onclick="location.href='../detail/NewFile.jsp'" class="a">�󼼺���</button></div>
			</div>
			<input type="hidden" class="m1" value="">
			<input type="hidden" class="m2" value="">
			<input type="hidden" class="m3" value="">
			<input type="hidden" class="m4" value="">
			<input type="hidden" class="m5" value="">
			
		</div>
		
		<div class="swiper-slide">
			<img class="img" src="">
			<em>7</em>
			<div class="darkness"></div>
<!-- 			<div class="btn-plus"><a href="#"><span draggable="false">�����ϱ�</span></a></div><br> -->
<!-- 			<div class="btn-plus1"><a href="../detail/NewFile.jsp" id="" class="a"><span draggable="false">�󼼺���</span></a></div> -->
			<div class="btn-group-vertical">
				<div class="btn-plus"><button class="btn btn-info" onclick="location.href='../ticketing/reservation.jsp'" class="a">�����ϱ�</button></div><br>
				<div class="btn-plus1"><button class="btn btn-danger" onclick="location.href='../detail/NewFile.jsp'" class="a">�󼼺���</button></div>
			</div>
			<input type="hidden" class="m1" value="">
			<input type="hidden" class="m2" value="">
			<input type="hidden" class="m3" value="">
			<input type="hidden" class="m4" value="">
			<input type="hidden" class="m5" value="">
			
		</div>
		
		<div class="swiper-slide">
			<img class="img" src="">
			<em>8</em>
			<div class="darkness"></div>
<!-- 			<div class="btn-plus"><a href="#"><span draggable="false">�����ϱ�</span></a></div><br> -->
<!-- 			<div class="btn-plus1"><a href="../detail/NewFile.jsp" id="" class="a"><span draggable="false">�󼼺���</span></a></div> -->
			<div class="btn-group-vertical">
				<div class="btn-plus"><button class="btn btn-info" onclick="location.href='../detail/NewFile.jsp'" class="a">�����ϱ�</button></div><br>
				<div class="btn-plus1"><button class="btn btn-danger" onclick="location.href='../detail/NewFile.jsp'" class="a">�󼼺���</button></div>
			</div>
			<input type="hidden" class="m1" value="">
			<input type="hidden" class="m2" value="">
			<input type="hidden" class="m3" value="">
			<input type="hidden" class="m4" value="">
			<input type="hidden" class="m5" value="">
			
		</div>
		
		<div class="swiper-slide">
			<img class="img" src="">
			<em>9</em>
			<div class="darkness"></div>
<!-- 			<div class="btn-plus"><a href="#"><span draggable="false">�����ϱ�</span></a></div><br> -->
<!-- 			<div class="btn-plus1"><a href="../detail/NewFile.jsp" id="" class="a"><span draggable="false">�󼼺���</span></a></div> -->
			<div class="btn-group-vertical">
				<div class="btn-plus"><button class="btn btn-info" onclick="location.href='../detail/NewFile.jsp'" class="a">�����ϱ�</button></div><br>
				<div class="btn-plus1"><button class="btn btn-danger" onclick="location.href='../detail/NewFile.jsp'" class="a">�󼼺���</button></div>
			</div>
			<input type="hidden" class="m1" value="">
			<input type="hidden" class="m2" value="">
			<input type="hidden" class="m3" value="">
			<input type="hidden" class="m4" value="">
			<input type="hidden" class="m5" value="">
			
		</div>
		
		<div class="swiper-slide">
			<img class="img" src="">
			<em>10</em>
			<div class="darkness"></div>
<!-- 			<div class="btn-plus"><a href="#"><span draggable="false">�����ϱ�</span></a></div><br> -->
<!-- 			<div class="btn-plus1"><a href="../detail/NewFile.jsp" id="" class="a"><span draggable="false">�󼼺���</span></a></div> -->
			<div class="btn-group-vertical">
				<div class="btn-plus"><button class="btn btn-info" onclick="location.href='../detail/NewFile.jsp'" class="a">�����ϱ�</button></div><br>
				<div class="btn-plus1"><button class="btn btn-danger" onclick="location.href='../detail/NewFile.jsp'" class="a">�󼼺���</button></div>
			</div>
			<input type="hidden" class="m1" value="">
			<input type="hidden" class="m2" value="">
			<input type="hidden" class="m3" value="">
			<input type="hidden" class="m4" value="">
			<input type="hidden" class="m5" value="">
			
		</div>
		
		
		

		
	</div>

	<!-- �׺���̼� -->
	<div class="swiper-button-next"></div><!-- ���� ��ư (�����ʿ� �ִ� ��ư) -->
	<div class="swiper-button-prev"></div><!-- ���� ��ư -->

	<!-- ����¡ -->
	<div class="swiper-pagination"></div>
</div>
			
			
	
	
	
			
			
	<div class="event"></div>
	<div class="gift" style="text-align: center"></div>
	</div>
	
	
	<!-- Modal -->
	<!-- Modal -->
	<!-- Modal -->
	<!-- Modal -->
	<!-- Modal -->
	
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
	      		<source src="https://caching2.lottecinema.co.kr/lotte_image/2022/Doctor/0421/Doctor_1280720.mp4" type="video/mp4">
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
	
	
	
	
<script type="text/javascript">
  new Swiper('.swiper-container', {

		slidesPerView : 3, // ���ÿ� ������ �����̵� ����
		spaceBetween : 1, // �����̵尣 ����
		slidesPerGroup : 3, // �׷����� ���� ��, slidesPerView �� ���� ���� �����ϴ°� ����

		// �׷���� ���� ���� ��� ��ĭ���� �޿��
		// 3���� ���;� �Ǵµ� 1���� �ִٸ� 2���� ��ĭ���� ä���� 3���� ����
		loopFillGroupWithBlank : false,

		loop : false, // ���� �ݺ�

		pagination : { // ����¡
			el : '.swiper-pagination',
			clickable : true, // ����¡�� Ŭ���ϸ� �ش� �������� �̵�, �ʿ�� ������ ��� ��� �۵�
		},
		navigation : { // �׺���̼�
			nextEl : '.swiper-button-next', // ���� ��ư Ŭ������
			prevEl : '.swiper-button-prev', // �̹� ��ư Ŭ������
		},
	});
  
 </script>
</body>
</html>