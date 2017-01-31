<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<title>update.jsp</title>
</head>
<body>
<script type="text/javascript">
	var result = '${result.msg}';
	if (result!=null) {
		alert("수정이 완료되었습니다.");
		location.href="/";
	}
</script>
</body>
</html>

