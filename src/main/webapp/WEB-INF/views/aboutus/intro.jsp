<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html> 
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<title>menu.jsp</title>
<style type="text/css">
* {border: 0px solid black;	box-sizing: border-box;}
img{width: 150px; height: 160px; margin-bottom:3%;}
#container{margin-top:5%;}
#title{font-size: 25px; font-weight:bold; margin-top:1%; margin-bottom:3%;}
#content{font-size: 15px; margin-bottom:3%; line-height: 1.8em; }
#author{font-size: 15px; margin-bottom:3%;}
#content{width:100%;}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-2 sidenav"></div>
			<div class="col-sm-8">
				<%@ include file="/WEB-INF/views/include/intro.jsp" %>
			</div>
			<div class="col-sm-2 sidenav"></div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>