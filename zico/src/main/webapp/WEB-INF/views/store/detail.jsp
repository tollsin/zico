<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link href="/resources/css/store-main.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" >

<style>
	#map { width: 700px; height: 400px; }
	button { color: white; }
</style>

<div class="container">
	<h2>매장상세정보</h2><hr>
	
	<!-- 매장 상세 정보 -->
	<div id="map"></div>

	<div class="info">
		<h2>${store.sname}</h2>
		<table class="table">
			<tr>
				<th>주소</th>
				<td>${store.addr}</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${store.tel}</td>
			</tr>
			<tr>
				<th>매장정보</th>
				<td>${store.sinfo}</td>
			</tr>
		</table><hr>
		
		<button id="listBtn">목록으로</button>
		<button id="modBtn">매장정보수정</button>
	</div><hr>
	
	<!-- 매장 리뷰 -->	
	<div class="panel">
		<div class="reviewHead">
			<label>작성자</label>
			<input type="text" placeholder="userID" id="reviewWriter" value="tester" readonly="readonly">
			<label>후기내용</label>
			<input type="text" placeholder="reviewContent" id="reviewContent">
			
			<button id="reviewAddBtn">후기등록</button>
		</div><br>
		<div class="reviewBody">
			
		</div>
	</div>
	
	<form id="listForm" action="/store/list" method="get">
		<input type="hidden" name="page" value="${cri.page}">
		<input type="hidden" name="size" value="${cri.size}">
	</form>
	<form id="modifyForm" action="/store/modify" method="get">
		<input type="hidden" name="sno" value="${store.sno}">
		<input type="hidden" name="page" value="${cri.page}">
		<input type="hidden" name="size" value="${cri.size}">
	</form>
</div>

<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=680c3376031fbe0564e2477735746752"></script>
		
<script>
	
	var lat = "${store.lat}";
	var lng = "${store.lng}";
	var mapContainer = document.getElementById('map');	// 지도 표시할 div
	var	mapOption = {
			center: new daum.maps.LatLng(lat, lng),	// 지도 중심좌표
			level: 3	// 지도 확대 레벨
		};
	
	$(document).ready(function() {
		
		var map = new daum.maps.Map(mapContainer, mapOption);	// 지도 표시할 div, 지도 옵션으로 지도 생성
		var markerPosition = new daum.maps.LatLng(lat, lng);	// 마커 표시될 위치
		var marker = new daum.maps.Marker({	// 마커 생성
			position: markerPosition
		});
		
		marker.setMap(map);	// 지도 위에 마커 표시
		
		
		var modifyForm = $("#modifyForm");
		var listForm = $("#listForm");
		
		$("#modBtn").on("click", function() {	// 매장수정페이지로..
			modifyForm.submit();
		});
		
		$("#listBtn").on("click", function() {	// 목록페이지로..
			listForm.submit();
		});
		
	});
	
</script>

<%@ include file="../footer.jsp" %>