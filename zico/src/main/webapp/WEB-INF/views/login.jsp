<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

  <link rel="stylesheet" href="/resources/dist/css/login.css">

<body>
  <div class="login">
    <h1>Hee's Cafe Login</h1>
    <form  action="/loginPost"method="post">
      <p><input type="text" name="uid" placeholder="아이디"></p>
      <p><input type="password" name="upassword"  placeholder="비밀번호"></p>
      <p class="remember_me">
        <label>
          <input type="checkbox" name="remember" >
          Remember?
        </label>
      </p>
      <p class="submit"><input type="submit" name="commit" value="Login"></p>
    </form>
  </div>

  <div class="login-help">
  </div>
<%@ include file="footer.jsp" %>