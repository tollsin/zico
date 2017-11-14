<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	body { background-color: white; }
	h2 { font-size: 30px; font-weight: 500; }
</style>
<link href="/resources/css/store-form.css" rel="stylesheet">

<div class="container">
	<h2>매장 정보 수정</h2>
	<form role="form" method="post">
		<div class="form-group">
			<label>지점명</label>
			<input type="text" name="sname" value="${store.sname}">
		</div>
		<div class="form-group">
			<label>주소</label>
			<input type="text" name="addr" value="${store.addr}">
		</div>
		<div class="form-group">
			<label>연락처</label>
			<input type="text" name="tel" value="${store.tel}">
		</div>
		<div class="form-gruop">
			<label>위도</label>
			<input type="text" name="lat" value="${store.lat}">
			<label>경도</label>
			<input type="text" name="lng" value="${store.lng}">
		</div>
		<div class="form-group">
			<label>상세정보</label>
			<textarea rows="3" name="sinfo">"${store.sinfo}</textarea>
		</div><p>
		
		<input type="hidden" name="sno" value="${store.sno}">
		<input type="hidden" name="page" value="${cri.page}">
		<input type="hidden" name="size" value="${cri.size}">
		
		<button type="button" id="listBtn">목록으로</button>
		<button type="submit" id="modBtn">수정</button>
		<button type="submit" id="delBtn">삭제</button>
	</form>
	
	<form id="listForm" action="/store/list" method="get">
		<input type="hidden" name="page" value="${cri.page}">
		<input type="hidden" name="size" value="${cri.size}">
	</form>
</div>

<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
  
<script>
	$(document).ready(function() {
		
		$("#delBtn").on("click", function() {	// 매장삭제 후 목록페이지로..
			$("form[role='form']").attr("action", "/store/remove").submit();
		});
		
		$("#listBtn").on("click", function() {	// 목록페이지로..
			$("#listForm").submit();
		});
		
	});
	
</script>
<%@ include file="../footer.jsp" %>