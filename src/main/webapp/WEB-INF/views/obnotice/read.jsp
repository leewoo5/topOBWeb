<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sitemesh" tagdir="/WEB-INF/tags/sitemesh"%>
<!DOCTYPE>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<title></title>
<style type="text/css">
button{font-size: 12px; padding:10px; font-weight: bold; border-radius:5px;}
.form-control:FOCUS{outline: none;}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp"%>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<%@ include file="/WEB-INF/views/include/obNoticeRead.jsp"%>
		</div>
		<div class="col-md-4"></div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>