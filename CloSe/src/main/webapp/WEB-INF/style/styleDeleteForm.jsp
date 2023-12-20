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
    	#styleNav {
		    font-size: 15pt;
		    font-weight: 700;
		    padding-top: 3px;
		}
    	
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
        
        #styleContainer{
        	width: 66%;
        	margin: auto;
        }
        
    </style>
</head>
<body>

	<div class="border-bottom d-flex justify-content-around py-3" id="imgContainer">
		<c:forEach begin="0" end="4">
		<a href="view.main" class="link-dark link-underline-opacity-0">
		<div class="d-flex flex-column" id="imgDiv" onclick="location.href='view.main'">
			<div>
				<img src="resources/img/abc.jpeg" id="img">
			</div>
			<div>
				겨울룩
			</div>
		</div>
		</a>
		</c:forEach>
	</div>
	
	<div class="d-flex justify-content-end">
		<input style="float: right;" type="button" value="나의 코디" onclick="location.href='insert.style'">
	</div>
	
    <div class="d-flex flex-wrap" id="styleContainer">
    <c:forEach var="styleBean" items="${styleList}" varStatus="status">
        <c:if test="${status.index % 4 == 0}">
        	<c:if test="${status.index == 0}">
            	<div class="flex-column" style="width: 25%;">
            </c:if>

	        <div class="card m-3">
	            <a href="detail.style?style_number=${styleBean.style_number}" class="link-dark link-underline-opacity-0">
	                <img src="<%=request.getContextPath()%>/resources/styleImage/${styleBean.image1}" class="card-img-top">
	                <div class="card-body">
	                    <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='gray' class='bi bi-person-circle' viewBox='0 0 16 16'%3E%3Cpath d='M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z'/%3E%3Cpath fill-rule='evenodd' d='M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z'/%3E%3C/svg%3E" alt="Person Icon">
	                    ${styleBean.nickname}
	                    <p class="card-text">${styleBean.content}</p>
	                </div>
	            </a>
	        </div>
        </c:if>
    </c:forEach>
    </div>
	
	<c:forEach var="styleBean" items="${styleList}" varStatus="status">
        <c:if test="${status.index % 4 == 1}">
        	<c:if test="${status.index == 1}">
            	<div class="flex-column" style="width: 25%;">
            </c:if>

	        <div class="card m-3">
	            <a href="detail.style?style_number=${styleBean.style_number}" class="link-dark link-underline-opacity-0">
	                <img src="<%=request.getContextPath()%>/resources/styleImage/${styleBean.image1}" class="card-img-top">
	                <div class="card-body">
	                    <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='gray' class='bi bi-person-circle' viewBox='0 0 16 16'%3E%3Cpath d='M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z'/%3E%3Cpath fill-rule='evenodd' d='M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z'/%3E%3C/svg%3E" alt="Person Icon">
	                    ${styleBean.nickname}
	                    <p class="card-text">${styleBean.content}</p>
	                </div>
	            </a>
	        </div>
        </c:if>
    </c:forEach>
    </div>
    
    <c:forEach var="styleBean" items="${styleList}" varStatus="status">
        <c:if test="${status.index % 4 == 2}">
        	<c:if test="${status.index == 2}">
            	<div class="flex-column" style="width: 25%;">
            </c:if>

	        <div class="card m-3">
	            <a href="detail.style?style_number=${styleBean.style_number}" class="link-dark link-underline-opacity-0">
	                <img src="<%=request.getContextPath()%>/resources/styleImage/${styleBean.image1}" class="card-img-top">
	                <div class="card-body">
	                    <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='gray' class='bi bi-person-circle' viewBox='0 0 16 16'%3E%3Cpath d='M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z'/%3E%3Cpath fill-rule='evenodd' d='M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z'/%3E%3C/svg%3E" alt="Person Icon">
	                    ${styleBean.nickname}
	                    <p class="card-text">${styleBean.content}</p>
	                </div>
	            </a>
	        </div>
        </c:if>
    </c:forEach>
    </div>
    
    <c:forEach var="styleBean" items="${styleList}" varStatus="status">
        <c:if test="${status.index % 4 == 3}">
        	<c:if test="${status.index == 3}">
            	<div class="flex-column" style="width: 25%;">
            </c:if>

	        <div class="card m-3">
	            <a href="detail.style?style_number=${styleBean.style_number}" class="link-dark link-underline-opacity-0">
	                <img src="<%=request.getContextPath()%>/resources/styleImage/${styleBean.image1}" class="card-img-top">
	                <div class="card-body">
	                    <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='gray' class='bi bi-person-circle' viewBox='0 0 16 16'%3E%3Cpath d='M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z'/%3E%3Cpath fill-rule='evenodd' d='M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z'/%3E%3C/svg%3E" alt="Person Icon">
	                    ${styleBean.nickname}
	                    <p class="card-text">${styleBean.content}</p>
	                </div>
	            </a>
	        </div>

        </c:if>
    </c:forEach>
    </div>
	
	</div>
	
</body>
</html>
    