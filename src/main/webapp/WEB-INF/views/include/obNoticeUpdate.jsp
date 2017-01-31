<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div id="wrapper">
	<form action="/obnotice/updatePost?bno=${data.bno}" method="post">
	<div class="box-body" id="register" style="margin-bottom: 30px;">
		<div class="form-group text-center">
			<h2 style="margin-bottom: 30px;">공지사항 수정</h2>
		</div>
		<div class="form-group">
			<label style="border: black;">등록일</label> <input id="datePrint"
				type="text" name="regdate" value="${data.regdate}" class="form-control" readonly="readonly"/>
		</div>
		<div class="form-group">
			<label>제목</label> <input type="text" value="${data.title}"
				name="title" class="form-control"/>
		</div>
		<div class="form-group">
			<label>내용</label>
			<textarea class="form-control" name="content" rows="15" >${data.content}</textarea>
		</div>
	</div>
	<c:if test="${sessionScope.login.rights=='y'}">
		<div class="box-footer text-right">
			<button id="update" type="submit" class="btn btn-info">수정</button>
		</div>
	</c:if>
	</form>
</div>












