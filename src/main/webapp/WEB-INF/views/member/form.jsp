<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/page.jsp" %>
<html>
<head>
<title>form.jsp</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
* {border: 0px solid white;}
body {background-color: #004466;}
.space {visibility: hidden; height: 10%;}
.sidenav {height: 100%;}
label {color: white; font-weight: bold;}
form {margin-top: 5%;}
form label, input {	display: block;}
input {margin-bottom: 10px;}
.btns {border: 1px solid white;}
#backtohome {color: white; font-size: 15px;	background-color: #004466; border: none;}
[class*="col-"] {padding: 0px;}
</style>
</head>
<body>
	<c:if test="${empty sessionScop.user}">
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-1 col-sm-5 sidenav"></div>
				<div class="col-xs-10 col-sm-2">
					<div class="space"></div>
					<form action="/member/form" role="form" method="post">
						<label for="id">ID</label>
						<input class="form-control" id="id" name="uid" type="text" value="user"/>
						
						<label for="pw">Password</label>
						<input class="form-control" id="pw" name="upw" type="password" value="1234"/>
						
						<label for="nickName">NickName</label>
						<input class="form-control" id="nickName" name="nickName" type="text" value="user"/>
						
						<label for="email">Email</label>
						<input class="form-control" id="email" name="email" type="email" value="user@gmail.com"/>
			
						<div class="btn-group btn-group-justified">
							<div class="btn-group">
								<button type="reset" class="btn btn-danger btns">취소</button>
							</div>
							<div class="btn-group">
								<button type="submit" class="btn btn-primary btns">완료</button>
							</div>
						</div>
					</form>
					
					<a id="backtohome" class="form-control text-center" href="/">홈으로 돌아가기</a>
				
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