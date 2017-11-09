<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<label>카테고리</label> <input type="text" name="category"
			value="${menu.category}" readonly="readonly">
	</div>
	<div>
		<label>메뉴이름</label> <input type="text" name="mname"
			value="${menu.mname}" readonly="readonly">
	</div>
	<div>
		<label>메뉴종류</label> <input type="text" name="minfo"
			value="${menu.minfo}" readonly="readonly">
	</div>
	<div>
		<label>이미지 경로</label> <input type="text" name="imgpath"
			value="${menu.imgpath}" readonly="readonly">
	</div>
	<div>
		<label>가격</label> <input type="text" name="mprice"
			value="${menu.mprice}" readonly="readonly">
	</div>

	<button type="button" class="btn btn-default modBtn">수정</button>
	<button type="button" class="btn deleteBtn">삭제</button>
	<button type="button" class="btn btn-default listBtn">목록으로</button>

	<form id="actionForm" action="/menu/coffeelist" method="get">
		<input type="hidden" name="menuno" value="${menu.menuno}"> 
		<input type="hidden" name="page" value="${cri.page}"> 
		<input type="hidden" name="size" value="${cri.size}">
	</form>
	
	<form id="actionForm1" action="/menu/delete" method="get">
		<input type="hidden" name="menuno" value="${menu.menuno}"> 
	
	</form>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>

	<script type="text/javascript">
		$(document).ready(function() {

			var actionForm = $("#actionForm");
			var actionForm1 = $("#actionForm1");

			$(".deleteBtn").click(function() {
				actionForm1.submit();
			})

			$(".listBtn").click(function() {
				actionForm.submit();
			})
		});
	</script>
</body>
</html>