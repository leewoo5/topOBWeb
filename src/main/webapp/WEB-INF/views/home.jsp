<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="include/page.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="include/header.jsp" %>
<title>Home</title>
<style>
* {border: 0px solid white;	box-sizing: border-box;}
body {background-color: #004466;}
#wrapper {height: 100%;}
.sidenav {height: 100%;}
nav {background-color: #00334d;	position: absolute;}
nav a {font-size: 20px;	color: white;}
.nav-justified>li>a{margin: 0px;}
#container {padding-left: 0%; padding-right: 0%; margin: 0px;}
#content {
	background-color: #00334d;
	opacity: 0.5;
	height: 1700px;
	z-index: -2;
	position: absolute;
	width: 100%;
	padding: 0px;
	margin: 0px;
}
.timeline {background-color: #00334d; padding: 0px; margin-bottom: 5%;}
.review {background-color: white; padding-top: 2%; padding-bottom: 2%;}
.cover{ height:120px; width: 30%; margin: 3%; position: absolute;}
#discri{ height:100px; width: 57%; margin-left: 40%; margin-top: 3%; margin-right: 1%; margin-bottom:10%; line-height: 20px; }
.title {margin-top:5%; font-size: 12px; color: white;}
.author, .publisher, .price {color: white; font-size: 11px;}
.info {padding: 0px; margin-top: 1%; margin-left: 3%; font-size: 10px;}
.time {	padding: 0px; margin-bottom: 2%; margin-left: 3%; font-size: 5px;}
textarea {padding: 5px;	resize: none;}
.btn {font-size: 10px; color: white; padding: 5px; margin: 0px;}
p {margin: 0px;}
.btns{background-color: #00334d; border: none; }
.btn.focus, .btn:focus, .btn:hover {color: #0cf2ff; text-decoration: none;}
#nickName{color: #0cf2ff; }
.signs{margin-bottom: 5%;}
.sign{padding-top: 5%; padding-bottom: 5%;}
footer .signs{margin-bottom: 1%;}
#copyright{color: white; font-weight: bold; font-size: 11px;}
footer .timeline{padding-bottom: 5%;}
<%@ include file="include/stars_css.jsp" %>
</style>

</head>
<body>
	<div id="wrapper">
		<nav class="navbar">
			<ul class="nav nav-pills nav-justified">
				<li><a class="text-center" href="/">BookStory Beta 1.0</a></li>
			</ul>
		</nav>
		<!-- timeline start -->
		<div class="container-fluid">
			<div class="row">
				<div class="sidenav col-xs-1 col-sm-4"></div>
				
				<div id="container" class="col-xs-10 col-sm-4">
					
					<div id="content"></div>
					
					<!-- 로그인 안 했을 때 -->
					<c:if test="${empty sessionScope.user}">
					<div class="signs btn-group btn-group-justified">
						<div class="btn-group">
							<a class="sign btn btn-primary btns" href="/user/login">로그인</a>
						</div>
						<div class="btn-group">
							<a class="sign btn btn-danger btns" href="/member/form">회원가입</a>
						</div>
					</div>
					</c:if>
					
					<!-- 로그인 했을 때 -->
					<c:if test="${not empty sessionScope.user}">
					<div class="signs btn-group btn-group-justified">
						<div class="btn-group">
							<a class="sign btn btns"><span id="nickName">${sessionScope.user}</span></a>
						</div>
						<div class="btn-group">
							<a class="sign btn btns" href="#">나의 정보</a>
						</div>
					</div>
					</c:if>

					<div class="timeline">
						<img style="display: inline-block;" class="cover" alt="bookcover" src="/resources/image/book1.jpg"/>
						<div id="discri" style="display: inline-block;">
							<p class="title">소프트웨어 개발의 모든 것</p>
							<p class="author">김태균</p>
							<p class="publisher">미래북</p>
							<p class="price">25,000</p>
							<!--평점 -->
							<%@ include file="include/stars_html.jsp" %>
						</div>
						<div class="review">
							<p class="info">김철수님이 이 책을 읽었습니다.</p>
							<p class="time"><i class="fa fa-clock-o"></i> 1시간 전</p>
							<textarea class="form-control" rows="5" readonly="readonly">test: 30대에게 추천하는 책</textarea>
						</div>
						<div class="text-right">
							<a class="btn"><i class="fa fa-heart"></i>&nbsp&nbsp0</a>
							<a class="btn"><i class="fa fa-align-justify"></i>&nbsp&nbsp0</a>
							<a class="btn"><i class="fa fa-share-alt"></i>&nbsp&nbsp0</a>
							<a class="btn"><i class="fa fa-shopping-cart"></i>&nbsp&nbsp0</a>
						</div>
					</div>
					
					<c:if test="${not empty sessionScope.user}">
						<footer>
							<div class="timeline">
								<div class="signs btn-group btn-group-justified">
									<div class="btn-group">
										<a href="/user/logout" class="sign btn btns">로그아웃</a>
									</div>
								</div>
								<p id="copyright" class="btn-group-justified text-center">
									Copyright. BOOKSTORY all rights reserved.
								</p>
							</div>
						</footer>
					</c:if>
					<c:if test="${empty sessionScope.user }">
						<footer>
							<div class="timeline">
								<div class="signs btn-group btn-group-justified">
									<div class="btn-group">
										<a href="/member/form" class="sign btn btns">BookStory 시작하기</a>
									</div>
								</div>
								<p id="copyright" class="btn-group-justified text-center">
									Copyright. BOOKSTORY all rights reserved.
								</p>
							</div>
						</footer>
					</c:if>
					
				</div>
			</div>			
			<div class="sidenav col-xs-1 col-sm-4"></div>
			</div>
		</div>
	<!-- wrapper end -->
</body>
</html>
