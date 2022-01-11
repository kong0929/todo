<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
	.wrapper {
  display: grid;
  place-items: center;
  min-height: 100vh;
}

.content {
  font-family: system-ui, serif;
  font-size: 2rem;
  padding: 3rem;
  border-radius: 1rem;
  background: #ff6e6c;
}
</style>
</head>
<body>
	<div class="container-fluid pt-3 text-center wrapper">
		<div class="container pt-3 center-block text-center alert alert-secondary" style="width:500px;">
		<h4>LOGIN</h4>
			<br>
			<div class="mx-auto m-3" style="width:300px;">
			<div class="center-block text-center">
				<form id="loginForm" class="form-group" method="post"  action="${pageContext.request.contextPath}/login">
					<table align="center">
						<tr>
							<td>ID&nbsp;&nbsp;</td>
							<td><input class="form-control" type="text" name="memberId" id="memberId"></td>
						</tr>
						<tr>
							<td></td>
							<td id="memberIdCheck">&nbsp;</td>
						</tr>
						<tr>
							<td>PW&nbsp;&nbsp;</td>
							<td><input class="form-control" type="password" name="memberPw" id="memberPw"></td>
						</tr>
						<tr>
							<td></td>
							<td id="memberPwCheck">&nbsp;</td>
						</tr>
					</table>
					<br>
					<div class="text-center">
						<button type="button" id="loginButton" class="btn btn-outline-primary">LOGIN</button>
						<a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/addMember">SIGN UP</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	</div>
	<script>
	// %(() == jquery()
		$('#loginButton').click(function() {
			
			if ($('#memberId').val() == '') {
				$('#memberIdCheck').html($('<small style="color:red;">').text("아이디를 입력해 주세요."));
			} else if ($('#memberPw').val() == '') {
				// id를 입력했으므로 입력해 달라는 코멘트를 삭제
				$('#memberIdCheck').html("&nbsp;");
				
				$('#memberPwCheck').html($('<small style="color:red;">').text("비밀번호를 입력해 주세요."));
				
			} else {
				$('#loginForm').submit();
			}
			
		})
	</script>
</body>
</html>