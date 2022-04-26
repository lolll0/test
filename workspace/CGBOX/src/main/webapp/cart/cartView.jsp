<%@page import="cgbox.vo.allcartVO"%>
<%@page import="java.util.Map"%>
<%@page import="cgbox.vo.CartProdVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="../js/jquery-3.6.0.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	
<style>


.table{
margin  : auto;
width : 800px;
margin-left: 250px;
 font-family: "Monaco","Lucida Console", "Courier New", monospace;
}


.table th{
  background-color: #f7f8fa;    
  text-align: center;
  vertical-align: center;
}
.table td{
  padding-left:20px !important;
  padding-top: : 100px;
  vertical-align: middle;
}  


#container {
	overflow: auto;
	width: 90%;
	height: 90%;
	text-align : middle;
}

#payinfo {
	width: 700px;
	height: 200px;
}

#header {
	width: 500px;
	height: 500px;
}

.nav-item {
/* 	margin-left: 30px; */
}

.navbar-nav {
/*  margin: 0px auto; */
}
#mainimg{
 display: block; 
 margin: 0px auto;
 margin-left :  200px;
 width : 1000px;
 height : 500px;
}
#below{
display: block; 
 margin: 0px auto;
 margin-left :  200px;
 width : 900px;
 height : 200px;

}
#selectcancel,#pay{
margin-left: 250px;
margin-bottom: 50px;
}
#count{
	width : 50px;
    text-align : center;
    display : inline;
}

.countupdate{
font-size : 0.8rem;
lint-height : 1.0;
}
img{
width : 70px;
height :70px;
}

p{
display : none;
}
#sall{
display : none;
}
.sumtable{
font-size : 3.0em;
}
nav{
	background: rgb(220,53,69);
	background: linear-gradient(90deg, rgba(220,53,69,1) 0%, rgba(220,53,69,1) 29%, rgba(255,66,0,1) 100%);
}
</style>

<script>




$(function(){
   
    $('#sum').text('0원');
    $('#discount').text('0원');
    $('#lastsum').text('0원');
	
	
	
	
	
	
	$('.table').on('click','#countupdate',function(){
	count =	 $(this).prev().val();
	prod_no = $(this).parent().find('p').text();
		
	console.log(count);
	console.log(prod_no);
      
	$.ajax({
    	   url : '<%=request.getContextPath()%>/CountUpdate.do',
    	   type : 'get' ,
    	   data : { "count" : count,
    		        "prod_no" : prod_no
    	           },
    	   
    	   success :function(res){
    		
    		   location.reload();
    		   
    	   },
    	   error : function(xhr){
    		
    		  location.reload();
    		   
    	   },
    	   dataType : 'text'
       })
	
	})
	
	$('#selectcancel').on('click',function(){
// 		chk_val = [];
// 		$("input:checkbox[name=prod]:checked").each(function(){
// 			chk = $(this).val();
// 			chk_val.push(chk);
// 		})
// 		console.log(chk_val);
// 		let data = {"chkval":chk_val};
// 		console.log("data : " + data);

		// 폼 데이타 전체 직렬화
	var formData = $("#pageform").serialize();
		
		console.log("formData : " + formData);

		
		
		//ajax로 데이터 전송하기
		$.ajax({
			url : '<%=request.getContextPath()%>/SelectRemove.do',
			type : "POST",
			cache : false,
			data : formData,
			success : function(res){
				location.reload();
			
			},
			error : function(xhr){
				alert("상태 "+ xhr.status);
				location.reload();
			},
			dataType : 'text'
		})
	})

	
	//체크박스에 체인지가 일어나면 밑에 금액을 찍어주는 이벤트!
	$('.table').on('change','.checkbox',function(){ 
		
    
		var formData = $("#pageform").serialize();
		
		console.log("formData : " + formData);



		//ajax로 데이터 전송하기
		$.ajax({
			url : '<%=request.getContextPath()%>/SelectYN.do',
			type : "POST",
			cache : false,
			data : formData,
			//응답 
			success : function(res){  //sum을 리턴받는다!
			
			str = "";
			str += res+"원";
			
			$('#sum').text(str);

			$('#discount').text(0);
		
			$('#lastsum').text(str);
			
			$('#submitsum').val(res);
			
			$('#prods').val(formData);
				
			},
			error : function(xhr){
				alert("상태 "+ xhr.status);
				location.reload();
			},
			dataType : 'text'
		})
		
	})

$('#pay').on('click',function(){ //결제하기 버튼누르면!
	
	
	
	
	
	$('#paycheck').submit();
	
	
	
	
})
	
	
	
	
	
	
})

function selectAll(selectAll)  {
  const checkboxes 
       = document.getElementsByName('prod');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  })
}


</script>

</head>
<body>
	  <% 
	  List<allcartVO> prodlist = (List<allcartVO>)request.getAttribute("prodlist");
       %>
<!-- 네비게이션 바 -->
<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
  <!-- Brand -->
  <a class="navbar-brand" href="<%=request.getContextPath()%>/main/mainPage.jsp">CGBOX</a>

  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="#">영화</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="../ticketing/reservation.jsp">예매</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="../store/storePage.jsp">스토어</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="../user_event.jsp">이벤트</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="../user_FAQ.jsp">고객센터</a>
    </li>


  </ul>
</nav>
        



	<div id="container">
		<!-- 전체페이지 -->
		<div>
			<img id="mainimg"
				src="http://img.cgv.co.kr/GiftStore/Display/PC/15468087168510.jpg"
				alt="기프트샵">
		</div>
		<br>
		<br>

	
        
        
       
		<form name="pageform" id="pageform">
		<div id="header">
			
			
			<table class="table">
				<thead>
					<tr>
					    <th><input id = "sall" class= "checkbox" type="checkbox" name="prod" value="selectall" onclick="selectAll(this)"></th>
						<th>상품명</th>
						
						<th>판매금액</th>
							
						<th>수량</th>
						 
						<th>구매금액</th>
					</tr>
				</thead>
				<tbody>
				<%
				if(prodlist!=null){
				for(int i =0; i<prodlist.size(); i++){
				%>	
				<tr id = "line">
				<td><input type="checkbox" class="checkbox" name="prod" value=<%=prodlist.get(i).getProd_no()%>> </td>		
				<td><img src =<%=prodlist.get(i).getProd_source()%> alt =<%=prodlist.get(i).getProd_source()%>>
				<%=prodlist.get(i).getProd_name()%></td>
				<td ><%=prodlist.get(i).getProd_price()%>원</td>
				<td>
				<p><%=prodlist.get(i).getProd_no()%></p>
				<input id = "count" type="number" value="<%=prodlist.get(i).getCart_count()%>"/> 
			  
			    <button type="button" id = "countupdate" class="btn btn-outline-dark countupdate">변경</button>
				</td>
				<td><%=prodlist.get(i).getCart_price()%>원</td>
				</tr>
				<% 	
				    }
				}else{ //prodlist에 아무것도 담겨있지 않은 상태 
				%>
				
				<tr>
					<td>장바구에 담긴 상품이 없습니다</td>	
				
				</tr>
				
					
				<% 	
				}
				%>

			</tbody>	
			</table>
		</div>
		<!-- 선택한것 삭제하기 -->

		<button type="button" id="selectcancel" class="btn btn-secondary">선택상품
			삭제하기</button>	
<hr>
	
		</form>


 <form action ="<%=request.getContextPath()%>/pay/INIStdPayRequest3.jsp" id = "paycheck" >
		<div id="payinfo" name="payinfo">

			<table class="table">
				<thead>
					<tr>
						<th>총 상품금액</th>
						<th></th>
						<th>할인금액</th>
						<th></th>
						<th>총 결제 예정금액</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td sumtable id="sum"></td>
						<td id = "minus">
						
						<img src = "https://cdn0.iconfinder.com/data/icons/typicons-2/24/minus-512.png" >
						</td>
						<td sumtable id="discount"></td>
						<td id = "equal">
						<img src = "https://icon-library.com/images/equal-icon/equal-icon-7.jpg">
						</td>
						<td sumtable id="lastsum"></td>
						<input type = "hidden" id = "submitsum" name = "submitsum">
						<input type = "hidden" id = "prods" name = "prods" value = "">
					    <input type = "hidden" id = "prodname" name = "prodname" value = "스낵류">
					
					    
					   
					</tr>
				</tbody>
			</table>
		</div>

    </form>


		<button type="button" id="pay" class="btn btn-secondary">결제하기</button>
<br><hr>
     

	<img id = "below" src="https://adimg.cgv.co.kr/images/202111/cgvgift/0119_980x240.png">



	</div>
	
	










</body>
</html>