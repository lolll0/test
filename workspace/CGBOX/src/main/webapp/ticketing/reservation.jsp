<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 예매</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="../js/jquery.serializejson.min.js"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
  
<style type="text/css">
nav{
	background: rgb(220,53,69);
	background: linear-gradient(90deg, rgba(220,53,69,1) 0%, rgba(220,53,69,1) 29%, rgba(255,66,0,1) 100%);
}

#cont div{
	margin-top: 138px;
  	background-color: #333333;
	text-align: center;
	color: white;
	padding: 5px;
	font-family: 'East Sea Dokdo', cursive;
	font-size: 2.0em;
  }
  
/* .row>div */
#cont>div,
#movieList,
#inrow>div,
#daycon,
#movieTimeList
{
  	border : 1px solid lightgray;
}
  
 #movieList
 {
 	text-align: center;
 	padding: 0px;
 }
 
 #movieTimeList{
 	padding: 0px;
 }
 
#inrow{
	border: 0px;
}

.list-group-item.active{
	background-color: #dc3545;
    border-color: #dc3545;
}

.active,
.screen_time.active,
.screen_time.active:hover
{
    /* border: 1px solid #dc3545; */
	background-color: #dc3545;
    border-color: #dc3545;
	color: white;
	
}

.screen_time+span{
	font-size: 13px;
	color: green;
	font-weight: bold;
}


.date{

	padding : 10px;
	text-align: center;
	font-weight: bold;
	border: 2px solid lightgray;
	border-radius:20px;
	margin: 10px auto;
	width: 120px;
	
}
.month{
	font-size: 2.0em;
}
.year{
	font-size: 1.5em;
	color: gray;
}

#theather_div
{
	border: 0px;
}

.dayList>.list-group-item {
	border: 0px;
}
.dayList{
	max-width: 100%; 
	border: 0px;
	padding: 0px;
}

.sun,
.sun + span{
	color: red;
}
.sat,
.sat + span{
	color: blue;
}

.daynum{
	margin-left: 30px;
}
.dayList span,
.theater_num
{
	font-weight: bold;
}


.theater_kind{
	color: #dc3545;
	font-weight: bold;
	
}

.theater_seat{
	color: gray;
	font-size: 0.8em;
}

.screen_time{
	display: inline-block;
	border: 1px solid lightgray;
	width: 50px;
	text-align: center;
}

.screen_time:hover{
	background: lightgray;
}

.movieTime{
	display: inline-block;
	width: 100px;
	height: 25px;
	margin-top: 10px;
}

/* 중복 css */
#movieImg{
	display: inline-block;
	width: 100px;
	height: 135px;
}

#movieResult{
	background: #1d1d1c;
	border: 0px;
}

#movieInfo,
#theaterInfo,
#nextDiv
{
	color: white;
	border-right: 1px solid gray;
	margin-top: 20px;
	margin-bottom: 20px;
}


#movieInfo>span,
#theaterInfo>span
{
	display: inline-block;
	margin: 3px;
	padding-top: 5px;
	margin-bottom: 0px;
}

#movieImgDiv{
	text-align: right;
	margin-top: 20px;
	padding-top: 15px;
}

.infoText+span{
	font-weight: bold;
}

.nextdivs{
	font-size: 2.0em;
	margin: 10px;
	margin-top: 20px;
	display: inline-block;
}

.nextdivs img{
	padding-bottom: 5px;
}

#nextDiv{
	color: gray;
}


#nextbtn{
	margin-left: 60px;
	width: 120px;
	height: 120px;
}

#movieInfoDiv,
#thInfoDiv{
	display: inline;
}


/* 스크롤 바 */
#inrow>div, 
#movieList,
#daycon,
#movieTimeList
{
	padding: 0px;
	overflow: auto;
	height: 445px;
}

#inrow>div::-webkit-scrollbar,
#movieList::-webkit-scrollbar,
#daycon::-webkit-scrollbar,
#movieTimeList::-webkit-scrollbar
{
	width: 5px;
}

#inrow>div::-webkit-scrollbar-thumb,
#movieList::-webkit-scrollbar-thumb,
#daycon::-webkit-scrollbar-thumb,
#movieTimeList::-webkit-scrollbar-thumb
{
    background-color: lightgray;
    border-radius: 10px;
}
 
#img{
	margin-left : 10px;
	margin-bottom: 3px;
}




</style>

<script type="text/javascript">
$(function() {

	<%
	//세션이 없을 경우 진행할 수 없으니 알림을 출력하고 로그인페이지로 이동한다
	if(session.getAttribute("loginmember") == null && session.getAttribute("nonMember") == null){
		//로그인 페이지로 이동
	%>
		alert('로그인이 필요한 서비스입니다');
		location.href ='NonMember_reservations.jsp';
	<%
	}
	%>
	
	
	
	//영화 리스크 출력용 ajax(DB에서 가져옴)
	$.ajax({
		type: "GET",
		url: "<%=request.getContextPath()%>/MovieList.do",
		success: function(res){
			//영화 이름 movie_name / 영화번호 movie_no		
			 var result = "";
			
			$.each(res, function(i,v) {
			 	result += "<a id='" + v.movie_no +"' href='#' class='list-group-item list-group-item-action movie'>" + v.movie_name +"</a>"
			}) 
			
			$('#movieList').html(result); 
		},
		dataType : 'json'
	}) 
	
	//영화관 정보 출력용 ajax (DB에서 가져옴)
	$.ajax({
		type:"get",
		url : "<%=request.getContextPath()%>/MTheaterList.do",
		success: function(res) {
			/* console.log(res); */
			var result = "";
			
			$.each(res, function(i,v) {
				result += '<a href="#" class="list-group-item list-group-item-action" id="' + v.mtheater_no +'">'+ v.mtheater_name +'</a>';
			})
			
			$('#thlist').html(result);
			
		},
		error: function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
	
	
	//모든 요소 클릭시 nextbtn 활성화
	movieNo ="";	//영화번호
	moiveName = "";	//영화이름
	mtheaterName = "";	//상영관 이름
	resmonth = "";	// 예약일 달
	resday = "";	// 예약일 날
	resweek = "";	//요일
	theaterNo = "";	// 예약 상영관 번호 
	screenTime = ""; // 상영시간
	//모든 값이 입력되었는지 체크하는 함수
	function checkNext() {
		if(moiveName.length > 0 && mtheaterName.length > 0 && resmonth.length > 0 && resday.length > 0 && theaterNo.length > 0 && screenTime.length > 0 && resweek.length > 0){
			/* alert('모든값이 입력되었습니다'); */
			$('#nextbtn').removeAttr('disabled');
		}
	}
	
	
	//a 리스트를 클릭해서 active가 생성될 때 마다 체크
	function printTimeList() {
		
		//영화이름, 상영관 이름, 날짜정보가 모두 선택된 경우 시간 리스트를 출력
		if(moiveName.length > 0 && mtheaterName.length > 0 && resmonth.length > 0 && resday.length > 0 && resweek.length > 0 ){
			/* alert('시간리스트 출력준비완료!');	 */
			$.ajax({
				type:"get",
				data : {
					"movie_no" : movieNo,
					"mtheaterName" : mtheaterName
				},
				url : "<%=request.getContextPath()%>/screenList.do",
				success: function(res) {
					
					//가져와야되는 정보
					//1. 상영관 번호와  ->THEATER_NO
					//2. 상영관 이름(키값) ->THEATER_NAME
					//3. 상영관 종류(키값) -> THEATER_KIND
					//4. 상영시작시간 / 종료시간 (O)-> screen_start / screen_end
					
					var result = "";

					//반복문 i가 키 값
					$.each(res, function(i,v) {
						var array = eval("(" + i + ")");
						var theater_name = array[0];
						var theater_kind = array[1];

						
						result += '<li class="list-group-item">';
						 
						result += '	<span class="theater_kind">'+ theater_kind +'</span>';
						result += '	<span class="theater_num" num="'+ theater_name +'">'+ theater_name +'관</span><br>'; 
						
						$.each(v, function(idx, s) {
							result += '	<span class="movieTime" no='+ s.screen_no +'>';
							result += '	  <span class="screen_time" end="'+s.screen_end +'">' + s.screen_start +'</span>';
							result += '	  <span class="seat">50석</span>'	
							result += '	</span>';
						})
						
						
						result += '</li>'; 
					})

		  		
					
					$('#movieTimeList ul').html(result);
					
				},
				dataType : 'json'
			})
			
		}
	}
	
	
	
	
	
	
	//다음 버튼 클릭시 전송데이터 전송하기
	$('#nextbtn').on('click', function() {
		var no = $('#movieTimeList ul span.active').parent().attr('no');
		var end = $('#movieTimeList ul span.active').attr('end');
		
		$.ajax({
			type:"get",
			data : {
				"movieNo"	   : movieNo,
				"moiveName"    : moiveName,
				"mtheaterName" : mtheaterName,
				"resmonth"     : resmonth,
				"resday"       : resday,
				"theaterName"    : theaterNo,
				"screenTime"   : screenTime,
				"screenNo"	   : no,
				"resweek" : resweek,
				"screen_end" : end
			},
			url : "<%=request.getContextPath()%>/ReservationSession.do",
			success: function() {
				location.href = "../ticketing/ticketing.jsp";
			}
			
		})
	})
	
	
	//영화 선택시
	//처음에는 포스터와 영화 정보를 숨긴다.
	$('#movieImg').hide();	
	$('#movieInfoDiv').hide();

	$(document).on('click', '#movieList a',function() {
		
		//클릭시 배경색 지정해주는 클래스 추가
		$('#movieList a').removeClass('active');
		$(this).addClass('active')
		
		//영화 정보에 영화정보 출력
		
		//1. 영화정보 출력
		$('#movieSelect').hide();
		$('#movieInfoDiv').show();
		
		var nm =  $(this).text();
		$('#movieName').text(nm);
		moiveName = nm;
		movieNo = $(this).attr('id');
		
		//2. 포스터 출력
		
		var mvid = $(this).attr('id');
		
		$.ajax({
			url : '<%=request.getContextPath()%>/getMovieInfo.do',
			type : 'get',
			data:{
				"mvid" : mvid
			},
			success : function(res) {
				console.log(res)
				$('#movieImg').attr('src', res.movie_img);
				$('#movieImg').show();
				
			},
			error : function() {
				
			},
			dataType : 'json'
		})
		
		
		
		//시청 연령, 영화관 종류(ex. 2D, 3D...)삽입
		
		checkNext();
		printTimeList();
	})

 	
 	//영화관 선택시
 	$('#thInfoDiv').hide();
	
	$(document).on('click', "#thlist a",function() {
		$('#thlist a').removeClass('active');
		$(this).addClass('active');
		
		$('#thInfoDiv').show();
		$('#theaterSelect').hide();
		
		var thname = $(this).text();
		mtheaterName = $(this).text();
		$('#thName').text(thname);
		
		var thno =$(this).attr('id');
		$('#thName').attr('no', thno); 
		
		checkNext();
		printTimeList();
		
	})

	
	$('.dayList a').on('click', function() {
		$('#thInfoDiv').show();
		$('#theaterSelect').hide();
		
		
		//이전에 토요일 일요일이 active클래스를 보유하고 있던 경우 다시 본래의 색으로 설
 		$('.dayList a').removeClass('active'); 
		
		$('.dayList .sun').css('color', 'red');
		$('.dayList .sun+span').css('color', 'red');
		$('.dayList .sat').css('color', 'blue');
		$('.dayList .sat+span').css('color', 'blue');
		
		
		var wek = $(this).children('span');
		// 토요일 일요일은 흰색으로 직접 바꿔 주어야함 
		if($(wek).hasClass('sun') || $(wek).hasClass('sat')){
			$(this).find('span').css('color', 'white');
		}
		
		$(this).addClass('active');
		
		resday = $(this).find('.daynum').text();
		resmonth = $(this).parent().prev().find('.month').text();
		resweek = $(this).children('span:eq(0)').text();
		$('#resdayInfo').text('2022.' + resmonth +'.' + resday + '(' + resweek +')');
		
		checkNext();
		printTimeList();
		
	})
	
	
	//상영시간선택
	$(document).on('click', '.screen_time', function() {
		$('.screen_time').removeClass('active');
		$(this).addClass('active')
		
		theaterNo = $(this).parent().parent().find('.theater_num').attr('num');
		
		console.log('선택한 상영관번호 : ' + theaterNo);
		screenTime = $(this).text();
		$('#resTimeInfo').text($(this).text());
		
		$('#thnoInfo').text(theaterNo + "관");
		
		checkNext();
	})
	
	$('#nextbtn').hover(function() {
		$(this).find('img').attr('src', 'https://img.icons8.com/fluency-systems-regular/50/ffffff/circled-right.png');
	}, function() {
		$(this).find('img').attr('src', 'https://img.icons8.com/fluency-systems-regular/50/dc3545/circled-right.png');
	})

})
</script>

</head>
<body>

<!-- 네비게이션 바 -->
<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
  <!-- Brand -->
  <a class="navbar-brand" href="../main/mainPage.jsp">CGBOX</a>

  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="movie/movieChart.jsp">영화</a>
    </li>
<!--     <li class="nav-item"> -->
<!--       <a class="nav-link" href="#">극장</a> -->
<!--     </li> -->
    <li class="nav-item">
      <a class="nav-link" href="reservation.jsp" style="font-weight : bold; color: white">예매</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="../store/storePage.jsp">스토어</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="../user_event.jsp">이벤트</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="../user_FAQ.jsp">고객센터</a>
    </li>


  </ul>
</nav>

<!-- ///////////////////////////////////////////////////////////// -->
<div class="container">

	<div class="row" id="cont">
	  <div class="col-sm-3">
	  	영화
	  </div>
	  
	  <div class="col-sm-3">
	  	극장
	  </div>
	  
	  <div class="col-sm-2">
	  	날짜
	  </div>
	  
	  <div class="col-sm-4">
	  	시간
	  </div>
	</div>
	
	<div id="cont2" class="row">
	  <div id="movieList" class="col-sm-3 list-group list-group-flush">
	  		<!-- 영화 리스트 출력 -->
	  </div>
	  
	  <div id="theather_div" class="col-sm-3">
	  	<!-- 극장 리스트 -->
	  	
	  	  	<!-- 지역리스트 -->
	  	  	<div id="inrow" class="row">
	  	  	
	  	  		
	  	  		<div class="theather col-sm-6 list-group list-group-flush">
	  	  			<a href="#" class="list-group-item list-group-item-action active">대전 
	  	  			<img id="img" src="https://img.icons8.com/fluency-systems-filled/15/ffffff/double-right.png"/>
	  	  			</a>
	  	  			
		  	  	</div>
	  	  		
	  	  		<div id="thlist" class="theather col-sm-6 list-group list-group-flush">
	  	  			<!-- 영화관 리스트 출력 -->
	  	  		</div>
	  	  	</div>
	  	  	
	  </div>
	  
	  <div id="daycon" class="col-sm-2">
	  
	  	<div class="container date">
	  		<span class="year">2022</span>
	  		<br>
	  		<span class="month">04</span>
	  	</div>
	  	<!-- 날짜 리스트 -->
	  	

	  	
	  	<div class="dayList col-sm-3 list-group list-group-flush">
	  		<a href="#" class="list-group-item list-group-item-action">
				<span class="">금</span>	  		
				<span class="daynum">15</span>	  		
	  		</a>
	  		<a href="#" class="list-group-item list-group-item-action">
				<span class="sat">토</span>	  		
				<span class="daynum">16</span>	  		
	  		</a>
	  		<a href="#" class="list-group-item list-group-item-action">
				<span class="sun">일</span>	  		
				<span class="daynum">17</span>	  		
	  		</a>
	  		<a href="#" class="list-group-item list-group-item-action">
				<span class="mon">월</span>	  		
				<span class="daynum">18</span>	  		
	  		</a>
	  		<a href="#" class="list-group-item list-group-item-action">
				<span class="tue">화</span>	  		
				<span class="daynum">19</span>	  		
	  		</a>
	  		<a href="#" class="list-group-item list-group-item-action">
				<span class="wed">수</span>	  		
				<span class="daynum">20</span>	  		
	  		</a>
	  		<a href="#" class="list-group-item list-group-item-action">
				<span class="thu">목</span>	  		
				<span class="daynum">21</span>	  		
	  		</a>
	  		<a href="#" class="list-group-item list-group-item-action">
				<span class="fri">금</span>	  		
				<span class="daynum">22</span>	  		
	  		</a>
	  	</div> 
	  	
	  	<div class="container date">
	  		<span class="year">2022</span>
	  		<br>
	  		<span class="month">05</span>
	  	</div>
	  	
	  	<div class="dayList col-sm-3 list-group list-group-flush">
	  		<a href="#" class="list-group-item list-group-item-action">
				<span class="">금</span>	  		
				<span class="daynum">15</span>	  		
	  		</a>
	  		<a href="#" class="list-group-item list-group-item-action">
				<span class="sat">토</span>	  		
				<span class="daynum">16</span>	  		
	  		</a>
	  		<a href="#" class="list-group-item list-group-item-action">
				<span class="sun">일</span>	  		
				<span class="daynum">17</span>	  		
	  		</a>
	  		<a href="#" class="list-group-item list-group-item-action">
				<span class="mon">월</span>	  		
				<span class="daynum">18</span>	  		
	  		</a>
	  		<a href="#" class="list-group-item list-group-item-action">
				<span class="tue">화</span>	  		
				<span class="daynum">19</span>	  		
	  		</a>
	  		<a href="#" class="list-group-item list-group-item-action">
				<span class="wed">수</span>	  		
				<span class="daynum">20</span>	  		
	  		</a>
	  		<a href="#" class="list-group-item list-group-item-action">
				<span class="thu">목</span>	  		
				<span class="daynum">21</span>	  		
	  		</a>
	  		<a href="#" class="list-group-item list-group-item-action">
				<span class="fri">금</span>	  		
				<span class="daynum">22</span>	  		
	  		</a>
	  	</div> 
	  	
	  </div>
	  
	  <div id="movieTimeList" class="col-sm-4">
	  	<!-- 영화 시간대별 리스트 -->
	  	<ul class="list-group list-group-flush">
	  	</ul>
	  </div>

	</div>
	
	<br><br>
</div>

	<div id="movieResult">
		<div class="col">
			<!-- 예매 정보 출력용 div -->
			<div class="row">
			
			  <!-- 영화선택 -->
			  <div id="movieImgDiv" class="col-sm-3">
  			    <img id="movieImg">
			  </div>
			  <div id="movieInfo" class="col-sm-1">
			  	<div id="movieInfoDiv">
			      <span id="movieName">영화제목</span><br>
			  	  <span id="movieKind">2D</span><br>
			  	  <span id="movieAge">15세 관람가</span>
			  	</div>
			  	
			  	
			  	<span id="movieSelect" style="color: gray; font-size: 1.5em; padding-top:55px;">영화선택</span>
			  </div>
			  
			  <!-- 극장선택 -->
			  <div id="theaterInfo" class="col-sm-2">
			    <div id="thInfoDiv">
			      <span class="infoText">극장</span>
			      <span id="thName"></span>
			      <br>
			      <span class="infoText">일시</span>
			      <span id="resdayInfo"></span>
			      <span id="resTimeInfo"></span>
			      <br>
			      <span class="infoText">상영관</span>
			      <span id="thnoInfo"></span>
			      <br>
			      <span class="infoText">인원</span>
			    </div>
			    <div style="text-align : center; padding-top: 60px;">
			      <span id="theaterSelect" style="color: gray; font-size: 1.5em; padding-top: 50px;">극장선택</span> 
			    </div>
			  </div>
			  
			  <div id="nextDiv" class="col-sm-6">
			  	<span class="nextdivs">
			  		<img src="https://img.icons8.com/small/50/666666/circled-chevron-right.png"/>
			  		좌석선택
			  	</span>
			  	
			  	<span class="nextdivs">
			  		<img src="https://img.icons8.com/small/50/666666/circled-chevron-right.png"/>
			  		예약
			  	</span>
			  	
			  	<span class="nextdivs">
			  		<!-- 활성화 상태 : 모든 요소 선택이 아닐시 > disabled 속성부여 -->
			  		
			  		<button id="nextbtn" type="button" class="btn btn-outline-danger btn-lg" disabled >
			  			<img src="https://img.icons8.com/fluency-systems-regular/50/dc3545/circled-right.png"/>
			  			<br>
				  		좌석선택
			  		</button>
			  	</span>
			  </div>
			  
			  
			  		
			  
			</div>
		</div>
	</div>
</body>
</html>