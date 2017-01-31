<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE> 
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<title>menu.jsp</title>
<style type="text/css">
*{border: 0px solid black;	box-sizing: border-box;}
img{width: 100%; height: 300px; margin-top:3%; margin-bottom:3%;}
#title{font-size: 20px; width: 990px;}
p{font-size: 15px; width: 990px;}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-2 sidenav"></div>
		<div class="col-sm-8">
			<%@ include file="/WEB-INF/views/include/friendship.jsp" %>
		</div>
		<div class="col-sm-2 sidenav"></div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>