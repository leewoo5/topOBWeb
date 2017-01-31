<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<title>intro_update.jsp</title>
<style type="text/css">
* {
	border: 0px solid black;
	box-sizing: border-box;
}

img {
	width: 150px;
	height: 160px;
	margin-bottom: 3%;
}

#container {
	margin-top: 5%;
}

#title {
	font-size: 27px;
	font-weight: bold;
	margin-top: 1%;
	margin-bottom: 3%;
}

#content {
	font-size: 15px;
	margin-bottom: 3%;
	line-height: 1.8em;
	width: 100%;
}

#author {
	font-size: 17px;
	margin-bottom: 3%;
}
</style>
</head>
<body>
	<c:if test="${user.uid == 'admin'}">
		<div class="container-fluid">
			<div class="row">
				<div id="sideNav_admin" class="col-sm-2 sidenav">
					<%@ include file="/WEB-INF/views/include/sidenav_admin.jsp"%>
				</div>
				<div class="col-sm-10 no-padding">
					<div class="adminNav">
						<%@ include file="/WEB-INF/views/include/adminNav.jsp"%>
					</div>
					<div class="container-fluid">
						<div class="row" style="padding:0px 30px 0px 30px;'">
							<%@ include file="/WEB-INF/views/include/intro.jsp"%>
						</div>
					</div>
					<div id="wrapper">
						<h4 class="changeHeader">변경내용 입력 </h4>
						<form action="/admin/intro_update" method="post">
							<table>
							<tr>
								<th class="table-title">
									이미지 파일 이름 입력 예:kim.png
								</th>
								<td>
									<input type="text" class="form-control" name="img" value="${content.img}" />
								</td>
							</tr>
							<tr>
								<th class="table-title">
									제목입력
								</th>
								<td>
									<input type="text" class="form-control"  name="title" value="${content.title}"/>
								</td>
							</tr>
							<tr>
								<th class="table-title">
									내용입력
								</th>
								<td>
									<textarea class="form-control" rows="10" cols="" name="content">${content.content}</textarea>
								</td>
							</tr>
							<tr>
								<th class="table-title">
									작성자 입력
								</th>
								<td>
									<input type="text" class="form-control" name="author" value="${content.author}"/>
								</td>
							</tr>
							</table>
							<div class="btn-group text-right" style="padding:15px 0px 15px 0px; width:100%;">
								<div>
									<button type="reset" class="btn btn-info">취소</button>
									<button type="submit" class="btn btn-primary">완료</button>
								</div>
							</div>
							<c:if test="${result=='SUCCESS'}">
								<script type="text/javascript">
									alert("수정완료");
									location = "/admin/intro_update?name=intro"
								</script>
							</c:if>
						</form>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${user.uid != 'admin'}">
		<script type="text/javascript">
			alert("관리자 로그인이 필요합니다.")
			location.href = "/";
		</script>
	</c:if>
</body>
<script type="text/javascript">
$(".menulogo").hide();
</script>
</html>