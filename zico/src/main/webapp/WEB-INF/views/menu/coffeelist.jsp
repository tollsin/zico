<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
<a href="/menu/dessertlist">디저트</a>
<a href="/menu/coffeelist">커피</a>
	<table>
		<thead>
			<tr>
				<th>메뉴 이름</th>
				<th>이미지</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="menu">
				<tr>
					<td><a href="${menu.menuno}" class="target"><c:out value="${menu.mname}"></c:out></a></td>
					<td><img  src='${menu.imgname}'></td>
					<td><img src='/display?name=s_${menu.imgpath}'></td>
					<td class="uploadList"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<form id="actionForm" action="/menu/coffeelist" method="get">
		<input type="hidden" name="menuno">
		  <input type="hidden" name="page" value="${criteria.page}">
		<input type="hidden" name="size" value="${criteria.size}">
	</form>
	
	<form id="insertForm" action="/menu/coffeelist" method="get">
		<input type="hidden" name="page" value="${criteria.page}">
		<input type="hidden" name="size" value="${criteria.size}">
	</form>
	
	<button id="insertBtn">메뉴등록</button>
	<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
  
	<script type="text/javascript">
	function showAttach(data) {
		
		var uploadList = $(".uploadList");
		var before = uploadList.html();
		var str = "";
		
		if(data.isImage) {
			str = "<div><img class='att' src='/display?name=s_"
					+ data.uploadName + "'/><span data-src='" + data.uploadName + "'>x</span></div>";
		} else {
			str = "<div><img class='att' src='/resources/file.jpg'/><span data-src='"
					+ data.uploadName + "'>x</span></div>";
		}
		
		before += "<li>" + str + "</li>";
		uploadList.html(before);
		
	}
	
	
	$(document).ready(function(){
	var actionForm = $("#actionForm");
	var insertForm = $("#insertForm");
	 var result = "${result}";

	 
	 $("#insertBtn").click(function() {
		 insertForm.attr("action", "/menu/insert");
		 insertForm.attr("method", "get");
		 insertForm.submit();
	    });
	 $(".target").on("click",function(event){
		 event.preventDefault();
		 var menuno = $(this).attr("href");
		 //actionForm.find("input[name='menuno']").val(menuno);
		 //actionForm.html('<input type="hidden" name="menuno" value="'+menuno+'">')
		 //actionForm.attr("data-menuno", menuno);
		 //actionForm.attr("data-page", "${criteria.page}");
		 //actionForm.attr("data-size", "${criteria.size}");
		actionForm.find("input[name='menuno']").val(menuno);
	    actionForm.attr("action","/menu/detail").submit();
	 });
	 if(result === 'success') {
	    	alert('등록성공');
	    }
	});
	
	</script>
</body>
</html>