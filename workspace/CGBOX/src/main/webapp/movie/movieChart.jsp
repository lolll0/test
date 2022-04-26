<%@page import="cgbox.vo.MemberVO"%>
<%@page import="movie.vo.MovieVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<title>Insert title here</title>
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
  .movieNo{
  	display: inline-block;
/*   	max-width: auto; */
/*   	max-height: auto; */
  	margin: 10px;
  }
  .movieCover{
  	text-align: center;
  }
  ol{
  	text-align: center;
  }
  .movieli{
  	display: inline-block;
  	margin: 20px;
  	width: 215px;
  	height: 500px;
  }
  .strongDiv{
  	width: auto;
  	height: 40px;
  	background: red;
  	margin-bottom: 5px;
  }
  strong{
  	text-align: center;
  	height: 214px;
  }
  .movieImg{
  	width: 197px;
  	height: 350px;
  }
  .h2div{
  	display: inline-block;
  }
  .chartdiv{
  	margin-left: 200px;
  	margin-right: 200px;
  }
  h2{
  	color : white;
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
/* div안 가운데로 높이 맞춤 */
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
  	color: white;
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
</style>
<script type="text/javascript">
// 	var str = $('.open').text();
// str.substring(0,10);
$(function(){
	var str = $('.open').text();
	var str = str.substring(0, 10);
	$('.open').text(str);
	
	var name = $('.Name').text();
	var name = str.substring(11).replace('.');
	$('.Name').text(name);
	
	
	<% 
	MemberVO vo = (MemberVO)session.getAttribute("loginmember");
	if(vo != null){
	%>
	$('.loginTest').css('display', 'none');
	$('.logout').before('<li class="topli" style="margin-left: 10px"><a href="mainPage.jsp" class="Alogout"><div style="text-align: center;"><img class="topimg" src="https://img.icons8.com/ios/36/ffffff/exit.png"/ width="36" height="36"><br><span>로그아웃</span></div></a></li>');
	
	<%
	}
	%>	
	
	
	$('.Alogout').on('click', function(){
		<% session.removeAttribute("loginmember");
		   
		
// 		response.sendRedirect("mainPage.jsp");
 		%> 
 		window.location.href='<%=request.getContextPath()%>/mainPage.jsp';
	})
	
})	
</script>
</head>
<body>
<%
	String[] movieName = (String[])session.getAttribute("movieName");
	String[] movieOpen = (String[])session.getAttribute("movieOpen");
	String[] movieSummary = (String[])session.getAttribute("movieSummary");
	String[] movieLink = (String[])session.getAttribute("movieLink");
	String[] movieImg = (String[])session.getAttribute("movieImg");
	String[] movieRunning = (String[])session.getAttribute("movieRunning");

%>
<div class="header">
				<div class="header-content" style="clear: both;">
					<div class="contents">
						
							<a href="../main/mainPage.jsp">
								<img class="topimg" src="../images/logo_transparent.png" width="200" height="200">
							</a>
						
						<ul class="memberul">
							<div class="adDiv">
								<a href="../user_event.jsp">
									<img class="topimg" src="https://img.cgv.co.kr/WingBanner/2022/0303/16462658373950.png">
								</a>
							</div>
							<li class="topli" style="margin-left: 10px">
								<a href="../ticketing/NonMember_reservations.jsp">
									
									
										<img  class="topimg" src="https://img.icons8.com/material-outlined/36/ffffff/lock--v1.png"/ width="36" height="36"><br>
										<span>로그인</span>
									
								</a>
							</li>
							<li class="topli" style="margin-left: 10px">
								<a href="../member/member.jsp">
									<div style="text-align: center;">
										<img class="topimg" src="https://img.icons8.com/small/36/ffffff/add-user-group-woman-woman.png"/ width="36" height="36"><br>
										<span>회원가입</span>
									</div>
								</a>
							</li>
							<li class="topli" style="margin-left: 10px">
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
										<span>고객센터</span>
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
									<a href="../movie/movieChart.jsp">영화</a>
								</h2>
							</li>
							<li class="topli">
								<h2>
									<a href="../ticketing/reservation.jsp">예매</a>
								</h2>
							</li>
							<li class="topli">
								<h2>
									<a href="../store/storePage.jsp">스토어</a>
								</h2>
							</li>
							<li class="topli">
								<h2>
									<a href="../user_event.jsp">이벤트</a>
								</h2>
							</li>
							<li class="topli">
								<h2>
									<a href="../user_FAQ.jsp">고객페이지</a>
								</h2>
							</li>
						</ul>
					</div>
				</div>
						<br>
			</div>

	<br>
<!-- 	<div class="movieCover"> -->
<!-- 		<div class="movieNo"> -->
<!-- 			<h2>No.1</h2> -->
<!-- 		</div> -->
		
<!-- 		<div class="movieNo"> -->
		
<!-- 		</div> -->
		
<!-- 		<div class="movieNo"> -->
		
<!-- 		</div> -->
<!-- 	</div> -->
<div class="chartdiv">
	
	<div class="movieCover">
		<h2>무비차트</h2>
		<hr style="background: white;">
		<ol>
			<li class="movieli">
				<div class="movieImg">
					<div class="strongDiv">
						<div class="h2div">
							<h2 class="rank">No.1</h2>	
						</div>			
					</div>
					<span>
						<img src="<%=movieImg[0] %>" width="197" height="260">
					</span>
				</div>
				<div class="movieDetail">
					
						<strong><%=movieName[0] %></strong>
						<br>
						개봉일 : <strong class="open"><%=movieOpen[0] %></strong>
						<br>
						<div>
							<button class="btn btn-danger" onclick="location.href='../ticketing/reservation.jsp'">예매하기</button>
						</div>
				</div>
			</li>
			<li class="movieli">
				<div class="movieImg">
					<div class="strongDiv">
						<h2 class="rank">No.2</h2>				
					</div>
					<span>
						<img src="<%=movieImg[1] %>" width="197" height="260">
					</span>
				</div>
				<div class="movieDetail">
					
						<strong><%=movieName[1] %></strong>
						<br>
						개봉일 : <strong class="open"><%=movieOpen[1] %></strong>
						<br>
						<div>
							<button class="btn btn-danger" onclick="location.href='../ticketing/reservation.jsp'">예매하기</button>
						</div>
				</div>
			</li>
			<li class="movieli">
				<div class="movieImg">
					<div class="strongDiv">
						<h2 class="rank">No.3</h2>				
					</div>
					<span>
						<img src="<%=movieImg[2] %>" width="197" height="260">
					</span>
				</div>
				<div class="movieDetail">
					
						<strong><%=movieName[2] %></strong>
						<br>
						개봉일 : <strong class="open"><%=movieOpen[2] %></strong>
						<br>
						<div>
							<button class="btn btn-danger" onclick="location.href='../ticketing/reservation.jsp'">예매하기</button>
						</div>
				</div>
			</li>
		</ol>
		<ol>
			<li class="movieli">
				<div class="movieImg">
					<div class="strongDiv">
						<h2 class="rank">No.4</h2>				
					</div>
					<span>
						<img src="<%=movieImg[3] %>" width="197" height="260">
					</span>
				</div>
				<div class="movieDetail">
					
						<strong><%=movieName[3] %></strong>
						<br>
						개봉일 : <strong class="open"><%=movieOpen[3] %></strong>
						<br>
						<div>
							<button class="btn btn-danger" onclick="location.href='../ticketing/reservation.jsp'">예매하기</button>
						</div>
				</div>
			</li>
			<li class="movieli">
				<div class="movieImg">
					<div class="strongDiv">
						<h2 class="rank">No.5</h2>				
					</div>
					<span>
						<img src="<%=movieImg[4] %>" width="197" height="260">
					</span>
				</div>
				<div class="movieDetail">
					
						<strong><%=movieName[4] %></strong>
						<br>
						개봉일 : <strong class="open"><%=movieOpen[4] %></strong>
						<br>
						<div>
							<button class="btn btn-danger" onclick="location.href='../ticketing/reservation.jsp'">예매하기</button>
						</div>
				</div>
			</li>
			<li class="movieli">
				<div class="movieImg">
					<div class="strongDiv">
						<h2 class="rank">No.6</h2>				
					</div>
					<span>
						<img src="<%=movieImg[5] %>" width="197" height="260">
					</span>
				</div>
				<div class="movieDetail">
					
						<strong><%=movieName[5] %></strong>
						<br>
						개봉일 : <strong class="open"><%=movieOpen[5] %></strong>
						<br>
						<div>
							<button class="btn btn-danger" onclick="location.href='../ticketing/reservation.jsp'">예매하기</button>
						</div>
				</div>
			</li>
		</ol>
		<ol>
			<li class="movieli">
				<div class="movieImg">
					<div class="strongDiv">
						<h2 class="rank">No.7</h2>				
					</div>
					<span>
						<img src="<%=movieImg[6] %>" width="197" height="260">
					</span>
				</div>
				<div class="movieDetail">
					
						<strong><%=movieName[6] %></strong>
						<br>
						개봉일 : <strong class="open"><%=movieOpen[6] %></strong>
						<br>
						<div>
							<button class="btn btn-danger" onclick="location.href='../ticketing/reservation.jsp'">예매하기</button>
						</div>
				</div>
			</li>
			<li class="movieli">
				<div class="movieImg">
					<div class="strongDiv">
						<h2 class="rank">No.8</h2>				
					</div>
					<span>
						<img src="<%=movieImg[7] %>" width="197" height="260">
					</span>
				</div>
				<div class="movieDetail">
					
						<strong><%=movieName[7] %></strong>
						<br>
						개봉일 : <strong class="open"><%=movieOpen[7] %></strong>
						<br>
						<div>
							<button class="btn btn-danger" onclick="location.href='../ticketing/reservation.jsp'">예매하기</button>
						</div>
				</div>
			</li>
			<li class="movieli">
				<div class="movieImg">
					<div class="strongDiv">
						<h2 class="rank">No.9</h2>				
					</div>
					<span>
						<img src="<%=movieImg[8] %>" width="197" height="260">
					</span>
				</div>
				<div class="movieDetail">
					
						<strong class="Name"><%=movieName[8] %></strong>
						<br>
						개봉일 : <strong class="open"><%=movieOpen[8] %></strong>
						<br>
						<div>
							<button class="btn btn-danger" onclick="location.href='../ticketing/reservation.jsp'">예매하기</button>
						</div>
				</div>
			</li>
		</ol>
	</div>
</div>	
</body>
</html>