<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="Post" enctype="multipart/form-data" >

		카테고리 :<input type="text" name="category" value="카테고리"> 
		메뉴이름:<input type="text" name="mname" value="메뉴이름"> 
		메뉴종류:<input type="text" name="minfo" value="메뉴종류"> 
		메뉴 사이즈:<input type="text" name="msize" value="메뉴 사이즈"> 
		가격 :<input type="text" name="mprice" value="2700"> 
		<input type="hidden" name="size" value="${criteria.size}"> 
		<input type="file" name="file" value="file">
		<button  type="submit">등록</button>
	</form>






</body>

</html>