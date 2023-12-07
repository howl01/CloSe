<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "../main/top.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Photo Tagging</title>
    <style>
        #photo-container {
            position: relative;
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
        #styleNav{
        	font-size: 15pt;
        	font-weight: 700;
        	padding-top: 3px;
        }
        #img{
        	width: 80%;
        	height: 100%;
        	border-radius: 50%;
        }
        #imgDiv{
        	text-align: center;
        }
        #imgContainer{
        	width: 66%;
        margin: auto;
        }
    </style>
</head>
<body>

	<div class="border-bottom d-flex justify-content-around pt-4" id="imgContainer">
		<div class="d-flex flex-column" id="imgDiv">
			<div><img src="resources/img/abc.jpeg" id="img"></div>
			<div><a href="" class="link-dark link-underline-opacity-0">겨울룩</a></div>
		</div>
		
		<div class="d-flex flex-column" id="imgDiv">
			<div><img src="resources/img/abc.jpeg" id="img"></div>
			<div><a href="" class="link-dark link-underline-opacity-0">겨울룩</a></div>
		</div>
		
		<div class="d-flex flex-column" id="imgDiv">
			<div><img src="resources/img/abc.jpeg" id="img"></div>
			<div><a href="" class="link-dark link-underline-opacity-0">겨울룩</a></div>
		</div>
		
		<div class="d-flex flex-column" id="imgDiv">
			<div><img src="resources/img/abc.jpeg" id="img"></div>
			<div><a href="" class="link-dark link-underline-opacity-0">겨울룩</a></div>
		</div>
		
		<div class="d-flex flex-column" id="imgDiv">
			<div><img src="resources/img/abc.jpeg" id="img"></div>
			<div><a href="" class="link-dark link-underline-opacity-0">겨울룩</a></div>
		</div>
	</div>
	
    <div id="photo-container">
        <img id="photo" src="resources/img/abc.jpeg" alt="Your Photo">
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
                    const x = event.offsetX;
                    const y = event.offsetY;

                    const tagElement = document.createElement("div");
                    tagElement.classList.add("tag");
                    tagElement.style.left = x+"px";
                    tagElement.style.top = y+"px";
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
</html>
    