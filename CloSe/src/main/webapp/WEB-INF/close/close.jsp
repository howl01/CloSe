<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file= "../main/top.jsp" %>
<script type="text/javascript">
$.getJSON('https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=27f0e2dcc40e953d16644b55e897423d&units=metric',
	      function (result) {
		    var openWeatherTemperature = result.main.temp;
			
		   	var $ctemp = result.main.temp;
		   	$('#ctemp').text(result.main.temp + '°C');
	     	var wiconUrl = '<img src="http://openweathermap.org/img/wn/' + result.weather[0].icon + '.png" alt="' + result.weather[0].description + '">';
	       	$('.icon').html(wiconUrl);
	        $('#feel').text(result.main.feels_like + '°C');
	        $('#description').text(result.main.description);
	        
	         var ct = result.dt;

	         function convertTime(ct) {
	            var ot = new Date(ct * 1000);
	            var year = ot.getFullYear();
	            var month = ot.getMonth() + 1;
	            var dt = ot.getDate();
	            var hr = ot.getHours();
	            var m = ot.getMinutes();

	            return year + '년 ' + month + '월 ' + dt + '일 ';
	         }

	         var currentTime = convertTime(ct);
	         $('.time').text(currentTime);
	      });
	      
	      $("#datepicker").datepicker();
	      
$.getJSON("http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?serviceKey=SGflivtBGvqXbmouseeny%2BqiubaR1mjy1tBrvVnTKHHN9fjXz2%2FFRdq3iUDNwPu%2BIPE3tH%2FRdFPJmSDCLjVFpg%3D%3D&pageNo=1&numofRows=1000&dataType=JSON&base_date=20231218&base_time=0500&nx=60&ny=127",
		function (data){
			console.log(data);
			console.log(data.response.body.items.item[3].obsrValue);
			let item = data.response.body.items.item[3];
			let content = item.baseDate + "/" + item.baseTime + "/" + item.obsrValue + "기준";
				$('.result').text(content);
});
</script>

오늘의 날씨
<table border="1">
	<tr>
		<td>
			날씨 : <span id="description"></span>
			<span class="icon"></span>
		</td>
	</tr>
	<tr>
	
		<td>최고 온도 : ${ TMXValue }</td>
	</tr>
	<tr>
		<td>최저 온도 : ${ TMNValue }</td>
	</tr>
</table>



    
<%@ include file="../main/bottom.jsp" %>