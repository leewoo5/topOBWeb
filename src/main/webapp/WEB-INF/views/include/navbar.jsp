<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar" style="color: white;">
        Menu <i class="fa fa-bars"></i>                        
      </button>
      <a class="navbar-brand" href="/" style="padding-top: 14px;">TOP factory OB</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a style="font-weight: bold;" href="/#intro">소개 </a></li>
		<li><a href="/#active" style="font-weight: bold;">활동사항</a></li>
		<li><a style="font-weight: bold;" href="/obnotice/listAll">공지사항</a></li>
		<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" >운영정보</a>
			<ul class="dropdown-menu">
				<li><a href="/obmember/listAll?page=1&perPageNum=10&keyword=">회원정보</a></li>
				<li><a href="/obfinance/listAll?page=1&perPageNum=10&keyword=&startDate=&endDate=">재무정보</a></li>
			</ul>
		</li>
      </ul>
      <ul class="nav navbar-nav navbar-right" style="font-size: 12px; margin-top:5px;">
	  	<li><a href="#contact" ><i class="fa fa-envelope-o"></i> Contact</a></li>
		<c:if test="${empty sessionScope.login}">
		<li><a href="/user/login" ><i class="fa fa-sign-in fa-1x"></i> Login</a></li>
		<li><a href="/obmember/form" ><i class="fa fa-user-plus fa-1x"></i> Sign Up</a></li>
		</c:if>
		<c:if test="${not empty sessionScope.login}">
		<li><a style="color: white;">${sessionScope.login.name}</a></li>
		<li><a href="/user/logout" ><i class="fa fa-sign-out fa-1x"></i> Logout</a></li>
		</c:if>
		</ul>
    </div>
  </div>
</nav>