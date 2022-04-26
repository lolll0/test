<%@page import="cgbox.vo.MemberVO"%>
<%@page import="vo.NonMemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="../js/jquery.serializejson.min.js"></script>
  <link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
  
  
<title>좌석 예약</title>
<style type="text/css">
nav{
	background: rgb(220,53,69);
	background: linear-gradient(90deg, rgba(220,53,69,1) 0%, rgba(220,53,69,1) 29%, rgba(255,66,0,1) 100%);
}

.mt-3, .my-3 {
    /* margin-top: 1rem!important; */
    margin-top: 0px!important; 
}

#cont div{
	margin-top: 140px;
  	background-color: #333333;
	text-align: center;
	color: white;
	padding: 5px;
	font-family: 'East Sea Dokdo', cursive;
	font-size: 2.0em;
  }

#choosen{
	text-align:center;
}

.text{
	color: gray;
}

.page-link{
	font-size: 2.0em;
	font-weight: bold;
}

#timeInfo{
	font-size: 1.3em;
	font-weight: bold;
}

#price{
	font-size: 2.0em;
}

#seatsCont{
	border:1px solid lightgray;
	padding: 20px;
}

#screenDiv{
    text-align: center;
	font-size: 1.5em;
}

.seatKind{
	text-align: right;
}

#seatsDiv .seat{
	text-align: center;
	margin: 3px;
	border: 1px solid gray;
}

.seat:hover{
	background: #dc3545;
	color: white;
}

.select{
	background: #dc3545;
	color: white;
}

#ybtn,
#nbtn{
	width: 74px;
}

.row {
	margin-left: 0px;
	margin-right: 0px; 
}


.modal-body label{
	display: inline-block;
	width: 100px;
	text-align: right;
	border-right: 2px solid #dc3545;
	padding-right: 10px;
	margin-right: 10px;
	font-weight: bold;
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
#seatInfo
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
	padding-bottom: 15px;
}

.infoText+span{
	font-weight: bold;
}

.nextdivs{
	/* font-size: 2.0em; */
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


</style>
<script type="text/javascript">
$(function() {
	
	<%
	//세션이 없을 경우 진행할 수 없으니 알림을 출력하고 로그인페이지로 이동한다
	if(session.getAttribute("loginmember") == null && session.getAttribute("nonMember") == null){
		//로그인 페이지로 이동
	%>
		alert('잘못된 경로 접근입니다.');
		location.href ='NonMember_reservations.jsp';
	<%
	}
	%>
	
	
	
	//좌석 id부여
	$.ajax({
		url : '<%=request.getContextPath()%>/insertSeatNo.do',
		type:'get',
		data : {
			"tdata" : '<%=session.getAttribute("theaterNo")%>' 			
		},
		success : function(res) {
			var sdiv = $('.seat')
			$.each(res, function(i,v) {
				sdiv.eq(i).attr('id', 's'+v.seat_no);
			})
			
			disabledSeat();
			
		},
		error : function() {
			alert('상태 : ' + xhr.status)	;
		},
		dataType : 'json'
	})
	
	
	//예약된 좌석 리스트
	function disabledSeat() {
		//screenNo 세션
		$.ajax({
			url : '<%=request.getContextPath()%>/disabledSeat.do',
			type:'get',
			data : {
				"scdata" : '<%=session.getAttribute("screenNo")%>' 			
			},
			success : function(res) {
				var sid = $('.seat');
				$(sid).each( function(i, v) {
					$.each(res, function(j, k) {
						if(sid.eq(i).attr('id') == 's' + k.seat_no){
							sid.eq(i).css('background', 'gray');
							sid.eq(i).css('color', 'lightgray');
							sid.eq(i).attr('status', 'reserved');
						}
					})
				})
			},
			error : function(xhr) {
				alert('상태 : ' + xhr.status)	;
			},
			dataType : 'json'
			
		})
	}
	 
	
	//1표당 기준가격
	var vprice = <%=session.getAttribute("tprice")%>;
	$('#price span').text(vprice);
	
	
	//인원수를 체크하여 1이하 8이상인 경우 disabled속성을 추가하는 함수
	function chkcnt() {
		var cnt = parseInt($('span[class="page-link"]').text());
		
		
		//1 이하인경우 
		if(cnt <= 1){
			$('#liDown').addClass('disabled')
		}else{
			$('#liDown').removeClass('disabled')
		}
		
		if(cnt >= 8){
			$('#liUp').addClass('disabled')
		}else{
			$('#liUp').removeClass('disabled')
		}
		
		
		//가격 변경
		$('#price span').text(cnt * vprice);
		btnprod();
	}
	
	$('#cntDown').on('click', function() {
		var cnt = parseInt($('span[class="page-link"]').text());
		if(cnt - 1 < $('.select').length){
			alert('선택한 인원이 예매인원보다 많습니다!');
			return false;
		}
		
		$('span[class="page-link"]').text(cnt - 1);
		
		$('#cnt').text(cnt-1 + '명');
		chkcnt();
	})
	
	$('#cntUp').on('click', function() {
		var cnt = parseInt($('span[class="page-link"]').text());
		
		$('span[class="page-link"]').text(cnt + 1);
		$('#cnt').text(cnt+1 + '명');
		chkcnt();
	})
	
	$('.seat').on('click', function() {
		if($(this).attr('status') == 'reserved'){
			//예약된 좌석은 선택할 수 없음
			return false;
		}
		
		
		if($(this).hasClass('select')){
			$('#minfo').text('이미 선택한 좌석입니다!');
			$("#overModal").modal();
			return false;
		}

		$(this).addClass('select');
		
		if($('.select').length >  parseInt($('span[class="page-link"]').text())){
			$(this).removeClass('select');
			$('#minfo').text('선택한 인원 수 이상으로 선택하셨습니다!');
			$("#overModal").modal();
		}
		
		if($(this).hasClass('select')){
			var data = $('#seatnum').text().trim();
			var result = $(this).parent().find('.seatKind').text() + $(this).text();			
			
			if(data.length > 0){
				result = data + ',' + result;
			}
			
			//선택한 좌석이 라면 정보칸에 좌석 정보 추가	
			$('#seatnum').text(result);
		}
		// 선택한 인원수 만큼 선택완료시 버튼 활성화
		btnprod();
	})
	
	
	
	function btnprod() {
		
		if($('.select').length ==  parseInt($('span[class="page-link"]').text())){
			$('#nextbtn').removeAttr('disabled')
		}else{
			$('#nextbtn').attr('disabled', 'disabled')
		}
	}
	
	
	
	//다시 선택 -> 예 클릭시
	$('#ybtn').on('click', function() {
		$('.seat').removeClass('select');
		//좌석 정보 초기화
		$('#seatnum').empty();
	})
	
	
	
	//중복
	$('#nextbtn').hover(function() {
		$(this).find('img').attr('src', 'https://img.icons8.com/fluency-systems-regular/50/ffffff/circled-right.png');
	}, function() {
		$(this).find('img').attr('src', 'https://img.icons8.com/fluency-systems-regular/50/dc3545/circled-right.png');
	})
	
	
	//다음 버튼 클릭시 모달창이 열린다
	$('#nextbtn').on('click', function() {
		//예약 내역 확인 창에 필요한 정보 입력
		
		
		// 인원수
		$('#resultcnt').text($('#cnt').text().split('명',2)[0]);
		
		//좌석
		var seatarr = $('#seatnum').text().split(',');
		var sresult = "";
		
		$.each(seatarr, function(i, v) {
			if(i == 0){
				sresult += v;
			}else{
				sresult += " / " + v ;
			}
		})
		
		$('#resultseat').text(sresult); 
		
		
		//영화관 위치는 db에서 가져옴 -> #resultaddr
		var mname = $("#resmname").text();
			
		$.ajax({
			type : 'get',
			url : '<%=request.getContextPath() %>/MtheaterAddress.do',
			data : {
				"name" : mname
			},
			success : function(res) {
				console.log("영화관 정보"); 
				console.log(res); 
				$('#resultaddr').text(res.mtheater_addr);
				
			},
			error : function(xhr) {
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
		
	})
	
	$('#finalbtn').on('click', function() {
		//1. DB에 예약정보 inset
		//좌석 데이터
		var seatarr = $('#seatnum').text().split(',');
		console.log("seatarr : " + seatarr);
	
		//1) 티켓 데이터 insert -> 필요한 데이터? = 세션에 있는 고객번호
		//2) 예약 데이터 insert -> 좌석데이터 / 상영일자 번호 / 티켓번호  
		$.ajax({
			type : 'get',
			url : '<%=request.getContextPath() %>/InsertReservation.do',
			traditional : true,
			data : {
				"seats" : seatarr,
				"screenNo" : '<%=session.getAttribute("screenNo")%>',
				"customerNo" : '<%
					if(session.getAttribute("loginmember") != null){
						MemberVO vo = (MemberVO) session.getAttribute("loginmember");
						out.print(vo.getCustomer_no());
					}
				%>'
			},
			success : function(res) {
				alert(res);
				
				//결제페이지로 이동
				
				<%
					//회원
					if(session.getAttribute("loginmember") != null ){
						
					%>
					location.href = "<%=request.getContextPath()%>/MemberPay.do";
<%-- 						location.href = "<%=request.getContextPath()%>/NonMemberPay.do"; --%>
					<%
					
				}else{
					//비회원
					%>
					location.href = "<%=request.getContextPath()%>/NonMemberPay.do";
					<%
				}
				%>
			},
			error : function(xhr) {
				alert("상태 : " + xhr.status);
				//location.href = "NonMember_reservations.jsp";
			},
			dataType : 'json'
		})
		
		
		
		//2. 결제 페이지로 이동
	})
	
	
	
})
</script>

</head>
<body>
	
<!-- 네비게이션 바 -->
<nav class="navbar navbar-expand-sm navbar-dark fixed-top">
  <!-- Brand -->
  <a class="navbar-brand" href="#">CGBOX</a>

  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="#">영화</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">극장</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#" style="font-weight : bold; color: white">예매</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">스토어</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">이벤트</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">헤택</a>
    </li>


  </ul>
</nav>

<!-- //////////////////////////////////////////////////////////////////////////// -->

<div class="container">
	<div class="row" id="cont">
	  <div class="col">
	  	인원/좌석
	  </div>
	</div>
	<div class="row">
	  	<div id="choosenCnt" class="container p-3 my-3 border col-sm-6">
	  		<span class="text"> 
	  			예매 할 인원 수를 선택해 주세요
	  			<br>
	  			<span style="color: red; font-size:13px;">*최대 8명까지 선택가능</span>
	  		</span>
	  		<hr>
	  		<ul class="pagination pagination-lg justify-content-center">
			  <li id="liDown" class="page-item disabled">
			  	<a id="cntDown" class="page-link" href="#">
					-
			  	</a>
			  </li>
			  <li class="page-item active">
			  	<span class="page-link">1</span>
			  </li>
			  <li id="liUp" class="page-item">
			  	<a id="cntUp" class="page-link" href="#">
					+
			  	</a>
			  </li>
			</ul>
	  	</div>
	  <div class="container p-3 my-3 border col-sm-6">
		<div class="col">
			<ul class="breadcrumb justify-content-center">
  				<li class="breadcrumb-item active">CGBOX <%=session.getAttribute("mtheaterName") %>점</li>
  				<li class="breadcrumb-item active"><%=session.getAttribute("theaterName") %>관</li>
  				<li class="breadcrumb-item active">남은좌석 <span id="seatCnt" style="color: #dc3545; font-weight:bold;">121</span>/150</li>
			</ul>
		</div>
		<div id="timeInfo"class="col">
  			2020.<%=session.getAttribute("resmonth") %>.<%=session.getAttribute("resday") %>(<%=session.getAttribute("resweek") %>)
  			<%=session.getAttribute("screenTime") %> ~ <%=session.getAttribute("screen_end") %>
		</div>	  	
		<div id="price" class="col d-flex justify-content-end">
			<span>0</span>원
		</div>	  	
	  </div>
	</div>
	<div id="seatsCont" class="row justify-content-center">
		
		<div id="screenDiv" class="container p-3 my-3 bg-secondary text-white">
			SCREEN
		</div>
		
		<div id="seatsDiv"class="container p-3 my-3">
  			
  			<div class="row">
  				<div class="col-sm-2 seatKind">A</div>
  				<div class="col-sm-1 seat">1</div>
  				<div class="col-sm-1 seat">2</div>
  				<div class="col-sm-1 seat">3</div>
  				<div class="col-sm-3" style="margin: 9px;"></div>
  				<div class="col-sm-1 seat">4</div>
  				<div class="col-sm-1 seat">5</div>
  				<div class="col-sm-1 seat">6</div>
			</div>
			
  			<div class="row">
  				<div class="col-sm-2 seatKind">B</div>
  				<div class="col-sm-1 seat">1</div>
  				<div class="col-sm-1 seat">2</div>
  				<div class="col-sm-1 seat">3</div>
  				<div class="col-sm-1 seat">4</div>
  				<div class="col-sm-1 seat">5</div>
  				<div class="col-sm-1 seat">6</div>
  				<div class="col-sm-1 seat">7</div>
  				<div class="col-sm-1 seat">8</div>
  				<div class="col-sm-1 seat">9</div>
			</div>
  			<div class="row">
  				<div class="col-sm-2 seatKind">C</div>
  				<div class="col-sm-1 seat">1</div>
  				<div class="col-sm-1 seat">2</div>
  				<div class="col-sm-1 seat">3</div>
  				<div class="col-sm-1 seat">4</div>
  				<div class="col-sm-1 seat">5</div>
  				<div class="col-sm-1 seat">6</div>
  				<div class="col-sm-1 seat">7</div>
  				<div class="col-sm-1 seat">8</div>
  				<div class="col-sm-1 seat">9</div>
			</div>
  			<div class="row">
  				<div class="col-sm-2 seatKind">D</div>
  				<div class="col-sm-1 seat">1</div>
  				<div class="col-sm-1 seat">2</div>
  				<div class="col-sm-1 seat">3</div>
  				<div class="col-sm-1 seat">4</div>
  				<div class="col-sm-1 seat">5</div>
  				<div class="col-sm-1 seat">6</div>
  				<div class="col-sm-1 seat">7</div>
  				<div class="col-sm-1 seat">8</div>
  				<div class="col-sm-1 seat">9</div>
			</div>
  			<div class="row">
  				<div class="col-sm-2 seatKind">E</div>
  				<div class="col-sm-1 seat">1</div>
  				<div class="col-sm-1 seat">2</div>
  				<div class="col-sm-1 seat">3</div>
  				<div class="col-sm-1 seat">4</div>
  				<div class="col-sm-1 seat">5</div>
  				<div class="col-sm-1 seat">6</div>
  				<div class="col-sm-1 seat">7</div>
  				<div class="col-sm-1 seat">8</div>
  				<div class="col-sm-1 seat">9</div>
			</div>
  			<div class="row">
  				<div class="col-sm-2 seatKind">F</div>
  				<div class="col-sm-1 seat">1</div>
  				<div class="col-sm-1 seat">2</div>
  				<div class="col-sm-2" style="margin: 6px;"></div>
  				<div class="col-sm-1 seat">3</div>
  				<div class="col-sm-1 seat">4</div>
  				<div class="col-sm-1" style="margin: 3px;"></div>
  				<div class="col-sm-1 seat">5</div>
  				<div class="col-sm-1 seat">6</div>
			</div>
  			<div class="row">
  				<div class="col-sm-2 seatKind">G</div>
  				<div class="col-sm-1 seat">1</div>
  				<div class="col-sm-1 seat">2</div>
  				<div class="col-sm-2" style="margin: 6px;"></div>
  				<div class="col-sm-1 seat">3</div>
  				<div class="col-sm-1 seat">4</div>
  				<div class="col-sm-1" style="margin: 3px;"></div>
  				<div class="col-sm-1 seat">5</div>
  				<div class="col-sm-1 seat">6</div>
			</div>
		</div>
	</div>
</div>

<div>
	<div class="row" id="movieResult" style="background: #1d1d1c;border: 0px;">
		
		
		<div id="movieImgDiv" class="col-sm-3">
  			<img id="movieImg" src="<%=session.getAttribute("mvimg")%>">
		</div>
		
		
		<div id="movieInfo" class="col-sm-1">
			<div id="movieInfoDiv">
			  <span id="movieName"><%=session.getAttribute("moiveName") %></span><br>
			  <span id="movieKind">2D</span><br>
			  <span id="movieAge">15세 관람가</span>
			</div>
		</div>
			  
		<!-- 극장선택 -->
		<div id="theaterInfo" class="col-sm-2">
			<div id="thInfoDiv">
				<span class="infoText">극장</span>
			    <span id="thName"><%=session.getAttribute("mtheaterName") %></span>
			    <br>
			    <span class="infoText">일시</span>
			    <span id="resdayInfo">
			    	2022.<%=session.getAttribute("resmonth") %>.<%=session.getAttribute("resday") %>(<%=session.getAttribute("resweek") %>)</span>
			    <span id="resTimeInfo">
			    	<%=session.getAttribute("screenTime") %>
			    </span>
			    <br>
			    <span class="infoText">상영관</span>
			    <span id="thnoInfo">
			    	<%=session.getAttribute("theaterName") %>관
			    </span>
			    <br>
			    <span class="infoText">인원</span>
			    <span id="cnt"> 1명 </span>
			  </div>
		</div>
			  
		<div id="seatInfo" class="col-sm-2">
				<span class="infoText">좌석명</span>
				<span>일반석</span>
				<br>
				<span class="infoText">좌석번호</span>
				<span id="seatnum"> <!-- A0 --></span>

		 </div>
		 <div class="col-sm-3">
			 <span class="nextdivs">
			  	<button id="nextbtn" type="button" class="btn btn-outline-danger btn-lg" disabled data-toggle="modal" data-target="#resModal">
			  		<img src="https://img.icons8.com/fluency-systems-regular/50/dc3545/circled-right.png"/>
			  		<br>
				  	예약
			  	</button>
			 </span>
		 </div>
	</div>
</div>





<!-- 정보 모달 (confirm) -->
<div class="modal fade" id="overModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <!-- Modal body -->
      <div class="modal-body">
        <h4 id="minfo">선택한 인원 수 이상으로 선택하셨습니다!</h4><br>
        다시 선택하시겠습니까?<br>
        <hr>
        <div class="d-flex justify-content-around">
	        <button id="ybtn" type="button" class="btn btn-primary" data-dismiss="modal">예</button>
	        <button id="nbtn" type="button" class="btn btn-danger" data-dismiss="modal">아니오</button>
        </div>
      </div>


    </div>
  </div>
</div>


<!-- 예약안내 모달 -->
  <div class="modal fade" id="resModal">
    <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">예약정보 확인</h4>
        </div>
        
        <div class="modal-body">
			<!-- 예약자 명은 회원이면 회원명 비회원이면 비회원생년월일 -->
			<label>예약자 명 </label>
			<span>
			<%if(session.getAttribute("loginmember")!= null){
				MemberVO vo = (MemberVO)session.getAttribute("loginmember");
				out.println(vo.getMember_name());
			}else if(session.getAttribute("nonMember") != null){
				NonMemberVO vo = (NonMemberVO)session.getAttribute("nonMember");
				out.print(vo.getNonmember_birth() + "(비회원)");
			}else{
				out.print("세션오류 : 예약자 정보를 불러올 수 없습니다");
			}
			%>
			</span>
			<br>
			<label>영화 제목</label>
			<span><%=session.getAttribute("moiveName") %></span>
			<br>
			<label>영화관</label>
			CGBOX <span id="resmname"><%=session.getAttribute("mtheaterName") %></span>점
			<br>
			<label>상영관</label>
			<span><%=session.getAttribute("theaterName") %></span>관
			<br>
			<label>상영일자</label>
			<span>
			2022.
			<%=session.getAttribute("resmonth") %>.
			<%=session.getAttribute("resday") %>
			(<%=session.getAttribute("resweek") %>)
			</span>
			<br>
			<label>인원수</label>
			<span id="resultcnt">-</span>명		
			<br>
			<label>좌석</label>
			<span id="resultseat"></span>
			<br>
			<label>영화관 위치</label>
			<span id="resultaddr"></span>
        </div>
        
        <div class="modal-footer">
          <button id="finalbtn" type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
        </div>
        
      </div>
    </div>
  </div>

</body>
</html>