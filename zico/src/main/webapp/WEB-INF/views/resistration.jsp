<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap -->
    <link href="/resources/vender/bootstrap.min.css" rel="stylesheet">
    <!-- font awesome -->
    <link rel="stylesheet" href="/resources/vender/font-awesome.min.css" media="screen" title="no title" charset="utf-8">
    <!-- Custom style -->
    <link rel="stylesheet" href="/resources/vender/style.css" media="screen" title="no title" charset="utf-8">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

  <body>


      <article class="container">


        <div class="col-md-12">
        <div class="page-header">
    	    <h1>회원가입 <small>horizontal form</small></h1>
        </div>
        <form class="form-horizontal" action="postres" method="post">
        <div class="form-group">
          <label class="col-sm-3 control-label" id="uid1" for="inputEmail">아이디</label>
        <div class="col-sm-6">
          <input class="form-control" id="uid" name="uid" type="text" value="" placeholder="아이디">
        </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3 control-label" id="upassword1" for="inputPassword">비밀번호</label>
        <div class="col-sm-6">
          <input class="form-control" name="upassword" type="password" placeholder="비밀번호">
        <p class="help-block">숫자, 특수문자 포함 8자 이상</p>
        </div>
        </div>
         
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputEmail">생년월일</label>
        <div class="col-sm-6">
          <input class="form-control" name="birth" type="text" placeholder="생년월일">
        </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputEmail">2차비밀번호 질문</label>
        <div class="col-sm-6">
          <input class="form-control" name="pwhint" type="text" placeholder="2차비밀번호 질문">
        </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputEmail">2차비밀번호 정답</label>
        <div class="col-sm-6">
          <input class="form-control" name="pwanswer" type="text" placeholder="2차비밀번호 정답">
        </div>
        </div>
        
         
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputName">이름</label>
          <div class="col-sm-6">
            <input class="form-control" name="uname" type="text" placeholder="이름">
          </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputNumber">휴대폰번호</label>
              <div class="col-sm-6">
                <div class="input-group">
                  <input type="tel" class="form-control" name="uphone" placeholder="- 없이 입력해 주세요" />
                 
                </div>
              </div>
        </div>
        
          <div class="form-group">
              <label class="col-sm-3 control-label" for="inputAgree">약관 동의</label>
            <div class="col-sm-6" data-toggle="buttons">
              <label class="btn btn-warning active">
                <input id="agree" type="checkbox" autocomplete="off" chacked>
                  <span class="fa fa-check"></span>
              </label>
              <a href="#">이용약관</a> 에 동의 합니다.
            </div>
          </div>
        <div class="form-group">
          <div class="col-sm-12 text-center">
            <button class="btn btn-primary" type="submit">회원가입<i class="fa fa-check spaceLeft"></i></button>
            <button class="btn btn-danger" type="submit">가입취소<i class="fa fa-times spaceLeft"></i></button>
          </div>
        </div>
        </form>
          <hr>
        </div>
      </article>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/resources/js/bootstrap.min.js"></script>
<%@ include file="footer.jsp" %>
