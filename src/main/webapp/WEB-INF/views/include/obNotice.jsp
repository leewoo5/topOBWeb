<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div id="wrapper">
	<h3>공지사항 게시판</h3>
	<div id="searchBox" style="margin-bottom:10px;">
		<input id="keywordInput" name="keyword" type="text" style="width:150px;" placeholder="검색어를 입력하세요"/>
		<button id="searchBtn" type="submit" style="background-color: white; height: 25px;"><i class="fa fa-search" aria-hidden="true"></i></button>
		<script>
			$("#searchBtn").on('click', function(event){
				self.location = "listAll" 		
							  + '${pageMaker.makeQuery(1)}'
							  + '&searchType='
							  + $("select option:selected").val()
							  + '&keyword='
							  + $('#keywordInput').val()
			});
		</script>
		<c:if test="${sessionScope.login.rights=='y'}">
		<button id="register" style="background-color: white;">글쓰기</button>
		<script>
			$("#register").on('click', function(event){
				location = "/obnotice/register" 		
			});
		</script>
		</c:if>
	</div>
	<table id="financeBoard" style="width: 100%;">
		<tr>
			<th class="text-center heading" width="30%">제목</th>
			<th class="text-center heading" width="10%">등록일</th>
			<th class="text-center heading" width="10%">조회수</th>
		</tr>
		<c:if test="${empty list}">
			<tr>
				<td class="text-center"></td>
				<td class="text-center"></td>
				<td class="text-center"></td>
			</tr>
		</c:if>
		<c:if test="${not empty list}">
		<c:forEach items="${list}" var="list">
			<tr>
				<td class="text-center"><a style=" color: black; text-decoration: none;" href="/obnotice/read?bno=${list.bno}">${list.title}</a></td>
				<td class="text-center">${list.regdate}</td>
				<td class="text-center">${list.viewcnt}</td>
			</tr>
		</c:forEach>
		</c:if>
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


