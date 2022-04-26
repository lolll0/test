<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GRADE TABLE</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script>
	$(function() {
		$('.btn').on('click', function() {
			window.close();
		})

	})
</script>
<style>
	.gradeTable{
		margin: 30px auto;
	}
	
	.t1{
		width: 100px;
	}
	.t2{
		width: 200px;
	}
</style>

</head>
<body>
<div class='gradeTable'>
	<table class='table table-hover' style='text-align:center;'>
		<thead>   
			<tr>
				<th colspan="2"><h3>등급표</h3></th>
			</tr>                  
			<tr>                   
				<th class="t1">등급</th>      
				<th class="t2">기준포인트</th>      
		    </tr>                  
		</thead>                  
		<tbody>            
			<tr>             
				<td>브론즈</td>		       
				<td>0 포인트</td>		       
			</tr>            
			<tr>             
				<td>실버</td>		       
				<td>2000 포인트</td>		       
			</tr>
			<tr>             
				<td>골드</td>		       
				<td>4000 포인트</td>		       
			</tr>
			<tr>             
				<td>플레티넘</td>		       
				<td>7000 포인트</td>		       
			</tr>
			<tr>             
				<td>다이아몬드</td>		       
				<td>10000 포인트</td>		       
			</tr>
			<tr>             
				<td colspan='2' ><button type="button" class="btn btn-outline-info" >확인</button></td>		       
			</tr>
		</tbody>    
	</table>    
</div>   
</body>
</html>




