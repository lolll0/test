<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
<style type="text/css">
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
  	color: white;
  }
  .active{
  	float:left;
  }
  .carousel-inner img {
    width: 100%;
    height: 100%;
  }
   h3{
  	text-align: center;
  }
  .logoimg{
  	 max-width: 100%;
    max-height: 100%;
  }
  .ifr{
  	 max-width: 100%;
    max-height: 100%;
  }
</style>
</head>


<body>

<div>
		<h1>
		<a href="#">
			<img class="logoimg" src="https://img.cgv.co.kr/R2014/images/common/logo/logoRed.png">
		</a>
		</h1>
	</div>
	<div>
		<ul>
			<li class="memberli">
				<a href="">로그인</a>
			</li>
			<li class="memberli">
				<a href="">메인페이지</a>
			</li >
			<li class="memberli">
				<a href="">회원가입</a>
			</li>
		</ul>
	</div>

	<div class="navdiv">
		
		<ul class="navul">
			<li class="navli">
				<a href="">영화</a>
			</li>
			<li class="navli">
				<a href="">예매</a>
			</li>
			<li class="navli">
				<a href="">스토어</a>
			</li>
			<li class="navli">
				<a href="">이벤트</a>
			</li>
			<li class="navli">
				<a href="">고객센터</a>
			</li>
		</ul>
		
	</div>

<nav class="navbar navbar-inverse">
  <ul class="nav navbar-nav">
  	<!-- 
  		리뷰, 포스터, 트레일러, 개봉일, 줄거리, 평점, 상영시간, 관람객수, 예매율추가
  	 -->
    <li><a href="movie.html" target="ifr">Link</a></li>
    <li><a href="iframe테스트.html" target="ifr">Link</a></li>
  </ul>
  <p class="navbar-text">Some text</p>
</nav>

<div class="container">
<!--   <h3>Navbar Text</h3> -->
<!--   <p>Use the .navbar-text class to vertical align any elements inside the navbar that are not links (ensures proper padding).</p> -->

<!--  -->
<!--  -->
<!--  -->

  <div class="carousel-inner">
    
    
    <div class="carousel-item">
      <img src="https://caching2.lottecinema.co.kr/lotte_image/2022/Ani/Ani_1920774.jpg" alt="New York" width="1100" height="500">
    </div>
  </div>
  


</div>
<br><br>
<h1>
<iframe src="" name="ifr" class="ifr" width="1100" height="500"></iframe>
</h1>
</body>
</html>