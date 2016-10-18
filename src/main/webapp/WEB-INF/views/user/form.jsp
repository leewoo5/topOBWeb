<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/page.jsp"%>
<html>
<head>
<title>form.jsp</title>
<%@ include file="../include/header.jsp"%>
<style type="text/css">
* {
	border: 0px solid white;
}

body {background-color: #004466;}
.space {visibility: hidden;	height: 10%;}
.sidenav {height: 100%;}
label {color: white; font-weight: bold;}
form {margin-top: 5%;}
form label, input {	display: block;}
input {	margin-bottom: 10px;}
.btns {	border: 1px solid white;}
#backtohome, #title {color: white;	font-size: 15px; background-color: #004466; border: none;}
p{color: #0cf2ff;}
#btnCheck{width: auto;}
[class*="col-"] {padding: 0px;}
</style>
</head>
<body>
	<!-- 로그인이 되어있으면 회원정보 수정 폼 아니면 회원가입 폼 -->
	<c:choose>
	<c:when test="${empty sessionScope.login}">
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-1 col-sm-5 sidenav"></div>
				<div class="col-xs-10 col-sm-2">
					<div class="space"></div>
					<p id="title" class="form-control text-center">회원가입</p>
					<form action="/user/form" role="form" method="post">
						<label for="id">ID</label> 
						<input class="form-control" id="id" name="uid" type="text" value="user" autofocus="autofocus" /> 
						
						<label for="pw">Password</label>
						<input class="form-control" id="pw" name="upw" type="password" value="1234" />
						
						<label for="nickName">NickName</label>
						<input class="form-control" id="nickName" name="nickName" type="text" value="user" />
						
						<label for="email">Email</label>
						<input class="form-control" id="email" name="email" type="email" value="user@gmail.com" />

						<div class="btn-group btn-group-justified">
							<div class="btn-group">
								<button type="reset" class="btn btn-danger btns">취소</button>
							</div>
							<div class="btn-group">
								<button type="submit" class="btn btn-primary btns">완료</button>
							</div>
						</div>
					</form>

					<a id="backtohome" class="form-control text-center" href="/">홈으로	돌아가기</a>

				</div>
				<div class="col-xs-1 col-sm-5 sidenav"></div>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-1 col-sm-5 sidenav"></div>
				<div class="col-xs-10 col-sm-2">
					<div class="space"></div>
					<p id="title" class="form-control text-center">회원정보 수정</p>
					<!-- put 메소드 사용을 위해서 스프링 폼태그 사용 -->
					<form:form action="/user/update" method="put">
						
						<label for="id">아이디</label> 
						<input class="form-control" id="id" name="uid" type="text" readonly="readonly" value="${userInfo.uid}"  /> 
						
						<label >변경할 비밀번호</label>
						<input class="form-control" id="pwOld" name="upwNew1" type="password" required="required" autofocus="autofocus"  />

						<label >변경할 비밀번호 확인</label>
						<input class="form-control" id="pwNew" name="upwNew2" type="password" required="required"  />
						<div class="btn-group-justified text-right">
							<p style="display: inline-block; margin-right: 5%;" id="pwCheck"></p>
							<button type="button" class="btn btn-info" id="btnCheck">확인</button>
						</div>
						<script>
						$(document).ready(function(){
							$("#btnCheck").hide();
							$("#pwNew").focus(function(){
								$("#btnCheck").show();
							});
							$("#btnCheck").click(function(){
								if($("#pwNew").val()!=null) {
									if ($("#pwOld").val()==$("#pwNew").val()) {
										$("#pwCheck").html("비밀번호가 일치합니다");
									}else{
										$("#pwCheck").html("비밀번호가 일치하지 않습니다");
									}	
								}
							});
						});
						</script>
						
						<label for="nickName">NickName</label>
						<input class="form-control" id="nickName" name="nickName" type="text" value="${userInfo.nickName}" required="required"  />
						
						<label for="email">Email</label>
						<input class="form-control" id="email" name="email" type="email" value="${userInfo.email}" required="required"  />

						<div class="btn-group btn-group-justified">
							<div class="btn-group">
								<button type="reset" class="btn btn-danger btns">취소</button>
							</div>
							<div class="btn-group">
								<button type="submit" class="btn btn-primary btns">수정완료</button>
							</div>
						</div>
					</form:form>

					<a id="backtohome" class="form-control text-center" href="/">홈으로	돌아가기</a>

				</div>
				<div class="col-xs-1 col-sm-5 sidenav"></div>
			</div>
		</div>
	</c:otherwise>
	</c:choose>

</body>

</html>