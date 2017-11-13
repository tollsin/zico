<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<form class="acform" action="/menu/dessertlist" method="get">
		<input type="hidden" name="page" value="${criteria.page}"> 
		<input type="hidden" name="size" value="${criteria.size}">
	</form>
	<div>
		<form class="container" method="post" enctype="multipart/form-data"
			target="zero">
			<div class="form-group">
				<label for="usr">메뉴이름:</label> <input type="text" name="mname"
					 required>
			</div>
			<div class="form-group">
				<label for="usr">가격:</label> <input name="mprice" type="text"
					name="mprice"  required>
			</div>
			<div class="form-group">
				<label>카테고리:</label> <label class="radio-inline"> <input
					type="radio" name="category" value="Coffee"> coffee
				</label> <label class="radio-inline"> <input type="radio"
					name="category" value="Dessert"> dessert
				</label>
			</div>
			
			<div class="form-group">
				<label>사이즈:</label> <label class="radio-inline"> <input
					type="radio" name="msize" value="Short">Short
				</label> <label class="radio-inline"> <input type="radio"
					name="msize" value="Grande"> Grande
				</label> <label class="radio-inline"> <input type="radio"
					name="msize" value="Venti"> Venti
				</label>
			</div>
			<div class="form-group">
				<label for="usr">사진등록:</label> <input type="hidden" name="imgsize"
					value="${criteria.size}"> <input type="file" name="f1">
			</div>
			
			<div class="form-group">
				<label for="comment">메뉴정보:</label>
				<textarea class="form-control" rows="5" name="minfo" id="comment" required></textarea>
			</div>
			<button class="btn btn-default" type="submit">등록</button>
			<button type="button" class="btn btn-default listBtn">목록으로</button>
		</form>
	</div>
	
 	
	
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
		
		<script type="text/javascript">
		
		$(document).ready(function() {
			
			var actionForm = $(".acform");
			
			$(".listBtn").click(function() {
// 				console.log(actionForm.children("input:nth-child(1)").val());
// 				console.log(actionForm.children("input:nth-child(2)").val());
				actionForm.submit();
			})
		});
	
</script>
<%@ include file="../footer.jsp" %>