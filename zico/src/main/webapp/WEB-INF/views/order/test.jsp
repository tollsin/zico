
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<body>
	<form action="/order/index" method="post">
		<button>hihi</button>
	</form>
	<span id="ice4">아이스크림4</span><br>
	<span id="ice2">아이스크림2</span><br>
	<span id="ame1">아메리카노1</span><br>
	<span id="ame3">아메리카노3</span><br>
	<span id="hon1">허니브레드1</span><br>
	<span id="hon19">허니브레드19</span><br>
	
	
	
	<script
	  	src="https://code.jquery.com/jquery-3.2.1.min.js"
	  	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	  	crossorigin="anonymous">
	</script>
	
	<script>
	$("form").on("click",function(){
		setCookie("order","coffee","Esspresso","10");
	});
	$("#ice4").on("click",function(){
		setCookie("order","dessert","IceCreme","4")
	});
	$("#ice2").on("click",function(){
		setCookie("order","dessert","IceCreme","2");
	});
	$("#ame1").on("click",function(){
		setCookie("order","coffee","Americano","1");
	});
	$("#ame3").on("click",function(){
		setCookie("order","coffee","Americano","3");
	});
	$("#hon1").on("click",function(){
		setCookie("order","dessert","HoneyBread","1");
	});
	$("#hon19").on("click",function(){
		setCookie("order","dessert","HoneyBread","19");
	});
	
/*  	function setCookie(cname, cvalue){
		var cookie = document.cookie;
		var d = new Date();
		d.setDate(d.getDate() + 1); //1일 뒤 이 시간
		var expires = "expires="+d.toGMTString();
			//쿠키값 존재시
			if(cookie.length > 0){
				startIndex = cookie.indexOf(cname);
				console.log(startIndex);
				if(startIndex != -1){
					startIndex += cname.length;
					endIndex = cookie.indexOf( ";", startIndex );
					if( endIndex == -1) endIndex = cookie.length;
					value = cookie.substring( startIndex + 1, endIndex ) +"!"+ cvalue;
					document.cookie = cname + "=" + value + ";" + expires;
				}
			}
			else{
				document.cookie = cname + "=" + cvalue + ";" + expires;
			}
	} */

		/* function setCookie(cName, cType, cMenu, cCnt){
		// 1. 쿠키 내용 설정
		// 쿠키 내용 설정
		var cValue = cType + "_" + cMenu;
		var cValue2 = cValue + "_" + cCnt;
		var cookie = document.cookie;
		// 기간설정
		var date = new Date();
		date.setDate(date.getDate() + 1);
		var expires = "expires="+date.toGMTString();
			if(cookie.length > 0){	// 2. 쿠키 존재 체크(전체)
				var startIndex = cookie.indexOf(cName);
				if(startIndex != -1){	// 3. 쿠키 존재 체크(특정)
					startIndex += cName.length;
					endIndex = cookie.length;
					var startIndex2 = cookie.indexOf(cValue)
					if(startIndex2 != -1){	//4. 중복된 데이터가 있는지 확인
						var startIndex3 = cookie.indexOf("!"+cValue);	//5. 구분자 포함하는지 확인
						if(startIndex3 != -1){
							var markIndex = cookie.indexOf("!", startIndex2);	//5. 쿠키 수정(제일 앞 제외)
							if(markIndex != -1){
								var markIndex2 = cookie.indexOf("!", startIndex2-1);
								document.cookie = cookie.substring(0,markIndex2) + "!" + cValue2 + cookie.substring(cookie.indexOf("!",markIndex),endIndex) + ";" + expires;
							}else{
								cookie.replace(cookie.substring(startIndex2+cName.length,endIndex), cValue2);
								document.cookie = cookie.substring(0,startIndex3) + "!" + cValue2 + ";" + expires;
							}
						//5. 쿠키 수정(제일 앞에있는 데이터)
						}else{
							console.log()
							var markIndex = cookie.indexOf("!",startIndex2);
							if(markIndex != -1){
							document.cookie = cookie.substring(0,startIndex+1) + cValue2 + cookie.substring(markIndex,endIndex) + ";" + expires;
							} else {
							document.cookie = cookie.substring(0,startIndex+1) + cValue2 + ";" + expires;
							console.log(cookie.substring(0,startIndex+1));
							console.log(cValue2)
							console.log(cookie.substring(markIndex,endIndex))
							}
						}
					//4. 쿠키 추가
					}else{
						console.log("aa")
						var value = cookie.substring( 0, endIndex ) +"!"+ cValue2;
						document.cookie = value + ";" + expires;
					}
					
				}else{
					console.log("bb")
					doucument.cookie = cName + "=" + cValue2 + ";" + expires;
				}
				
			}else{
				console.log("cc")
				document.cookie = cName + "=" + cValue2 + ";" + expires;
			}
	} */
			
	/* 
	var d = new Date();
	d.setDate(d.getDate() + 1); //1일 뒤 이 시간
	var expires = "expires="+d.toGMTString();
	document.cookie = cname + "=" + cvalue + "; " + expires;
	} */
	</script>
</body>
</html>