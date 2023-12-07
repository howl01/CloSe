<%@page import="category.model.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<script src="resources/js/bootstrap.bundle.min.js"></script>
<script src="resources/js/jquery.js"></script>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">

<style>
	.overlay {
      display: none; /* 초기에는 배경 숨김 */
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(255, 255, 255); /* 반투명한 검은 배경 */
      z-index: 1200;
   	}
   
    @font-face {
      font-family: 'Hahmlet-VariableFont_wght.ttf';
      src: url('resources/font/Hahmlet-VariableFont_wght.ttf.ttf') format('woff');
      src: url('resources/font/Hahmlet-VariableFont_wght.ttf.ttf') format('woff2');
    }

    body {
      font-family: 'Hahmlet-VariableFont_wght.ttf', sans-serif;
      font-size: 12pt;
      font-weight: 600;
    }
</style>

<script type="text/javascript">
   function goLogin() {
      location.href = "login.member";
   }
   
   function search() {
	      var overlay = document.getElementById('overlay');
	      overlay.style.display = 'block';
	   }
	function hideOverlay() {
	      var overlay = document.getElementById('overlay');
	      overlay.style.display = 'none';
	}
</script>

<div id="overlay" class="overlay">
<a href="javascript:hideOverlay()">
<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="black" class="bi bi-x-square" viewBox="0 0 16 16" style="float: right;">
  <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
</svg>
</a>
</div>
<div class="sticky-top">
<div class="px-3 py-2 bg-white">
   <div class="container" style="width:66%;">
      <div
         class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
         <a href="/main/main_normal_home.jsp"
            class="d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none">
            <img src="resources/img/logo.png" class="bi me-2" width="280"
            height="60" role="img" aria-label="#home">
         </a>

         <ul
            class="nav col-12 col-lg-auto my-2 justify-content-center my-md-0">
            <li><a href="javascript:goLogin()" class="nav-link text-black"> <img
                  src="resources/icon/person.svg" class="bi d-block mx-auto mb-1"
                  width="30" height="30"> <font size="2">로그인</font>
            </a></li>
            
            <li><a href="javascript:goLogin()" class="nav-link text-black"> <img
                  src="resources/icon/cart.svg" class="bi d-block mx-auto mb-1" width="30"
                  height="30" style="margin-top: 1px;"> <font size="2">장바구니</font>
            </a></li>
            
            <li><a href="javascript:search()" class="nav-link text-black"> 
            <svg src xmlns="http://www.w3.org/2000/svg" class="bi d-block mx-auto mb-1" width="28" height="28" style="margin-top: 2.5px;" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  			<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
			</svg> <font size="2">검색</font>
            </a></li>
            

         </ul>
      </div>
   </div>
</div>

<nav class="py-2 bg-white border-bottom">
    <div class="container d-flex flex-wrap" style="width:66%;">
      <ul class="nav me-auto">
        <li class="nav-item"><a href="javscript:void(0);" onclick="goLogin()" class="nav-link link-body-emphasis px-2">HOME</a></li>
        <li class="nav-item"><a href="javscript:void(0);" onclick="goLogin()" class="nav-link link-body-emphasis px-2">오늘의 옷비서</a></li>
        <li class="nav-item"><a href="javscript:void(0)" onclick="goLogin()" class="nav-link link-body-emphasis px-2">STYLE</a></li>
        <li class="nav-item"><a href="javscript:void(0)" onclick="goLogin()" class="nav-link link-body-emphasis px-2">SHOP</a></li>
        <li class="nav-item"><a href="javscript:void(0)" onclick="goLogin()" class="nav-link link-body-emphasis px-2">EVENT</a></li>
      </ul>
      <ul class="nav">
        <li class="nav-item"><a href="javscript:void(0)" onclick="goLogin()" class="nav-link link-body-emphasis px-2"><font size="2">고객센터</font></a></li>
      </ul>
    </div>
  </nav>
</div>