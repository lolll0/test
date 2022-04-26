<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <style type="text/css">
  <style>
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
  	color: white;
  }
  .active{
  	float:left;
  }
  .modal-content{
  	width:1100px;
  	height: 690px;
  }	
  h3{
  	text-align: center;
  }
  </style>
  <script type="text/javascript">
//   $(function(){
// 	  $('#btn').on('click', function(){
// 		  $('#video').css('display', 'block');
// 	  })
//   })
  </script>
</head>
<body>
	<div>
		<h1>
		<a href="#">
			<img src="https://img.cgv.co.kr/R2014/images/common/logo/logoRed.png">
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
      <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
      <img src="https://caching2.lottecinema.co.kr/lotte_image/2022/Ani/Ani_1920774.jpg" width="1100" height="500">
      </button>	
      <!--  -->
      
    </div>
    <div class="carousel-item">
      <img src="https://caching2.lottecinema.co.kr/lotte_image/2022/Ani/Ani_1920774.jpg" width="1100" height="500">
    </div>
    <div class="carousel-item">
      <img src="https://caching2.lottecinema.co.kr/lotte_image/2022/Ani/Ani_1920774.jpg" width="1100" height="500">
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
	<div class="container">
  <div class="row">
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="/w3images/lights.jpg" target="_blank">
          <img src="../images/chopa.jpg" alt="Lights" style="width:100%">
          <div class="caption">
            <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="/w3images/nature.jpg" target="_blank">
          <img src="../images/chopa.jpg" alt="Nature" style="width:100%">
          <div class="caption">
            <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
          </div>
          <input type="button" value="예매하기">
          <input type="button" value="상세보기">
        </a>
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="/w3images/nature.jpg" target="_blank">
          <img src="../images/chopa.jpg" alt="Nature" style="width:100%">
          <div class="caption">
            <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
          </div>
          <input type="button" value="예매하기">
          <input type="button" value="상세보기">
        </a>
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="/w3images/nature.jpg" target="_blank">
          <img src="../images/chopa.jpg" alt="Nature" style="width:100%">
          <div class="caption">
            <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
          </div>
          <input type="button" value="예매하기">
          <input type="button" value="상세보기">
        </a>
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="/w3images/fjords.jpg" target="_blank">
          <img src="../images/chopa.jpg" alt="Fjords" style="width:100%">
          <div class="caption">
            <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
          </div>
        </a>
      </div>
    </div>
  </div>
</div>

 <div class="modal" id="myModal">
    <div class="modal-dialog-center">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <video autoplay muted>
          		<!-- 영화 예고편 -->
	      		<source src="https://adimg.cgv.co.kr/images/202203/Gonggisarin/0412_Gonggisarin_1080x608.mp4" type="video/mp4">
	      	</video>
        </div>
        
       
        
      </div>
    </div>
  </div>

	
</body>
</html>