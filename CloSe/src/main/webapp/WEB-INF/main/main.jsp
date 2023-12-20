<%@page import="product.model.ProductBean"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file= "../main/top.jsp" %>

<style type="text/css">
   .body {
      width: 100%;
      margin: auto;
   }

   #par {
      position: relative;
   }

   #chi {
      position: absolute;
      left: 0px;
      top: 0px;
      opacity: 0.4;
   }

   #carouselExampleAutoplaying {
      max-width: 66%;
      /* 최대 너비 설정 */
      margin: auto;
      /* 가운데 정렬 */
   }
</style>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script type="text/javascript">
   $(document).ready(function () {
      var bsComponent = $(".bs-component");
      var initialPosition = bsComponent.offset().top;

      $(window).scroll(function () {
         var scrollPosition = $(window).scrollTop();
         var windowHeight = window.innerHeight;
         var elementHeight = bsComponent.outerHeight();

         // 스크롤이 일정 위치를 넘어가면 더 이상 조절하지 않음
         var newPosition = (windowHeight - elementHeight) / 2 + scrollPosition - initialPosition;

         console.log("scrollPosition:", scrollPosition);
         console.log("windowHeight:", windowHeight);
         console.log("elementHeight:", elementHeight);
         console.log("newPosition:", newPosition);

         // 새로운 top 위치를 부드러운 애니메이션으로 적용

   $.getJSON('https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=27f0e2dcc40e953d16644b55e897423d&units=metric',
	        function (result) {
	            var openWeatherTemperature = result.main.temp;
	            
	            $("#close").click(function(){
	            	alert("click");
	            	
	            	$.ajax({
	            		url: "/view.close",
	            		type: "get",
	            		data: {openWeatherTemperature:result.main.temp},
	            		success:function(data){
	            			alert("성공");
	            		},
	            		error:function(){
	            			alert("실패");
	            		}
	            	});
	            });
	            
	            var $ctemp = result.main.temp;
	            $('#ctemp').text(openWeatherTemperature + '°C');
	            var wiconUrl = '<img src="http://openweathermap.org/img/wn/' + result.weather[0].icon + '.png" alt="' + result.weather[0].description + '">';
	            $('.icon').html(wiconUrl);
	            $('#feel').text(result.main.feels_like + '°C');
	            $('#description').text(result.weather[0].description);

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
         bsComponent.stop().animate({"margin-top": newPosition + "px"}, 700);
       });
     });
   
   	 function orderdetails(member_id){
 		 location.href='list.orders?member_id='+member_id;
 	 }
   
   	 function productList(bigcate){
   		 alert(bigcate);
   		 location.href="list.product?bigcategory_name="+bigcate;
   	 }
</script>

<div class="body">

   <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-inner">
         <div class="carousel-item active">
            <img src="resources/img/logo.png"
               class="d-block w-100" alt="...">
         </div>
         <div class="carousel-item">
            <img src="resources/img/logo.png"
               class="d-block w-100" alt="...">
         </div>
         <div class="carousel-item">
            <img src="resources/img/logo.png"
               class="d-block w-100" alt="...">
         </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying"
         data-bs-slide="prev">
         <span class="carousel-control-prev-icon" aria-hidden="true"></span>
         <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying"
         data-bs-slide="next">
         <span class="carousel-control-next-icon" aria-hidden="true"></span>
         <span class="visually-hidden">Next</span>
      </button>
   </div>

   <div class="row">
      <div class="col-lg-2"></div>
      <div class="col-lg-8">
         <div class="album py-5">
            <div class="container">
               <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">

				  <a href="view.close" class="link-dark link-underline-opacity-0">
	                  <div class="col" align="center">
	                     <img class="bd-placeholder-img card-img-top" width="100%" height="120"
	                           style="border-radius: 20%;" id="par" src="resources/img/close.png">
	                     오늘의 옷비서
	                  </div>
                  </a>

				  <a href="#" class="link-dark link-underline-opacity-0">
	                  <div class="col" align="center">
	                     <img class="bd-placeholder-img card-img-top" src="resources/img/man.png" width="100%" height="120"
	                           style="border-radius: 20%;">
	                     남자 코디
	                  </div>
                  </a>

				  <a href="#" class="link-dark link-underline-opacity-0">
	                  <div class="col" align="center">
	                     <img class="bd-placeholder-img card-img-top" src="resources/img/woman.png" width="100%" height="120"
	                           style="border-radius: 20%;">
	                     여자 코디
	                  </div>
                  </a>

				  <a href="#" class="link-dark link-underline-opacity-0">
	                  <div class="col" align="center">
	                     <img class="bd-placeholder-img card-img-top" src="resources/img/weather.jpg" width="100%" height="120"
	                           style="border-radius: 20%;">
	                     계절별 코디
	                  </div>
                  </a>

				  <a href="#" class="link-dark link-underline-opacity-0">
	                  <div class="col" align="center">
	                     <img class="bd-placeholder-img card-img-top" src="resources/img/outer.avif" width="100%" height="120"
	                           style="border-radius: 20%;" onclick="productList('아우터')">
	                     아우터
	                  </div>
                  </a>
					
				  <a href="#" class="link-dark link-underline-opacity-0">
	                  <div class="col" align="center">
	                     <img class="bd-placeholder-img card-img-top" src="resources/img/top.png" width="100%" height="120"
	                           style="border-radius: 20%;" onclick="productList('상의')">
	                     상의
	                  </div>
                  </a>
                  
				  <a href="#" class="link-dark link-underline-opacity-0">
	                  <div class="col" align="center">
	                     <img class="bd-placeholder-img card-img-top" src="resources/img/bottom.png" width="100%" height="120"
	                           style="border-radius: 20%;" onclick="productList('하의')">
	                     하의
	                  </div>
                  </a>
                  
				  <a href="#" class="link-dark link-underline-opacity-0">
	                  <div class="col" align="center">
	                     <img class="bd-placeholder-img card-img-top" src="resources/img/shoes.png" width="100%" height="120"
	                           style="border-radius: 20%;" onclick="productList('신발')">
	                     신발
	                  </div>
                  </a>

               </div>
            </div>
         </div>

         <br>
         <hr>
         <br>

         <div>
            Most Popular <br>
            인기 상품 <br>
         </div>
         <div class="album py-5">
            <div class="container">
               <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">

                  <div class="col">
                     <div class="card shadow-sm">
                        <a><img class="bd-placeholder-img card-img-top" src="/pimages/" width="100%" height="225"></a>
                        <div class="card-body" align="center">

                        </div>
                     </div>
                  </div>

                  <div class="col">
                     <div class="card shadow-sm">
                        <a><img class="bd-placeholder-img card-img-top" src="/pimages/" width="100%" height="225"></a>
                        <div class="card-body" align="center">

                        </div>
                     </div>
                  </div>

                  <div class="col">
                     <div class="card shadow-sm">
                        <a><img class="bd-placeholder-img card-img-top" src="/pimages/" width="100%" height="225"></a>
                        <div class="card-body" align="center">

                        </div>
                     </div>
                  </div>

                  <div class="col">
                     <div class="card shadow-sm">
                        <a><img class="bd-placeholder-img card-img-top" src="/pimages/" width="100%" height="225"></a>
                        <div class="card-body" align="center">

                        </div>
                     </div>
                  </div>

               </div>
            </div>
         </div>

         <br>
         <hr>
         <br>

         <div>
            Style <br>
            코디 모음 <br>
         </div>
         <div class="album py-5 bg-body-tertiary">
            <div class="container">
               <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">

                  <div class="col">
                     <div class="card shadow-sm">
                        <a><img class="bd-placeholder-img card-img-top" src="/pimages/" width="100%" height="225"></a>
                        <div class="card-body" align="center">

                        </div>
                     </div>

                  </div>

                  <div class="col">
                     <div class="card shadow-sm">
                        <a><img class="bd-placeholder-img card-img-top" src="/pimages/" width="100%" height="225"></a>
                        <div class="card-body" align="center">

                        </div>
                     </div>
                  </div>

                  <div class="col">
                     <div class="card shadow-sm">
                        <a><img class="bd-placeholder-img card-img-top" src="/pimages/" width="100%" height="225"></a>
                        <div class="card-body" align="center">

                        </div>
                     </div>
                  </div>

                  <div class="col">
                     <div class="card shadow-sm">
                        <a><img class="bd-placeholder-img card-img-top" src="/pimages/" width="100%" height="225"></a>
                        <div class="card-body" align="center">

                        </div>
                     </div>
                  </div>

               </div>
            </div>
         </div>
      </div>

      <div class="col-lg-2 mt-5 px-5">
         <div class="bs-component">
            <div class="card mb-3">
               <h3 class="card-header" align="center">오늘의 날씨</h3>
               <div class="card-body">
                  <h5 class="card-title time">Special title treatment</h5>
                  <p class="card-text">현재 온도 : <span id="ctemp"></span></p>
                  <p class="card-text">체감 온도 : <span id="feel"></span></p>
                  <p class="card-text">날씨 : <span id="description"></span></p>
                  <div class="icon"></div>
               </div>
            </div>
         </div>
      </div>
      
   </div>

   <div class="col-lg-2">
   		<button onclick="location.href='register.product'">상등</button>
   		<button onclick="location.href='detail.product?product_number=1'">상품상세</button>
   		<button onclick="orderdetails('kim')">주문내역</button>
   </div>


 </div> 


<%@ include file="../main/bottom.jsp" %>