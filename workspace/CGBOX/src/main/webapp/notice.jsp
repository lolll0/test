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
	<title>공지관리</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	<script src="assets/js/jquery-3.6.0.min.js"></script>
	<script src="assets/js/jquery.serializejson.min.js"></script>	
	<script src = "assets/js/notice.js" ></script>
	
	<!-- *테이블  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
#pagelist{
 margin-left : 40%;
 height : 50px;
}
</style>
<script>
currentPage = 1; //초기값
notice = { };

$(function(){
	typevalue = "";
	wordvalue = "";
	noticeList();
	
	//page번호 클릭하는 이벤트 //
    $('#pagelist').on('click','.pnum',function(){
    	//alert($(this).text());
    	currentPage = $(this).text();
    	noticeList();
    })
    
    //이전버튼 클릭하는 이벤트
     $('#pagelist').on('click','.prev',function(){
    	 currentPage = parseInt($('.pager a').first().text()) -1;
    	 noticeList();
    })
    //다음버튼 클릭하는 이벤트
    $('#pagelist').on('click','.next',function(){
    	currentPage = parseInt($('.pager a').last().text()) +1;
    	noticeList();
    })
    
    
    //수정버튼
    $('body').on('click', '.updateB', function(){
		
		//수정창 띄우기 - 수정할 내용(원래 내용)들을 출력 
    	ncard = $(this).parents('.trclass');
		
		no = ncard.find('.nno').text();
		title = ncard.find('.ntitle').text();
		content = ncard.find('.ncontent').text();
		date = ncard.find('.ndate').text();
		
		$('#modiModal #no').val(no);
		$('#modiModal #title').val(title);
		$('#modiModal #content').val(content);
		$('#modiModal #date').val(date);
		
		$('#modiModal #no').prop('disabled', true);
	})
	
	//글 수정 모달창에서 내용을 수정후에 전송 버튼 클릭
	$('#modisend').on('click', function(){
		
		no = $('#modiModal #no').val();
		title = $('#modiModal #title').val();
		content = $('#modiModal #content').val();
		date = $('#modiModal #date').val();
		
		notice.no = no;
		notice.title = title;
		notice.content = content;
		notice.date = date;
		
		updateNotice();
		
		$('#modiModal').modal('hide');
 		
 		noticeList();
		
	})

	//공지 상세내용 보기
	$('body').on('click', '.ntitle', function(){
		$('.noticeList').remove();
		$('#pagelist').remove();
		actionIdx = $(this).attr('idx');
		noticeDetail(this);
	})
	
	//등록버튼
	$('body').on('click', '.insertB', function(){
		$('#modiModal2 #title2').val("");
		$('#modiModal2 #content2').val("");
		$('#modiModal2 #date2').val("");
	})
	
	$('#modisend2').on('click', function(){
		
		title = $('#modiModal2 #title2').val();
		content = $('#modiModal2 #content2').val();
		date = $('#modiModal2 #date2').val();
		
		notice.title = title;
		notice.content = content;
		notice.date = date;
		
		insertNotice();
		
		$('#modiModal2').modal('hide');
		
 		noticeList();
		
	})
	
	//삭제버튼	
 	$('body').on('click', '.deleteB', function(){
		actionIdx = $(this).attr('idx');
		if(confirm("정말 삭제하시겠습니까?")==true){
			deleteNotice(this);
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
								<a href="notice.jsp" class="logo"><strong>공지관리</a>
								<ul class="icons">
									<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
									<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
									<li><a href="#" class="icon brands fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
									<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
									<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
								</ul>
							</header>

						<!-- Banner -->
							<section id="banner">
								<header class="major">
								
								</header>
								<!--** 공지 목록 출력할 부분 -->
								<div class="noticeList">
								</div>
								<div class="noticeDetail"></div>
							</section>
							<div id="pagelist"></div>
<!-- 							<ul class="actions"> -->
<!-- 								<li><a href="#" class="button big">등록</a></li> -->
<!-- 								<li><a href="#" class="button big">수정</a></li> -->
<!-- 							</ul> -->
						<!-- Section -->
							<section>
								
								<div class="features">
									
								</div>
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
        <h4 class="modal-title">공지사항 수정</h4>
<!--         <button type="button" class="close" data-dismiss="modal">&times;</button> -->
      </div>

<!--       Modal body -->
      <div class="modal-body">
        <form id="modiForm">
        	<label>번호</label> 
        	<input id="no" type="text" name="no"><br>
        
        	<label>제목</label>
        	<input id="title" type="text" name="title"><br>
        	
        	<label>내용</label>
        	<textarea id="content" rows="5" cols="30" name="content"></textarea><br>
        	
        	<label>작성일</label>
        	<input id="date" type="date" name="date"><br>
        	
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
        <h4 class="modal-title">공지사항 등록</h4>
<!--         <button type="button" class="close" data-dismiss="modal">&times;</button> -->
      </div>

<!--       Modal body2 -->
      <div class="modal-body">
        <form id="modiForm2">
        	<label>제목</label>
        	<input id="title2" type="text" name="title"><br>
        	
        	<label>내용</label>
        	<textarea id="content2" rows="5" cols="30" name="content"></textarea><br>
        	
        	<label>작성일</label>
        	<input id="date2" type="date" name="date"><br>
        	
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