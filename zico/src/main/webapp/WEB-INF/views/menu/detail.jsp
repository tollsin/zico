<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


<section class="content gallery pad1"><div class="ic">More Website Templates @ TemplateMonster.com - July 30, 2014!</div>
	<div class="container">
		<h1 class="cType">${menu.category}</h1>
	</div>
	<div class="container">
		<div class="form-group">
			<img src="display?name=s_${menu.imgname}" height="40%" width="40%"
				style="float: left;">

		</div>
		<div class="form-group">
			<h2>${menu.mname}</h2>
		</div>
		<hr style="border: solid; 8px; black; ">
		<div>
			<h2>${menu.minfo}</h2>
		</div>
		<div>
			<h2>${menu.mprice}원</h2>
		</div>
		<form>
			<input type="text" class="count">
			<button class="orderBtn">장바구니</button>
		</form>
		<button type="button" class="btn btn-default modBtn">수정</button>
	<button type="button" class="btn deleteBtn">삭제</button>
	<button type="button" class="btn btn-default listBtn">목록으로</button>


	</div>
	
</section>

	

	<form id="actionForm" action="/menu/coffeelist" method="get">
		<input type="hidden" name="menuno" value="${menu.menuno}"> 
		<input type="hidden" name="page" value="${cri.page}"> 
		<input type="hidden" name="size" value="${cri.size}">
	</form>
	
	<form id="actionForm1" action="/menu/delete" method="get">
		<input type="hidden" name="menuno" value="${menu.menuno}"> 
		
	</form>
	<form id="actionForm2" action="/menu/update" method="get">
		<input type="hidden" name="menuno" value="${menu.menuno}"> 
		<input type="hidden" name="page" value="${cri.page}"> 
		<input type="hidden" name="size" value="${cri.size}">
		<input type="hidden" name="mname" value="${menu.mname}">
		<input type="hidden" name="minfo" value="${menu.minfo}">
		<input type="hidden" name="imgname" value="s_${menu.imgname}">
		 
	</form>

	
	
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>
	<script src="/resources/js/order.js" ></script>
	<script type="text/javascript">
		$(document).ready(function() {

			var actionForm = $("#actionForm");
			var actionForm1 = $("#actionForm1");
			var actionForm2 = $("#actionForm2");
			
			
			$(".orderBtn").click(function(e){
				e.preventDefault();
				var cCnt=$(".count").val();
				var cType="${menu.category}";
				var cMenu="${menu.mname}";
				var cPrice="${menu.mprice}";				
				console.log(cCnt);
				console.log(cType);
				console.log(cPrice);
				console.log(cMenu);				
				setCookie("order",cType,cMenu,cPrice,cCnt);	
				$(".count").val("");
			});
			
			$(".deleteBtn").click(function() {
				actionForm1.submit();
			})

			$(".listBtn").click(function() {
				actionForm.submit();
			})
			
			$(".modBtn").click(function() {
				actionForm2.submit();
			})
		
			
			
			

			
			
			
			
		});
		
	</script>
<%@ include file="../footer.jsp" %>