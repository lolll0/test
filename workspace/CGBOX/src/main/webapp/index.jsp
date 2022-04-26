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
	<title>회원관리</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	<script src="assets/js/jquery-3.6.0.min.js"></script>
	<script src="assets/js/jquery.serializejson.min.js"></script>	
	<script src = "assets/js/memberList.js" ></script>
	
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
member = { };

$(function(){
	typevalue = "";
	wordvalue = "";
	memberList();
	
	//page번호 클릭하는 이벤트 //
    $('#pagelist').on('click','.pnum',function(){
    	//alert($(this).text());
    	currentPage = $(this).text();
    	memberList();
    })
    
    //이전버튼 클릭하는 이벤트
     $('#pagelist').on('click','.prev',function(){
    	 currentPage = parseInt($('.pager a').first().text()) -1;
    	 memberList();
    })
    //다음버튼 클릭하는 이벤트
    $('#pagelist').on('click','.next',function(){
    	currentPage = parseInt($('.pager a').last().text()) +1;
    	memberList();
    })
    
    $('body').on('click','#insertB',function(){
    	$('#modiModal2 #no2').prop('able', true);
    	$('#modiModal2 #no2').val("");
    	$('#modiModal2 #grade2').val("");
    	$('#modiModal2 #id2').val("");
    	$('#modiModal2 #name2').val("");
    	$('#modiModal2 #mail2').val("");
    	$('#modiModal2 #pass2').val("");
    	$('#modiModal2 #birth2').val("");
    	$('#modiModal2 #tel2').val("");
    	$('#modiModal2 #point2').val("");
    })	
    
	$('#modisend2').on('click', function(){
		
    	no = $('#modiModal2 #no2').val();
    	gr = $('#modiModal2 #grade2').val();
    	id = $('#modiModal2 #id2').val();
    	name = $('#modiModal2 #name2').val();
    	mail = $('#modiModal2 #mail2').val();
    	pass = $('#modiModal2 #pass2').val();
    	bir = $('#modiModal2 #birth2').val();
    	tel = $('#modiModal2 #tel2').val();
    	point = $('#modiModal2 #point2').val();
    	
		//객체에 저장		
		member.no = no;
		member.grade = gr;
		member.id = id;
		member.name = name;
		member.mail = mail;
		member.pass = pass;
		member.birth = bir;
		member.tel = tel;
		member.point = point;
    	
		memberInsert();
		
		//창닫기
		$('#modiModal2').modal('hide');
		memberList();
		
	})
    	
   
    $('body').on('click','.updateB', function(){

    	//수정창 띄우기 - 수정할 내용(원래 내용)들을 출력 
    	mcard = $(this).parents('.trclass');
    	
    	no = mcard.find('.cno').text();
    	grade = mcard.find('.mgrade').text();
    	id = mcard.find('.mid').text();
    	name = mcard.find('.mname').text();
    	mail = mcard.find('.mmail').text();
    	pass = mcard.find('.mpass').text();
    	birth = mcard.find('.mbirth').text();
    	tel = mcard.find('.mtel').text();
    	point = mcard.find('.mpoint').text();
    	
    	
    	$('#modiModal #no').val(no);
    	$('#modiModal #grade').val(grade);
    	$('#modiModal #id').val(id);
    	$('#modiModal #name').val(name);
    	$('#modiModal #mail').val(mail);
    	$('#modiModal #pass').val(pass);
    	$('#modiModal #birth').val(birth);
    	$('#modiModal #tel').val(tel);
    	$('#modiModal #point').val(point);
    	
    	$('#modiModal #no').prop('disabled', true);
    	
    })
   
    
    //글 수정 모달창에서 내용을 수정후에 전송 버튼 클릭
 	$('#modisend').on('click', function(){
 		
		//수정 내용을 가져온다 		
 		no = $('#modiModal #no').val();
    	gr = $('#modiModal #grade').val();
    	id = $('#modiModal #id').val();
    	name = $('#modiModal #name').val();
    	mail = $('#modiModal #mail').val();
    	pass = $('#modiModal #pass').val();
    	bir = $('#modiModal #birth').val();
    	tel = $('#modiModal #tel').val();
    	point = $('#modiModal #point').val();
    	
		//객체에 저장		
		member.no = no;
		member.grade = gr;
		member.id = id;
		member.name = name;
		member.mail = mail;
		member.pass = pass;
		member.birth = bir;
		member.tel = tel;
		member.point = point;
		
 		//서버로 보내기
 		memberUpdate(); 
 		
 		//성공할때만 화면에도 수정된결과가 출력되어야 하므로 js로 가서 수정
// 		mcard.find('.cno').text(no);
// 		mcard.find('.mgrade').text(gr);
//     	mcard.find('.mid').text(id);
//     	mcard.find('.mname').text(name);
//     	mcard.find('.mmail').text(mail);
//     	mcard.find('.mpass').text(pass);
//     	mcard.find('.mbirth').text(bir);
//     	mcard.find('.mtel').text(tel);
//     	mcard.find('.mpoint').text(point);
		
		//창닫기
		$('#modiModal').modal('hide');
		
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
								<a href="index.jsp" class="logo"><strong>회원관리</a>
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
								
								<!--** 회원 목록 출력할 부분 -->
								<div class="memberList">
								</div>
								
							</section>
							<div id="pagelist"></div>
<!-- 							<ul class="actions"> -->
<!-- 								<li><a href="#" class="button big">등록</a></li> -->
<!-- 								<li><a href="#" class="button big">수정</a></li> -->
<!-- 							</ul> -->
						

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

						

<!-- 						Section -->
<!-- 							<section> -->
<!-- 								<header class="major"> -->
<!-- 									<h2>Get in touch</h2> -->
<!-- 								</header> -->
<!-- 								<p>Sed varius enim lorem ullamcorper dolore aliquam aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin sed aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p> -->
<!-- 								<ul class="contact"> -->
<!-- 									<li class="icon solid fa-envelope"><a href="#">information@untitled.tld</a></li> -->
<!-- 									<li class="icon solid fa-phone">(000) 000-0000</li> -->
<!-- 									<li class="icon solid fa-home">1234 Somewhere Road #8254<br /> -->
<!-- 									Nashville, TN 00000-0000</li> -->
<!-- 								</ul> -->
<!-- 							</section> -->

<!-- 						Footer -->
<!-- 							<footer id="footer"> -->
<!-- 								<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p> -->
<!-- 							</footer> -->

					</div>
				</div>

		</div>
		
<!-- The Modal -->
<div class="modal" id="modiModal">
  <div class="modal-dialog">
    <div class="modal-content">

<!--       Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">회원정보</h4>
<!--         <button type="button" class="close" data-dismiss="modal">&times;</button> -->
      </div>

<!--       Modal body -->
      <div class="modal-body">
        <form id="modiForm">
        	<label>고객번호  </label> 
        	<input id="no" type="text" name="no"><br>
        
        	<label>등급</label>
        	<input id="grade" type="text" name="grade"><br>
        	
        	<label>ID</label>
        	<input id="id" type="text" name="id"><br>
        	
        	<label>이름</label>
        	<input id="name" type="text" name="name"><br>
        	
        	<label>이메일</label><br>
        	<textarea id="mail" name="mail" rows="1" cols="30"></textarea>
        	
        	<label>비밀번호</label>
        	<input id="pass" type="password" name="pass"><br>
        	
        	<label>생년월일</label>
        	<input id="birth" type="text" name="birth"><br>
        	
        	<label>전화번호</label>
        	<input id="tel" type="text" name="tel"><br>
        	
        	<label>포인트</label>
        	<input id="point" type="text" name="point"><br>
        	
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
        <h4 class="modal-title">회원정보</h4>
<!--         <button type="button" class="close" data-dismiss="modal">&times;</button> -->
      </div>

<!--       Modal body2 -->
      <div class="modal-body">
        <form id="modiForm2">
        	<label>고객번호  </label> 
        	<input id="no2" type="text" name="no"><br>
        
        	<label>등급</label>
        	<input id="grade2" type="text" name="grade"><br>
        	
        	<label>ID</label>
        	<input id="id2" type="text" name="id"><br>
        	
        	<label>이름</label>
        	<input id="name2" type="text" name="name"><br>
        	
        	<label>이메일</label><br>
        	<textarea id="mail2" name="mail" rows="1" cols="30"></textarea>
        	
        	<label>비밀번호</label>
        	<input id="pass2" type="password" name="pass"><br>
        	
        	<label>생년월일</label>
        	<input id="birth2" type="text" name="birth"><br>
        	
        	<label>전화번호</label>
        	<input id="tel2" type="text" name="tel"><br>
        	
        	<label>포인트</label>
        	<input id="point2" type="text" name="point"><br>
        	
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