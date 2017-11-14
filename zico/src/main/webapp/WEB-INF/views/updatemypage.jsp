<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<body>
    <h1>회원정보 수정</h1>
        </div>
        <form  id="result" action="updateresult" method="post">
       
        <div class="form-group">
          <label class="col-sm-3 control-label" id="upassword1" for="inputPassword">비밀번호</label>
           <input value="${result.upassword}" name="upassword"></input>
           
        </div>
         
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputEmail">생년월일</label>
          <input value="${result.birth}" name="birth"></input>
        <div class="col-sm-6">
        </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputEmail">2차비밀번호 질문</label>
          <input value="${result.pwhint}" name="pwhint"></input>
        <div class="col-sm-6">
        </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputEmail">2차비밀번호 정답</label>
          <input value="${result.pwanswer}" name="pwanswer"></input>
        <div class="col-sm-6">
        </div>
        </div>
        
         
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputName">이름</label>
            <input value="${result.uname}" name="uname"></input>
          <div class="col-sm-6">
          </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputNumber">휴대폰번호</label>
            <input value="${result.uphone}" name="uphone"></input>
              <div class="col-sm-6">
                <div class="input-group">
                 
                </div>
              </div>
        </div>
        <button>수정확인</button>
        </form>
 </div>
<%@ include file="footer.jsp" %>