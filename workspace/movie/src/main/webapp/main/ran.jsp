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
  top:70px;
  left:70px;
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
  top:110px;
  left:70px;
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
a{
	text-decoration: none;
}
</style>
</head>
<body>
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
	</div>
</div>
</body>
</html>