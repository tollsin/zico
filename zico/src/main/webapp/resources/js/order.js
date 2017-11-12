function setCookie(cName, cType, cMenu, cCnt){
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
	}