<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../header.jsp" %>
<link href="/resources/css/store-main.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" >
<style>
.container {
	background: white;
	color: black;
}
</style>
<div class="container">
	<h2>매장 리스트</h2>
	<button id="registerBtn">신규 매장 등록</button><p>
	
	<!-- Store List -->
	<div class="content">
		<table class="table">
		<thead>
			<tr>
				<th>NO</th>
				<th>지점명</th>
				<th>주소</Sth>
				<th>연락처</th>
				<th>상세정보</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="store">
			<tr>
				<td><c:out value="${store.sno}" /></td>
				<td><c:out value="${store.sname}" /></td>
				<td><c:out value="${store.addr}" /></td>
				<td><c:out value="${store.tel}" /></td>
				<td><a href="${store.sno}" class="target">
					<button type="button" id="detail">
					<img src="http://www.caffe-pascucci.co.kr/lib/images/contents/ic_detail_info.png"></button></a></td>
			</tr>
			</c:forEach>
		</tbody>
		</table><hr>
	</div>
	
	<!-- paging -->
	<div class="paging">
		<ul class="pagination list"></ul>
	</div>

	<form id="listForm" action="/store/list" method="get">
		<input type="hidden" name="sno">
		<input type="hidden" name="page" value="${criteria.page}">
		<input type="hidden" name="size" value="${criteria.size}">
	</form>
	<form id="registerForm" action="/store/register" method="get">
		<input type="hidden" name="page" value="${criteria.page}">
		<input type="hidden" name="size" value="${criteria.size}">
	</form>
</div>

<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
<script src="/resources/js/pagination.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<script>
$(document).ready(function() {
	
	var listForm = $("#listForm");
	var str = "";
	var pageResult = makePage({page:${criteria.page}, total:${total}, size:${criteria.size}});
	
	// 신규 매장 등록
	$("#registerBtn").on("click", function() {
		$("#registerForm").submit();
	});
	
	// 매장 상세 정보
	$(".target").on("click", function(e) {
    	e.preventDefault();
    	
    	var sno = $(this).attr("href");
    	
    	listForm.find("input[name='sno']").val(sno);
    	listForm.attr("action", "/store/detail").submit();
    });
	
	// 페이징 처리
	$(".list").on("click", "li > a", function(e) {
		e.preventDefault();
		
		var pageNum = $(this).attr("href");
		
		listForm.find("input[name='page']").val(pageNum);
		listForm.submit();
	});
	
	if(pageResult.prev) {
		str += "<li><a class='page-link prev' href=" + (parseInt(pageResult.first) - 1) + ">prev </a></li>";
	}
	
	for(var i = pageResult.first; i <= pageResult.last; i++) {
		str += "<li " + (pageResult.page == i ? "class='active'" : "")
			 + "><a class='page-link' href=" + i + ">" + i + "</a></li>";
	}
	
	if(pageResult.next) {
		str += "<li><a class='page-link next' href=" + (parseInt(pageResult.last) + 1) + ">next </a></li>";
	}
	
	$(".list").html(str);
});
</script>
<%@ include file="../footer.jsp" %>