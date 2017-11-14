<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<body>
<html>
<head>
 <h1>개인 정보</h1>
 
    
     

        <div class="form-group">
          <label class="col-sm-3 control-label" id="uid1" for="inputEmail">아이디</label>
          <span id="check"><button>중복체크</button></span>
          <pre>  ${result.uid}</pre>
        <div class="col-sm-6">
        </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3 control-label" id="upassword1" for="inputPassword">비밀번호</label>
           <pre>  ${result.upassword}</pre>
        <div class="col-sm-6">
        <p class="help-block">숫자, 특수문자 포함 8자 이상</p>
        </div>
        </div>
         
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputEmail">생년월일</label>
           <pre>  ${result.birth}</pre>
        <div class="col-sm-6">
        </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputEmail">2차비밀번호 질문</label>
           <pre>  ${result.pwhint}</pre>
        <div class="col-sm-6">
        </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputEmail">2차비밀번호 정답</label>
         <pre> ${result.pwanswer}</pre>
        <div class="col-sm-6">
        </div>
        </div>
        
         
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputName">이름</label>
          <pre>${result.uname}</pre>
          <div class="col-sm-6">
          </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputNumber">휴대폰번호</label>
           <pre> ${result.uphone}</pre>
              <div class="col-sm-6">
                <div class="input-group">
                 
                </div>
              </div>
        </div>
        
 </div>
 			<form class="updatemypage" action="updatemypage" method="post">
                 <button class="update">수정</button>
            </form>
    <script
        src="https://code.jquery.com/jquery-3.2.1.min.js"
        integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
        crossorigin="anonymous">
   </script>        
	<script>
	$(".update").on("click",function(e){
		e.preventDefault();
		$(".updatemypage").submit();
		//$(".updatemypage").
	});
	
	$(".span").on("click",function(e){
		
	});
	
	
	
	</script>


<%@ include file="footer.jsp" %>