<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div id="wrapper">
	<div class="container-fluid text-center">
		<h2 style="margin-bottom:30px;">OB 회원정보</h2>
	</div>
	<table id="register" style="width: 100%; margin-bottom: 30px;">
		<tr>
			<td class="heading" width="30%">학번</td>
			<td width="70%"><input id="uid" type="text" value="${data.uid}" readonly="readonly"/></td>
		</tr>
		<tr>
			<td class="heading" width="30%">이름</td>
			<td width="70%"><input type="text" value="${data.name}" readonly="readonly" /></td>
		</tr>
		<tr>
			<td class="heading" width="30%">성별</td>
			<td width="70%"><input type="text" value="${data.gender}" readonly="readonly" /></td>
		</tr>
		<tr>
			<td class="heading" width="30%">생일</td>
			<td class="content" width="70%"><input type="text" value="${data.birthday}" readonly="readonly" /></td>
		</tr>
		<tr>
			<td class="heading" width="30%">연락처</td>
			<td class="content" width="70%"><input type="text" value="${data.phone}" readonly="readonly" /></td>
		</tr>
		<tr>
			<td class="heading" width="30%">기수</td>
			<td class="content" width="70%"><input type="text" value="${data.stage}" readonly="readonly" /></td>
		</tr>
		<tr>
			<td class="heading" width="30%">주소</td>
			<td class="content" width="70%"><input type="text"value="${data.address}" readonly="readonly" /></td>
		</tr>
		<tr>
			<td class="heading" width="30%">전공</td>
			<td class="content" width="70%"><input type="text"value="${data.major}" readonly="readonly" /></td>
		</tr>
		<tr>
			<td class="heading" width="30%">직무</td>
			<td class="content" width="70%"><input type="text"  name="jobid" value="${data.jobid}" readonly="readonly"/></td>
		</tr>
		<tr>
			<td class="heading" width="30%">직무(기타)</td>
			<td class="content" width="70%"><input type="text"  name="jobid_etc" value="${data.jobid_etc}" readonly="readonly"/></td>
		</tr>
		<tr>
			<td class="heading" width="30%">산업</td>
			<td class="content" width="70%"><input type="text"  name="industry" value="${data.industry}" readonly="readonly"/></td>
		</tr>
		<tr>
			<td class="heading" width="30%">산업(기타)</td>
			<td class="content" width="70%"><input type="text"  name="industry_etc" value="${data.industry_etc}" readonly="readonly"/></td>
		</tr>
		<tr>
			<td class="heading" width="30%">활동상태</td>
			<c:if test="${data.active==1}">
			<td class="content" width="70%">
				<select name="active" disabled="disabled">
					<option value="1" selected="selected">활동</option>
					<option value="0">미활동</option>
				</select>
			</td>
			</c:if>
			<c:if test="${data.active==0}">
			<td class="content" width="70%">
				<select name="active" disabled="disabled">
					<option value="1">활동</option>
					<option value="0" selected="selected">미활동</option>
				</select>
			</td>
			</c:if>
		</tr>
		<tr>
			<td class="heading" width="30%">등급</td>
			<c:if test="${data.position=='p'}">
			<td class="content" width="70%">
				<select name=position disabled="disabled">
					<option value="p" selected="selected">회장</option>
					<option value="v">부회장</option>
					<option value="m">회원</option>
				</select>
			</td>
			</c:if>
			<c:if test="${data.position=='v'}">
			<td class="content" width="70%">
				<select name="position" disabled="disabled">
					<option value="p">회장</option>
					<option value="v" selected="selected">부회장</option>
					<option value="m">회원</option>
				</select>
			</td>
			</c:if>
			<c:if test="${data.position=='m'}">
			<td class="content" width="70%">
				<select name="position" disabled="disabled">
					<option value="p">회장</option>
					<option value="v">부회장</option>
					<option value="m" selected="selected">회원</option>
				</select>
			</td>
			</c:if>			
		</tr>
		<tr>
			<td class="heading" width="30%">관리자 권한</td>
			<c:if test="${data.rights=='y'}">
			<td class="content" width="70%">
				<select name="rights" disabled="disabled">
					<option value="p" selected="selected">관리자</option>
					<option value="v">일반회원</option>
				</select>
			</td>
			</c:if>
			<c:if test="${data.rights=='n'}">
			<td class="content" width="70%">
				<select name="rights" disabled="disabled">
					<option value="p">관리자</option>
					<option value="v" selected="selected">일반회원</option>
				</select>
			</td>
			</c:if>
		</tr>
		<c:if test="${sessionScope.login.rights=='y'||sessionScope.login.uid==data.uid}">
		<tr>
			<td style="border: none;"></td>
			<td style="border: none;" class="text-right">
				<button id="delete" type="button" class="btn btn-danger">삭제</button>
				<script>
					$("#delete").on("click",function(event){
						var choice = confirm("정말 삭제하시겠습니까?");
						if (choice==true) {
							self.location = "delete" + "?uid=" + $("#uid").val();
						}
					});
				</script>
				<button id="update" type="button" class="btn btn-info">수정</button>
				<script>
					$("#update").on("click",function(event){
						self.location = "update" + "?uid=" + $("#uid").val();
					});
				</script>
			</td>
		</tr>
		</c:if>
	</table>
</div>