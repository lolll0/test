<%@page import="cgbox.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY PAGE</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="../js/myPage.js"></script>
<script>
	customer_no = 0;
<% 

MemberVO vo = (MemberVO)session.getAttribute("loginmember");
if(vo != null){
%>
customer_no = <%=vo.getCustomer_no() %>;
<%
}
%>


	member = {}; //회원객체
	mtheater_name = "";
	$(function() {
		findMember();
		memberOutput();
		
		$('.fbutton').on('click', function() {
			selectAllMtheater();
		})

		$('.mtlist').on('click', function() {
			mtheater_name = $('.mtlist option:selected').val();
			if (mtheater_name != '극장선택')
				$('.selfa').html(mtheater_name);

		})

		$('#famodi').on('click', function() {
			mset = $('.mset').text();
			if (mtheater_name == '극장선택') {
				alert("극장선택을 해주세요");
			} else {
				updateFavorite();
				$('#faModal').modal('hide');
			}

		})
		
		
		$('#delfa').on('click',function(){
			
			mset = $('.mset').text();
			$('.selfa').html('지정된 영화관이 없습니다.');
			if(mset != '지정된 영화관이 없습니다.'){
				deleteFavorite();
				$('#faModal').modal('hide');
			}else{
				alert('지정된 영화관이 없습니다.')				
			}
		})

		$('#selbirth').on('click', function() {
			bir = $('#cal').val();
			$('#birth').val(bir);
		})

		$(document).on('click', '.modimem', function() {
			mem = $(this).parents(".memContainer");

			name = $(mem).find('.name').text();
			id = $(mem).find('.id').text();
			pass = $(mem).find(".pass").val();
			birth = $(mem).find(".birth").text();
			tel = $(mem).find(".tel").text();
			mail = $(mem).find(".mail").text();
			point = $(mem).find(".point").text();
			grade = $(mem).find(".grade").text();

			$('#moModal #name').val(name);
			$('#moModal #id').val(id);
			$('#moModal #pass').val(pass);
			$('#moModal #birth').val(birth);
			$('#moModal #tel').val(tel);
			$('#moModal #mail').val(mail);
			$('#moModal #point').val(point);
			$('#moModal #grade').val(grade);
			$('#moModal #num').val(customer_no);

			$('#moModal #id').prop('disabled', true);
			$('#moModal #point').prop('disabled', true);
			$('#moModal #birth').prop('disabled', true);
			$('#moModal #grade').prop('disabled', true);
		})

		$('#modisend').on('click', function() {

			// 수정 내용을 가져온다
			name = $('#moModal #name').val();
			pass = $('#moModal #pass').val();
			birth = $('#moModal #birth').val();
			tel = $('#moModal #tel').val();
			mail = $('#moModal #mail').val();
			num = $('#moModal #num').val();
			
			member.name = name;
			member.pass = pass;
			member.birth = birth;
			member.tel = tel;
			member.mail = mail;
			member.cusNo = num;
			// 서버로 보내기
			updateMember();
			// db에서 수정 성공하면 나중에 할일 
			// ajax의 success부분에서 코딩 할 일
			// 입력한 내용을 card본문으로 다시 출력한다.
			name = $(mem).find('.name').text(name);
			id = $(mem).find('.id').text(id);
			pass = $(mem).find(".pass").val(pass);
			birth = $(mem).find(".birth").text(birth);
			tel = $(mem).find(".tel").text(tel);
			mail = $(mem).find(".mail").text(mail);
			point = $(mem).find(".point").text(point);

		
			// 창닫기
			$('#moModal').modal('hide');

		})
		
		$('.delok').on('click',function(){
			inpass = $('#passchk').val();
			
			if(inpass == $('.pass').val()){
				$('#delModal').modal('hide');
				deleteMember();
				//로그아웃
				$.ajax({
		 			url : '<%=request.getContextPath()%>/Logout.do',
		 			success : function() {
				 		window.location.href='<%=request.getContextPath()%>/main/mainPage.jsp';
					},
					error : function(xhr) {
						alert('상태 : ' + xhr.status);
					}
					
		 		})
						
				
				window.location.href='../main/mainPage.jsp';
			}else{
				alert('비밀번호를 정확하게 입력해주세요')
			}
			
		})
		
		$('#movecart').on('click',function(){
			window.location.href= "<%=request.getContextPath()%>/CartServlet.do";
		})
		
		$('.reserve').on('click',function(){
			$('#relist').css('color','');
			$('#haveProduct').css('color','');
			$('#paylist').css('color','');
			$('#relist').css('color','red');
			reserveList();
		})
		
		$('.sub').on('click',function(){
			$(this).parents('.ubody').find($('.active')).removeClass("active");
			$('#buylist').addClass("active");
			
			$('#relist').css('color','');
			$('#haveProduct').css('color','');
			$('#paylist').css('color','');
			$(this).css('color','red');
			
			
		})
		
		$('#meminfo').on('click',function(){
			$('#relist').css('color','');
			$('#haveProduct').css('color','');
			$('#paylist').css('color','');
			memberOutput();
		})
		
		$('#haveProduct').on('click',function(){
			haveProduct();
		})
		
		$('.grade1').on('click',function(){
			window.open("gradeTable.jsp", "등급표", "width=500 height=500 left=700px top=200px");
		})
		
		$('#memreview').on('click',function(){
			$('#relist').css('color','');
			$('#haveProduct').css('color','');
			$('#paylist').css('color','');
			reviewList();
		})
		
		mno='';
		cno='';
		$(document).on('click', '#delreview' ,function(){
	
			$("input[name=check]:checked").each(function() {
				mno = $(this).parents('.par').find('#mno').attr('name');
				cno = $(this).parents('.par').find('#cno').attr('name');
				deleteReview();
			})
			
				
		})
		
		
		qnano='';
		$(document).on('click', '#delqna' ,function(){
	
			$("input[name=qnacheck]:checked").each(function() {
				qnano = $(this).parents('.qnapar').find('#qnano').text();
				deleteQna();
			})
			
		})
		
		// 리뷰 버튼
		$(document).on('click','#checkAll',function() {
			if($("#checkAll").is(":checked")) $("input[name=check]").prop("checked", true);
			else $("input[name=check]").prop("checked", false);
		});
		
		$(document).on('click',"input[name=check]",function() {
			var total = $("input[name=check]").length;
			var checked = $("input[name=check]:checked").length;
			
			if(total != checked) $("#checkAll").prop("checked", false);
			else $("#checkAll").prop("checked", true); 
		});
		
		
		
		/// qna 버튼
		$(document).on('click','#qnacheckAll',function() {
			if($("#qnacheckAll").is(":checked")) $("input[name=qnacheck]").prop("checked", true);
			else $("input[name=qnacheck]").prop("checked", false);
		});
		
		$(document).on('click',"input[name=qnacheck]",function() {
			var total = $("input[name=qnacheck]").length;
			var checked = $("input[name=qnacheck]:checked").length;
			
			if(total != checked) $("#qnacheckAll").prop("checked", false);
			else $("#qnacheckAll").prop("checked", true); 
		});
		
		
		
		$('#qnalist').on('click',function(){
			$('#relist').css('color','');
			$('#haveProduct').css('color','');
			$('#paylist').css('color','');
			getQna();
		})
		
		$(document).on('click','.qnainfo',function(){
			a = $(this).parents('tr').find('#ans').val();
			q = $(this).parents('tr').find('#que').val();
			d = $(this).parents('tr').find('#qdate').text();
			
			$('#qnadate').text(d);
			$('#ansinfo').html(a);
			$('#queinfo').html(q);
		})
		
		
		$('#paylist').on('click', function(){
			payList();
		})
	});
</script>
<style type="text/css">
body{
 		min-width: 1950px; 
	}
	

.myPage {
	margin: 20px auto;
	width: 70%;
}

.mainMyPage {
	margin-top:80px;
	background-color: #f6f7f6;
}

.nameId {
	border-bottom: 1px solid lightgray;
}

.top {
	width: 80%;
	margin: 30px auto;
	border-right: 1px solid lightgray;
}

.bottom {
	width: 80%;
	margin: 30px auto;
}

.mPoint {
	width: 27%;
	float: left;
	border-right: 1px solid lightgray;
	margin-right: 10px;
}

.gifticon {
	width: 27%;
	float: left;
	border-right: 1px solid lightgray;
	margin-right: 10px;
}

.favorite {
	width: 40%;
	float: right;
}

ul {
	list-style: none;
}

hr {
	clear: both;
}

.mt1, .mt2 {
	width: 50%;
	float: left;
}

.fbutton {
	float: left;
}

#famodi {
	clear: both;
}

.sidebar {
	width: 20%;
	float: left;
}

.content {
	witdh: 70%;
	float: left;
}
.memContainer{
	/* margin-top:20px;*/
	margin-bottom:20px;
	margin-left: 20px; 
}

.rehistory, .havePro, .reviewList, .qnaList, .paylist{
	margin-left: 20px;
}


.rh1{
	width: 80px;
}
.rh2{
	width: 90px;
}
.rh3{
	width: 350px;
}

.pl1{
	width: 325px;
}

.re1{
	width: 280px;
}
.re2{
	width: 580px;
}
.re3{
	width: 150px;
	
}
.ta1 {
	width: 200px;
}

.ta2 {
	width: 850px;
}

.hp1{
	width: 300px;
}
.hp2{
	width: 450px;
}

.qna1{
	width: 80px;
}
.qna2{
	width: 400px;
}
.qna3{
	width: 400px;
}
.qna4{
	width: 130px;
}

.nav-item>.active {
	color: white;
	background-color: red;
}

.title:hover {
	color: white;
}

.title{
  position: relative;
}

.title::before{
  content: "";
position: absolute;
top: 0;
left: 0;
display: block;
width: 100%;
height: 100%;
z-index: -1;
background-color: red;
-webkit-transform: scaleY(.3);
transform: scaleY(.3);
opacity: 0;
transition: all .3s
}

.title:hover::before{
  opacity: 1;
  background-color: red;
  -webkit-transform: scaleY(1);
  transform: scaleY(1);
  transition: -webkit-transform .6s cubic-bezier(.08, .35, .13, 1.02), opacity .4s;
  transition: transform .6s cubic-bezier(.08, .35, .13, 1.02), opacity
}

.sub:hover {
	color: red;
}

.qa1{
	width: 100px;
}

.myPage{
	font-family: 'Do Hyeon', sans-serif;
}

nav{
	background: rgb(220,53,69);
	background: linear-gradient(90deg, rgba(220,53,69,1) 0%, rgba(220,53,69,1) 29%, rgba(255,66,0,1) 100%);
}
</style>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top" >
  <!-- Brand -->
  <a class="navbar-brand" href="../main/mainPage.jsp">CGBOX</a>

  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="../movie/movieChart.jsp">영화</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">극장</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="../ticketing/reservation.jsp">예매</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="../store/storePage.jsp">스토어</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="../event.jsp">이벤트</a>
    </li>

  </ul>
  <ul class="navbar-nav" style="margin-left:1300px;" >
    <li class="nav-item">
      <a class="nav-link" href="../ticketing/NonMember_reservations.jsp" style="float:right;">로그인</a>
      </li>
      <li class="nav-item">
      <a class="nav-link" href="myPage.jsp" style="float:right;">MyPage</a>
      </li>
      <li class="nav-item">
      <a class="nav-link" href="../user_FAQ.jsp" style="float:right;">고객센터</a>
      </li>
      </ul>
</nav>
	<div class="myPage">
		<div class="mainMyPage">
			<div class="top">
				<div class="nameId"></div>
				<div><h3>고객님은 <span class="grade1" style='color:red; text-decoration:underline'></span> 입니다.</h3></div>
			</div>
			<div class="bottom">
				<div class="mPoint">
					<strong style='font-size: 1.5em;'>MY POINT</strong>
					<ul class='navbar-nav'>
						<li class="nav-item "><span class="pointli"></span></li>
					</ul>
				</div>
				<div class="gifticon">
					<strong style='font-size: 1.5em;'>MY PRODUCT</strong>
					<ul class='navbar-nav'>
						<li class="nav-item "><span class="giftli"></span></li>
					</ul>
				</div>
				<div class="favorite">
					<div class="mt1 mset" style="font-size: 2.0em;"></div>
					<button type="button" class="btn btn-dark fbutton "
						style="font-size: 0.5em;" data-toggle="modal"
						data-target="#faModal">
						자주가는 CGBOX<br>설정하기
					</button>
				</div>
			</div>
			<hr>
		</div>

		<div class="sidebar">

			<ul class="nav flex-column ubody" >
				<li class="nav-item ">
					<strong id="meminfo" class="nav-link title active" data-toggle="pill" style='font-size: 1.5em;'><img alt='회원정보' src='../images/account_circle_FILL0_wght400_GRAD0_opsz48.png'> 회원정보</strong></li>
				<li class="nav-item">
					<strong id="movecart" class="nav-link title"data-toggle="pill" style='font-size: 1.5em;'><img alt='회원정보' src='../images/shopping_bag_FILL0_wght400_GRAD0_opsz48.png'> 장바구니</strong></li>
				<li class="nav-item">
					<strong id="buylist" class="nav-link title reserve" data-toggle="pill" style='font-size: 1.5em;'><img alt='회원정보' src='../images/receipt_long_FILL0_wght400_GRAD0_opsz48.png'> 구매내역</strong>
					<ul class="nav flex-column sublist" style="font-size: 1.0em;">
						<li class="nav-item">
							<p id="relist" class="nav-link sub reserve">● 예매내역</p>
						</li>
						<li class="nav-item">
							<p id="paylist" class="nav-link sub">● 결제내역</p>
						</li>
						<li class="nav-item">
							<p id="haveProduct" class="nav-link sub">● 보유상품</p>
						</li>
					</ul></li>
				<li class="nav-item">
					<strong id="memreview" class="nav-link title" data-toggle="pill" style='font-size: 1.5em;'><img alt='회원정보' src='../images/edit_note_FILL0_wght400_GRAD0_opsz48.png'> 리뷰</strong>
					</li>
				<li class="nav-item">
					<strong id="qnalist" class="nav-link title" data-toggle="pill" style='font-size: 1.5em;'><img alt='회원정보' src='../images/support_agent_FILL0_wght400_GRAD0_opsz48.png'> 문의내역</strong>
				</li>
			</ul>
		</div>

		<div class="content"></div>

		<hr>

	</div>



	<!-- Favorite Modal -->
	<div class="modal" id="faModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">자주가는 영화관</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="mt1 selfa"></div>
					<div class="mt2">
						<select class="mtlist">

						</select>

					</div>

					<br>
					<br> 
					<button type="button" id="famodi"class="btn btn-outline-success">수정</button>
					<button type='button' id="delfa" class='btn btn-outline-danger'>삭제</button>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>



	<!-- Modify Modal -->
	<div class="modal" id="moModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">회원정보 수정</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form id="modiForm">
						<table>
							<tr>
								<td><label>이름</label></td>
								<td><input type="text" id="name" name="name"></td>
							</tr>
							<tr>
								<td><label>아이디</label></td>
								<td><input type="text" id="id" name="id"></td>
							</tr>
							<tr>
								<td><label>비밀번호</label></td>
								<td><input type="text" id="pass" name="pass"></td>
							</tr>
							<tr>
								<td><label>생년월일</label></td>
								<td><input type="text" id="birth" name="birth"> <input
									type="date" id="cal">
									<button type="button" id="selbirth"
										class="btn btn-outline-success">확인</button></td>
							</tr>
							<tr>
								<td><label>휴대전화</label></td>
								<td><input type="text" id="tel" name="tel"></td>
							</tr>
							<tr>
								<td><label>메일</label></td>
								<td><input type="email" id="mail" name="mail"></td>
							</tr>
							<tr>
								<td><label>포인트</label></td>
								<td><input type="text" id="point" name="point"></td>
							</tr>
							<tr>
								<td><label>등급</label></td>
								<td><input type="text" id="grade" name="grade"></td>
							</tr>
						</table>
						<input type="hidden" id="num" name="num">
						<button type="button" id="modisend"class="btn btn-outline-success">전송</button>

					</form>

				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>
	
<!-- deleteMember Modal -->
	<div class="modal" id="delModal">
		<div class="modal-dialog">
			<div class="modal-content">
		
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">회원탈퇴</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form id="delForm">
						<label><strong>회원탈퇴를 위해 비밀번호를 입력해주세요</strong></label><br>
						<input type="password" id="passchk" autoComplete="off" placeholder="비밀번호를 입력해주세요">
						<button type="button" id="passsend"  class="btn btn-outline-success delok">확인</button>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>


<!-- qnainfo Modal -->
	<div class="modal" id="qnaModal">
		<div class="modal-dialog">
			<div class="modal-content">
		
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">1:1 문의내역</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
						<table class='table table-hover' style='text-align:center;'>
							<tr>                 
								<th class='qa1'>등록일 : </th>
								<th><span id="qnadate"></span></th>                    
							</tr>
							<tr>                 
								<td class='qa1'><strong>질문내용 : </strong></td>
								<td id="queinfo" style = 'word-break: break-all'></td>                    
							</tr>
							<tr>                 
								<td class='qa1'><strong>답변내용 : </strong></td>
								<td id="ansinfo" style = 'word-break: break-all'></td>                    
							</tr>
						</table>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>

</body>
</html>










