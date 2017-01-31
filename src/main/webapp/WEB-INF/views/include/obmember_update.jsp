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
	<form action="/obmember/updatePost?preUid=${data.uid}" method="post">
	<table id="register" style="width: 100%; margin-bottom: 30px;">
		<tr>
			<td class="heading" width="30%">학번</td>
			<td width="70%"><input id="uid" type="text" name="uid" value="${data.uid}" required="required"/></td>
		</tr>
		<tr>
			<td class="heading" width="30%">기존 비밀번호</td>
			<td width="70%"><input type="text" name="upw" required="required" value="${data.upw}">
			</td>
		</tr>
		<tr>
			<td class="heading" width="30%">새 비밀번호</td>
			<td width="70%"><input type="password" name="upwNew">
			</td>
		</tr>
		<tr>
			<td class="heading" width="30%">새 비밀번호 확인</td>
			<td width="70%"><input type="password" name="upwCheck">
			</td>
		</tr>
		<tr>
			<td class="heading" width="30%">이름</td>
			<td width="70%"><input type="text" name="name"  value="${data.name}" required="required"/></td>
		</tr>
		<tr>
			<td class="heading" width="30%">성별</td>
			<td width="70%"><input type="text" name="gender" value="${data.gender}" required="required"/></td>
		</tr>
		<tr>
			<td class="heading" width="30%">생일</td>
			<td class="content" width="70%"><input type="text"  name="birthday" value="${data.birthday}" required="required" placeholder="YYYY-MM-DD"/></td>
		</tr>
		<tr>
			<td class="heading" width="30%">연락처</td>
			<td class="content" width="70%"><input type="text"  name="phone" value="${data.phone}"required="required"/></td>
		</tr>
		<tr>
			<td class="heading" width="30%">기수</td>
			<td class="content" width="70%"><input type="text"  name="stage" value="${data.stage}"required="required"/></td>
		</tr>
		<tr>
			<td class="heading" width="30%">주소</td>
			<td class="content" width="70%"><input type="text"  name="address" value="${data.address}"required="required"/></td>
		</tr>
		<tr>
			<td class="heading" width="30%">전공</td>
			<td class="content" width="70%"><input type="text"  name="major" value="${data.major}"required="required"/></td>
		</tr>
		<tr>
			<td class="heading" width="30%">직무</td>
			<td class="content" width="70%">
				<select id="jobid" name="jobid">
					<c:if test="${data.jobid=='마케팅'}">
						<option selected="selected" value="마케팅">마케팅</option>
						<option value="재무">재무</option>
						<option value="광고">광고</option>
						<option value="영업">영업</option>
						<option value="인사">인사</option>
						<option value="기타">기타</option>
					</c:if>
					<c:if test="${data.jobid=='재무'}">
						<option value="마케팅">마케팅</option>
						<option selected="selected" value="재무">재무</option>
						<option value="광고">광고</option>
						<option value="영업">영업</option>
						<option value="인사">인사</option>
						<option value="기타">기타</option>
					</c:if>
					<c:if test="${data.jobid=='광고'}">
						<option value="마케팅">마케팅</option>
						<option value="재무">재무</option>
						<option selected="selected" value="광고">광고</option>
						<option value="영업">영업</option>
						<option value="인사">인사</option>
						<option value="기타">기타</option>
					</c:if>
					<c:if test="${data.jobid=='영업'}">
						<option value="마케팅">마케팅</option>
						<option value="재무">재무</option>
						<option value="광고">광고</option>
						<option selected="selected" value="영업">영업</option>
						<option value="인사">인사</option>
						<option value="기타">기타</option>
					</c:if>
					<c:if test="${data.jobid=='인사'}">
						<option value="마케팅">마케팅</option>
						<option value="재무">재무</option>
						<option value="광고">광고</option>
						<option value="영업">영업</option>
						<option selected="selected" value="인사">인사</option>
						<option value="기타">기타</option>
					</c:if>
					<c:if test="${data.jobid=='기타'}">
						<option value="마케팅">마케팅</option>
						<option value="재무">재무</option>
						<option value="광고">광고</option>
						<option value="영업">영업</option>
						<option value="인사">인사</option>
						<option selected="selected" value="기타">기타</option>
					</c:if>
				</select>
			</td>
		</tr>
		<tr>
			<td class="heading" width="30%">직무(기타)</td>
			<td class="content" width="70%"><input type="text"  name="jobid_etc" value="${data.jobid_etc}"/></td>
		</tr>
		<tr>
			<td class="heading" width="30%">산업</td>
			<td class="content" width="70%">
				<select id="industry" name="industry">
					<c:if test="${data.industry=='뷰티'}">
					<option selected="selected" value="뷰티">뷰티</option>
					<option value="유통">유통</option>
					<option value="광고">광고</option>
					<option value="자동차">자동차</option>
					<option value="식품">식품</option>
					<option value="아이티">IT</option>
					<option value="기타">기타</option>
					</c:if>
					<c:if test="${data.industry=='유통'}">
					<option value="뷰티">뷰티</option>
					<option selected="selected" value="유통">유통</option>
					<option value="광고">광고</option>
					<option value="자동차">자동차</option>
					<option value="식품">식품</option>
					<option value="아이티">IT</option>
					<option value="기타">기타</option>
					</c:if>
					<c:if test="${data.industry=='광고'}">
					<option value="뷰티">뷰티</option>
					<option value="유통">유통</option>
					<option selected="selected" value="광고">광고</option>
					<option value="자동차">자동차</option>
					<option value="식품">식품</option>
					<option value="아이티">IT</option>
					<option value="기타">기타</option>
					</c:if>
					<c:if test="${data.industry=='자동차'}">
					<option value="뷰티">뷰티</option>
					<option value="유통">유통</option>
					<option value="광고">광고</option>
					<option selected="selected" value="자동차">자동차</option>
					<option value="식품">식품</option>
					<option value="아이티">IT</option>
					<option value="기타">기타</option>
					</c:if>
					<c:if test="${data.industry=='식품'}">
					<option value="뷰티">뷰티</option>
					<option value="유통">유통</option>
					<option value="광고">광고</option>
					<option value="자동차">자동차</option>
					<option selected="selected" value="식품">식품</option>
					<option value="아이티">IT</option>
					<option value="기타">기타</option>
					</c:if>
					<c:if test="${data.industry=='아이티'}">
					<option value="뷰티">뷰티</option>
					<option value="유통">유통</option>
					<option value="광고">광고</option>
					<option value="자동차">자동차</option>
					<option value="식품">식품</option>
					<option selected="selected" value="아이티">IT</option>
					<option value="기타">기타</option>
					</c:if>
					<c:if test="${data.industry=='기타'}">
					<option value="뷰티">뷰티</option>
					<option value="유통">유통</option>
					<option value="광고">광고</option>
					<option value="자동차">자동차</option>
					<option value="식품">식품</option>
					<option value="아이티">IT</option>
					<option selected="selected" value="기타">기타</option>
					</c:if>
				</select>
			</td>
		</tr>
		<tr>
			<td class="heading" width="30%">산업(기타)</td>
			<td class="content" width="70%"><input type="text"  name="industry_etc" value="${data.industry_etc}"/></td>
		</tr>
		<tr>
			<td class="heading" width="30%">활동상태</td>
			<c:if test="${data.active==1}">
			<td class="content" width="70%">
				<select name="active">
					<option value="1" selected="selected">활동</option>
					<option value="0">미활동</option>
				</select>
			</td>
			</c:if>
			<c:if test="${data.active==0}">
			<td class="content" width="70%">
				<select name="active">
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
				<select name="position">
					<option value="p" selected="selected">회장</option>
					<option value="v">부회장</option>
					<option value="m">회원</option>
				</select>
			</td>
			</c:if>
			<c:if test="${data.position=='v'}">
			<td class="content" width="70%">
				<select name="position">
					<option value="p">회장</option>
					<option value="v" selected="selected">부회장</option>
					<option value="m">회원</option>
				</select>
			</td>
			</c:if>
			<c:if test="${data.position=='m'}">
			<td class="content" width="70%">
				<select name="position">
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
				<select name="rights">
					<option value="y" selected="selected">관리자</option>
					<option value="n">일반회원</option>
				</select>
			</td>
			</c:if>
			<c:if test="${data.rights=='n'}">
			<td class="content" width="70%">
				<select name="rights">
					<option value="y">관리자</option>
					<option value="n" selected="selected">일반회원</option>
				</select>
			</td>
			</c:if>
		<tr>
			<td style="border: none;"></td>
			<td style="border: none;" class="text-right">
				<button type="reset" class="btn btn-danger">다시작성</button>
				<button type="submit" class="btn btn-info">회원정보 수정</button>
			</td>
		</tr>
	</table>
	</form>
</div>