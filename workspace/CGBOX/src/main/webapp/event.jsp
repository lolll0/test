<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
	<title>이벤트관리</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	<script src="assets/js/jquery-3.6.0.min.js"></script>
	<script src="assets/js/jquery.serializejson.min.js"></script>	
	<script src = "assets/js/event.js" ></script>
	
	<!-- *테이블  -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
#pagelist{
 margin-left : 40%;
 height : 50px;
}
/* .eventB{float: right;} */
</style>
<script>
currentPage = 1; 
event = { };
$(function(){
	typevalue = "";
	wordvalue = "";
	eventList();
	
	//page번호 클릭하는 이벤트 //
    $('#pagelist').on('click','.pnum',function(){
    	//alert($(this).text());
    	currentPage = $(this).text();
    	eventList();
    })
    
    //이전버튼 클릭하는 이벤트
     $('#pagelist').on('click','.prev',function(){
    	 currentPage = parseInt($('.pager a').first().text()) -1;
    	 eventList();
    })
    //다음버튼 클릭하는 이벤트
    $('#pagelist').on('click','.next',function(){
    	currentPage = parseInt($('.pager a').last().text()) +1;
    	eventList();
    })
	
    
	$('body').on('click', '.updateB', function(){
		
		//수정창 띄우기 - 수정할 내용(원래 내용)들을 출력 
    	ecard = $(this).parents('.arclass');
		
		no = ecard.find('.eno').text();
		title = ecard.find('.etitle').text();
		start = ecard.find('.estart').text();
		end = ecard.find('.eend').text();
		src = ecard.find('.esrc').text();
		detail = ecard.find('.image').text();
		
		$('#modiModal #title').val(title);
		$('#modiModal #no').val(no);
		$('#modiModal #start').val(start);
		$('#modiModal #end').val(end);
		$('#modiModal #src').val(src);
		$('#modiModal #detail').val(detail);
		
		$('#modiModal #no').prop('disabled', true);
	})
	
	//글 수정 모달창에서 내용을 수정후에 전송 버튼 클릭
 	$('#modisend').on('click', function(){
 		
 		no = $('#modiModal #no').val();
 		title = $('#modiModal #title').val();
 		start = $('#modiModal #start').val();
 		end = $('#modiModal #end').val();
 		src = $('#modiModal #src').val();
 		detail = $('#modiModal #detail').val();
 		
 		//객체에 저장
 		event.no = no;
 		event.title = title;
 		event.start = start;
 		event.end = end;
 		event.src = src;
 		event.detail = detail;
 		
 		//서버로 보내기
 		updateEvent();
 		
 		//창닫기
		$('#modiModal').modal('hide');
 		
 		eventList();
 	})
	
 	//굳이 클릭이벤트 안줘도 열림
	$('body').on('click', '.insertB', function(){
		$('#modiModal2 #title2').val("");
 		$('#modiModal2 #start2').val("");
 		$('#modiModal2 #end2').val("");
 		$('#modiModal2 #src2').val("");
 		$('#modiModal2 #detail2').val("");
	})
	$('#modisend2').on('click', function(){
		
// 		no = $('#modiModal2 #no2').val();
 		title = $('#modiModal2 #title2').val();
 		start = $('#modiModal2 #start2').val();
 		end = $('#modiModal2 #end2').val();
 		src = $('#modiModal2 #src2').val();
 		detail = $('#modiModal2 #detail2').val();
 		
 		//객체에 저장
//  		event.no = no;
 		event.title = title;
 		event.start = start;
 		event.end = end;
 		event.src = src;
 		event.detail = detail;
 		
 		//서버로 보내기
 		insertEvent();
 		
 		//창닫기
		$('#modiModal2').modal('hide');
 		
 		eventList();
	})
 	
	$('body').on('click', '.deleteB', function(){
		actionIdx = $(this).attr('idx');
		if(confirm("정말 삭제하시겠습니까?")==true){
			deleteEvent(this);
		}
 	})
	
})
	
</script>	
</head>
<body class="is-preload">

	<!-- Wrapper -->
		<div id="wrapper">

			<!-- Main -->
				<div id="main">
					<div class="inner">

						<!-- Header -->
							<header id="header">
								<a href="event.jsp" class="logo"><strong>이벤트 관리</a>
								<ul class="icons">
									<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
									<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
									<li><a href="#" class="icon brands fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
									<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
									<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
								</ul>
							</header>
							<br><br>


						<!-- Section -->
							<section>
								<header class="major">
									
									<input class="insertB" type="button" data-toggle="modal" name="insert" data-target="#modiModal2" value="  등록">
								</header>
								<!--** 이벤트 목록 출력할 부분 -->
								<div class="posts">
<!-- 									<article> -->
<!-- 										<a href="#" class="image"><img src="images/pic01.jpg" alt="" /></a> -->
<!-- 										<h3>Interdum aenean</h3> -->
<!-- 										<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p> -->
<!-- 										<ul class="actions"> -->
<!-- 											<li><a href="#" class="button">More</a></li> -->
<!-- 										</ul> -->
<!-- 									</article> -->
<!-- 									<article> -->
<!-- 										<a href="#" class="image"><img src="images/pic02.jpg" alt="" /></a> -->
<!-- 										<h3>Nulla amet dolore</h3> -->
<!-- 										<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p> -->
<!-- 										<ul class="actions"> -->
<!-- 											<li><a href="#" class="button">More</a></li> -->
<!-- 										</ul> -->
<!-- 									</article> -->
<!-- 									<article> -->
<!-- 										<a href="#" class="image"><img src="images/pic03.jpg" alt="" /></a> -->
<!-- 										<h3>Tempus ullamcorper</h3> -->
<!-- 										<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p> -->
<!-- 										<ul class="actions"> -->
<!-- 											<li><a href="#" class="button">More</a></li> -->
<!-- 										</ul> -->
<!-- 									</article> -->
<!-- 									<article> -->
<!-- 										<a href="#" class="image"><img src="images/pic04.jpg" alt="" /></a> -->
<!-- 										<h3>Sed etiam facilis</h3> -->
<!-- 										<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p> -->
<!-- 										<ul class="actions"> -->
<!-- 											<li><a href="#" class="button">More</a></li> -->
<!-- 										</ul> -->
<!-- 									</article> -->
<!-- 									<article> -->
<!-- 										<a href="#" class="image"><img src="images/pic05.jpg" alt="" /></a> -->
<!-- 										<h3>Feugiat lorem aenean</h3> -->
<!-- 										<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p> -->
<!-- 										<ul class="actions"> -->
<!-- 											<li><a href="#" class="button">More</a></li> -->
<!-- 										</ul> -->
<!-- 									</article> -->
<!-- 									<article> -->
<!-- 										<a href="#" class="image"><img src="images/pic06.jpg" alt="" /></a> -->
<!-- 										<h3>Amet varius aliquam</h3> -->
<!-- 										<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p> -->
<!-- 										<ul class="actions"> -->
<!-- 											<li><a href="#" class="button">More</a></li> -->
<!-- 										</ul> -->
<!-- 									</article> -->
								</div><br><br>
								<div id = "pagelist"></div>
							</section>

					</div>
				</div>

			<!-- Sidebar -->
				<div id="sidebar">
					<div class="inner">

						<!-- Search -->
							<section id="search" class="alt">
<!-- 								<form method="post" action="#"> -->
<!-- 									<input type="text" name="query" id="query" placeholder="Search" /> -->
<!-- 									<a  href="main/mainPage.jsp">  -->
									<img onclick="location.href='main/mainPage.jsp';" style="cursor: pointer" class="topimg" src="images/logo2.PNG" width="100" height="50">
<!-- 									</a> -->
<!-- 								</form> -->
							</section>

						<!-- Menu -->
							<nav id="menu">
								<header class="major">
									<h2>Menu</h2>
								</header>
								<ul>
									<li><a href="index.jsp">회원관리</a></li>
									<li>
										<span class="opener">문의관리</span>
										<ul>
											<li><a href="QnA.jsp">Q&A 관리</a></li>
											<li><a href="FAQ.jsp">FAQ 관리</a></li>
											<li><a href="notice.jsp">공지사항 관리</a></li>
										</ul>
									</li>
									<li><a href="event.jsp">이벤트관리</a></li>
									<li><a href="store/manager_storePage.jsp">상품관리</a></li>
									
								</ul>
							</nav>

						

					

					</div>
				</div>

		</div>
		
<!-- The Modal -->
<div class="modal" id="modiModal">
  <div class="modal-dialog">
    <div class="modal-content">

<!--       Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">이벤트 수정</h4>
<!--         <button type="button" class="close" data-dismiss="modal">&times;</button> -->
      </div>

<!--       Modal body -->
      <div class="modal-body">
        <form id="modiForm">
        	<label>이벤트 번호</label> 
        	<input id="no" type="text" name="no"><br>
        
        	<label>이벤트 제목</label> 
        	<input id="title" type="text" name="title"><br><br>
        
        	<label>시작날짜</label>
        	<input id="start" type="date" name="start"><br><br>
        	
        	<label>종료날짜</label>
        	<input id="end" type="date" name="end"><br><br>
        	
        	<label>썸네일 이미지소스</label>
        	<input id="src" type="text" name="src"><br>
        	
        	<label>상세내용 이미지소스</label><br>
        	<input id="detail" type="text" name="detail"><br>
        	
        	<br>
        	<input type="hidden" id="num" name="num">
        	<input  style="float: right;" type="button" id="modisend" value="수정">
        </form>
      </div>

<!--       Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div> 
		
<!-- The Modal2 -->
<div class="modal" id="modiModal2">
  <div class="modal-dialog">
    <div class="modal-content">

<!--       Modal Header2 -->
      <div class="modal-header">
        <h4 class="modal-title">이벤트 등록</h4>
<!--         <button type="button" class="close" data-dismiss="modal">&times;</button> -->
      </div>

<!--       Modal body2 -->
      <div class="modal-body">
        <form id="modiForm2">
<!--         	<label>이벤트 번호</label>  -->
<!--         	<input id="no2" type="text" name="no"><br> -->
        
        	<label>이벤트 제목</label> 
        	<input id="title2" type="text" name="title"><br><br>
        
        	<label>시작날짜</label>
        	<input id="start2" type="date" name="start"><br><br>
        	
        	<label>종료날짜</label>
        	<input id="end2" type="date" name="end"><br><br>
        	
        	<label>썸네일 이미지소스</label>
        	<input id="src2" type="text" name="src"><br>
        	
        	<label>상세내용 이미지소스</label><br>
        	<input id="detail2" type="text" name="detail"><br>
        	
        	<br>
        	<input type="hidden" id="num2" name="num">
        	<input style="float: right;" type="button" id="modisend2" value="등록">
        </form>
      </div>

<!--       Modal footer2 -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div> 
		
		
	<!-- Scripts -->
<!-- 		<script src="assets/js/jquery.min.js"></script> -->
		<script src="assets/js/browser.min.js"></script>
		<script src="assets/js/breakpoints.min.js"></script>
		<script src="assets/js/util.js"></script>
		<script src="assets/js/main.js"></script>
	
</body>
</html>