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
	<title>QnA 관리</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	<script src="assets/js/jquery-3.6.0.min.js"></script>
	<script src="assets/js/jquery.serializejson.min.js"></script>	
	<script src = "assets/js/QnA.js" ></script>
	
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
QnA = { };

$(function(){
	typevalue = "";
	wordvalue = "";
	QnAList();
	
	
    
    //답변버튼
    $('body').on('click', '.answerB', function(){
		
		//수정창 띄우기 - 수정할 내용(원래 내용)들을 출력 
    	qcard = $(this).parents('.trclass');
		
		no = qcard.find('.qno').text();
		question = qcard.find('.qquestion').text();
		name = qcard.find('.qname').text();
		answer = qcard.find('.qanswer').text();
		
		$('#modiModal #no').val(no);
		$('#modiModal #question').val(question);
		$('#modiModal #name').val(name);
		if(answer=="undefined"){
			$('#modiModal #answer').val("");
		}else{
			$('#modiModal #answer').val(answer);
		}
		
		$('#modiModal #no').prop('disabled', true);
		$('#modiModal #question').prop('disabled', true);
		$('#modiModal #name').prop('disabled', true);
	})
	
	//답변 모달창에서 답변 버튼 클릭
	$('#modisend').on('click', function(){
		
		no = $('#modiModal #no').val();
		question = $('#modiModal #question').val();
		answer = $('#modiModal #answer').val();
		name = $('#modiModal #name').val();
		
		QnA.no = no;
		QnA.question = question;
		QnA.answer = answer;
		QnA.name = name;
		
		answerQnA();
		
		$('#modiModal').modal('hide');
 		
		
	})

// 	//FAQ 상세내용 보기
// 	$('body').on('click', '.fquestion', function(){
// 		$('.FAQList').remove();
// 		$('#pagelist').remove();
// 		actionIdx = $(this).attr('idx');
// 		FAQDetail(this);
// 	})
	
	
	
	
    
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
								<a href="QnA.jsp" class="logo"><strong>QnA관리</a>
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
								<!--** FAQ 목록 출력할 부분 -->
								<div class="QnAList">
								</div>
								<div class="QnADetail"></div>
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

						<!-- Section -->
							

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
        <h4 class="modal-title">QnA 답변</h4>
<!--         <button type="button" class="close" data-dismiss="modal">&times;</button> -->
      </div>

<!--       Modal body -->
      <div class="modal-body">
        <form id="modiForm">
        	<label>번호</label> 
        	<input id="no" type="text" name="no"><br>
        
        	<label>작성자 이름</label>
        	<input id="name" type="text" name="name"><br>
        	
        	<label>질문</label>
        	<input id="question" type="text" name="question"><br>
        	
        	<label>답변</label>
        	<textarea id="answer" rows="5" cols="30" name="answer"></textarea><br>
        	
        	
        	<br>
        	<input type="hidden" id="num" name="num">
        	<input  style="float: right;" type="button" id="modisend" value="등록">
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
        <h4 class="modal-title">FAQ 등록</h4>
<!--         <button type="button" class="close" data-dismiss="modal">&times;</button> -->
      </div>

<!--       Modal body2 -->
      <div class="modal-body">
        <form id="modiForm2">
        	<label>제목</label>
        	<input id="question2" type="text" name="question2"><br>
        	
        	<label>내용</label>
        	<textarea id="answer2" rows="5" cols="30" name="answer2"></textarea><br>
        	
        	<label>카테고리</label>
        	<input id="category2" type="text" name="category2"><br>
        	
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