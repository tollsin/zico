<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.zero{
	width: 0px;
	height: 0px;
	border: 0px;
}
</style>
</head>
<body>
	<h1>File Upload EX1</h1>
	<form method="post" enctype="multipart/form-data" target="zero">
	<input type="file" name="f1">
	<button>Upload</button>
	</form>
	
	<ul class="uploadList">
	
	</ul>
	
	<iframe name="zero" class="zero"></iframe>
	
	<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
  
	
	<script>
	function showAttach(data){
		var uploadList = $(".uploadList");
		var before  = uploadList.html();
		var str="";
		if(data.isImage) {
			str = "<div><img class='att' src='/display?name=s_"
					+ data.uploadName + "'/><span data-src='" + data.uploadName + "'>x</span></div>";
		} else {
			str = "<div><img class='att' src='/resources/file.jpg'/><span data-src='"
					+ data.uploadName + "'>x</span></div>";
		}
		before += "<li>" + str + "</li>";
		uploadList.html(before);
	}
	</script>
</body>
</html>