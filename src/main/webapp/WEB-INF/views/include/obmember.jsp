<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div id="wrapper">
	<h3>회원명단 조회</h3>
	<div id="searchBox" style="margin-bottom:10px;">
		<input id="keywordInput" name="keyword" type="text" style="width:150px;" placeholder="검색어를 입력하세요"/>
		<button id="searchBtn" type="submit" style="background-color: white; height: 25px;"><i class="fa fa-search" aria-hidden="true"></i></button>
	</div>
	<script>
		$("#searchBtn").on('click', function(event){
			self.location = "listAll" 		
						  + '${pageMaker.makeQuery(1)}'
						  + '&keyword='
						  + $('#keywordInput').val()
		});
	</script>
	<table id="memberOverview" style="width: 100%; margin-bottom: 30px;">
		<tr>
			<th class="heading" width="20%">총 인원</th>
			<th class="heading" width="20%">경영학과</th>
			<th class="heading" width="20%">기타학과</th>
			<th class="heading" width="10%">남성</th>
			<th class="heading" width="10%">여성</th>
		</tr>
		<tr>
			<c:if test="${empty overview}">
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			</c:if>
			<c:if test="${not empty overview}">
			<td>${overview.members}명</td>
			<td>${overview.business}명</td>
			<td>${overview.etc}명</td>
			<td>${overview.male}명</td>
			<td>${overview.femail}명</td>
			</c:if>
		</tr>
	</table>
	<table id="managerList" style="width: 100%; margin-bottom: 30px;">
		<tr>
			<th class="heading" width="20%">직책</th>
			<th class="heading" width="20%">이름</th>
			<th class="heading" width="20%">연락처</th>
		</tr>
		<c:if test="${empty manager}">
		<tr>
			<td width="20%"></th>
			<td width="20%"></th>
			<td width="20%"></th>
		</tr>
		<tr>
			<td width="20%"></th>
			<td width="20%"></th>
			<td width="20%"></th>
		</tr>
		</c:if>
		<c:if test="${not empty manager}">
		<tr>
			<td width="20%">회장</th>
			<td width="20%">${manager.presidentName} ${manager.presidentStage}</th>
			<td width="20%">${manager.presidentPhone}</th>
		</tr>
		<tr>
			<td width="20%">부회장</th>
			<td width="20%">${manager.vicePresidentName} ${manager.vicePresidentStage}</th>
			<td width="20%">${manager.vicePresidentPhone}</th>
		</tr>
		</c:if>
	</table>
	<div style="margin-bottom:70px;">
		<h4 style="padding:10px;">직무 별 회원분포</h4>
		<div id="chart_d1"></div>
		<script>
			 var options = ${job};
			Nwagon.chart(options);
		</script>
		<h4 style="padding:10px;">산업 별 회원분포</h4>
		<div id="chart_d2"></div>
		<script>
			 var options = ${industry};
			Nwagon.chart(options);
		</script>
	</div>
	<p style="width: 100%;">이름을 클릭하면 상세정보를 볼 수 있습니다.</p>
	<table id="memberList" style="width: 100%;">
		<tr>
			<th class="heading" width="10%">이름</th>
			<th class="heading" width="20%">학과</th>
			<th class="heading" width="10%">기수</th>
		</tr>
		<c:if test="${empty list}">
		<tr>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		</c:if>
		<c:if test="${not empty list}">
		<c:forEach items="${list}" var="list">
			<tr>
				<td><a style=" color: black; text-decoration: none; font-weight: bold;" href="/obmember/memberInfo?uid=${list.uid}" style="text-decoration: none;">${list.name}</a></td>
				<td>${list.major}</td>
				<td>${list.stage}</td>
			</tr>
		</c:forEach>
		</c:if>
	</table>
	<div id="paging" class="text-center">
		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
				<li><a href="/obmember/listAll${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
				<li
					<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
					<a href="/obmember/listAll${pageMaker.makeSearch(idx)}">${idx}</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a href="/obmember/listAll${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
</div>
