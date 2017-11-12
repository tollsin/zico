<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>Result PAGE</h1>
<script >
var uploadName = '${uploadName}';
var isImage = '${isImage}';

// parent = ex1.jsp
parent.showAttach({uploadName:uploadName, isImage:isImage});
</script>
</body>
