<%@page import="cgbox.vo.MovieInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1">


<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script>
$(function(){

	
		$("#adaptbutton").hide();	
		$("#myModal").modal("show");
		
		$('#check').on('click',function(){
			location.href = "<%=request.getContextPath()%>/main/mainPage.jsp";

		})

	})
</script>

</head>

<style>
#sform {
	display: inline-block;
	text-align: center;
}

* {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
<body>

	<%
   List<MovieInfoVO> minfolist = (List<MovieInfoVO>)request.getAttribute("minfolist"); 
%>



	<!-- 결제 완료 후 나오는 창 입니다. -->


	<button id="adaptbutton" type="button" class="btn btn-primary"
		data-toggle="modal" data-target="#myModal">적용하기</button>


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

							<%
           if(minfolist!=null){
    	  for(int i =0; i<minfolist.size(); i++){
              %>
							<label>티켓번호 :</label> <span><%=minfolist.get(i).getTicket_no()%></span><br>
							<label>영화제목 : </label> <span name="mname"><%=minfolist.get(i).getMovie_name()%></span><br>
							<label>영화관 :</label> <span name="tname"><%=minfolist.get(i).getMtheater_name()%></span><br>
							<label>상영시간 :</label> <span name="time"><%=minfolist.get(i).getScreen_start()%>
								~ <%=minfolist.get(i).getScreen_end()%></span><br> <label>상영관
								:</label> <span><%=minfolist.get(i).getTheater_name()%>관</span><br>
							<label>예매 좌석 :</label> <span><%=minfolist.get(i).getSeat_row()%><%=minfolist.get(i).getSeat_col()%></span>
							<hr>

							<% 
    	   }
        }
     %>


							<!-- Modal footer -->
							<div class="modal-footer">

								<button type="button" class="btn btn-secondary"
									data-dismiss="modal" id="check">닫기</button>

							</div>

						</div>
					</div>
				</div>
</body>
</html>