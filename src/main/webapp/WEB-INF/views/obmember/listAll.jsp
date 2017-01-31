<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<title>top_listAll.jsp</title>
<style type="text/css">
* {
	border: 0px solid black;
	box-sizing: border-box;
}
td, th{border: 1px solid #bfbfbf; padding-top:5px; padding-bottom:5px; text-align: center; font-size: 12px;}
input, select, button{border: 1px solid #cccccc; height: 25px;}
#searchBox label, select, input {display: inline-block;}
@media screen and (max-width:799px) {
  .chart_line {
	display: none;
  }
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp"%>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<%@ include file="/WEB-INF/views/include/obmember.jsp"%>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>