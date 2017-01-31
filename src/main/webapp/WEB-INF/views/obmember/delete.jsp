<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE> 
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<title>menu.jsp</title>
</head>
<body>
<script type="text/javascript">
	var result = '${result.msg}';
	if (result!=null) {
		alert(result);
		location.href="/obmember/listAll";
	}
</script>
</body>
</html>
