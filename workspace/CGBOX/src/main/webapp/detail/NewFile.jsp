<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style type="text/css">
body{
	background: black;
	color: white;
	font-family: 'Noto Sans KR', sans-serif;
}
/* div{ */
/* 	border: 1px solid white; */
/* } */
h1{
	text-align: center;
}
li{
	list-style: none;
}
a{
	text-decoration: none;
}
hr{
	background: white;
}
div{
	margin: 15px;
}
img{
	border-radius: 30px;
}
</style>

</head>
<body>
<%	
	String movieName = (String)session.getAttribute("movieName");
	String movieOpen = (String)session.getAttribute("movieOpen");
	String movieSummary = (String)session.getAttribute("movieSummary");
	String movieLink = (String)session.getAttribute("movieLink");
	String movieImg = (String)session.getAttribute("movieImg");
	String movieRunning = (String)session.getAttribute("movieRunning");

%>
	<div>
	
		<h1>
			<a href="../main/mainPage.jsp">
				<img src="../images/logo_transparent.png" width="200px;" height="200px;">
			</a>
		</h1>
	</div>
	
	<br>
	
	<div>
		<div>
			<h1>
			<img src="<%=movieImg%>">
			<span>
			
			</span>
			</h1>
		</div>
	</div>
	
	<br>
	
	<div>
		<ul>
			<li>
				<span>
					<h2>
					<strong>영화제목 : <%= movieName%></strong>
					</h2>
					<hr>
				</span>
			</li>
			<li>
				<span>
					<strong>개봉일 : <%= movieOpen%> </strong>
				</span>
			</li>
			<br>
			<li>
				<span>
					<strong>상영시간 : <%= movieRunning %> 시간</strong>
				</span>
			</li>
			<br>
			<li>
				<button class="btn btn-danger" onclick="location.href='../ticketing/reservation.jsp'">예매하기</button>
			</li>
		</ul>
	</div>
	<div>
		<h1>
		<video autoplay="autoplay" muted="muted" loop="999">
			<source src="<%=movieLink%>">
		</video>
		</h1>
	</div>
	<div id="SummaryDiv">
		<h3>줄거리</h3>
		<hr>
		<div>
		<span><%=movieSummary%></span>
		</div>
	</div>
</body>
</html>