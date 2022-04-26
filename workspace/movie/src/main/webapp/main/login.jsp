<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

	<form action="/action_page.php" class="was-validated">
	  <div class="form-group">
	    <label for="uname">아이디:</label>
	    <input type="text" class="form-control" id="uid" placeholder="Enter userid" name="uid" required>
	    <div class="valid-feedback">Valid.</div>
	    <div class="invalid-feedback">아이디를 입력하세요!!</div>
	  </div>
	  <div class="form-group">
	    <label for="pwd">비밀번호:</label>
	    <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pswd" required>
	    <div class="valid-feedback">Valid.</div>
	    <div class="invalid-feedback">비밀번호를 입력하세요!!</div>
	  </div>
	  <div class="form-group">
	    <label for="pwd">비밀번호확인:</label>
	    <input type="password" class="form-control" id="pwdcheck" placeholder="Enter password" name="pswd" required>
	    <div class="valid-feedback">Valid.</div>
	    <div class="invalid-feedback">Please fill out this field.</div>
	  </div>
	  <div class="form-group form-check">
	    <label class="form-check-label">
	      <input class="form-check-input" type="checkbox" name="remember" required> I agree on blabla.
	      <div class="valid-feedback">Valid.</div>
	      <div class="invalid-feedback">Check this checkbox to continue.</div>
	    </label>
	  </div>
	  <button type="submit" class="btn btn-primary">Submit</button>
	</form>

</body>
</html>