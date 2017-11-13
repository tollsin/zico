<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>매장 등록</title>
<link href="/resources/css/store-form.css" rel="stylesheet">
</head>
<body>
<div class="container">
	<h2>신규 매장 등록</h2>
	<form role="form" method="post">
		<div class="form-group">
			<label>지점명</label>
			<input type="text" name="sname">
		</div>
		<div class="form-group">
			<label>주소</label>
			<input type="text" name="addr">
		</div>
		<div class="form-group">
			<label>연락처</label>
			<input type="text" name="tel">
		</div>
		<div class="form-group">
			<label>위도</label>
			<input type="text" name="lat">
			<label>경도</label>
			<input type="text" name="lng">
		</div>
		<div class="form-group">
			<label>상세정보</label>
			<textarea rows="3" name="sinfo"></textarea>
		</div><p>
		
		<button type="button" id="listBtn">목록으로</button>
		<button type="submit" class="btn btn-default">매장등록</button>
	</form>
	
	<form id="listForm" action="/store/list" method="get">
		<input type="hidden" name="page" value="${criteria.page}">
		<input type="hidden" name="size" value="${criteria.size}">
	</form>
</div>

<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
  	
<script>
	$(document).ready(function() {
		$("#listBtn").on("click", function() {
			$("#listForm").submit();
		});
	});
</script>
</body>
</html>