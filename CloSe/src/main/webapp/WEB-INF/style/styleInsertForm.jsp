<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file= "../main/top.jsp" %>

<style>
	#styleNav {
	    font-size: 15pt;
	    font-weight: 700;
	    padding-top: 3px;
	}
	
	.preview-container {
	    width: 640px;
	    margin: auto;
	}
	
	.preview-image {
	    width: 100%;
	    max-height: 900px;
	    height: auto;
	}
	
	.carousel {
	    width: 640px;
	    margin: auto;
	}
	
	.carousel-item img {
	    width: 100%;
	    max-height: 900px;
	    height: auto;
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
</style>

<script type="text/javascript">
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
	
	    // If more than one file, create carousel previews
	    if (files.length > 1) {
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
	    }
	}
</script>

<body>
    <h2 align="center">코디 사진 선택</h2>
    <form enctype="multipart/form-data" style="text-align: center;">
    	<div class="form row">
    	<div class="form-group col-md-4 mx-auto">
        <input class="form-control" type="file" name="file" multiple accept="image/*" onchange="updatePreview()">
    	</div>
    	</div>
    </form>

    <div class="preview-container"></div>

    <div id="carouselExampleIndicators" class="carousel slide">
    	<div class="carousel-indicators"></div>
        <div class="carousel-inner"></div>
    </div>
		
	<div class="d-flex justify-content-between mt-2" style="width: 70%; margin: auto;">
		<div><button type="button" class="btn btn-dark">처음</button></div>
		<div><button type="button" class="btn btn-dark">다음</button></div>
	</div>
</body>

<%@ include file= "../main/bottom.jsp" %>
