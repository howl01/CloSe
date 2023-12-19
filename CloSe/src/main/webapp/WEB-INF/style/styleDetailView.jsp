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
            width: 30%;
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
        
        #styleDetailContainer{
        	width: 50%;
        	margin: auto;
        }
        
        .btn{
			border: none;
			padding: 0;
		}
        
        .overlay2 {
	      display: none; /* 초기에는 배경 숨김 */
	      position: fixed;
	      width: 100%;
	      height: 100%;
	      z-index: 1200;
	      background-color: rgba(255, 255, 255, 0);
	   	}
	   	
	   	.overlay2 ol {
		    position: absolute;
		    top: 35%; /* 원하는 위치로 조절할 수 있습니다. */
		    left: 35%; /* 원하는 위치로 조절할 수 있습니다. */
		    width: 30%; /* 원하는 너비로 조절할 수 있습니다. */
		    cursor: pointer;
		}
        
    </style>
    
    <script type="text/javascript">
	    function search2() {
	        var overlay2 = document.getElementById('overlay2');
	        overlay2.style.display = 'block';
	     }
    	function hideOverlay2() {
    		var overlay2 = document.getElementById('overlay2');
    		overlay2.style.display = 'none';
	 	 }
    </script>
</head>
<body>
	
	<div id="overlay2" class="overlay2" onclick="javascript:hideOverlay2();">
		<ol class="list-group" style="cursor: pointer;">
			<li class="list-group-item d-flex justify-content-center" onclick="alert('신고');"><font color="red">유저 신고</font></li>
	        <li class="list-group-item d-flex justify-content-center" onclick="javascript:hideOverlay2()">취소</li>
	    </ol>
	</div>
	
	<div id="styleDetailContainer">
	    <div class="d-flex justify-content-between">
	    	<div>
	    		<img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='50' height='50' fill='gray' class='bi bi-person-circle' viewBox='0 0 16 16'%3E%3Cpath d='M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z'/%3E%3Cpath fill-rule='evenodd' d='M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z'/%3E%3C/svg%3E" alt="Person Icon">
	            ${styleBean.member_id}
	            <fmt:parseDate var="write_date" value="${styleBean.write_date}" pattern="yyyy-MM-dd"/>
	            <fmt:formatDate value="${write_date}" pattern="yyyy-MM-dd"/>
	    	</div>
	    	<div>
	    		<button type="button" class="btn" onclick="javascript:search2()">
	    			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-three-dots" viewBox="0 0 16 16">
					  <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z"/>
					</svg>
	    		</button>
	    	</div>
	    </div>
	        <a href="detail.style?style_number=${styleBean.style_number}" class="link-dark link-underline-opacity-0">
	            <img src="<%=request.getContextPath()%>/resources/styleImage/${styleBean.image1}" class="card-img-top">
	            <div class="card-body">
	                
	                <p class="card-text">${styleBean.content}</p>
	            </div>
	        </a>
	</div>
	
</body>
</html>