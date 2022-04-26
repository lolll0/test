<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGBOX</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=League+Gothic&family=Nothing+You+Could+Do&family=Noto+Sans+KR:wght@300&family=Roboto:wght@300&display=swap" rel="stylesheet">
<style type="text/css">
ul .member{ 
	/*마이페이지, 회원가입, 로그인*/
	list-style: none;
	float: right;
}
body{
	color: white;
}
.navbar{
	/*영화, 예매, 스토어, 이벤트, 고객센터 div*/
	clear:both;
}
/* div{ */
/* 	/* div check*/ */
/* 	border:1px solid black; */
/* } */
.nav{
	/*li스타일제거*/
	list-style: none;
}
.poster{
	/*무비차트 포스터*/
	width: 50px;
	height: 100px;
}
input{
	clear:both;
}
.bodydiv{ 
	/*조상div*/
	width: 80%;
	margin: 0px auto;
}
/* div .videobox{ */
/* 	/*예고편 재생div*/ */
/* 	width: 1541px; */
/* 	background: black; */
/* 	border-top: 2px solid red; */
/* } */
.anav{
	/*영화, 예매, 스토어, 이벤트, 고객센터 <a>*/
	text-decoration: none;
	float: none;
	margin : 15px;
}
.navh1{
	text-align: center;
	font-size : 18px;
/* 	color : white; */
}
.memberimg{
	/*마이페이지 회원가입 로그인 이미지*/
	width: 30px;
	height: 30px;
}
.memberspan{
	/*로그인, 이벤트, 스토어, 예매, 영화 span*/
	margin: 10px;
	font-size: 17px;
}
video{
	margin: 0px auto;
}
a{
	font-family: 'Noto Sans KR';
	color: white;
	text-decoration: none;
	margin: 15px;
}
.logo{
	/*로고이미지*/
	text-align: center;
}
.logoimg{
	
}
.main{
	z-index: -1;
	position: absolute;
	
	
}
</style>
</head>
<body>
	<div class="bodydiv">
		<img class="main" src="https://caching2.lottecinema.co.kr/lotte_image/2022/Ani/Ani_1920774.jpg">
	
		<div class="header">
			<div class="header_contents">
				<a href="#">
					<h1 class="logo">
					<img class="logoimg" src="https://img.cgv.co.kr/R2014/images/common/logo/logoRed.png">
					</h1>
				</a>
<!-- 				<span>CULTUREPLEX</span> -->
				<hr>
				
				
			</div>
			<br><br>
			<div class="navbar">
				<ul>
					<li class="member">
						<a href="로그인화면">
							<img class="memberimg" src="https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png">
						</a>
						<br>	
						<span class="memberspan">로그인</span>
					</li>
					<li class="member">
						<a href="회원가입화면">
							<img class="memberimg" src="https://img.cgv.co.kr/R2014/images/common/ico/loginJoin.png">
						</a>	
						<br>
						<span class="memberspan">회원가입</span>
					</li>
					<li class="member">
						<a href="마이페이지">
							<img class="memberimg" src="https://img.cgv.co.kr/R2014/images/common/ico/loginMember.png">
						</a>	
						<br>
						<span class="memberspan">마이페이지</span>
					</li>
				</ul>
				<ul>
					<li class="nav" style="list-style: none;">
						<h1 class="navh1">
						<a href="영화" class="anav">
							영화
						</a>
						<a href="예매" class="anav">
							예매
						</a>
						<a href="스토어" class="anav">
							스토어
						</a>
						<a href="이벤트" class="anav">
							이벤트
						</a>
						<a href="고객센터" class="anav">
							고객센터
						</a>
						</h1>
					</li>
					<br><hr>
				</ul>
			</div>
			<div class="contents">
				<div class="videobox">
<!-- 					<video autoplay muted> -->
<!-- 						<source type="video/mp4" src="https://adimg.cgv.co.kr/images/202203/Gonggisarin/0412_Gonggisarin_1080x608.mp4"> -->
<!-- 					</video> -->
					
				</div>
			</div>
			
		</div>
	</div>
	<div class="moviechart">
				<h2>
				무비차트
				</h2>
				<div>
					<img class="poster" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000085/85712/85712_320.jpg">
					<a href="예매하기">
						<input type="button" value="예매하기">
					</a>
					<a href="상세보기">
						<input type="button" value="상세보기">
					</a>
				</div>
	</div>
</body>

	

</html>