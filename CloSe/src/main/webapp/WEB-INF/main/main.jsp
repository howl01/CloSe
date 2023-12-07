<%@page import="product.model.ProductBean"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file= "../main/top.jsp" %>

<style type = "text/css">
   .body{
      width: 100%;
      margin: auto;
   }
   #par{
      position: relative;
   }
   #chi{
      position: absolute;
      left: 0px;
      top: 0px;
      opacity: 0.4;
   }
   #carouselExampleAutoplaying {
       max-width: 66%; /* 최대 너비 설정 */
       margin: auto; /* 가운데 정렬 */
     }
</style>
<script type="text/javascript">
   $(document).ready(function(){
       var bsComponent = $(".bs-component");
       var initialPosition = bsComponent.offset().top;
   
       $(window).scroll(function() {
         var scrollPosition = $(window).scrollTop();
         var windowHeight = $(window).height();
         var elementHeight = bsComponent.outerHeight();
   
         // 새로운 top 위치 계산하여 요소를 수직으로 중앙에 배치
         var newPosition = (windowHeight - elementHeight) / 2 + scrollPosition - initialPosition;
   
         // 새로운 top 위치를 부드러운 애니메이션으로 적용
         bsComponent.stop().animate({"margin-top": newPosition + "px"}, 700);
       });
     });
</script>

<div class = "body">


<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="//cdn-mart.baemin.com/inventory-unit/d3f87c07-c411-4c22-a17c-0db6cc9a5bed.jpg?w=1080" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="https://cdn-mart.baemin.com/inventory-unit/92e7b4b2-897e-4498-9bd2-9f4f545c2928.jpg?w=1080" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="https://cdn-mart.baemin.com/inventory-unit/04624c21-af52-4a3e-a7f7-5f7b920f41c4.jpg?w=1080" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<div class="row">
   <div class="col-lg-2"></div>
<div class="col-lg-8">
<div class="album py-5 bg-body-tertiary">
    <div class="container">
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">
      
      	<div class="col" align="center">
         <a><img class="bd-placeholder-img card-img-top" style="width: 150px; height: 150px; border-radius: 50%;" id = "par" src = "resources/img/abc.jpeg" ></a>
         오늘의 옷비서
          </div>
        
        <div class="col" align="center">
            <a><img class="bd-placeholder-img card-img-top" src = "/pimages/" width="100%" height="120"></a>
               남자 코디
            </div>
        
        <div class="col" align="center">
            <a><img class="bd-placeholder-img card-img-top" src = "/pimages/" width="100%" height="120"></a>
               여자 코디
            </div>
            
        <div class="col" align="center">
            <a><img class="bd-placeholder-img card-img-top" src = "/pimages/" width="100%" height="120"></a>
               계절별 코디
        </div>
        
        <div class="col" align="center">
            <a><img class="bd-placeholder-img card-img-top" src = "/pimages/" width="100%" height="120"></a>
               아우터
        </div>
        
        <div class="col" align="center">
            <a><img class="bd-placeholder-img card-img-top" src = "/pimages/" width="100%" height="120"></a>
               상의
        </div>
        
        <div class="col" align="center">
            <a><img class="bd-placeholder-img card-img-top" src = "/pimages/" width="100%" height="120"></a>
               하의
        </div>
        
        <div class="col" align="center">
            <a><img class="bd-placeholder-img card-img-top" src = "/pimages/" width="100%" height="120"></a>
               신발
        </div>
        
        
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
  <div class="album py-5 bg-body-tertiary">
    <div class="container">
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">
      
      <div class="col">
          <div class="card shadow-sm">
            <a><img class="bd-placeholder-img card-img-top" src = "/pimages/" width="100%" height="225"></a>
            <div class="card-body" align="center">
               
            </div>
          </div>
        </div>
        
      <div class="col">
          <div class="card shadow-sm">
            <a><img class="bd-placeholder-img card-img-top" src = "/pimages/" width="100%" height="225"></a>
            <div class="card-body" align="center">
               
            </div>
          </div>
        </div>
        
      <div class="col">
          <div class="card shadow-sm">
            <a><img class="bd-placeholder-img card-img-top" src = "/pimages/" width="100%" height="225"></a>
            <div class="card-body" align="center">
               
            </div>
          </div>
        </div>
        
      <div class="col">
          <div class="card shadow-sm">
            <a><img class="bd-placeholder-img card-img-top" src = "/pimages/" width="100%" height="225"></a>
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
            <a><img class="bd-placeholder-img card-img-top" src = "/pimages/" width="100%" height="225"></a>
            <div class="card-body" align="center">
               
            </div>
          </div>
          
        </div>
        
      <div class="col">
          <div class="card shadow-sm">
            <a><img class="bd-placeholder-img card-img-top" src = "/pimages/" width="100%" height="225"></a>
            <div class="card-body" align="center">
               
            </div>
          </div>
        </div>
        
      <div class="col">
          <div class="card shadow-sm">
            <a><img class="bd-placeholder-img card-img-top" src = "/pimages/" width="100%" height="225"></a>
            <div class="card-body" align="center">
               
            </div>
          </div>
        </div>
        
      <div class="col">
          <div class="card shadow-sm">
            <a><img class="bd-placeholder-img card-img-top" src = "/pimages/" width="100%" height="225"></a>
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
                <h3 class="card-header">오늘의 날씨 정보</h3>
                <div class="card-body">
                  <h5 class="card-title">Special title treatment</h5>
                  <h6 class="card-subtitle text-muted">Support card subtitle</h6>
                </div>
                <svg xmlns="http://www.w3.org/2000/svg" class="d-block user-select-none" width="100%" height="200" aria-label="Placeholder: Image cap" focusable="false" role="img" preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180" style="font-size:1.125rem;text-anchor:middle">
                  <rect width="100%" height="100%" fill="#868e96"></rect>
                  <text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text>
                </svg>
              </div>
            </div>
        </div>
     </div>
 </div> 


<%@ include file="../main/bottom.jsp" %>