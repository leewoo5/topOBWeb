<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div id="wrapper">
	<form action="/obnotice/registerPost" role="form" method="post">
	<div class="box-body" id="register" style="margin-bottom: 30px;">
		<div class="form-group text-center">
			<h2 style="margin-bottom:30px;">공지사항 작성</h2>
		</div>
		<div class="form-group">
			<label style="border:black;">등록일</label>
			<input id="datePrint" type="text" name="regdate" class="form-control" readonly="readonly" />
			<script>
			$(document).ready(function(){
			  var now = new Date();
		      var year= now.getFullYear();
		      var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
		      var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
		      var nowDate = year + '-' + mon + '-' + day;
			  $('#datePrint').val(nowDate);
			})
			</script>
		</div>
		<div class="form-group">
			<label>작성자</label>
			<input type="text" name="writer" class="form-control" value="관리자" readonly="readonly" />
		</div>
		<div class="form-group">
			<label >제목</label>
			<input type="text" name="title" class="form-control"/>
		</div>
		<div class="form-group">
			<label >내용</label>
			<textarea name="content" class="form-control" rows="15"></textarea></div>
		</div>
		<div class="box-footer text-right">
			<button type="reset" class="btn btn-danger">다시작성</button>
			<button type="submit" class="btn btn-info">작성완료</button>
		</div>
	</form>
</div>	


