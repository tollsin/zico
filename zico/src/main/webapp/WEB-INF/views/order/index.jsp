<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Home</title>
<meta charset="utf-8">
<meta name="format-detection" content="telephone=no" />
<link rel="icon" href="/resources/images/favicon.ico">
<link rel="shortcut icon" href="/resources/images/favicon.ico" />
<link rel="stylesheet" href="/resources/css/stuck.css">
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/touchTouch.css">
<script src="/resources/js/jquery.js"></script>
<script src="/resources/js/jquery-migrate-1.1.1.js"></script>
<script src="/resources/js/script.js"></script>
<script src="/resources/js/superfish.js"></script>
<script src="/resources/js/jquery.equalheights.js"></script>
<script src="/resources/js/jquery.mobilemenu.js"></script>
<script src="/resources/js/jquery.easing.1.3.js"></script>
<script src="/resources/js/tmStickUp.js"></script>
<script src="/resources/js/jquery.ui.totop.js"></script>
<script src="/resources/js/touchTouch.jquery.js"></script>

<style>

	.button {
		background-color: #e7e7e7;
		color: black; /* Green */
		border: 2px solid #555555; /* Green */
		border-radius: 4px;
		color: black;
		padding: 15px 32px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 16px;
	}
	
	.button:hover {
		background-color: #555555; /* Green */
		color: white;
	}
	.store {
		background
	}
	tr td{
		width:30%;
		height:30%;
		font-size:20px;
		margin:0 auto;
	}
	th {
		font-size:30px;
	}
	table {
	    width:100%
	}
	.button:hover {
	    background-color: #555555; /* Green */
	    color: white;
	}
	.store {
	    margin: 3% auto;
	}
	td{
	    padding: 5%;
	}
</style>
<script>
 $(document).ready(function(){

  $().UItoTop({ easingType: 'easeOutQuart' });
  $('#stuck_container').tmStickUp({});
  $('.gallery .gall_item').touchTouch();

  }); 
</script>
<!--[if lt IE 9]>
 <div style=' clear: both; text-align:center; position: relative;'>
   <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
     <img src="http://storage.ie6countdown.com/assets/100//resources/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
   </a>
</div>
<script src="/resources/js/html5shiv.js"></script>
<link rel="stylesheet" media="screen" href="/resources/css/ie.css">


<![endif]-->
</head>

<body class="page1" id="top">
	<!--==============================
              header
=================================-->
	<header> <!--==============================
            Stuck menu
=================================--> <section id="stuck_container">
	<div class="container">
		<div class="row">
			<div class="grid_12">
				<h1>
					<a href="index.html"> <img src="/resources/images/logo.png"
						alt="Logo alt">
					</a>
				</h1>
				<div class="navigation">
					<nav>
					<ul class="sf-menu">
						<li class="current"><a href="index.html">home</a></li>
						<li><a href="index-1.html">menu</a></li>
						<li><a href="index-2.html">store</a></li>
						<li><a href="index-3.html">order</a></li>
					</ul>
					</nav>
					<div class="clear"></div>
				</div>
			</div>
		</div>
	</div>
	</section> </header>
	<!--=====================
          Content
======================-->
	<section class="content">
	<div class="ic">More Website Templates @ TemplateMonster.com -
		July 30, 2014!</div>
	<div class="container">
		<div class="row">
			<div style="margin: 0 auto; text-align: center;">
				<br>
				<br>
				<span style="font-size: 40px;">OrderList</span><br>
				<br>
				<br>
				<form id="orderform" method="post" action="/order/pay">
					<div class="order" style="background-color: skyblue; padding: 10%;">
						<table>
							<thead>
								<tr>
									<th value="Menu"> Menu </th>
									<th> 수량 </th>
									<th> 가격 </th>
								</tr>
							</thead>
							<tbody>									
							</tbody>
						</table>
					</div>
					<br><br>
					<input class="button check" type="button" value="check">&emsp;&emsp; 
					<input class="button cancel" type="button" value="cancel">
					<br>
					<br>
				</form>
			</div>
		</div>
	</div>
	</section>
<!--==============================
              footer
=================================-->
	<footer id="footer">
	<div class="container">
		<div class="row">
			<div class="grid_12">
				<div class="socials">
					<a href="#" class="fa fa-twitter"></a> <a href="#"
						class="fa fa-facebook"></a> <a href="#" class="fa fa-google-plus"></a>
					<a href="#" class="fa fa-pinterest"></a>
				</div>
				<div class="copyright">
					<span class="brand">Bliss </span> &copy; <span id="copyright-year"></span>
					| <a href="#">Privacy Policy</a>
					<div>
						Website designed by <a href="http://www.templatemonster.com/"
							rel="nofollow">TemplateMonster.com</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	</footer>

	
	<script>
		$(document).ready(function(){
			var order = '${order}'.split("!");	
			console.log("주문 개수");
			console.log(order.length);
			// 커피 주문 처리
			for(var i=0; i<order.length; i++){
				if(order[i].indexOf("coffee") == 0){
					var menu = order[i].split("_");
					console.log("메뉴 : " + menu[1] + "  개수 : " + menu[2]);
					$(".order > table > tbody").append("<tr class='"+menu[0]+"_"+menu[1]+"'><td class='menu'>"+menu[1]+"</td><td class='count'>"+count(menu[1],menu[2])+"</td><td class='price'>1700원</td><td><span>X</span></td></tr>");
				}
			}
			// 디저트 주문 처리
			for(var i=0; i<order.length; i++){
				if(order[i].indexOf("dessert") == 0){
					var menu = order[i].split("_");
					console.log("메뉴 : " + menu[1] + "  개수 : " + menu[2]);
					$(".order > table > tbody").append("<tr class='"+menu[0]+"_"+menu[1]+"'><td class='menu'>"+menu[1]+"</td><td class='count'>"+count(menu[1],menu[2])+"</td><td class='price'>1700원</td><td><span>X</span></td></tr>");
				}
			}
			// 매장 처리
			for(var i=0; i<order.length; i++){
				if(order[i].indexOf("store") == 0){
					var menu = order[i].split("_");
					console.log("매장 : " + menu[1]);
				}
			}		
		});
		
		function count(menu,count){
			str = "";
			str += "<select name='"+menu+"'>" +
					"<option value='개수'>개수</option>";
			for(var i = 1; i <= 20; i++){
				if(count != i){
					str += "<option value="+ i +">"+ i +"</option>";
				} else {
					str += "<option value="+ i +" selected='selected'>"+ i +"</option>";	
				}
			}
			str += "</select>";
			return str;
		}
		
		var $orderform = $(".orderform");
		$(".check").click(function(){
			orderform.submit();
		});
		$orderform.submit(function(e){
			console.log(e);
		    e.preventDefault();
		});
		
		// 삭제 클릭시 엘리먼트삭제+쿠키삭제
		$("tbody").on("click","span",function(){
	        var del = $(this).parent().parent().attr("class");
	        var cookie = document.cookie;
	        var startIndex = cookie.indexOf("!"+del);
	        var endIndex = cookie.indexOf("!",startIndex+1);
	        if(startIndex != -1){
	        	if(endIndex == -1){
	        		console.log("1")
	        		document.cookie = cookie.substring(0,startIndex);
	        	} else {
	        		console.log("2")
	        		document.cookie = cookie.substring(0,startIndex) + cookie.substring(endIndex,cookie.length);
	        	}	        
	        } else {	        	
	        	startIndex = cookie.indexOf(del);
	        	if(endIndex != -1){
	        		console.log("3")
	        		document.cookie = cookie.substring(0,startIndex) + cookie.substring(endIndex+1,cookie.length);
	        	} else {
	        		console.log("4")
	        		  var expireDate = new Date();
	        		  expireDate.setDate( expireDate.getDate() - 1 );
	        		  document.cookie = "order" + "= " + "; expires=" + expireDate.toGMTString() ;
	        	}
	        	
	        }
	        $(this).parents("tr").remove();
		});
		
		// 개수 수정시 쿠키 수정
		$("tbody").on("change","select",function(){
			console.log($(this).val());
			var del = $(this).parent().parent().attr("class");
	        var cnt = $(this).val();
	        var val = del + "_" + cnt
			var cookie = document.cookie;
	        var startIndex = cookie.indexOf("!"+del);
	        var endIndex = cookie.indexOf("!",startIndex+1);
	        console.log(val)
	        if(startIndex != -1){
	        	if(endIndex != -1){
	        		document.cookie = cookie.substring(0,startIndex)  + "!" + val + cookie.substring(endIndex,cookie.length);
	        	} else {
	        		document.cookie = cookie.substring(0,startIndex) + "!" + val;
	        	}	        
	        } else {	        	
	        	startIndex = cookie.indexOf(del);
	        	if(endIndex != -1){
	        		document.cookie = cookie.substring(0,startIndex) + val + cookie.substring(endIndex,cookie.length);
	        	} else {
	        		document.cookie = "order" + "= " + val; 
	        	}
	        	
	        }
		});
	</script>
</body>
</html>

