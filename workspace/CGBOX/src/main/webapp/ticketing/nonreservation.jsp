<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="vo.TicketVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비회원 예매내역 확인</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="../js/jquery.serializejson.min.js"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">

<style type="text/css">


nav{
	background: rgb(220,53,69);
	background: linear-gradient(90deg, rgba(220,53,69,1) 0%, rgba(220,53,69,1) 29%, rgba(255,66,0,1) 100%);
}

.container{
	margin-top: 80px;
}


h1{
	font-weight: bold;
	text-align: center;

}

.container h1{
	color: white;
}
.row{
 	border: 1px solid lightgray;
 }
 img{
 	width: 150px;
 	height: 300px;
 	margin: 10px;
 }
 
.tittle{
	padding-top : 20px;
	padding-bottom : 20px;
	font-size : 2.0em;
	text-align: center;
	color: black;
	vertical-align: middle;
	font-weight:bold;
	border-radius: 0.25rem;

 	background-color:#e74c3c;
 	color: white;
 	font-family: 'Black Han Sans', sans-serif;
	font-family: 'Nanum Gothic Coding', monospace;

 
}
.card{
	margin: 0px auto;
	box-shadow: rgba(0, 0, 0, 0.56) 0px 22px 70px 4px;
	
	
}

#seats{
	color: green;
	font-weight: bold;
}
</style>

<script type="text/javascript">


<%
Map<String, String> result = (Map<String, String>) session.getAttribute("result");

if(result == null){
%>


	alert('예약된 내역이 없습니다');

<%	
}else{
	
	
%>
$(function() {
	$('#backbtn').on('click', function() {
		location.href = 'NonMember_reservations.jsp';
	})
	
	$('#paybtn').on('click', function() {
		location.href = '<%=request.getContextPath()%>/NonMemberPay.do?tno=<%=result.get("ticket")%>';
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
      <a class="nav-link" href="../movie/movieChart.jsp">영화</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">극장</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="reservation.jsp">예매</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="../store/storePage.jsp">스토어</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="../user_event.jsp">이벤트</a>
    </li>
    


  </ul>
</nav>

<!-- ///////////////////////////////////////////////////////////// -->



	
	


<div class="container">
		
  <div class="card " style="width:500px">
  	<div class="tittle"><%=result.get("mname") %></div>
    <img class="card-img-top" src="<%=result.get("mImg") %>" alt="영화포스터" style="width:96%;object-fit: cover;">
    <div class="card-body">
      <h4 class="card-title">CGBOX <%=result.get("mtName") %>점</h4>
      <p class="card-text"><%=result.get("tKind") %></p>
      <p class="card-text">
      	<span><%=result.get("tName") %></span>&nbsp;&nbsp;|&nbsp;&nbsp;<span><%=result.get("day") %></span>&nbsp;&nbsp;|&nbsp;&nbsp;<span><%=result.get("time") %></span>
      </p>
	      <p class="card-text" id="seats"><%=result.get("seats") %></p>
      <hr>
      <div style="text-align: center; padding-bottom: 10px;">
    	  <img src="../image/바코드.png" style="width: 400px; height: 100px;">
      </div>
      <%
      	if(result.get("status").equals("N")){
		%>
	   	  <div class="btn-group btn-block">
	   	    <button type="button" class="btn btn-secondary" id="backbtn">뒤로가기</button>
		    <button id="paybtn" type="button" class="btn btn-success">결제 하기</button>
		    <button type="button" class="btn btn-danger">예매 취소</button>
		  </div>
		<%      		
      	}else{
		%>
		  <div class="btn-group btn-block">
	   	    <button type="button" class="btn btn-secondary" id="backbtn">뒤로가기</button>
		    <button type="button" class="btn btn-outline-success" disabled>결제 완료</button>
		    <button type="button" class="btn btn-danger">예매 취소</button>
		  </div> 
		
	  <%      		
      	}
      %>
    </div>
  </div>
	
	
	


</div>



<% 	
	}
%>


</body>
</html>