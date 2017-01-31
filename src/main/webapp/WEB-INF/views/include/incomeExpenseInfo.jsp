<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div id="wrapper">
	<div class="container-fluid text-center">
		<h2 style="margin-bottom:30px;">수입지출</h2>
	</div>
	<form action="/obfinance/updatePost_incomeExpense?bno=${data.bno}" role="form" method="post">
	<table id="register" style="width: 100%; margin-bottom: 30px;">
		<tr>
			<td class="heading" width="30%">일자</td>
			<td width="70%"><input type="text" name="regdate" 
				 value="<fmt:formatDate value="${data.regdate}" pattern="YYYY-MM-DD"/>">
			</td>
		</tr>
		<tr>
			<td class="heading" width="30%">항목</td>
			<td width="70%"><input type="text" name="title"  value="${data.title}" /></td>
		</tr>
		<tr>
			<td class="heading" width="30%">구분</td>
			<td width="70%">
				<select name="content" disabled="disabled">
					<c:if test="${data.content == '수입' }">
					<option value="수입" selected="selected">수입</option>
					<option value="지출">지출</option>
					</c:if>
					<c:if test="${data.content == '지출'}">
					<option value="수입">수입</option>
					<option value="지출" selected="selected">지출</option>
					</c:if>
				</select>
			</td>
		</tr>
		<tr>
			<td class="heading" width="30%">금액</td>
			<td width="70%"><input type="text" name="money" required="required" placeholder="숫자만 입력" value="${data.money}"/></td>
		</tr>
		<tr>
			<td class="heading" width="30%">상세내용</td>
			<td width="70%">
				<textarea readonly="readonly" name="detail" rows="10" style="width: 100%; border: none;">${data.detail}</textarea>
			</td>
		</tr>
	</table>
	</form>
</div>