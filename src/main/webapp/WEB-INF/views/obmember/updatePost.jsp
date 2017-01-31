<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE> 
<html>
<head>
<title>update.jsp</title>
</head>
<body>
<script type="text/javascript">
	var result = '${result.msg}';
	var pwError = '${pwError.msg}';
	var preUid = '${preUid}';
	if (result!="") {
		alert(result);
		location.href="/obmember/listAll?page=1&perPageNum=10&keyword=&startDate=&endDate=";
	}
	if (pwError!="") {
		alert(pwError);
		location.href="/obmember/update?uid="+preUid;
	}
</script>
</body>
</html>
