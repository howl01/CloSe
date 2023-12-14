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
	
	.result {
		list-style-type: none; /* 이 부분이 li 요소 앞에 나타나는 점을 없애는 스타일입니다. */
		cursor: pointer;
	}
	
	.result ul {
	    padding: 0 !important;
	    margin: 0 !important;
	}
	
	
</style>

<script type="text/javascript">
$(document).ready(function () {
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
                        var html = "<ul>";
                        var jsonArray = JSON.parse(json);
                        $.each(jsonArray, function (index, item) {
                            html += "<li class='result' style='cursor:pointer;'>" + item.image + item.product_name + item.price + item.smallcategory_name + "</li>";
                        });
                        html += "</ul>";
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

    $(document).on('click', ".result", function () {
        var word = $(this).text();
        $("#searchWord2").val(word);
        $("#displayList2").hide();
   	});
});

	function updatePreview() {
	    var fileInput = document.querySelector('input[type=file]');
	    var files = fileInput.files;
	
	    var previewContainer = document.querySelector('.preview-container');
	    previewContainer.innerHTML = ""; // Clear previous previews
	
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
            
            previewContainer.style.width = '30vw';
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
	        
	        carouselContainer.style.width = '30vw';
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
	}
	
	const clothingMap = new Map();

	   <c:forEach var="category" items="${clists}">
	      clothingMap.set('${category.smallcategory_name}','${category.bigcategory_name}');
	   </c:forEach>
	   
	   
	   const set1 = new Set();
	   
	   for (const [key, value] of clothingMap) {
	      set1.add(value);
	   } 
	   
	   
	    const firstSelect = document.getElementById("firstSelect");
	     for (const value of set1) {
	         const option = document.createElement("option");
	         option.value = value;
	         option.text = value;
	        if(value == clothingMap.get("${productBean.smallcategory_name}")){
	           option.selected = true;
	        }
	         firstSelect.add(option);
	        updateSecondSelect();
	     }
	     
	   
	     function updateSecondSelect() {
	         const firstSelect = document.getElementById("firstSelect");
	         const secondSelect = document.getElementById("secondSelect");
	         const selectedCategory = firstSelect.value;

	         // 이전 옵션 지우기
	         secondSelect.innerHTML = '';

	         // 선택한 카테고리에 기반하여 동적으로 옵션 추가
	         for (const [key, value] of clothingMap) {
	             if (value === selectedCategory) {
	                 const option = document.createElement("option");
	                 option.value = key;
	                 option.text = key;
	                 if(key == "${productBean.smallcategory_name}"){
	                   option.selected = true;
	                }
	                 secondSelect.add(option);
	             }
	         }
	     }
	     
	    function handleFileSelection() {
	         var fileInput = document.getElementById("file2");
	         var fileSelectionMessage = document.getElementById("fileSelectionMessage");
	         var selectedFileName = document.getElementById("selectedFileName");

	         if (fileInput.files.length > 0) {
	             fileSelectionMessage.innerHTML = "선택된 파일: " + fileInput.files[0].name;
	         } else {
	             fileSelectionMessage.innerHTML = ""; // 파일이 선택되지 않은 경우 초기화
	         }
	    }
	     
	     
	     function NumerInput(fieldName) { //숫자칸에는 숫자만 들어가게
	           var inputField = document.getElementsByName(fieldName)[0];
	           var inputValue = inputField.value;
	           var numericValue = inputValue.replace(/[^0-9]/g, '');
	           inputField.value = numericValue;
	    }
	     
</script>



<div class="body">
	
	<div class="row d-flex justify-content-center">
		<div class="col-lg-2"></div>
      
		<div class="col-lg-6">
		<form:form name="f" commandName="styleBean" action="insert.style" method="post" enctype="multipart/form-data">
			<h3 style="padding: 22 0 22 0">Style Write</h3>
		
			<div class="row productrow" style="border-top: 3px solid;"> 
   				<div class="col-2 align-self-center" style="white-space: nowrap;">
   					<span>상품이미지<font color="red">*</font></span>
				</div>
				<div class="col-2"></div>
				<div class="col-6 align-self-center">
		        	<div><input class="form-control" type="file" name="image" multiple accept="image/*" onchange="updatePreview()"></div>
			    <div class="preview-container"></div>
			    <div id="carouselExampleIndicators" class="carousel carousel-dark slide">
			    	<div class="carousel-indicators"></div>
			        <div class="carousel-inner"></div>
			    </div>
				<div>
				   <form:errors path="image" cssClass="err"/>
				   </div>
				</div>
				<div class="col-2"></div>
			</div>
	
			<div class="row productrow">
				<div class="col-2 align-self-center" style="white-space: nowrap;">
				<span>상품태그</span>
				</div>
				<div class="col-2"></div>
				<div class="col-6 align-self-center">
					<div><input type="text" class="form-control mb-1" id="searchWord2" name="searchWord2" autocomplete= 'off' placeholder="브랜드, 상품명을 검색하세요." ></div>
					<div id="displayList2" style="overflow: auto; border-top: 0px;"></div>
				</div>
				<div class="col-2"></div>
			</div>

	<div class="row productrow">
	    <div class="col-2 align-self-center" style="white-space: nowrap;">
			<span>제목</span>
	    </div>
	    <div class="col-2"></div>
	    <div class="col-6 align-self-center">
			<input type="text" class="form-control mb-1" name="title" 
                    placeholder="비워두시면 내용으로 대체됩니다.">
                <div>
                    <form:errors path="price" cssClass="err"/>
              </div>      
	    </div>
	    <div class="col-2"></div>
	</div>
	
	<div class="row productrow">
	    <div class="col-2 align-self-center" style="white-space: nowrap;">
			<span>내용<font color="red">*</font></span>
	    </div>
	    <div class="col-2"></div>
	    <div class="col-6 align-self-center">
			<textarea class="form-control mb-1" name="content" placeholder="자유롭게 작성하시면 됩니다.&#13;&#10;(#해시태그도 OK)" rows="5" style="resize: none;"></textarea>
                <div>
                    <form:errors path="price" cssClass="err"/>
              </div>      
	    </div>
	    <div class="col-2"></div>
	</div>
	
	<div class="row productrow" style="border-bottom: 3px solid;">
        <div class="col-2 align-self-center" style="white-space: nowrap;">
           <span>스타일<font color="red">*</font></span>
        </div>
        <div class="col-2"></div>
        <div class="col-6 align-self-center">
        	<c:set var="styleList">로맨틱, 모던, 미니멀, 빈티지, 스트릿, 스포티, 아메카지, 캐주얼, 클래식</c:set>
			<c:forEach var="style" items="${styleList}">
			    <input type="checkbox" class="btn-check" id="btn-${style}" autocomplete="off" name="style">
			    <label class="btn btn-outline-dark" for="btn-${style}" style="margin-right: 2px; margin-bottom: 4px;">${style}</label>
			</c:forEach>
           <div>
              <form:errors path="temperature" cssClass="err"/>
           </div>
        </div>
        <div class="col-2"></div>
     </div>
              <div style="padding-top: 15; float: right;">
                 
	</div>
	
	<div class="row py-3">
	<div class="d-flex justify-content-center" style="margin: auto;">
		<div style="margin-right: 5px;"><button type="button" class="btn btn-dark" onclick="submitForm()">등록</button></div>
		<div><button type="button" class="btn btn-dark">취소</button></div>
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
