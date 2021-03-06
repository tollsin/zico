<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="../header.jsp" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<div>
	<form class="container" method="post" enctype="multipart/form-data">
	<div class="form-group">
				<label>카테고리:</label> <label class="radio-inline"> <input
					type="radio" name="category" value="Coffee" checked="checked"> coffee
				</label> <label class="radio-inline"> <input type="radio"
					name="category" value="Desert"> dessert
				</label>
			</div>
	<div class="form-group">
				<label for="usr">메뉴이름:</label> <input type="text" name="mname"
					 required value="${menu.mname}">
			</div>
	<div class="form-group">
				<label for="comment">메뉴정보:</label>
				<textarea class="form-control" rows="5" name="minfo" id="comment" required>${menu.minfo}</textarea>
			</div>
	
	<div class="form-group">
				<label for="usr">가격:</label> <input name="mprice" type="text"
					name="mprice" required value="${menu.mprice}">
			</div>
	<div class="form-group">
				<label>사이즈:</label> <label class="radio-inline"> <input
					type="radio" name="msize" value="Short" checked="checked">Short
				</label> <label class="radio-inline"> <input type="radio"
					name="msize" value="Grande"> Grande
				</label> <label class="radio-inline"> <input type="radio"
					name="msize" value="Venti"> Venti
				</label>
			</div>
	<div class="form-group">
		<label>이미지</label> <img src="display?name=s_${menu.imgname}">
	</div>
	<div class="form-group">
	<input type="file" name="f1" value="${menu.imgname}">
	</div>
	<input type="hidden" name="menuno" value="${menu.menuno}" >
	<button class="btn btn-default" type="submit">수정</button>
	<button type="button" class="btn btn-default listBtn">목록으로</button>
	</form>
	</div>
	<form id="actionForm" action="/menu/coffeelist" method="get">
		<input type="hidden" name="menuno" value="${menu.menuno}"> 
		<input type="hidden" name="page" value="${cri.page}"> 
		<input type="hidden" name="size" value="${cri.size}">
	</form>
	
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
		<script type="text/javascript">
		$(document).ready(function() {
			var actionForm = $("#actionForm");
			$(".listBtn").click(function() {
				actionForm.submit();
			})
		});
		
		</script>
<%@ include file="../footer.jsp" %>