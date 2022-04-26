<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 	body{ */
/* 		width: 100%; */
/* 		height: 100%; */
		
/* 	} */
	
	
/* 	li{ */
/* 		list-style-type: none; */
/* 		margin: 15px; */
/* 		float: left; */
		
/* 	} */
	
/* 	.a{ */
/* 		display : none;	 */
/* 	} */
/* 	img:hover + .a + .a{ */
/* 		display : block; */
/* 	}  */
/* 	img:hover + .a{ */
/* 		display : block; */
/* 	}  */
	
/* 	img{ */
/* 		position : relative; */
		
/* 	} */
/* 	.a{ */
/* 		position: absolute; */
/* 		top: 50%; */
/*  		left : 50%;  */
/* 	} */
#wrapper {
  width:500px;
  height:500px;
  background:#aed6e4;
}

#frame {
  width:400px;
  height:400px;
  background:#ffffff;
  box-shadow: 0 1px 10px rgba(0,0,0,0.5);
  position:relative;
  top:50px;
  left:50px;
}

.img-wrapper {
  width:195px;
  height:195px;
  position:absolute;
  cursor:pointer;
}

.img-wrapper img {
  box-shadow: 0 1px 10px rgba(0,0,0,0.4);
  width:inherit;
  height:inherit;
}

.img1 {
  top:2px;
  left:2px;
}

.img2 {
  top:2px;
  left:202px;
}

.img3 {
  top:202px;
  left:2px;
}

.img4 {
  top:202px;
  left:202px;
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
  position:absolute;
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
  position:absolute;
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

/* 추가된 부분 */
.img-wrapper:hover .darkness{
  opacity:0.4;
}

/* 추가된 부분 */
.img-wrapper:hover .btn-plus {
  opacity:1;
  transform:scale(1);
}
/* 추가된 부분 */
.img-wrapper:hover .btn-plus1{
  opacity:1;
  transform:scale(1);
}

/* 추가 */
a{
	font-style: none
}
</style>

</head>
<body>

<div id="wrapper">

  <div id="frame">
    <div class="img-wrapper img1">
      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDtfNIkGooyqsBDlQ_W4bznuExkLsWUg0xwNJgmijy-2l7wn-T"/>
      <div class="darkness"></div>
      <div class="btn-plus"><a href=""><span draggable="false">예매하기</span></a></div>
      <div class="btn-plus1"><a href=""><span draggable="false">상세보기</span></a></div>
    </div>
      
    <div class="img-wrapper img2">
      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJSqmRDw0NslJoX2PGpU2MqCmcq1oxNaUSgqHWQzMo9xdffAxp"/>
      <div class="darkness"></div>
      <div class="btn-plus"><a href=""><span draggable="false">예매하기</span></a></div>
      <div class="btn-plus1"><a href=""><span draggable="false">상세보기</span></a></div>
      
    </div>
    
    <div class="img-wrapper img3">
      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRa9xmdTGxroxImnlyXBUcrFE-0BcjKofMscCK1Yu-NbahvMLqHLw"/>
      <div class="darkness"></div>
      <div class="btn-plus"><a href=""><span draggable="false">예매하기</span></a></div>
      <div class="btn-plus1"><a href=""><span draggable="false">상세보기</span></a></div>
    </div>
    
    <div class="img-wrapper img4">
      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTK-7Grq30fWlFQ_lVEmutDHaYboppq8zJo9zepB-EivlgUzuU-g"/>
      <div class="darkness"></div>
      <div class="btn-plus"><a href=""><span draggable="false">예매하기</span></a></div>
      <div class="btn-plus1"><a href=""><span draggable="false">상세보기</span></a></div>
    </div>
  </div>
</div>

</body>
</html>