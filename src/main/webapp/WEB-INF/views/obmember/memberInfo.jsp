<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<title>회원정보</title>
<style type="text/css">
* {border: 0px solid white;}
input, select{width: 100%; border:none;}
input, select:focus{outline: none;}
td{border: 1px solid #d9d9d9; padding:10px;}
button{font-size: 12px; padding:10px; font-weight: bold; border-radius:5px;}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
		<div id="register" class="container-fluid" style="margin-top:30px; margin-bottom:100px;">
			<div class="row">
				<div class="col-md-4"></div>
				<div class="col-md-4">
					<%@ include file="/WEB-INF/views/include/obmember_memberInfo.jsp" %>
				</div>
			<div class="col-md-4"></div>
			</div>
		</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>