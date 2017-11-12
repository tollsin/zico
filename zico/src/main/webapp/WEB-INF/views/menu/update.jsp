<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" enctype="multipart/form-data">
	<div>
		<label>카테고리</label> <input type="text" name="category"
			value="${menu.category}" >
	</div>
	<div>
		<label>메뉴이름</label> <input type="text" name="mname"
			value="${menu.mname}" >
	</div>
	<div>
		<label>설명</label> <input type="text" name="minfo"
			value="${menu.minfo}">
	</div>
	
	<div>
		<label>가격</label> <input type="text" name="mprice"
			value="${menu.mprice}">
	</div>
	<div>
		<label>사이즈</label> <input type="text" name="msize"
			value="${menu.msize}">
	</div>
	<div>
		<label>이미지</label> <img src="display?name=s_${menu.imgname}">
	</div>
	<input type="file" name="f1" value="${menu.imgname}">
	<input type="hidden" name="menuno" value="${menu.menuno}" >
	<button>수정</button>
	</form>
</body>
</html>