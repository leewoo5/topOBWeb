<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div id="wrapper">
	<div class="box-body" id="register" style="margin-bottom: 30px;">
		<div class="form-group text-center">
			<h2 style="margin-bottom: 30px;">공지사항 보기</h2>
		</div>
		<div class="form-group">
			<label style="border: black;">등록일</label> <input id="datePrint"
				type="text" value="${data.regdate}" class="form-control"
				readonly="readonly" />
		</div>
		<div class="form-group">
			<label>제목</label> <input type="text" value="${data.title}"
				class="form-control" readonly="readonly" />
		</div>
		<div class="form-group">
			<label>내용</label>
			<textarea class="form-control" rows="15" readonly="readonly">${data.content}</textarea>
		</div>
	</div>
	<c:if test="${sessionScope.login.rights=='y'}">
		<div class="box-footer text-right">
			<button id="delete" type="button" class="btn btn-danger">삭제</button>
			<script>
					$("#delete").on("click",function(event){
						self.location = "delete" + "?bno=" + ${data.bno}
					});
			</script>
			<button id="update" type="submit" class="btn btn-info">수정</button>
			<script>
					$("#update").on("click",function(event){
						self.location = "update" + "?bno=" + ${data.bno}
					});
			</script>
		</div>
	</c:if>
<!-- 댓글입력 -->
	<div class="row" style="margin-bottom:30px;">
		<div class="col-md-12">
			<div class="box box-success">
				<div class="box-header">
					<h3 class="box-title">댓글작성</h3>
				</div>
				<div class="box-body">
					<input id="newReplyWriter" style="border:1px solid #a6a6a6;" class="form-control" type="text" readonly="readonly"
					 value="${sessionScope.login.name}"/>
					<textarea id="newReplyText" style="border: 1px solid #a6a6a6;" placeholder="댓글을 입력하세요" class="form-control" rows="2"></textarea>
				</div>
				<div class="box-footer pull-right" style="padding-top:10px; padding-bottom:10px;">
					<button id="replyAddBtn" type="submit" class="btn btn-primary">댓글추가</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 댓글 목록 -->
	<ul id="replyList" style="list-style: none;" class="list">
		<li class="btn btn-info" id="repliesDiv">댓글목록 보기</li>
	</ul>
	<div class="text-center">
		<ul id="pagination" class="pagination">
		</ul>
	</div>
	<!-- 댓글수정 Modal-->
	<div id="modifyModal" class="modal modal-primary fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 style="visibility: hidden;" class="modal-title"></h4>
				</div>
				<div class="modal-body" data-rno>
					<p><input type="text" id="replytext" class="form-control" placeholder="수정할 내용을 입력하세요"/></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" id="replyDelBtn">삭제</button>
					<button type="button" class="btn btn-info" id="replyModBtn">수정</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	
</div>
<script type="text/javascript">
//댓글추가 버튼
$("#replyAddBtn").on("click",function(){
	var replyerObj = $("#newReplyWriter");
	var replytextObj = $("#newReplyText");
	var replyer = replyerObj.val();
	var replytext = replytextObj.val();
	
	$.ajax({
		type:'post',
		url:'/obnotice_reply/insert',
		headers: {
			"Content-Type": "application/json",
			"X-HTTP-Method-Override": "POST"},
		dataType:'text',
		data: JSON.stringify({bno:bno, replyer:replyer, replytext:replytext}),
		success:function(result){
			console.log("result: " + result);
			if(result == 'SUCCESS'){
			alert("댓글이 등록되었습니다.");
			replyPage =1;
			getPage("/obnotice_reply/"+bno+"/"+replyPage);
			replyerObj.val("");
			replytextObj.val("");
		}
	}});
});
//댓글 목록 보기 버튼
$("#repliesDiv").on("click", function(){
	if ($(".list li").size > 1){
		return;
	}
	getPage("/obnotice_reply/"+bno+"/1");
});
//댓글 받아오기
var bno = ${data.bno};
var replyPage = 1;

function getPage(pageInfo){
	$.getJSON(pageInfo,function(data){
		printData(data.list);
		printPaging(data.pageMaker, $(".pagination"));
	});
}
//댓글 리스트 출력
var printData = function (data){
	var result = "";
	var date = "";
	var writer = "";
	var user = '${sessionScope.login.name}';
	for ( var i in data) {
		date = data[i].regdate;
		date = transTime(date); 
		result +=
		"<li class='replyLi' style='margin-bottom:10px;'data-rno='"+data[i].rno+"'>"+ 
			"<label id='writer'>"+data[i].replyer+"<span style='margin-left:10px;font-size:8px;'>"+date+"</span>"+"</label>"
		if (user == data[i].replyer) {
		result +=	
			"<button id='modifyBtn' style='display: inline-block;font-size:10px;padding:5 12 5 12;' class='modify pull-right' data-toggle='modal' data-target='#modifyModal'>"+"수정"+"</button>"
		}
		
		result += "<textarea class='text' style='border:1px solid #a6a6a6;'>"+data[i].replytext+"</textarea>"
	   +"</li>";
	}
   $("#replyList").html(result);
};

//댓글 시간 포맷팅
function transTime(time){
	return time.substring(0,16);
}
//페이지 이동
$(".pagination").on("click", "li a", function(event){
	event.preventDefault();
	replyPage = $(this).attr("href");
	getPage("/obnotice_reply/"+bno+"/"+replyPage);
});
//페이징
var printPaging = function(pageMaker, target){
	var str = "";
	if(pageMaker.prev){
		str += "<li><a href='"+(pageMaker.startPage-1)+"'> << </a></li>";
	}
	for(var i=pageMaker.startPage, len = pageMaker.endPage; i <= len; i++){
		var strClass= pageMaker.cri.page == i?'class=active':'';
		str += "<li "+strClass+"><a href = '"+i+"'>"+i+"</a></li>"
	}
	if(pageMaker.next){
		str += "<li><a href='"+(pageMaker.endPage+1)+"'> >> </a></li>";
	}
	target.html(str);
};

//댓글에있는 수정버튼 클릭시
$(".list").on("click",".replyLi", function(event){
	var reply = $(this);
	$("#replytext").val(reply.find('.text').text());
	$(".modal-title").html(reply.attr("data-rno"));
});

//댓글 수정처리
$("#replyModBtn").on("click",function(){
	var rno = $(".modal-title").html();
	var replytext = $("#replytext").val();
	
	$.ajax({
		type:'put',
		url:'/obnotice_reply/'+rno,
		headers: {
			"Content-Type":"application/json",
			"X-Http-Method-Override":"PUT"
		},
	data:JSON.stringify({replytext:replytext}),
	dataType:'text',
	success:function(result){
		if(result == 'SUCCESS'){
			alert("수정되었습니다.");
			getPage("/obnotice_reply/"+bno+"/"+replyPage);
			$("#modifyModal").modal("hide");
		}
	}
	});
		
});
//댓글 삭제처리
$("#replyDelBtn").on("click",function(){
	var rno = $(".modal-title").html();
	var replytext = $("#replytext").val();
	
	$.ajax({
		type:'delete',
		url:'/obnotice_reply/'+rno,
		headers: {
			"Content-Type":"application/json",
			"X-Http-Method-Override":"DELETE"
		},
	dataType:'text',
	success:function(result){
		if(result == 'SUCCESS'){
			alert("삭제되었습니다.");
			getPage("/obnotice_reply/"+bno+"/"+replyPage);
			$("#modifyModal").modal("hide");
		}
	}
	});
		
});
</script>












