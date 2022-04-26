<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
	background: black;
	color: white;
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
			<a href="../main/fix.jsp">
				<img src="https://img.cgv.co.kr/R2014/images/common/logo/logoRed.png">
			</a>
		</h1>
	</div>
	<div>
		<div>
			<h1>
			<img src="<%=movieImg%>">
			<span>
			
			</span>
			</h1>
		</div>
	</div>
	
	<div>
		<ul>
			<li>
				<span>
					<strong>영화제목 : <%= movieName%></strong>
					<hr>
				</span>
			</li>
			<li>
				<span>
					<strong>개봉일 : <%= movieOpen%> </strong>
				</span>
			</li>
			<li>
				<span>
					<strong>상영시간 : <%= movieRunning %> 시간</strong>
				</span>
			</li>
			<li>
				<button class="btn btn-danger"><a href="#">예매하기</a></button>
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
	<div>
		<h3>줄거리</h3>
		<hr>
		<div>
		<span><%=movieSummary%></span>
		</div>
	</div>
</body>
</html>