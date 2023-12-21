<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../main/top.jsp" %>

<section class="vh-100">
  <div class="container py-5">

    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-md-9 col-lg-7 col-xl-5">

        <div id="wrapper-bg" class="card text-white bg-image shadow-4-strong"
          style="background-image: url('img/clouds.gif')">
          <!-- Main current data -->
          <div class="card-header p-4 border-0">
            <div class="text-center mb-3">
              <p class="h2 mb-1" id="wrapper-name"></p>
              <p class="mb-1" id="wrapper-description"></p>
              <p class="display-1 mb-1" id="wrapper-temp"></p>
              <span class="">Pressure: <span id="wrapper-pressure"></span></span>
              <span class="mx-2">|</span>
              <span class="">Humidity: <span id="wrapper-humidity"></span></span>
            </div>
          </div>

          <!-- Hourly forecast -->
          <div class="card-body p-4 border-top border-bottom mb-2">
            <div class="row text-center">
              <div class="col-2">
                <strong class="d-block mb-2">Now</strong>
                <img id="wrapper-icon-hour-now" src="" class="" alt="" />
                <strong class="d-block" id="wrapper-hour-now"></strong>
              </div>

              <div class="col-2">
                <strong class="d-block mb-2" id="wrapper-time1"></strong>
                <img id="wrapper-icon-hour1" src="" class="" alt="" />
                <strong class="d-block" id="wrapper-hour1"></strong>
              </div>

              <div class="col-2">
                <strong class="d-block mb-2" id="wrapper-time2"></strong>
                <img id="wrapper-icon-hour2" src="" class="" alt="" />
                <strong class="d-block" id="wrapper-hour2"></strong>
              </div>

              <div class="col-2">
                <strong class="d-block mb-2" id="wrapper-time3"></strong>
                <img id="wrapper-icon-hour3" src="" class="" alt="" />
                <strong class="d-block" id="wrapper-hour3"></strong>
              </div>

              <div class="col-2">
                <strong class="d-block mb-2" id="wrapper-time4"></strong>
                <img id="wrapper-icon-hour4" src="" class="" alt="" />
                <strong class="d-block" id="wrapper-hour4"></strong>
              </div>

              <div class="col-2">
                <strong class="d-block mb-2" id="wrapper-time5"></strong>
                <img id="wrapper-icon-hour5" src="" class="" alt="" />
                <strong class="d-block" id="wrapper-hour5"></strong>
              </div>
            </div>
          </div>

          <!-- Daily forecast -->
          <div class="card-body px-5">
            <div class="row align-items-center">
              <div class="col-lg-6">
                <strong>Today</strong>
              </div>

              <div class="col-lg-2 text-center">
                <img id="wrapper-icon-today" src="" class="w-100" alt="" />
              </div>

              <div class="col-lg-4 text-end">
                <span id="wrapper-forecast-temp-today"></span>
              </div>
            </div>

            <div class="row align-items-center">
              <div class="col-lg-6">
                <strong>Tomorrow</strong>
              </div>

              <div class="col-lg-2 text-center">
                <img id="wrapper-icon-tomorrow" src="" class="w-100" alt="" />
              </div>

              <div class="col-lg-4 text-end">
                <span id="wrapper-forecast-temp-tomorrow">28</span>
              </div>
            </div>

            <div class="row align-items-center">
              <div class="col-lg-6">
                <strong>Day after tomorrow</strong>
              </div>

              <div class="col-lg-2 text-center">
                <img id="wrapper-icon-dAT" src="" class="w-100" alt="" />
              </div>

              <div class="col-lg-4 text-end">
                <span id="wrapper-forecast-temp-dAT">28</span>
              </div>
            </div>
          </div>
        </div>

      </div>
    </div>

  </div>
</section>

<table border="1">
	<tr>
		<td>오늘의 날씨</td>
	</tr>
	<tr>
		<td>${currentTime}</td>
	</tr>
	<tr>
		<td>
			날씨 : <img src="${wiconUrl}" alt="Weather Icon"> / ${ description }
		</td>
	</tr>
	<tr>
		<td>현재 온도 : ${ temperature }</td>
	</tr>
	<tr>
		<td>체감 온도 : ${ feelTemperature }</td>
	</tr>
	<tr>
		<td>
			<c:if test="${ temperature <= 4.0 }">
				추천 옷 : 패딩, 두꺼운코트, 목도리, 기모제품
			</c:if>
			<c:if test="${ temperature > 4.0 && temperature <= 8.0 }">
				추천 옷 : 코트, 가죽자켓, 히트텍, 니트, 레깅스
			</c:if>
			<c:if test="${ temperature > 8.0 && temperature <= 12.0 }">
				추천 옷 : 자켓, 트렌치코트, 야상, 니트, 청바지, 스타킹
			</c:if>
			<c:if test="${ temperature > 12.0 && temperature <= 16.0 }">
				추천 옷 : 자켓, 가디건, 야상, 스타킹, 청바지, 면바지
			</c:if>
			<c:if test="${ temperature > 16.0 && temperature <= 19.0 }">
				추천 옷 : 얇은 니트, 맨투맨, 가디건, 청바지
			</c:if>
			<c:if test="${ temperature > 19.0 && temperature <= 22.0 }">
				추천 옷 : 얇은 가디건, 긴팔, 면바지, 청바지
			</c:if>
			<c:if test="${ temperature > 22.0 && temperature <= 27.0 }">
				추천 옷 : 반팔, 얇은 셔츠, 반바지, 면바지
			</c:if>
			<c:if test="${ temperature > 27.0 }">
				추천 옷 : 민소매, 반팔, 반바지, 원피스
			</c:if>
       </td>
	</tr>
</table>

<table border="1">
	<c:if test="${ fn:length(tempLists) == 0 }">
		<tr>
			<td>추천 스타일이 없습니다.</td>
		</tr>
	</c:if>
	<c:if test="${ fn:length(tempLists) != 0 }">
		<c:forEach var="styleBean" items="${ tempLists }">
			<tr>
				<td><img src="${ styleBean.image1 }"></td>
				<td>${ styleBean.title }</td>
				<td>${ styleBean.nickname }</td>
				<td>${ styleBean.write_date }</td>
			</tr>
		</c:forEach>
	</c:if>
</table>

    
<%@ include file="../main/bottom.jsp" %>