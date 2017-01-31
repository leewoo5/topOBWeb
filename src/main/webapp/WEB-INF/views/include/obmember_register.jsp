<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div id="memberResisterForm">
	 <div class="container-fluid">
		<div class="row">
			<form class="form-horizontal" action="/obmember/formPost" role="form" method="post">
				<div class="panel panel-default" style="border: 1px solid #bfbfbf;">
					<div class="panel-heading text-center" style="background-color: #bfbfbf;">
						OB 회원가입
					</div>
					<div class="panel-body" style="padding-top:30px;">
						<div class="form-group">
							<label for="id" class="col-sm-4 control-label"> 아이디 <br> <small class="text-danger">(필수입력)</small> </label>
							<div class="col-sm-6">
								<input id="uid" name="uid" type="text" class="form-control" placeholder="학번입력" />
							</div>
						</div>
						<div class="form-group">
							<label for="upw" class="col-sm-4 control-label"> 비밀번호 <br> <small class="text-danger">(필수입력)</small> </label>
							<div class="col-sm-6">
								<input id="upw" name="upw" type="password" class="form-control" placeholder="Password">
							</div>
						</div>
						<div class="form-group">
							<label for="upw" class="col-sm-4 control-label"> 비밀번호 확인 <br> <small class="text-danger">(필수입력)</small> </label>
							<div class="col-sm-6">
								<input id="upwCheck" name="upwCheck" type="password" class="form-control" placeholder="Password (재입력)">
							</div>
							<c:if test="${not empty pwError}">
								<script>
									alert("${pwError.msg}");
								</script>
							</c:if>
						</div>
						<div class="form-group joinForm-name">
							<label for="name" class="col-sm-4 control-label"> 이름 <br> <small class="text-danger">(필수입력)</small> </label>
							<div class="col-sm-6">
								<input id="name" name="name" type="text" class="form-control" placeholder="홍길동" required="required">
							</div>
						</div>
						<div class="form-group">
							<label for="gender" class="col-sm-4 control-label"> 성별 <br> <small class="text-danger">(필수입력)</small>  </label>
							<div class="col-sm-6">
								<select name="gender" class="form-control">
									<option value="남">남</option>
									<option value="여">여</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="email" class="col-sm-4 control-label"> 이메일  주소 <br> <small class="text-danger">(필수입력)</small> </label>
							<div class="col-sm-6">
								<input id="email" name="email" type="email" class="form-control" placeholder="이메일 주소" required="required">
							</div>
						</div>
   						<div class="form-group">
							<label for="birthday" class="col-sm-4 control-label"> 생년월일 <br> <small class="text-danger">(필수입력)</small>  </label>
							<div class="col-sm-6">
								<input id="birthday" name="birthday" type="text" class="form-control" placeholder="1900-01-11" required="required"  style="cursor:pointer;">
							</div>
						</div>
   						<div class="form-group">
							<label for="phone" class="col-sm-4 control-label"> 연락처 <br> <small class="text-danger">(필수입력)</small>  </label>
							<div class="col-sm-6">
								<input id="phone" name="phone" type="text" class="form-control" placeholder="010-0000-0000" required="required">
							</div>
						</div>
						<div class="form-group">
							<label for="stage" class="col-sm-4 control-label"> 기수 <br> <small class="text-danger">(필수입력)</small>  </label>
							<div class="col-sm-6">
								<input id="stage" name="stage" type="text" class="form-control" placeholder="예: 01" required="required">
							</div>
						</div>
						<div class="form-group">
							<label for="addr" class="col-sm-4 control-label"> 주소 <br> <small class="text-danger">(필수입력)</small>  </label>
							<div class="col-sm-6">
								<input id="addr" name="address" type="text" class="form-control" placeholder="" required="required">
							</div>
						</div>
						<div class="form-group">
							<label for="major" class="col-sm-4 control-label"> 전공 <br> <small class="text-danger">(필수입력)</small>  </label>
							<div class="col-sm-6">
								<input id="major" name="major" type="text" class="form-control" placeholder="예: 경영학과" required="required">
							</div>
						</div>
						<div class="form-group">
							<label for="job" class="col-sm-4 control-label"> 직무 <br> <small class="text-danger">(필수입력)</small>  </label>
							<div class="col-sm-6">
								<select id="jobid" name="jobid">
									<option value="마케팅">마케팅</option>
									<option value="재무">재무</option>
									<option value="광고">광고</option>
									<option value="영업">영업</option>
									<option value="인사">인사</option>
									<option value="기타">기타</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="job" class="col-sm-4 control-label"> 직무(기타)</label>
							<div class="col-sm-6">
								<input id="jobid_etc" name="jobid_etc" type="text" class="form-control" placeholder="직무선택이 기타일 경우만 입력">
							</div>
						</div>
						<div class="form-group">
							<label for="job" class="col-sm-4 control-label"> 산업 <br> <small class="text-danger">(필수입력)</small>  </label>
							<div class="col-sm-6">
								<select id="industry" name="industry">
									<option value="뷰티">뷰티</option>
									<option value="유통">유통</option>
									<option value="광고">광고</option>
									<option value="자동차">자동차</option>
									<option value="식품">식품</option>
									<option value="아이티">IT</option>
									<option value="기타">기타</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="job" class="col-sm-4 control-label"> 산업(기타)</label>
							<div class="col-sm-6">
								<input id="industry_etc" name="industry_etc" type="text" class="form-control" placeholder="산업선택이 기타일 경우만 입력">
							</div>
						</div>
					</div><!-- panel body -->
					<div class="panel-footer" style="background-color: #bfbfbf;">
						<div class="form-group" style="padding-top: 10px">
							<div class="col-sm-offset-3 col-sm-6">
								<button type="submit" class="btn btn-lg btn-primary btn-block">회원가입</button>
							</div>
						</div>						
					</div>
				</div>
			</form>	
	</div> 
	</div>
	
</div>