<%@page import="cgbox.vo.MemberVO"%>
<%@page import="cgbox.vo.MovieInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>

<%@page import="cgbox.vo.selectmconVO"%>
<%@page import="cgbox.vo.ScreenVO"%>
<%@page import="cgbox.vo.TheaterVO"%>
<%@page import="com.inicis.std.util.SignatureUtil"%>
<%@page import="java.text.SimpleDateFormat"%>



<!DOCTYPE html>
<html>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1">

<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>



<script>
 $(function(){
	 

	 
	 
	 $('#insertcon').on('click',function(){
		 window.open("<%=request.getContextPath()%>/pay/insertcon.jsp","영화관람권등록","width=600 height=700" );	 
	 })
	
	
	$('.conbutton').on('click',function(){  //기프티콘 사용하기 버튼 누르면 
	
	//conprod =	$(this).parent().find('span').text();
		conprod =	$(this).parent().find('input').val();
	    console.log(conprod);
		
	//해당상품 사용하기 누르면 서블릿가서 밑에 할인금액 찍기
	$.ajax({
		url : '<%=request.getContextPath()%>/Discount.do',
				type : 'get',
				data : {
					"conprod" : conprod
				},

				success : function(res) { //res는 prodprice
					str = "";
					str += res + " 원";
					$('#discount').text(str);
					$('#discount2').text(str); //밑에 할인금액칸

					//빼기한거 넣어주기
					//alert($('#sumcheck').text());
					price = $('#sumcheck').text() - res;

					if (price < 0) {
						price = 0;
					}
					$('#lastsum').text(price);

					$('#totalsum').text(price);//모달창에 있는

					$('#submitsum').val($('#totalsum').text());
					$('#conprodno').val(conprod);

				},
				error : function(xhr) {
					alert(xhr.status);
				},
				dataType : 'text'
			})
		})

		$('#minfo').on('click', function() { //영화 예매 정보를 클릭하면 id = sum인 곳에 결제금액 찍히기 

			//가격 
			str = $('#sumcheck').text() + "원";
			$('#sum').text(str);
			$('#discount2').text('0');
			$('#lastsum').text(str);
			$('#totalsum').text(str);
			$('#submitsum').val($('#sumcheck').text());

		})

		$('.reset').on('click', function() {
			str = $('#sumcheck').text() + "원";
			$('#sum').text(str);
			$('#discount').text('0원');
			$('#discount2').text('0');
			$('#lastsum').text(str);
			$('#submitsum').val($('#sumcheck').text());

			//reset버튼을 누르면 관람권사용이 취소되어야한다
			$('#conprodno').val(""); //null로 설정해주기 

		})

		$('#submitcheck').on('click', function() {
			$('#paycheck').submit();

		})

	})
</script>
<style>
#adaptbutton{
margin-left : 400px;
}
#sumcheck {
	display: none;
}

.pricecheck {
	margin: auto;
	width: 800px;
	margin: 0px auto;
	font-family: "Monaco", "Lucida Console", "Courier New", monospace;
}

.pricecheck th {
	background-color: #f7f8fa;
	text-align: center;
	vertical-align: center;
}

.pricecheck td {
	padding-left: 20px !important;
	padding-top: : 100px;
	vertical-align: middle;
}

#ticketimg {
	width: 160px;
	height: 100px;
	margin-right: 200px;
}

#memonly, ticketimg {
	display: inline;
	font-family: 'Noto Sans KR', sans-serif;
}

.conbutton {
	margin-right: 50px;
}

.table-hover {
	border-radius: 10px;
}

img {
	width: 60px;
	height: 60px;
}

#accordion {
	text-align: center;
}

.blank {
	margin-left: 20px;
}

*{
	font-family: 'Noto Sans KR', sans-serif;
}

</style>

</head>
<body>

	<%
	MemberVO loginmember = (MemberVO) request.getAttribute("loginmember");
	
	int cusno = loginmember.getCustomer_no();
	String grade = loginmember.getGrade_no();
	String id = loginmember.getMember_id();
	String name = loginmember.getMember_name();
	String mail = loginmember.getMember_mail();
	String pass = loginmember.getMember_pass();
	String birth = loginmember.getMember_birth();
	String tel = loginmember.getMember_tel();
	int point = loginmember.getMember_point();

	List<selectmconVO> mconlist = (List<selectmconVO>) request.getAttribute("mconlist");
	List<MovieInfoVO> minfolist = (List<MovieInfoVO>) request.getAttribute("minfolist");
	int sum = (int) request.getAttribute("sum");
	
	%>



	<div class="container">
		<br> <img id="ticketimg"
			src="https://cdn-icons-png.flaticon.com/512/1292/1292167.png">
		<h3 id="memonly">회원전용 결제</h3>
		<hr>

		<br>
		<div id="accordion">
			<div class="card">
				<div class="card-header">
					<a id="minfo" class="card-link" data-toggle="collapse"
						href="#collapseOne"> <font color="black">영화 예매 정보 확인하기<span
							class="blank"></span> ▼
					</font>
					</a>
				</div>
				<div id="collapseOne" class="collapse show" data-parent="#accordion">
					<div class="card-body">
						<!-- 영화예매 정보 출력  -->



						<%
						if (minfolist != null) {
							for (int i = 0; i < minfolist.size(); i++) {
						%>
						<label style="font-size: 1.1em;">티켓번호 :</label> <span><%=minfolist.get(i).getTicket_no()%></span><br>
						<label style="font-size: 1.1em;">영화제목 : </label> <span
							name="mname"><%=minfolist.get(i).getMovie_name()%></span><br>
						<label style="font-size: 1.1em;">영화관 :</label> <span name="tname"><%=minfolist.get(i).getMtheater_name()%></span><br>
						<label style="font-size: 1.1em;">상영시간 :</label> <span name="time"><%=minfolist.get(i).getScreen_start()%>
							~ <%=minfolist.get(i).getScreen_end()%></span><br> <label
							style="font-size: 1.1em;">상영관 :</label> <span><%=minfolist.get(i).getTheater_name()%>관</span><br>

						<label style="font-size: 1.1em;">상영 날짜 :</label> <span><%=minfolist.get(i).getScreen_day()%></span><br>
						<label style="font-size: 1.1em;">예매 좌석 :</label> <span><%=minfolist.get(i).getSeat_row()%><%=minfolist.get(i).getSeat_col()%></span>
						<hr>

						<%
						}
						}
						%>

					</div>
				</div>
			</div>
			<div class="card">
				<div class="card-header">
					<a class="collapsed card-link" data-toggle="collapse"
						href="#collapseTwo"> <font color="black">영화관람권 적용하기 <span
							class="blank"></span>▼
					</font>
					</a>
				</div>
				<div id="collapseTwo" class="collapse" data-parent="#accordion">
					<div class="card-body">
						<!-- 영화관람권 출력 및 등록하기-->
						<button type="button" id="insertcon" class="btn btn-secondary">등록하기</button>
						<br>
						<br>

						<table class="table table-dark table-hover">
							<thead>
								<tr>
									<th>사용가능한 관람권이름</th>
									<th>남은 수량</th>
									<th>관람권 상품번호</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<%
								if (mconlist != null) {
									for (int i = 0; i < mconlist.size(); i++) {
								%>
								<tr>
									<td><%=mconlist.get(i).getProd_name()%></td>
									<td><%=mconlist.get(i).getMyprod_count()%></td>
									<td><span><%=mconlist.get(i).getProd_no()%></span></td>
									<td><input type="hidden"
										value="<%=mconlist.get(i).getProd_no()%>">
										<button type="button" class="btn btn-light conbutton">사용하기</button>
										<button type="button" class="btn btn-secondary reset">관람권
											사용취소↺</button></td>
								</tr>
								<%
								}
								} else {
								%>
								<tr>
									<td>사용 가능한 영화관람권이(가) 없습니다.
								</tr>

								<%
								}
								%>

							</tbody>
						</table>
						<hr>
						<span>할인금액: </span> <span id="discount"></span>



					</div>
				</div>
			</div>

		</div>
	</div>


	<br>
	<br>

	<table class="table pricecheck">
		<thead>
			<tr>
				<th>결제하실 금액</th>
				<th></th>
				<th>할인금액</th>
				<th></th>
				<th>남은 결제 금액</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<p id="sumcheck"><%=sum%></p>
				<td id="sum"></td>
				<td id="minus"><img
					src="https://cdn0.iconfinder.com/data/icons/typicons-2/24/minus-512.png">

				</td>
				<td id="discount2"></td>
				<td id="equal"><img
					src="https://icon-library.com/images/equal-icon/equal-icon-7.jpg"></td>
				<td id="lastsum"></td>
			</tr>
		</tbody>
	</table>

	<hr>
	<button id = "adaptbutton" type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#myModal">적용하기</button>

	<!-- The Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">예매확인</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<!-- 모달에 들어갔을 때의 내용 -->
				<div class="modal-body">


					<form
						action="<%=request.getContextPath()%>/pay/INIStdPayRequest.jsp" id="paycheck">



						<label>영화제목 : </label>
						<%
						HashSet<String> Set = new HashSet<String>();
						for (int i = 0; i < minfolist.size(); i++) {
							Set.add(minfolist.get(i).getMovie_name());
						}
						%>

						<%
						for (String nm : Set) {
						%>
						<span><%=nm%></span> <br>
						<%
						}
						%>



						<hr>


						<hr>
						<label>총 결제금액 :</label> <span id="totalsum"></span> <input
							type="hidden" id="submitsum" name="submitsum"> <input
							type="hidden" name="mname" value="CGBOX영화예매"> <input
							type="hidden" name="conprodno" id="conprodno">

					</form>

				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" id="submitcheck">결제요청</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" id="check">닫기</button>

				</div>

			</div>
		</div>
	</div>






</body>
</html>