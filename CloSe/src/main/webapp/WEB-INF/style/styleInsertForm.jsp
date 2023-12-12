<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file= "../main/top.jsp" %>

<style>
    #styleNav {
        font-size: 15pt;
        font-weight: 700;
        padding-top: 3px;
    }

    .preview-container {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
        justify-content: center;
    }

    .preview-image {
        max-width: 220px;
        max-height: 300px;
        object-fit: cover;
        position: relative;
    }

    .carousel {
        max-width: 220px;
        max-height: 300px;
        margin: auto;
    }
    
    #photo-container {
         position: relative;
         margin: auto;
         max-height: 300px;
     }

    .tag-container {
        position: absolute;
        top: 0;
        left: 0;
    }

    .tag {
        position: absolute;
        background-color: #3498db;
        color: #fff;
        padding: 5px;
        border-radius: 5px;
        cursor: pointer;
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

        // If only one file, create a single preview
        if (files.length === 1) {
            var img = document.createElement('img');
            img.src = URL.createObjectURL(files[0]);
            img.className = 'preview-image';
            img.setAttribute('onclick', 'addTag(this)');
            previewContainer.appendChild(img);
        } else if (files.length > 1) {
            // If more than one file, create carousel previews
            var carouselInner = document.querySelector('.carousel-inner');
            carouselInner.innerHTML = ""; // Clear previous slides

            var carouselIndicators = document.querySelector('.carousel-indicators');
            carouselIndicators.innerHTML = ""; // Clear previous indicators

            for (var i = 0; i < files.length; i++) {
                var img = document.createElement('img');
                img.src = URL.createObjectURL(files[i]);
                img.className = 'd-block w-100';
                img.setAttribute('onclick', 'addTag(this)');

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
        }
    }
</script>

<body>
    <h1 align="center">코디 사진 선택</h1>
    <form enctype="multipart/form-data" style="text-align: center;">
    	<div class="form row">
    	<div class="form-group col-md-4 mx-auto">
        <input class="form-control" type="file" name="file" multiple accept="image/*" onchange="updatePreview()">
    	</div>
    	</div>
    </form>

	<div id="photo-container">
	    <div class="preview-container"></div>
	
	    <div id="carouselExampleIndicators" class="carousel slide">
	        <div class="carousel-indicators"></div>
	        <div class="carousel-inner"></div>
	        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
	            data-bs-slide="prev">
	            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	            <span class="visually-hidden">Previous</span>
	        </button>
	        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
	            data-bs-slide="next">
	            <span class="carousel-control-next-icon" aria-hidden="true"></span>
	            <span class="visually-hidden">Next</span>
	        </button>
	    </div>
        <div class="tag-container" id="tag-container"></div>
    </div>
	
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const photoContainer = document.getElementById("photo-container");
            const tagContainer = document.getElementById("tag-container");

            let isAddingTag = false;

            // Function to add a tag at the clicked position
            function addTag(event) {
                if (isAddingTag) {
                	 const x = (event.offsetX / window.innerWidth) * 100;
                     const y = (event.offsetY / window.innerHeight) * 100;
                    
                    const tagElement = document.createElement("div");
                    tagElement.classList.add("tag");
                    tagElement.style.left = x+"vw";
                    tagElement.style.top = y+"vh";
                    tagElement.innerText = "Tag";

                    tagContainer.appendChild(tagElement);

                    // Add click event to handle tag click or further interactions
                    tagElement.addEventListener("click", () => {
                        alert("Tag Clicked!");
                        // Add your custom logic here
                    });

                    isAddingTag = false;
                }
            }

            // Event listener to detect clicks on the photo container
            photoContainer.addEventListener("mousemove", addTag);
            photoContainer.addEventListener("mousedown", () => isAddingTag = true);
        });
    </script>
</body>

<%@ include file= "../main/bottom.jsp" %>
