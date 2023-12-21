<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file= "../main/top.jsp" %>

<style>
	#styleNav {
	    font-size: 15pt;
	    font-weight: 700;
	    padding-top: 3px;
	}
	
	.preview-image {
	    width: 100%;
	    height: 39vw;
	}
	
	.carousel-item img {
	    width: 100%;
	    height: 39vw;
	}
	
	.carousel-indicators {
	    position: absolute;
	    transform: translateY(45px);
	}
	
	/* Carousel Indicators 스타일링 */
	.carousel-indicators [data-bs-target] {
		background-color: black;
		width: 7px;
  		height: 7px;
		border-radius:50%;
	}
	
	.body {
		width: 100vw;
		margin: auto;
	}

	#carouselExampleAutoplaying {
	   max-width: 66%; /* 최대 너비 설정 */
	   margin: auto; /* 가운데 정렬 */
	}

	.productrow {
	   border-bottom: 1px solid rgba(0, 0, 0, .1);
	   padding: 15 0 15 10;
	}
	.err{
		color: red;
		font-weight: bold;
		font-size: 9pt;
	}
	
	.col-2{
		text-align: center;
	}
	
	/* 이전(prev) 및 다음(next) 컨트롤 버튼의 아이콘 크기와 배경색 변경 */
	.carousel-control-prev-icon, .carousel-control-next-icon {
	  width: 30px; /* 아이콘 크기 지정 */
	  height: 30px; /* 아이콘 크기 지정 */
	  background-color: red; /* 배경색 지정 */
	  border-radius: 50%;
	}
	
	.list-group{
		margin-top: -5px; 
		border-top: 0px;
	}
	
	#displayList2_img{
		width:100px;
		height:100px;
	}
	
	#searchWord2{
	  background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="gray" class="bi bi-search" viewBox="0 0 16 16"><path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/></svg>');
	  background-position: 97%;
	  background-repeat: no-repeat;
	}
	
  	#pimage{
		width:6vw;
		height:9vh;
		margin: auto;
	}
	
	ol{
		font-size: 8pt;
	}
</style>

<script type="text/javascript">
var contextPath = '<%= request.getContextPath() %>';

//중복 체크 함수
function isProductNumberAlreadySet(productNumber) {
    for (var i = 1; i <= 4; i++) {
        var inputId = "#product_number" + i;
        console.log("Comparing:", $(inputId).val(), productNumber);
        if ($(inputId).val() === productNumber.toString()) {
            return true; // 중복된 경우 true 반환
        }
    }
    return false; // 중복이 아닌 경우 false 반환
}

function removeTagImage(productNumberIndex) {
    var tagImageDiv = document.getElementById('tagImage' + productNumberIndex);
    if (tagImageDiv) {
      // Remove the tagImage div
      tagImageDiv.parentNode.removeChild(tagImageDiv);

      // Reset the input value
      var inputElement = document.getElementById('product_number' + productNumberIndex);
      if (inputElement) {
        inputElement.value = ''; // You can set it to any default value if needed
      }
    }
  }


$(document).ready(function () {
	// 이미지 업로드, 내용 입력, 스타일 선택 여부에 따라 submit 버튼 활성화/비활성화
    function updateSubmitButton() {
        var imagesInput = $('input[name="images"]');
        var contentTextarea = $('textarea[name="content"]');
        var styleCheckboxes = $('input[name="style"]');
        var submitButton = $('button[type="submit"]');

        // 이미지 업로드, 내용 입력, 스타일 선택 여부 확인
        var isImagesSelected = imagesInput[0].files.length > 0;
        var isContentValid = contentTextarea.val().trim().length > 0;
        var isStyleSelected = styleCheckboxes.filter(':checked').length > 0;

        // 모든 조건을 만족하는 경우 submit 버튼 활성화, 그렇지 않으면 비활성화
        if (isImagesSelected && isContentValid && isStyleSelected) {
            submitButton.prop('disabled', false);
        } else {
            submitButton.prop('disabled', true);
        }
    }

    // 이미지, 내용, 스타일 변경 시 활성화/비활성화 여부 업데이트
    $('input[name="images"], textarea[name="content"], input[name="style"]').on('change', function () {
        updateSubmitButton();
    });

    // 폼 제출 시에도 한 번 더 업데이트
    $('form[name="f"]').submit(function () {
        updateSubmitButton();
    });

    // 초기 로딩 시에도 업데이트 수행
    updateSubmitButton();
	
	var bsComponent = $(".bs-component");
    var initialPosition = bsComponent.offset().top;

    $(window).scroll(function() {
      var scrollPosition = $(window).scrollTop();
      var windowHeight = window.innerHeight;
      var elementHeight = bsComponent.outerHeight();

      // 새로운 top 위치 계산하여 요소를 수직으로 중앙에 배치
      var newPosition = (windowHeight - elementHeight) / 2 + scrollPosition - initialPosition;

      // 새로운 top 위치를 부드러운 애니메이션으로 적용
      bsComponent.stop().animate({"margin-top": newPosition + "px"}, 700);
    });
    
    $("#searchWord2").on("input", function () {
        var searchWord2 = $(this).val().trim();
        if (searchWord2.length === 0) {
            $("#displayList2").hide();
        } else {
            $.ajax({
                url: "wordSearchShow.main",
                method: "post",
                data: {"searchWord2": searchWord2},
                dataType: "text",
                success: function (json) {
                    if (json.length > 0) {
                        var html = '<ol class="list-group" style="cursor:pointer;">';
                        var jsonArray = JSON.parse(json);
                        $(document).data('jsonArray', jsonArray);
                        $.each(jsonArray, function (index, item) {
                        	html += '<li class="list-group-item d-flex justify-content-between align-items-start">';
              			   	html += '<div><img id="displayList2_img" src="' + contextPath +"/resources/productImage/"+ item.image + '"></div>';
              			    html += '<div class="ms-2 me-auto my-auto">';
              			    html += '<div class="fw-bold">'+item.product_name+'</div>₩ '+item.price+'</div>';
              			    html += '<span class="badge bg-black rounded-pill my-auto">'+item.smallcategory_name+'</span></li>';
                        });
                        
                        html += '</ol>';
                        var inputWidth = $("#searchWord2").css("width");
                        $("#displayList2").css({"width": inputWidth});
                        $("#displayList2").html(html);
                        $("#displayList2").show();
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.error("AJAX Error:", textStatus, errorThrown);
                    alert("검색 중 오류가 발생했습니다. 자세한 내용은 콘솔을 확인하세요.");
                }
            });
        }
    });

    $(document).on('click', ".list-group-item d-flex", function () {
        var word = $(this).text();
        var jsonArray = $(document).data('jsonArray');
        var itemIndex = $(this).index(); // 클릭된 항목의 인덱스 가져오기
        var productNumber = jsonArray[itemIndex].product_number;
        var image = contextPath + "/resources/productImage/" + jsonArray[itemIndex].image;
        var price = jsonArray[itemIndex].price;
        var productName = jsonArray[itemIndex].product_name;
    
     	// 중복 체크
        if (isProductNumberAlreadySet(productNumber)) {
            alert("이미 선택된 제품입니다.");
            return; // 중복이면 추가 작업을 수행하지 않고 함수 종료
        }

        // 최대 4개까지의 hidden input에 값을 설정
        var isSet = false;
        for (var i = 1; i <= 4; i++) {
            var inputId = "#product_number" + i;
            if (!isSet && $(inputId).val() === "") {
                $(inputId).val(productNumber);
                $("#displayList2").hide(); // 예시에 따라 displayList1, displayList2, ... 가려주기
                isSet = true; // 값을 설정한 경우 isSet을 true로 변경
                
             // Assuming you have a container div with id 'tagImage'
                var tagImageContainer = $("#tagImage");

                // Create HTML elements for image, product_name, and price
                var imageElement = $("<img>").attr("src", image);
                var productNameElement = $("<div>").text(productName);
                var priceElement = $("<div>").text(price);
                var deleteButton = $("<button>").addClass("deleteButton").click(function() {
                	  // Remove the image and its related information
                	  $(this).parent().remove();

                	  // Remove the associated product_number
                	  $(inputId).val("");
                	});

                	// 이미지를 버튼에 추가
                	deleteButton.append('<img src="data:image/svg+xml,%3Csvg xmlns=\'http://www.w3.org/2000/svg\' width=\'16\' height=\'16\' fill=\'currentColor\' class=\'bi bi-x-square\' viewBox=\'0 0 16 16\'%3E%3Cpath d=\'M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z\'/%3E%3Cpath d=\'M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z\'/%3E%3C/svg%3E" alt="Close Icon">');

                // Append the elements to the container
                tagImageContainer.append(imageElement, productNameElement, priceElement, deleteButton);
                alert(inputId);
            }
        }

        // 4개 이상 클릭 시 알림 띄우기
        if (!isSet) {
            alert("최대 4개까지만 선택할 수 있습니다.");
        }

        // searchWord2 비우기
        $("#searchWord2").val("");
    });

});
	
	function updatePreview() {
	    var fileInput = document.querySelector('input[type=file]');
	    var files = fileInput.files;
	    
	    if (files.length > 5) {
            alert('최대 5개의 파일까지만 선택할 수 있습니다.');
            fileInput.value = ''; // 선택된 파일 초기화
        }
	
	    var previewContainer = document.querySelector('.preview-container');
	    previewContainer.innerHTML = ""; // Clear previous previews
		
	    var originalDisplay = previewContainer.style.display; // 현재 display 상태 저장

	    // Clear previous previews
	    while (previewContainer.firstChild) {
	        previewContainer.removeChild(previewContainer.firstChild);
	    }
	    
	    var carouselContainer = document.querySelector('.carousel');
	    carouselContainer.style.display = 'none'; // Hide carousel initially
	
	    var carouselInner = document.querySelector('.carousel-inner');
	    carouselInner.innerHTML = ""; // Clear previous slides
	
	    var carouselIndicators = document.querySelector('.carousel-indicators');
	    carouselIndicators.innerHTML = ""; // Clear previous indicators
	    
	    if (files.length === 1) {
            var img = document.createElement('img');
            img.src = URL.createObjectURL(files[0]);
            img.className = 'preview-image';
            
            previewContainer.appendChild(img);
            
            previewContainer.style.margin = 'auto';
            previewContainer.style.marginTop = '20px';
            previewContainer.style.marginBottom = '10px';
        } else if (files.length > 1) {
	        for (var i = 0; i < files.length; i++) {
	            var img = document.createElement('img');
	            img.src = URL.createObjectURL(files[i]);
	            img.className = 'd-block w-100';
	
	            var carouselItem = document.createElement('div');
	            carouselItem.className = (i === 0) ? 'carousel-item active' : 'carousel-item';
	            carouselItem.appendChild(img);
	
	            carouselInner.appendChild(carouselItem);
	
	            // Add indicator button
	            var indicatorButton = document.createElement('button');
	            indicatorButton.type = 'button';
	            indicatorButton.setAttribute('data-bs-target', '#carouselExampleIndicators');
	            indicatorButton.setAttribute('data-bs-slide-to', i.toString());
	            indicatorButton.setAttribute('aria-label', 'Slide ' + (i + 1));
	
	            if (i === 0) {
	                indicatorButton.className = 'active';
	                indicatorButton.setAttribute('aria-current', 'true');
	            }
	
	            carouselIndicators.appendChild(indicatorButton);
	        } 
	
	        // Show Carousel
	        carouselContainer.style.display = 'block';
	
	        // Add previous and next buttons
	        var prevButton = document.createElement('button');
	        prevButton.className = 'carousel-control-prev';
	        prevButton.type = 'button';
	        prevButton.setAttribute('data-bs-target', '#carouselExampleIndicators');
	        prevButton.setAttribute('data-bs-slide', 'prev');
	        prevButton.innerHTML = '<span class="carousel-control-prev-icon" aria-hidden="true"></span><span class="visually-hidden">Previous</span>';
	
	        var nextButton = document.createElement('button');
	        nextButton.className = 'carousel-control-next';
	        nextButton.type = 'button';
	        nextButton.setAttribute('data-bs-target', '#carouselExampleIndicators');
	        nextButton.setAttribute('data-bs-slide', 'next');
	        nextButton.innerHTML = '<span class="carousel-control-next-icon" aria-hidden="true"></span><span class="visually-hidden">Next</span>';
	
	        carouselContainer.appendChild(prevButton);
	        carouselContainer.appendChild(nextButton);
	        
	        carouselContainer.style.margin = 'auto';
	        carouselContainer.style.marginTop = '20px';
	        carouselContainer.style.marginBottom = '10px';
	    } else {
	        // No files selected, reset styles
	        previewContainer.style.width = '';
	        previewContainer.style.margin = '';
	        previewContainer.style.marginTop = '';
	        previewContainer.style.marginBottom = '';
	    }
	 	// 추가: form:errors가 발생하면 다시 보이도록 설정
	    var errors = document.querySelectorAll('.err');
	    if (errors.length > 0) {
	        previewContainer.style.display = originalDisplay; // 이전 상태로 복원
	        carouselContainer.style.display = 'block';
	    }
	}
</script>



<div class="body">
	
	<div class="row d-flex justify-content-center">
		<div class="col-lg-2"></div>
		<div class="col-lg-6">
		<form:form name="f" commandName="styleBean" action="update.style" method="post" enctype="multipart/form-data">
			<input type="hidden" name="member_id" <c:if test="${not empty loginInfo}">value="${loginInfo.member_id }"</c:if> <c:if test="${not empty kakaoLoginInfo}">value="${kakaoLoginInfo.member_id}"</c:if>>
			
			<h3 style="padding: 22 0 22 0">Style Write</h3>
		
			<div class="row productrow" style="border-top: 3px solid;"> 
   				<div class="col-2 align-self-center" style="white-space: nowrap;">
   					<span>코디 사진<font color="red">*</font><br>(최대 5장)</span>
				</div>
				<div class="col-2"></div>
				<div class="col-7 align-self-center">
		        	<div id="imgInput" >
		        		<input class="form-control" type="file" name="images" multiple accept="image/*" onchange="updatePreview()">
	        		</div>
			    <div class="preview-container"></div>
			    <div id="carouselExampleIndicators" class="carousel carousel-dark slide">
			    	<div class="carousel-indicators"></div>
			        <div class="carousel-inner"></div>
			    </div>
				<div>
			   </div>
				</div>
				<div class="col-2"></div>
			</div>
	
			<div class="row productrow">
				<div class="col-2 align-self-center" style="white-space: nowrap;">
				<span>상품태그<br>(최대 4개)</span>
				</div>
				<div class="col-2"></div>
				<div class="col-7 align-self-center" id="drop_the_text">
					<div><input type="text" class="form-control mb-1" id="searchWord2" name="searchWord2" autocomplete= 'off' placeholder="브랜드, 상품명을 검색하세요." ></div>
					<div id="displayList2" style="overflow: auto; border-top: 0px; margin-top: -4px;"></div>
					<div class="d-flex justify-content-start mt-3" id="tagImage">
						<ol class="list-group list-group-horizontal" style="width:100%;">
						<c:if test="${not empty styleBean.product_number1}">
							<li class="list-group-item me-3" id="tagimage1" style="width:25%; border-radius: 10%; padding: 5px; align-self: center;">
				   			   	<input type="hidden" name="product_number1" id="product_number1" value="${styleBean.product_number1}">
				   			   	<a href="javascript:removeTagImage(1)" style="float: right;">
					   			    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="black" class="bi bi-x-square" viewBox="0 0 16 16">
									  <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
									  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
									</svg>
								</a>
				   			   	<div style="text-align: center;"><img src="<%=request.getContextPath()%>/resources/productImage/${styleBean.pimage1}" id="pimage"></div>
				   			    <div class="ms-2 me-auto my-auto" style="text-align: center;">
					   			    <div>${fn:substringBefore(styleBean.product_name1,'/') }<br>${fn:substringAfter(styleBean.product_name1,'/') }</div>
					   			    <div class="fw-bold">
					   			    <fmt:formatNumber value="${styleBean.price1}" pattern="###,###원" />
					   			    </div>
				   			    </div>
							</li>
						</c:if>
						<c:if test="${not empty styleBean.product_number2}">
							<li class="list-group-item me-3" id="tagimage2" style="width:25%; border-left: 1px solid #dee2e6; border-radius: 10%; padding: 5px; align-self: center;">
				   			   	<input type="hidden" name="product_number2" id="product_number2" value="${styleBean.product_number2}">
				   			   	<a href="javascript:removeTagImage(2)" style="float: right;">
					   			    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="black" class="bi bi-x-square" viewBox="0 0 16 16">
									  <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
									  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
									</svg>
								</a>
				   			   	<div style="text-align: center;"><img src="<%=request.getContextPath()%>/resources/productImage/${styleBean.pimage2}" id="pimage"></div>
				   			    <div class="ms-2 me-auto my-auto" style="text-align: center;">
					   			    <div>${fn:substringBefore(styleBean.product_name2,'/') }<br>${fn:substringAfter(styleBean.product_name2,'/') }</div>
					   			    <div class="fw-bold">
					   			    	<fmt:formatNumber value="${styleBean.price2}" pattern="###,###원" />
					   			    </div>
				   			    </div>
							</li>
						</c:if>
						<c:if test="${not empty styleBean.product_number3}">
							<li class="list-group-item me-3" id="tagimage3" style="width:25%; border-left: 1px solid #dee2e6; border-radius: 10%; padding: 5px; align-self: center;">
				   			   	<input type="hidden" name="product_number3" id="product_number3" value="${styleBean.product_number3}">
				   			   	<a href="javascript:removeTagImage(3)" style="float: right;">
					   			    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="black" class="bi bi-x-square" viewBox="0 0 16 16">
									  <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
									  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
									</svg>
								</a>
				   			   	<div style="text-align: center;"><img src="<%=request.getContextPath()%>/resources/productImage/${styleBean.pimage3}" id="pimage"></div>
				   			    <div class="ms-2 me-auto my-auto" style="text-align: center;">
					   			    <div>${fn:substringBefore(styleBean.product_name3,'/') }<br>${fn:substringAfter(styleBean.product_name3,'/') }</div>
					   			    <div class="fw-bold">
					   			    	<fmt:formatNumber value="${styleBean.price3}" pattern="###,###원" />
					   			    </div>
				   			    </div>
							</li>
						</c:if>
						<c:if test="${not empty styleBean.product_number4}">
							<li class="list-group-item me-3" id="tagimage4" style="width:25%; border-left: 1px solid #dee2e6; border-radius: 10%; padding: 5px; align-self: center;">
			   			   		<input type="hidden" name="product_number4" id="product_number4" value="${styleBean.product_number4}">
			   			   		<a href="javascript:removeTagImage(4)" style="float: right;">
					   			    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="black" class="bi bi-x-square" viewBox="0 0 16 16">
									  <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
									  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
									</svg>
								</a>
			   			   		<div style="text-align: center;"><img src="<%=request.getContextPath()%>/resources/productImage/${styleBean.pimage4}" id="pimage"></div>
				   			    <div class="ms-2 me-auto my-auto" style="text-align: center;">
					   			    <div>${fn:substringBefore(styleBean.product_name4,'/') }<br>${fn:substringAfter(styleBean.product_name4,'/') }</div>
					   			    <div class="fw-bold">
										<fmt:formatNumber value="${styleBean.price4}" pattern="###,###원" />
									</div>
				   			    </div>
							</li>
						</c:if>	
						</ol>		
						</div>
					</div>
				<div class="col-2"></div>
			</div>

	<div class="row productrow">
	    <div class="col-2 align-self-center" style="white-space: nowrap;">
			<span>제목</span>
	    </div>
	    <div class="col-2"></div>
	    <div class="col-7 align-self-center">
			<input type="text" class="form-control mb-1" name="title" 
                    placeholder="비워두시면 내용으로 대체됩니다." value="${styleBean.title}">
	    </div>
	    <div class="col-2"></div>
	</div>
	
	<div class="row productrow">
	    <div class="col-2 align-self-center" style="white-space: nowrap;">
			<span>내용<font color="red">*</font></span>
	    </div>
	    <div class="col-2"></div>
	    <div class="col-7 align-self-center">
			<textarea class="form-control mb-1" name="content" placeholder="자유롭게 작성하시면 됩니다.&#13;&#10;(#해시태그도 OK)" rows="5" style="resize: none;">${styleBean.content}</textarea>
                <div>
              </div>      
	    </div>
	    <div class="col-2"></div>
	</div>
	
	<div class="row productrow" style="border-bottom: 3px solid;">
        <div class="col-2 align-self-center" style="white-space: nowrap;">
           <span>스타일<font color="red">*</font></span>
        </div>
        <div class="col-2"></div>
        <div class="col-7 align-self-center">
        	<c:set var="styleList">로맨틱, 모던, 미니멀, 빈티지, 스트릿, 스포티, 아메카지, 캐주얼, 클래식</c:set>
			<c:forEach var="style" items="${styleList}">
			    <input type="checkbox" class="btn-check" id="btn-${style}" autocomplete="off" name="style" value="${style}" <c:if test="${fn:contains(styleBean.style, style)}">checked</c:if>>
			    <label class="btn btn-outline-dark" for="btn-${style}" style="margin-right: 2px; margin-bottom: 4px;">${style}</label>
			</c:forEach>
           <div>
           </div>
        </div>
        <div class="col-2"></div>
     </div>
              <div style="padding-top: 15; float: right;">
                 
	</div>
	
	<div class="row py-3">
	<div class="d-flex justify-content-center" style="margin: auto;">
		<div style="margin-right: 5px;"><button type="submit" class="btn btn-dark">등록</button></div>
		<div><button type="button" class="btn btn-dark" onclick="location.href='mainView.style'">취소</button></div>
		</div>
	</div>
           </form:form>
           
  </div>

  <div class="col-2 mt-5 ps-5">
     <div class="bs-component">
        <div class="card mb-3">
           <h3 class="card-header">오늘의 날씨 정보</h3>
           <div class="card-body">
              <h5 class="card-title">Special title treatment</h5>
              <h6 class="card-subtitle text-muted">Support card subtitle</h6>
           </div>
           <svg xmlns="http://www.w3.org/2000/svg"
              class="d-block user-select-none" width="100%" height="200"
              aria-label="Placeholder: Image cap" focusable="false" role="img"
              preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180"
              style="font-size: 1.125rem; text-anchor: middle">
              <rect width="100%" height="100%" fill="#868e96"></rect>
              <text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text>
            </svg>
        </div>
     </div>
  </div>
  </div>
  
</div>

<%@ include file= "../main/bottom.jsp" %>
