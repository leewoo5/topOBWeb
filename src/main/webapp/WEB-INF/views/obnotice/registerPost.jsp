<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<title></title>
</head>
<body>
<script>
	var result = '${result.msg}' 
	if (result != null) {
		alert(result);
	}
	location.href="/obnotice/listAll";
</script>
</body>
</html>