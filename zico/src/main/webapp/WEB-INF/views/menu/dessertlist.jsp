<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--=====================
          Content
======================-->
<style>
	.mypage>li:first-child>a{
		margin-left: 0;
		border-top-left-radius: 4px;
		border-bottom-left-radius: 4px;
	}
	.mypage>.active>a{
		z-index: 3;
	    color: #fff;
	    cursor: default;
	    background-color: #337ab7;
	    border-color: #337ab7;
    }
    .mypage>li>a{
        position: relative;
	    float: left;
	    padding: 6px 12px;
	    margin-left: -1px;
	    line-height: 1.42857143;
	    color: #337ab7;
	    text-decoration: none;
	    background-color: #fff;
	    border: 1px solid #ddd;
	  
	    
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<section class="content gallery pad1"><div class="ic"></div>

  <div class="container">
  <div class="w3-bar w3-border w3-light-grey">
  <a href="/menu/dessertlist" class="w3-bar-item w3-button w3-border-right">Dessert</a>
  <a href="/menu/coffeelist" class="w3-bar-item w3-button w3-border-right">Coffee</a>

</div>
    <div class="row">
    <c:forEach items="${list}" var="menu">
    
      <div class="grid_4">
        <div class="gall_block">
          <div class="maxheight">
            <a href="display?name=s_${menu.imgname}" class="gall_item"></a><img src="display?name=s_${menu.imgname}" style="width: 368px;height: 265px;">
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
      <button id="insertBtn">메뉴등록</button>
	<ul class="pagination mypage"></ul>
  </div>
</section>


	<form id="actionForm" action="/menu/dessertlist" method="get">
		<input type="hidden" name="menuno">
		  <input type="hidden" name="page" value="${criteria.page}">
		<input type="hidden" name="size" value="${criteria.size}">
	</form>
	
	<form id="insertForm" action="/menu/dinsert" method="get">
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
		 insertForm.attr("action", "/menu/dinsert");
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
		    var last = Math.ceil(param.page / 5) * 5.0;
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

		
	
			
	
	

	</script>
<%@ include file="../footer.jsp" %>