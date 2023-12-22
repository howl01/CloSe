<%@page import="category.model.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%@ include file="../common/common.jsp" %>

<script src="resources/js/bootstrap.bundle.min.js"></script>
<script src="resources/js/jquery.js"></script>
<script src="resources/js/sidebars.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/sidebars.css" rel="stylesheet">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
   function goLogin() {
      location.href = "login.member";
   }
   function goLogout() {
      location.href = "logout.jsp";
   }
   function goKakaoLogin() {
      location.href = "kakaologin.member";
   }
   
   Kakao.init('2cdf0145ab332ff37556bbc8268b13a1');
   function kakaoLogout() {
	    if (Kakao.Auth.getAccessToken()) {
	      Kakao.API.request({
	        url: '/v1/user/unlink',
	        success: function (response) {
	        	console.log(response)
	        	alert('로그아웃 되었습니다.');
				location.href = 'kakaologout.jsp';

	        },
	        fail: function (error) {
	          console.log(error)
	        },
	      })
	      Kakao.Auth.setAccessToken(undefined)
	    }
	}

   function goLoginOrKakaoLogin() {
	    if (${not empty loginInfo}) {
	        goLogout();
	    } else if (${not empty kakaoLoginInfo}) {
	    	goKakaoLogin();
	    }
	}

	function goLogoutOrKakaoLogout() {
	    if (${not empty loginInfo}) {
	        goLogout();
	    } else if (${not empty kakaoLoginInfo}) {
	    	kakaoLogout();
	    }
	}
	
	function goQna(){ //고객센터
	    location.href = "list.qna";
	}
	function goNotice(){ //공지사항
	    location.href="list.notice";
	}
	
	function goMyPage(){
		location.href="mypage.member";
	}
	
	   	function search() {
	       var overlay = document.getElementById('overlay');
	       overlay.style.display = 'block';
	    }
	   	function hideOverlay() {
	   		var overlay = document.getElementById('overlay');
	   		overlay.style.display = 'none';
		 }
	   	
	   	
	   	$(document).ready(function () {
	   	    // 페이지 로드 시 최근 검색어 목록을 가져와서 업데이트
	   	    var recentSearchList = JSON.parse(localStorage.getItem("recentSearchList")) || [];
	   	    updateRecentSearchList(recentSearchList);

	   	    $("#searchWord").on("input", function () {
	   	        var searchWord = $(this).val().trim();
	   	        if (searchWord.length === 0) {
	   	            $("#displayList").hide();
	   	        } else {
	   	            $.ajax({
	   	                url: "wordSearchShow.main",
	   	            	method: "get",
	   	                data: {"searchWord": searchWord},
	   	                dataType: "text",
	   	                success: function (json) {
	   	                    if (json.length > 0) {
	   	                        var html = "<ul>";
	   	                        var jsonArray = JSON.parse(json);
	   	                        $.each(jsonArray, function (index, item) {
	   	                            html += "<li class='result' style='cursor:pointer;'>" + item.word + "</li>";
	   	                        });
	   	                        html += "</ul>";
	   	                        var inputWidth = $("#searchWord").css("width");
	   	                        $("#displayList").css({"width": inputWidth});
	   	                        $("#displayList").html(html);
	   	                        $("#displayList").show();
	   	                    }
	   	                },
	   	                error: function (jqXHR, textStatus, errorThrown) {
	   	                    console.error("AJAX Error:", textStatus, errorThrown);
	   	                    alert("검색 중 오류가 발생했습니다. 자세한 내용은 콘솔을 확인하세요.");
	   	                }
	   	            });
	   	        }
	   	    });
	   	    
	   		// 전체 지우기 버튼 클릭 이벤트 핸들러
	   	    $("#clearAllBtn").on("click", function () {
	   	        // 로컬 스토리지에서 최근 검색어 목록을 제거
	   	        localStorage.removeItem("recentSearchList");

	   	        // 최근 검색어 목록 업데이트
	   	        updateRecentSearchList([]);
	   	    });

	   	    $(document).on('click', ".result", function () {
	   	        var word = $(this).text();
	   	        $("#searchWord").val(word);
	   	        $("#displayList").hide();
	   	    	});
	   		});
	   		
		//검색어 저장 함수
		function saveToLocalStorage() {
		    var searchWord = $("#searchWord").val().trim();
		    if (searchWord.length > 0) {
		        // 로컬 스토리지에서 최근 검색어 목록을 읽어옴
		        var recentSearchList = JSON.parse(localStorage.getItem("recentSearchList")) || [];
		
		        // 중복 확인
		        var existingIndex = recentSearchList.indexOf(searchWord);
		        if (existingIndex !== -1) {
		            // 중복된 검색어가 이미 있다면 삭제
		            recentSearchList.splice(existingIndex, 1);
		        }
		
		        // 최근 검색어 목록에 추가
		        recentSearchList.push(searchWord);
		
		        // 로컬 스토리지에 최근 검색어 목록을 저장
		        localStorage.setItem("recentSearchList", JSON.stringify(recentSearchList));
		
		        // 최근 검색어 목록 업데이트
		        updateRecentSearchList(recentSearchList);
		    }
		
		    // 검색 버튼 클릭 시 페이지 이동을 방지하기 위해 false 반환
		    return false;
		}
		
		// 최근 검색어 목록 업데이트 함수
		function updateRecentSearchList(list) {
		    var recentSearchListElement = $("#recentSearchList");
		    recentSearchListElement.empty(); // 목록 초기화
		    for (var i = 0; i < list.length; i++) {
		           // 각 검색어 옆에 지우기 버튼 추가
		           recentSearchListElement.append("<li>" + list[i] +
		               "<button class='delete-btn' data-word='" + list[i] + "'>삭제</button></li>");
		       }
		}
		
			// 검색어 삭제 버튼 클릭 시
		   $(document).on('click', ".delete-btn", function (event) {
		       event.stopPropagation(); // 부모 클릭 방지
		       var wordToDelete = $(this).data("word");
		
		       // 로컬 스토리지에서 최근 검색어 목록을 읽어옴
		       var recentSearchList = JSON.parse(localStorage.getItem("recentSearchList")) || [];
		
		       // 해당 검색어 삭제
		       var indexToDelete = recentSearchList.indexOf(wordToDelete);
		       if (indexToDelete !== -1) {
		           recentSearchList.splice(indexToDelete, 1);
		           localStorage.setItem("recentSearchList", JSON.stringify(recentSearchList));
		           updateRecentSearchList(recentSearchList);
		       }
		   });
</script>

<style>
	.overlay {
      display: none;
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(255, 255, 255); /* 반투명한 검은 배경 */
      z-index: 1200;
   	}
   
    @font-face {
      font-family: 'IBMPlexSansKR-Regular';
      src: url('resources/font/IBMPlexSansKR-Regular.ttf') format('woff');
      src: url('resources/font/IBMPlexSansKR-Regular.ttf') format('woff2');
    }

    body {
      font-family: 'IBMPlexSansKR-Regular', sans-serif;
      font-size: 12pt;
      font-weight: 500;
    }
    .border{
    	border: none;
    }
</style>


<div id="overlay" class="overlay">
	<a href="javascript:hideOverlay()">
	<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="black" class="bi bi-x-lg" viewBox="0 0 16 16" style="float: right; margin-right: 20px; margin-top: 20px;">
	  <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
	</svg>
	</a>
	<br><br>
	<form action="view.main" onsubmit="return saveToLocalStorage()" name="searchForm" method="get">
	   <div class="d-flex justify-content-center border-bottom border-dark" style="width: 50%; margin: auto; padding-bottom: 10px;">
	      <div><input type="text" id="searchWord" name="searchWord" autocomplete= 'off' placeholder="카테고리, 상품명 등" style="border: none; outline: none; width: 500px;"></div>
	      <div><input type="image" src="resources/icon/search.svg" style="width: 25px; height: 25px;"></div>
	   </div>
	</form>
	<div id="displayList" style="border: solid 1px gray; height: 100px; overflow: auto; margin-left: 77px; margin-top: -1px; border-top: 0px;"></div>
	<div class="d-flex justify-content-start" style="border: none; outline: none; width: 555px; margin-left: 410px; ">
      <!-- 최근 검색어를 출력하는 부분 추가 -->
		<div id="recentSearchDiv">
		    최근 검색어 <button id="clearAllBtn">전체 삭제</button>
		    <ul id="recentSearchList"></ul>
		</div>
	</div>
</div>

<div class="sticky-top">
<div class="px-3 py-2 bg-white">
   <div class="container" style="width:66%;">
      <div
         class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
         <a href="view.main"
            class="d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none">
            <img src="resources/img/logo.png" class="bi me-2" width="280"
            height="60" role="img" aria-label="#home">
         </a>

         <ul class="nav col-12 col-lg-auto my-2 justify-content-center my-md-0">
            <li>
	            <c:if test="${empty loginInfo and empty kakaoLoginInfo}">
				    <a href="javascript:goLogin()" class="nav-link text-black"> 
				        <img src="resources/icon/box-arrow-in-right.svg" class="bi d-block mx-auto mb-1" width="30" height="30"> 
				        <font size="2">로그인</font>
				    </a>
				</c:if>
				
				<c:if test="${not empty loginInfo or not empty kakaoLoginInfo}">
				    <a href="javascript:goLogoutOrKakaoLogout()" class="nav-link text-black"> 
				        <img src="resources/icon/box-arrow-left.svg" class="bi d-block mx-auto mb-1" width="30" height="30"> 
				        <font size="2">로그아웃</font>
				    </a>
				</c:if>
            </li>
            
            <li>
               <c:if test="${not empty loginInfo or not empty kakaoLoginInfo}">
               <c:if test="${ loginInfo.member_id != 'admin' }">
                <a href="javascript:goMyPage()" class="nav-link text-black"> 
                    <img src="resources/icon/person.svg" class="bi d-block mx-auto mb-1" width="30" height="30"> 
                    <font size="2">마이페이지</font>
                </a>
               </c:if>
               <c:if test="${ loginInfo.member_id == 'admin' }">
                <a href="adminPage.member" class="nav-link text-black"> 
                    <img src="resources/icon/person.svg" class="bi d-block mx-auto mb-1" width="30" height="30"> 
                    <font size="2">관리자페이지</font>
                </a>
               </c:if>
            	</c:if>
            </li>
            
            <li>
            	<c:if test="${empty loginInfo and empty kakaoLoginInfo}">
	               <a href="javascript:goLogin()" class="nav-link text-black"> 
	                  <img src="resources/icon/cart.svg" class="bi d-block mx-auto mb-1" width="30" height="30" style="margin-top: 1px;"> 
	                  <font size="2">장바구니</font>
	               </a>
                </c:if>
                
                <c:if test="${not empty loginInfo or not empty kakaoLoginInfo}">
	               <a href="javascript:goLogin()" class="nav-link text-black"> 
	                  <img src="resources/icon/cart.svg" class="bi d-block mx-auto mb-1" width="30" height="30" style="margin-top: 1px;"> 
	                  <font size="2">장바구니</font>
	               </a>
                </c:if>
            </li>
            
            <li>
               <a href="javascript:search()" class="nav-link text-black"> 
               <svg src xmlns="http://www.w3.org/2000/svg" class="bi d-block mx-auto mb-1" width="28" height="28" style="margin-top: 2.5px;" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                 <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
            </svg> 
            <font size="2">검색</font>
               </a>
            </li>
         </ul>
      </div>
   </div>
</div>

<nav class="mb-2 py-2 bg-white border-bottom">
    <div class="container d-flex flex-wrap" style="width:66%;">
      <ul class="nav me-auto">
      	<c:if test="${empty loginInfo and empty kakaoLoginInfo}">
	        <li class="nav-item"><a href="javscript:goLogin()" onclick="goLogin()" class="nav-link link-body-emphasis px-2">HOME</a></li>
	        <li class="nav-item"><a href="javscript:void(0);" onclick="goLogin()" class="nav-link link-body-emphasis px-2">오늘의 옷비서</a></li>
	        <li class="nav-item"><a href="mainView.style" class="nav-link link-body-emphasis px-2">STYLE</a></li>
	        <li class="nav-item"><a href="list.product" class="nav-link link-body-emphasis px-2">SHOP</a></li>
	        <li class="nav-item"><a href="javscript:void(0)" onclick="goLogin()" class="nav-link link-body-emphasis px-2">EVENT</a></li>
      	</c:if>
      	<c:if test="${not empty loginInfo or not empty kakaoLoginInfo}">
      		<li class="nav-item"><a href="view.main" class="nav-link link-body-emphasis px-2">HOME</a></li>
	        <li class="nav-item"><a href="javscript:void(0);" onclick="goLogin()" class="nav-link link-body-emphasis px-2">오늘의 옷비서</a></li>
	        <li class="nav-item"><a href="mainView.style" class="nav-link link-body-emphasis px-2">STYLE</a></li>
	        <li class="nav-item"><a href="javscript:void(0)" onclick="goLogin()" class="nav-link link-body-emphasis px-2">SHOP</a></li>
	        <li class="nav-item"><a href="javscript:void(0)" onclick="goLogin()" class="nav-link link-body-emphasis px-2">EVENT</a></li>
      	</c:if>
      </ul>
      <ul class="nav">
      	<c:if test="${not empty loginInfo}">
      		<li class="nav-item" style="margin-top: 4px;"><font size="2" color="green">${loginInfo.name} 님 환영합니다.</font> &nbsp;</li>
      	</c:if>
      	<c:if test="${not empty kakaoLoginInfo}">
      		<li class="nav-item" style="margin-top: 4px;"><font size="2" color="green">${kakaoLoginInfo.name} 님 환영합니다.</font> &nbsp;</li>
      	</c:if>
      	<li class="nav-item"><a href="javascript:goNotice()" class="nav-link link-body-emphasis px-2"><font size="2">공지사항</font></a></li>
        <li class="nav-item"><a href="javascript:goQna()" class="nav-link link-body-emphasis px-2"><font size="2">고객센터</font></a></li>
      </ul>
    </div>
  </nav>
</div>