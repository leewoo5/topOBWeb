<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div id="wrapper">
	<div id="financeMenu" style="margin-bottom:30px;">
		<h3>수입지출 내역</h3>
		<div id="searchBox" style="margin-top:30px; margin-bottom:10px;">
			<div style="margin-bottom:10px;">
				<input type="date" name="startDate" id="startDate" />
				<span>-</span>
				<input type="date" name="endDate" id="endDate" />
			</div>
			<input id="keywordInput" name="keyword" type="text" style="width:150px;" placeholder="검색어를 입력하세요"/>
			<button id="searchBtn" type="submit" style="background-color: white; height: 25px;"><i class="fa fa-search" aria-hidden="true"></i></button>
			<script>
				$("#searchBtn").on('click', function(event){
					self.location = "listAll" 		
								  + '${pageMaker.makeQuery(1)}'
								  + '&keyword='
								  + $('#keywordInput').val()
								  + '&startDate='
								  + $('#startDate').val()
								  + '&endDate='
								  + $('#endDate').val();
				});
			</script>
			<button id="register" style="background-color: white; height: 25px; margin-left:10px;"><i class="fa fa-plus-circle" aria-hidden="true"></i> 등록</button>
			<script>
				$("#register").on('click', function(event){
					location = "/obfinance/register_incomeExpense" 		
				});
			</script>
		</div>
	</div>
	<div>
		<h4>수입/지출 차트</h4>
		<div id="chart_d"></div>
		<script>
			 var options = ${graph};
			Nwagon.chart(options);
		</script>
	</div>
	<p style="width: 100%;">항목을 클릭하면 상세정보를 볼 수 있습니다.</p>
	<table id="financeBoard" style="width: 100%;">
		<tr>
			<th class="text-center heading" width="20%">항목</th>
			<th class="text-center heading" width="20%">일자</th>
			<th class="text-center heading" width="10%">구분</th>
			<th class="text-center heading" width="20%">금액</th>
			<c:if test="${sessionScope.login.rights=='y'}">
			<th class="text-center heading" width="15%">수정/삭제</th>
			</c:if>
		</tr>
		<c:if test="${empty list}">
			<tr>
				<td class="text-center"></td>
				<td class="text-center"></td>
				<td class="text-center"></td>
				<td class="text-center"></td>
				<c:if test="${sessionScope.login.rights=='y'}">
				<td class="text-center"></td>
				</c:if>
			</tr>
		</c:if>
		<c:if test="${not empty list}">
		<c:forEach items="${list}" var="list">
			<tr>
				<td class="text-center"><a style=" color: black; text-decoration: none; font-weight: bold;" href="/obfinance/incomeExpenseInfo?bno=${list.bno}">${list.title}</a></td>
				<td class="text-center">
					<fmt:formatDate value="${list.regdate}" pattern="YYYY-MM-DD"/>
				</td>
				<c:if test="${list.content=='수입'}">
				<td class="text-center" style="color: blue;">${list.content}</td>
				</c:if>
				<c:if test="${list.content=='지출'}">
				<td class="text-center" style="color: red;">${list.content}</td>
				</c:if>
				<td class="text-center">
					<fmt:formatNumber value="${list.money}" pattern="#,###,###" />
				</td>
				<c:if test="${sessionScope.login.rights=='y'}">
				<td>
					<a class="btn btn-info" style="margin:5px; font-size: 10px;" href="/obfinance/update_incomeExpense?bno=${list.bno}">수정</a>
					<a class="btn btn-danger" style="margin:5px; font-size: 10px;" href="/obfinance/delete_incomeExpense_check?bno=${list.bno}">삭제</a>
				</td>
				</c:if>
			</tr>
		</c:forEach>
		</c:if>
	</table>
	<table id="financeOverview" style="width: 100%; margin-top: 15px;">
		<tr>
			<td class="text-center" width="10%">수입</td>
			<td class="text-right" width="20%" style="padding-right: 15px;">${result.inputCount}건</td>
			<td class="text-right" width="20%" style="padding-right: 15px; color: blue;"><fmt:formatNumber
					value="${result.inputSum}" pattern="#,###,###" /></td>
			<td class="text-center" width="10%">지출</td>
			<td class="text-right" width="20%" style="padding-right: 15px;">${result.outputCount}건</td>
			<td class="text-right" width="20%" style="padding-right: 15px; color: red;"><fmt:formatNumber
					value="${result.outputSum}" pattern="#,###,###" /></td>
		</tr>
	</table>
	<div id="paging" class="text-center">
		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
				<li><a
					href="/obfinance/listAll${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="idx">
				<li
					<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
					<a href="/obfinance/listAll${pageMaker.makeSearch(idx)}">${idx}</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a
					href="/obfinance/listAll${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
</div>


