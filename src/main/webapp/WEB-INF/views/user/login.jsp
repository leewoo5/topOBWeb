<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<title>login.jsp</title>
<style type="text/css">
input, button, .btn-group{margin:2% 0% 2% 0%;}
.navbar-brand{padding-top:14px !important;}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
			<div id="login" class="container-fluid" style="margin-top:100px; ">
				<div class="row">
					<div class="col-md-4"></div>
					<div class="col-md-4">
						<form action="/user/loginPost" role="form" method="post">
							<label for="id">ID</label> <input style="height: 60px;" class="form-control" id="id"
								name="uid" type="text" autofocus="autofocus"  />
							<c:if test="${not empty errorId}">
								<p>${errorId}</p>
							</c:if>

							<label for="pw">Password</label> <input style="height: 60px;" class="form-control"
								id="pw" name="upw" type="password"  />
							<c:if test="${not empty errorPw}">
								<p>${errorPw}</p>
							</c:if>

							<div class="btn-group btn-group-justified">
								<div class="btn-group">
									<button style="height: 60px;" type="submit" class="btn btn-primary btns">로그인</button>
								</div>
							</div>

							<c:if test="${not empty result}">
								<script type="text/javascript">
									var result = '${result}';
									alert(result);
									location.href = "/";
								</script>
							</c:if>
						</form>

						<div class="btn-group btn-group-justified">
<!-- 							<div class="btn-group"> -->
<!-- 								<label class="form-control text-center" style="border: none; box-shadow:none;">로그인 정보 저장<input type="checkbox" style="margin-left:5px;"/></label> -->
<!-- 							</div> -->
							<div class="btn-group">
								<a id="register" class="form-control text-center"
									href="/obmember/form" style="border: none; box-shadow:none; text-decoration: none; font-weight: bold; height: 60px;">회원가입</a>
							</div>
						</div>
					</div>
					<div class="col-md-4"></div>
				</div>
			</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>