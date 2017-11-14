<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	select {
    width: 70px;
    height: 30px;
    padding-left: 10px;
    font-size: 18px;
    color: #555555;
    border: 1px solid white;
    border-radius: 3px;
}
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
	.order {
		padding: 5%;
	}
	.button:hover {
		background-color: #555555; /* Green */
		color: white;
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
	tbody {
		height:50px;
	}
	.button:hover {
	    background-color: #555555; /* Green */
	    color: white;
	}
	.store {
	    margin: 3% auto;
	}
	td {
	    padding: 5%;
	}
	.tot {
		float:right;
		font-size:20px;
		padding-right: 3%;
		padding-bottom: 80%;
	}
	.store{
		float:left;
		font-size:20px;
		padding-left: 3%;
	}
</style>

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
					<div class="order" >
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
						<br>
						<br>
						<div style="font-size:20px;"class="time">
						예약시간 <span class="hour"></span>시<select class="minute"></select>분
						</div>
						<div class="store">
						<span>매장명: </span><span></span>
						</div>
						<div class="tot">
						<br>
						<span >합계 : </span><span class="totprice"></span>
						</div>
					</div>
					<br><br>
					<div>
					<input class="button check" type="button" value="check">&emsp;&emsp;
					<input class="button cancel" type="button" value="cancel">
					<input class="restime" name="restime" type="hidden" value="">
					</div>
					<br>
					<br>
				</form>
			</div>
		</div>
	</div>
	</section>

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
					$(".order > table > tbody").append("<tr class='"+menu[0]+"_"+menu[1]+"'><td class='menu'>"+menu[1]+"</td><td class='count'>"+count(menu[1],menu[3])+"</td><td class='price' value='"+menu[2]+"'>"+orderprice(menu[2]*menu[3])+"원"+"</td><td><span>X</span></td></tr>");
					console.log(menu[0]);
					console.log(menu[1]);
					console.log(menu[2]);
					console.log(menu[3]);
					console.log(orderprice(menu[2]*menu[3]));
				}
			}
			// 디저트 주문 처리
			for(var i=0; i<order.length; i++){
				if(order[i].indexOf("dessert") == 0){
					var menu = order[i].split("_");
					console.log("메뉴 : " + menu[1] + "  개수 : " + menu[2]);
					$(".order > table > tbody").append("<tr class='"+menu[0]+"_"+menu[1]+"'><td class='menu'>"+menu[1]+"</td><td class='count'>"+count(menu[1],menu[3])+"</td><td class='price' value='"+menu[2]+"'>"+orderprice(menu[2]*menu[3])+"원"+"</td><td><span>X</span></td></tr>");
				}
			}
			// 매장 처리
			for(var i=0; i<order.length; i++){
				if(order[i].indexOf("store") == 0){
					var menu = order[i].split("_");
					console.log("매장 : " + menu[1]);
				}
			}
			totprice();
			$(".time .hour").html(timeHour);
			$(".time .minute").html(timeMinute);
		});
		
		function timeHour(){
			str="<select>";
			for(var i=7; i<22; i++){
				str += "<option value='"+i+"''>"+i+"</option>";
			}
			str += "</select>";
			return str;
		}
		function timeMinute(){
			str="<select>";
			for(var i=0; i<60; i+=5){
				str += "<option value='"+i+"''>"+i+"</option>";
			}
			str += "</select>";
			return str;
		}
		
		function count(menu,count){
			str = "";
			str += "<select name='"+menu+"'>" +
					"<option value="+0+">개수</option>";
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
		
		
		$(".time").change(function(e){
			console.log("시간선택")
			var hour = document.getElementsByClassName("hour")
			var minute = document.getElementsByClassName("minute")
			var d = new Date();
//			document.write('현재 년: ' + d.getFullYear() + '<br />');
//			document.write('현재 월: ' + (d.getMonth() + 1) + '<br />');
//			document.write('현재 일: ' + d.getDate() + '<br />');
			if($(".hour option:selected").text() <= d.getHours() && $(".minute option:selected").text() <= d.getMinutes()){
				e.preventDefault();
				alert("현재 시간 이후로 주문해주세요 \n 현재시간 : "+d.getHours()+" 시 "+d.getMinutes()+" 분");
			}
				tim = d.getFullYear() + "-" + d.getMonth() + "-" + d.getDate() + " " + d.getHours() + ":" + $(".hour option:selected").text() + ":" + $(".minute option:selected").text();

				$(".restime").val(tim);
				console.log(tim);
				console.log($(".restime").val());
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
	        totprice();
		});
		
		// 개수 수정시 쿠키 수정
		$("tbody").on("change","select",function(){
			console.log($(this).val());
			var del = $(this).parent().parent().attr("class");
			var price = $("."+del).children(".price").attr("value");
	        var cnt = $(this).val();
	        var val = del + "_" + price + "_" + cnt
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
	        totprice();
	        $("."+del+" td"+":"+"eq"+"("+"2"+")").text(orderprice(price*cnt)+"원");
		});
		
		function orderprice(x) {
			if(x < 0 || (typeof x != "number")){
				x = 0; 
			}
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");		   
		}
		function totprice(){
			var cookie = document.cookie;
			var order = cookie.split("!");
			var tot = 0;
			for(var i=0; i<order.length; i++){
				if(order[i].indexOf("coffee") != -1 || order[i].indexOf("dessert") != -1){
					var menu = order[i].split("_");
					tot += menu[2]*menu[3];
				}
			}
			$(".totprice").text(orderprice(tot)+"원");
			console.log("tot2")
		}
	</script>
<%@ include file="../footer.jsp" %>


