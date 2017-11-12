<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--=====================
          Content
======================-->
<a href="/menu/dessertlist">디저트</a>
<a href="/menu/coffeelist">커피</a>
<section class="content gallery pad1"><div class="ic">More Website Templates @ TemplateMonster.com - July 30, 2014!</div>
  <div class="container">
    <div class="row">
    <c:forEach items="${list}" var="menu">
    
      <div class="grid_4">
        <div class="gall_block">
          <div class="maxheight">
            <a href="display?name=s_${menu.imgname}" class="gall_item"></a><img src="display?name=s_${menu.imgname}">
            <div class="gall_bot">
            <div class="text1"><c:out value="${menu.mname}"></c:out></div>
            "${menu.minfo}"
            <br>
            <a href="${menu.menuno}" class="btn target">상세보기</a></div>
         		   
          </div>
        </div>
      </div>
     
      </c:forEach>
      </div>
	<ul class="pagination mypage"></ul>
  </div>
</section>


	<form id="actionForm" action="/menu/test" method="get">
		<input type="hidden" name="menuno">
		  <input type="hidden" name="page" value="${criteria.page}">
		<input type="hidden" name="size" value="${criteria.size}">
	</form>
	
	<form id="insertForm" action="/menu/test" method="get">
		<input type="hidden" name="page" value="${criteria.page}">
		<input type="hidden" name="size" value="${criteria.size}">
	</form>
  


  
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
		    var last = Math.ceil(param.page / 5.0) * 5;
		    var first = last - 4;
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
<%@ include file="footer.jsp" %>

