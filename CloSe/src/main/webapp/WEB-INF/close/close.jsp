<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file= "../main/top.jsp" %>

<style>
	table {
      border-collapse: collapse;
      width: 50%;
      font-family: Arial, sans-serif;
   }

   td {
      border: 1px solid #dddddd;
      text-align: center;
      padding: 8px;
   }

   th {
      border: 1px solid #dddddd;
      text-align: left;
      padding: 8px;
      background-color: #f2f2f2;
   }
</style>

<script type="text/javascript">
$.getJSON('https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=27f0e2dcc40e953d16644b55e897423d&units=metric',
         function (result) {
          var openWeatherTemperature = result.main.temp;
         
            var $ctemp = result.main.temp;
            $('#ctemp').text(result.main.temp + ' °C');
           var wiconUrl = '<img src="http://openweathermap.org/img/wn/' + result.weather[0].icon + '.png" alt="' + result.weather[0].description + '">';
             $('.icon').html(wiconUrl);
           $('#feel').text(result.main.feels_like + ' °C');
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


<table style="display: inline; margin-left: 500px; ">
   <tr>
      <td>${ today } 기준</td>
   	  <td rowspan="5" width="180px;" >
         지금 날씨엔.. <br><br>
         <c:if test="${ avg <= 4.0 }">
            패딩<br> 두꺼운코트<br> 목도리<br> 기모제품
         </c:if>
         <c:if test="${ avg > 4.0 && avg <= 8.0 }">
            코트<br> 가죽자켓<br> 히트텍<br> 니트<br> 레깅스
         </c:if>
         <c:if test="${ avg > 8.0 && avg <= 12.0 }">
            자켓<br> 트렌치코트<br> 야상<br> 니트<br> 청바지<br> 스타킹
         </c:if>
         <c:if test="${ avg > 12.0 && avg <= 16.0 }">
            자켓<br> 가디건<br> 야상<br> 스타킹<br> 청바지<br> 면바지
         </c:if>
         <c:if test="${ avg > 16.0 && avg <= 19.0 }">
            얇은 니트<br> 맨투맨<br> 가디건<br> 청바지
         </c:if>
         <c:if test="${ avg > 19.0 && avg <= 22.0 }">
            얇은 가디건<br> 긴팔<br> 면바지<br> 청바지
         </c:if>
         <c:if test="${ avg > 22.0 && avg <= 27.0 }">
            반팔 얇은<br> 셔츠<br> 반바지<br> 면바지
         </c:if>
         <c:if test="${ avg > 27.0 }">
            민소매<br> 반팔<br> 반바지<br> 원피스
         </c:if>
      </td>
   </tr>
   <tr>
      <td>
         날씨 : ${ weather }<span id="description"></span>
         <span class="icon"></span>
      </td>
   </tr>
   <tr>
      <td>최고 온도 : <font color="red"> ${ TMXValue } °C</font></td>
   </tr>
   <tr>
      <td>최저 온도 : <font color="blue"> ${ TMNValue } °C</font></td>
   </tr>
   <tr>
      <td>체감 온도 : <span id="feel"></span></td>
   </tr>
</table>

<table border="1">
   <c:forEach var="style" items="${ avgList }">
      <tr>
         <td>${ style.style_number }</td>
      </tr>
   </c:forEach>
</table>



    
<%@ include file="../main/bottom.jsp" %>