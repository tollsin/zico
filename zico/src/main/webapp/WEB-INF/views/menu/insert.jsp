<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<form method="post" enctype="multipart/form-data" target="zero" >
		카테고리:<select name="category">
			<option value="coffee">coffee</option>
			<option value="dessert">dessert</option>
		</select>
		메뉴이름:<input type="text" name="mname" value="메뉴이름을 입력해주세요"> 
		메뉴설명:<textarea rows="5" cols="30" name="minfo">메뉴설명을 입력해주세요</textarea>
		메뉴사이즈:<select name="msize">
			<option value="Short">Short</option>
			<option value="Grande">Grande</option>
			<option value="Venti">Venti</option>
		</select>
		가격 :<input type="text" name="mprice" value="가격을 입력해주세요"> 
		<input type="hidden" name="size" value="${criteria.size}"> 
		<input type="file" name="f1">
		<button>등록</button>
		
	</form >
<div>
  <form  class="container" method="post" enctype="multipart/form-data" target="zero">
    <div class="form-group">
      <label for="usr">메뉴이름:</label>
      <input type="text" name="mname" value="메뉴이름을 입력해주세요">
    </div>
    
    <div class="form-group">
      <label for="usr">가격:</label>
      <input  name="mprice"   type="text" name="mprice" value="가격을 입력해주세요">
    </div>
    
    <div class="form-group">
      <label for="usr">사진등록:</label>
      <input type="hidden" name="size" value="${criteria.size}"> 
	  <input type="file" name="f1">
    </div>
    
    <div class="form-group">
      <label for="comment">메뉴정보:</label>
      <textarea class="form-control" rows="5" name="minfo" id="comment"></textarea>
    </div>
    
  </form>
</div>

</body>

</html>