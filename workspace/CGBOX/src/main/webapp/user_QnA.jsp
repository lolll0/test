<%@page import="cgbox.vo.MemberVO"%>
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
	<title>QnA</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	<script src="assets/js/jquery-3.6.0.min.js"></script>
	<script src="assets/js/jquery.serializejson.min.js"></script>	
	<script src = "assets/js/user_QnA.js" ></script>
	
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
customer_no = 0;
QnA = { };
<% 

MemberVO vo = (MemberVO)session.getAttribute("loginmember");
if(vo != null){
%>
customer_no = <%=vo.getCustomer_no() %>;
<%
}
%>

$(function(){
	
	memberInfo();

	//등록버튼
	$('body').on('click', '.questionB', function(){
		
		qcard = $(this).parents('#ccc');
		name = qcard.find('.qname').text();
		$('#modiModal2 #name2').val(name);
		$('#modiModal2 #name2').prop('disabled', true);

		$('#modiModal2 #question2').val("");
	})
	
	$('#modisend2').on('click', function(){
		
		question = $('#modiModal2 #question2').val();
		
		QnA.customer_no = customer_no;
		QnA.question = question;
		
		insertQnA();
		
		$('#modiModal2').modal('hide');
		
		memberInfo();
		
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
								<a href="FAQ.jsp" class="logo"><strong>QnA</a>
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
								<!--** QnA할 멤버 정보 출력할 부분 -->
								<div class="memberInfo">
								</div>
								<div class="FAQDetail"></div>
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
									<li>
										<span class="opener">문의사항</span>
										<ul>
											<li><a href="user_QnA.jsp">Q&A</a></li>
											<li><a href="user_FAQ.jsp">FAQ</a></li>
											<li><a href="user_notice.jsp">공지사항</a></li>
										</ul>
									</li>
									<li><a href="user_event.jsp">이벤트</a></li>
									<li><a href="store/storePage.jsp">스토어</a></li>
								</ul>
							</nav>

				
					</div>
				</div>

		</div>

<!-- The Modal2 -->
<div class="modal" id="modiModal2">
  <div class="modal-dialog">
    <div class="modal-content">

<!--       Modal Header2 -->
      <div class="modal-header">
        <h4 class="modal-title">QnA 등록</h4>
<!--         <button type="button" class="close" data-dismiss="modal">&times;</button> -->
      </div>

<!--       Modal body2 -->
      <div class="modal-body">
        <form id="modiForm2">
        	<label>작성자</label>
        	<input id="name2" type="text" name="name2"><br>
        	
        	<label>질문</label>
        	<textarea id="question2" rows="5" cols="30" name="question2"></textarea><br>
        	
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