<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<title>탑팩토리 메인</title>
<style>
* {
	border: 0px solid black;
}
.carousel-inner img {
	width: 100%;
	margin: auto;
	min-height: 600px;
	max-height: 600px;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<!-- <div id="myCarousel" class="carousel slide" data-ride="carousel"> -->
<!--     Wrapper for slides -->
<!--     <div class="carousel-inner" role="listbox"> -->
<!--       <div class="item active"> -->
<!-- 	  	<img alt="top0" src="../resources/img/header.jpg"> -->
<!-- 	  </div> -->
<!--     </div> -->
<!-- </div> -->
<header>
    <div class="header-content">
        <div class="header-content-inner">
            <h1 id="homeHeading">Welcome to Top factory OB</h1>
            <hr>
            <p>Hannam University HR(human resources) Incubating Group</p>
            <a href="#intro" class="btn btn-info" style="padding:1%; color: white;">Find Out More</a>
        </div>
    </div>
</header>
<c:if test="${sessionScope.login.rights=='y'}">
<div class="container-fluid" style="padding:0px;">
	<a style="width:100%; border-radius:0px;" class="btn btn-info" id="myBtn">메인 페이지 수정</a>
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content" style="color: black;">
				<form action="/updatePost" role="form" method="post">
				<div class="modal-header" style="padding:10px 10px;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="text-center">소개글 수정</h4>
				</div>
				<div class="modal-body" style="padding: 15px 15px;">
						<div class="form-group">
							<label for="introTitle">제목</label> 
							<input type="text" class="form-control" id="introTitle" name="introtitle" required="required" value="${data.introtitle}"/>
						</div>
						<div class="form-group">
							<label for="introWriter">작성자</label>
							<input type="text" class="form-control" id="introWriter" name="introwriter" required="required" value="${data.introwriter}"/>
						</div>
						<div class="form-group">
							<label for="introContent">내용</label>
							<textarea class="form-control" id="introContent" name="introcontent" rows="10" required="required">${data.introcontent}</textarea>
						</div>
						<div class="form-group">
							<label for="contactEmail">E-mail</label>
							<input type="email" class="form-control" id="contactEmail" name="contactemail" required="required" value="${data.contactemail}"/>
						</div>
				</div>
				<div class="modal-footer">
					<button type="submit" style="margin:5px;"
						class="btn btn-info btn-default pull-right" >
						수정완료
					</button>
					<button type="reset" style="margin:5px;"
						class="btn btn-danger btn-default pull-right" >
						 다시작성
					</button>
				</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script>
$(document).ready(function(){
    $("#myBtn").click(function(){
        $("#myModal").modal();
    });
});
</script>
</c:if>
<div id="intro" style="padding:60px; background-color: #333333; color: white;">
<div id="container" class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<h4 id="title" style="font-weight: bold; line-height: 1em;">"${data.introtitle}"</h4>
			<p id="content" style="line-height: 2em;">${data.introcontent}</p>
			<p class="text-right" id="author">
				OB 회장 <strong>${data.introwriter}</strong> 드림
			</p>
			<p class="text-right" id="redate">작성일: <fmt:formatDate value="${data.regdate}" pattern="YYYY-MM-DD"/></p>
		</div>
	</div>
</div>
</div>
<div id="active" style="padding:60px; background-color: #F05F40; color: white;">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4 text-center">
				<p style="font-size: 100px;"><span class="glyphicon glyphicon-blackboard"></p>
				<h4><strong>정기총회</strong></h4>
				<p>YB와 OB가 한 자리에 모이는 연말행사</p>
			</div>
			<div class="col-md-4 text-center">
				<p style="font-size: 100px;"><span class="glyphicon glyphicon-glass"></span></p>
				<h4><strong>OB 친목활동</strong></h4>
				<p>크고 작은 모임과 단체엠티등의 친목활동을 진행</p>
			</div>
			<div class="col-md-4 text-center">
				<p style="font-size: 100px;"><span class="glyphicon glyphicon-education"></span></p>
				<h4><strong>탑팩토리 OB만의 특별활동	</strong></h4>
				<p>회원간의 정보와 경험을 공유하는 다양한 활동</p>
			</div>
		</div>
	</div>
</div>
</div>
<div id="contact" style="padding:60px;">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 text-center" style="margin-bottom:15px;">
				<h2>Contact Us</h2>
				<hr style="border:1px solid #1a1a1a;">
				<p>문의사항이 있으시다면 OB운영진에게 아래의 이메일로 문의해주세요.</p>
			</div>
			<div class="col-lg-12 text-center">
				<i class="fa fa-envelope-o fa-3x sr-contact"></i>
				<p style="margin:10px;">${data.contactemail}</p>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>
