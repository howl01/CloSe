<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file= "../main/top.jsp" %>
<script type="text/javascript">
$.getJSON('https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=27f0e2dcc40e953d16644b55e897423d&units=metric',
	      function (result) {
			
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

	            return year + '년 ' + month + '월 ' + dt + '일 ' + hr + '시 기준';
	         }

	         var currentTime = convertTime(ct);
	         $('.time').text(currentTime);
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
		<td>현재온도 : <span id="ctemp"></span></td>
	</tr>
	<tr>
	
		<td>체감 온도 : <span id="feel"></span></td>
	</tr>
</table>

<c:if test="${ openWeatherTemperature == null }">
	씨
</c:if>
<c:if test="${ openWeatherTemperature != null }">
	${ openWeatherTemperature }
</c:if>
    
<%@ include file="../main/bottom.jsp" %>