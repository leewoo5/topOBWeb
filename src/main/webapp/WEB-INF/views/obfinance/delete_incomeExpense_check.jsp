<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<title>OB재무정보</title>
<style type="text/css">
</style>
</head>
<body>
<script>
	var choice = confirm("정말 삭제하시겠습니까?"); 
	if (choice == true) {
		location.href="/obfinance/delete_incomeExpense?bno=${data}"
	}else{
		location.href="/obfinance/listAll?page=1&perPageNum=10&keyword=&startDate=&endDate="
	}
</script>
</body>
</html>