<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<title>manager_main.jsp</title>
<style type="text/css">
* {border: 0px solid white;}
</style>
</head>
<body style="padding-top: 0px;">
	<c:if test="${user.uid == 'admin'}">
	<%@ include file="/WEB-INF/views/include/sidenav_admin.jsp" %>
	</c:if>
	<c:if test="${user.uid != 'admin'}">
	<script type="text/javascript">
		alert("관리자 로그인이 필요합니다.")
		location.href = "/";
	</script>
	</c:if>
</body>
</html>