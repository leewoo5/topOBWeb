<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div id="wrapper"">
	<div class="container-fluid text-center">
		<h2 style="margin-bottom:30px;">수입지출 등록</h2>
	</div>
	<form action="/obfinance/registerPost_incomeExpense" role="form" method="post">
	<table id="register" style="width: 100%; margin-bottom: 30px;">
		<tr>
			<td class="heading" width="30%">일자</td>
			<td width="70%"><input id="datePrint" type="date" name="regdate"/></td>
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
		</tr>
		<tr>
			<td class="heading" width="30%">항목</td>
			<td width="70%"><input type="text" name="title" required="required" /></td>
		</tr>
		<tr>
			<td class="heading" width="30%">구분</td>
			<td width="70%">
				<select name="content">
					<option value="수입">수입</option>
					<option value="지출">지출</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="heading" width="30%">금액</td>
			<td width="70%"><input type="text" name="money" required="required" placeholder="숫자만 입력"/></td>
		</tr>
		<tr>
			<td class="heading" width="30%">상세내용</td>
			<td width="70%">
				<textarea name="detail" rows="10" style="width: 100%; border: none;"></textarea>
			</td>
		</tr>
		<tr>
			<td style="border: none;"></td>
			<td style="border: none;" class="text-right">
				<button type="reset" class="btn btn-danger">다시작성</button>
				<button type="submit" class="btn btn-info">작성완료</button>
			</td>
		</tr>
	</table>
	</form>
</div>