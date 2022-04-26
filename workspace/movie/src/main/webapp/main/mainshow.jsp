<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGBOX</title>
<style type="text/css">
li{
	list-style: none;
	list-style-type: none;
	float: left;
}

</style>
</head>
<body>
	<div>
		<div class="header">
			<div class="header_content">
				<div class="contents">
					<h1 onclick>
						<a href="#">
							<img src="https://img.cgv.co.kr/R2014/images/common/logo/logoRed.png">
						</a>
						<span>CULTUREPLEX</span>
					</h1>
				</div>
				<div class="nav">
					<ul>
						<li>
							<a href="로그인화면">
								<img src="https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png">
								<span>로그인</span>
							</a>
						</li>
						<li>
							<a href="회원가입화면">
								<img src="https://img.cgv.co.kr/R2014/images/common/ico/loginJoin.png">
								<span>회원가입</span>
							</a>
						</li>
						<li>
							<a href="마이페이지">
								<img src="https://img.cgv.co.kr/R2014/images/common/ico/loginMember.png">
								<span>마이페이지</span>
							</a>
						</li>
					</ul>
					<div class="contents">
						<ul>
							<li>
								<a href="영화">영화</a>
							</li>
							<li>
								<a href="예매">예매</a>
							</li>
							<li>
								<a href="스토어">스토어</a>
							</li>
							<li>
								<a href="이벤트">이벤트</a>
							</li>
							<li>
								<a href="고객센터">고객센터</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="contaniner">
			
		</div>
		<div>
			<div class="contents">
				<div class="video_wrap">
					<video autoplay muted>
						<source type="video/mp4" src="http://h.vod.cgv.co.kr:80/vodCGVa/85603/85603_199812_1200_128_960_540.mp4">
					</video>
				</div>
			</div>
		</div>
	</div>
	<div class="movieChart">
		<div class="contents">
			<div class="movicechart">
				<div class="tabBtn_wrap">
					<h3>
						<a href="#" class="active" id="btnMovie">무비차트</a>
					</h3>
					<h3>
						<a href="#" id="btnReserMovie">상영예정작</a>
					</h3>
				</div>
			</div>
		</div>
	</div>
</body>
</html>