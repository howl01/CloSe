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
	
	<input style="float: right;" type="button" value="나의 코디" onclick="location.href='insert.style'">
	
</body>
</html>
    