<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">

</style>
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
					  <td><img src="display?name=s_${menu.imgname}"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<button id="insertBtn">메뉴등록</button>
	
	<ul class="pagination mypage"></ul>
	<form id="actionForm" action="/menu/coffeelist" method="get">
		<input type="hidden" name="menuno">
		  <input type="hidden" name="page" value="${criteria.page}">
		<input type="hidden" name="size" value="${criteria.size}">
	</form>
	
	<form id="insertForm" action="/menu/coffeelist" method="get">
		<input type="hidden" name="page" value="${criteria.page}">
		<input type="hidden" name="size" value="${criteria.size}">
	</form>
	
	
	
	
	<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
  
	<script type="text/javascript">
	$(document).ready(function(){
	var actionForm = $("#actionForm");
	var insertForm = $("#insertForm");
	var result = "${result}";   
	var pageResult = makePage({page:${criteria.page}, total:${total}, size:${criteria.size}});
	 $("#insertBtn").click(function() {
		 insertForm.attr("action", "/menu/insert");
		 insertForm.attr("method", "get");
		 insertForm.submit();
	    });
	 $(".target").on("click",function(event){
		 event.preventDefault();
		 var menuno = $(this).attr("href");
		actionForm.find("input[name='menuno']").val(menuno);
	    actionForm.attr("action","/menu/detail").submit();
	 });
	 if(result === 'success') {
	    	alert('등록성공');
	    }
	 
	 function makePage(param) {
		    var last = Math.ceil(param.page / 10.0) * 10;
		    var first = last - 9;
		    var prev = false, next = true;
		    
		    if (param.total <= last * param.size ) {
		        last = Math.ceil(param.total / (param.size * 1.0));
		        next = false;
		    }
		    prev = first != 1 ? true : false;
		    
		    return {first:first, last:last, next:next, prev:prev, page:param.page};
		}
	 
	 
		
	    $(".mypage").on("click", "li > a", function(event) {
	    	event.preventDefault();
	    	
	    	var pageNum = $(this).attr("href");
	    	
	    	// alert("PAGE: " + pageNum);
	    	actionForm.find("input[name='page']").val(pageNum);
	    	actionForm.submit();
	    });	    
	    var str = "";	    
	    if(pageResult.prev) {
	    	str += "<li class='page-item'><a class='page-link' href=" + (parseInt(pageResult.first) - 1) + ">prev </a></li>";
	    };	    
	    for(var i = pageResult.first; i <= pageResult.last; i++) {
	    	str += "<li class='page-item " + (pageResult.page == i ? "active" : "") + "'><a class='page-link' href=" + i + ">" + i + "</a></li>";
	    };	
	    if(pageResult.next) {
	    	str += "<li class='page-item'><a class='page-link' href=" + (parseInt(pageResult.last) + 1) + ">Next </a></li>";
	    };	    
	    console.log(str);	    
	    $(".mypage").html(str);	
	    console.log(pageResult);
	
	});

		/*
		var wh=$(window).scrollTop()+$(window).height();
		var dh=$(document).height();
		if(wh+10>dh){
			);
		}
			
		}
	});
	*/
	

	</script>
</body>
</html>