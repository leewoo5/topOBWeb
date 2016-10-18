<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/page.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Login.jsp</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
* {border: 0px solid white;}
body {background-color: #004466;}
.sidenav {height: 100%;}
label {color: white; font-weight: bold;}
.row{margin-top: 10%; margin-bottom:20%;}
form {margin-bottom: 10%;}
form label, input {	display: block;}
input {margin-bottom: 10px;}
.btns {border: 1px solid white; margin-top: 10%;}
#backtohome, #register {color: white; font-size: 15px;	background-color: #004466; border: none; margin-bottom: 30%;}
p{color: #0cf2ff;}
[class*="col-"] {padding: 0px;}
</style>
</head>
<body>
	<c:if test="${empty sessionScope.user}">
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-1 col-sm-5 sidenav"></div>
				<div class="col-xs-10 col-sm-2">
					
					<form action="/user/login" role="form" method="post">
						<label for="id">ID</label>
						<input class="form-control" id="id" name="uid" type="text" autofocus="autofocus"/>
						<c:if test="${not empty errorId}">
							<p>${errorId}</p>
						</c:if>
						
						<label for="pw">Password</label>
						<input class="form-control" id="pw" name="upw" type="password"/>
						<c:if test="${not empty errorPw}">
							<a>${errorPw}</a>
						</c:if>
						
						<div class="btn-group btn-group-justified">
							<div class="btn-group">
								<button type="reset" class="btn btn-danger btns">취소</button>
							</div>
							<div class="btn-group">
								<button type="submit" class="btn btn-primary btns">완료</button>
							</div>
						</div>
					</form>
					
					<div class="btn-group btn-group-justified">
						<div class="btn-group">
							<a id="backtohome" class="form-control text-center" href="/">돌아가기</a>
						</div>
						<div class="btn-group">
							<a id="register" class="form-control text-center" href="/user/form">회원가입</a>
						</div>

					</div>
				
				</div>
			<div class="col-xs-1 col-sm-5 sidenav"></div>
			</div>
		</div>
	</c:if>
	
	<c:if test="${not empty sessionScope.user}">
	<script type="text/javascript">
		location.href = "/";
	</script>
	</c:if>
</body>
</html>