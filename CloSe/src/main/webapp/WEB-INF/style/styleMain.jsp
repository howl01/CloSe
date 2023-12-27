<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../main/top.jsp" %>

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

<script>
var page = 1;
var pageSize = 12;
var loadingData = false;  // 데이터 로딩 중인지 여부를 나타내는 플래그

//페이지 로딩 후 처음 한 번은 바로 데이터를 로드하고, 그 후에는 일정한 간격으로 호출
$(document).ready(function () {
    // 페이지 로딩 후 한 번만 데이터를 로딩
    loadMoreData();
});

$(window).scroll(function () {
    if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100) {
        if (!loadingData) {  // 로딩 중이 아닌 경우에만 실행
            loadingData = true;  // 로딩 시작
            page++;
            loadMoreData();

            // 일정 시간(예: 10초) 후에 로딩 상태를 해제
            setTimeout(function () {
                loadingData = false;
            }, 1000);  // 10000 밀리초 = 10초
        }
    }
});

function loadMoreData() {
    $.ajax({
        url: 'mainView.style',
        type: 'POST',
        data: { page: page, pageSize: pageSize },
        success: function (json) {
        	alert("성공");
            if (json.length > 0) {
                var html = '';
                var jsonArray = JSON.parse(json);
                $(document).data('jsonArray', jsonArray);
                var contextPath = '<%= request.getContextPath() %>';
                var flag1 = false;
                var flag2 = false;
                var flag3 = false;
                var flag4 = false;
                $.each(jsonArray, function (index, styleBean) {
                    if (index % 4 === 0) {
                    	if(!flag1){
                        	html += '<div class="flex-column" style="width: 25%;">';
                        	flag1 = true;
                    	}

                    html += '<div class="card m-2 border-0">';
                    html += '<a href="detail.style?style_number=' + styleBean.style_number + '" class="link-dark link-underline-opacity-0">';
                    html += '<div class="card-body p-0">';
                    html += '<img src="' + contextPath + '/resources/styleImage/' + styleBean.image1 + '" style="max-height: 300px;" class="card-img-top">';
                    html += '<div class="d-flex align-items-center">';
                    html += '<img src="' + contextPath + '/resources/memberImage/' + styleBean.member_image + '" id="profile" style="width:3vw; height: 3vw; margin-top: 5px; border-radius: 100%; border: 1px solid #C0C0C0;">';
                    html += '&nbsp;' + styleBean.nickname;
                    html += '</div>';
                    html += '<p class="card-text" style="font-size: 10pt; margin-top: 5px;">' + styleBean.content + '</p>';
                    html += '</div>';
                    html += '</a>';
                    html += '</div>';
                    }
                    
                    if (index % 4 === 1) {
                    	if(!flag2){
                        	html += '<div class="flex-column" style="width: 25%;">';
                        	flag2 = true;
                    	}

                    html += '<div class="card m-2 border-0">';
                    html += '<a href="detail.style?style_number=' + styleBean.style_number + '" class="link-dark link-underline-opacity-0">';
                    html += '<div class="card-body p-0">';
                    html += '<img src="' + contextPath + '/resources/styleImage/' + styleBean.image1 + '" style="max-height: 300px;" class="card-img-top">';
                    html += '<div class="d-flex align-items-center">';
                    html += '<img src="' + contextPath + '/resources/memberImage/' + styleBean.member_image + '" id="profile" style="width:3vw; height: 3vw; margin-top: 5px; border-radius: 100%; border: 1px solid #C0C0C0;">';
                    html += '&nbsp;' + styleBean.nickname;
                    html += '</div>';
                    html += '<p class="card-text" style="font-size: 10pt; margin-top: 5px;">' + styleBean.content + '</p>';
                    html += '</div>';
                    html += '</a>';
                    html += '</div>';
                    }
                	
                    if (index % 4 === 2) {
                    	if(!flag3){
                        	html += '<div class="flex-column" style="width: 25%;">';
                        	flag3 = true;
                    	}

                    html += '<div class="card m-2 border-0">';
                    html += '<a href="detail.style?style_number=' + styleBean.style_number + '" class="link-dark link-underline-opacity-0">';
                    html += '<div class="card-body p-0">';
                    html += '<img src="' + contextPath + '/resources/styleImage/' + styleBean.image1 + '" style="max-height: 300px;" class="card-img-top">';
                    html += '<div class="d-flex align-items-center">';
                    html += '<img src="' + contextPath + '/resources/memberImage/' + styleBean.member_image + '" id="profile" style="width:3vw; height: 3vw; margin-top: 5px; border-radius: 100%; border: 1px solid #C0C0C0;">';
                    html += '&nbsp;' + styleBean.nickname;
                    html += '</div>';
                    html += '<p class="card-text" style="font-size: 10pt; margin-top: 5px;">' + styleBean.content + '</p>';
                    html += '</div>';
                    html += '</a>';
                    html += '</div>';
                    }

                    if (index % 4 === 3) {
                    	if(!flag4){
                        	html += '<div class="flex-column" style="width: 25%;">';
                        	flag4 = true;
                    	}

                    html += '<div class="card m-2 border-0">';
                    html += '<a href="detail.style?style_number=' + styleBean.style_number + '" class="link-dark link-underline-opacity-0">';
                    html += '<div class="card-body p-0">';
                    html += '<img src="' + contextPath + '/resources/styleImage/' + styleBean.image1 + '" style="max-height: 300px;" class="card-img-top">';
                    html += '<div class="d-flex align-items-center">';
                    html += '<img src="' + contextPath + '/resources/memberImage/' + styleBean.member_image + '" id="profile" style="width:3vw; height: 3vw; margin-top: 5px; border-radius: 100%; border: 1px solid #C0C0C0;">';
                    html += '&nbsp;' + styleBean.nickname;
                    html += '</div>';
                    html += '<p class="card-text" style="font-size: 10pt; margin-top: 5px;">' + styleBean.content + '</p>';
                    html += '</div>';
                    html += '</a>';
                    html += '</div>';
                    }
                });
            	
                $("#styleContainer").append(html);
            } else {
            	var html = '';
            	html += '</div>';
            	html += '</div>';
            	html += '</div>';
            	html += '</div>';
            	
            	$("#styleContainer").append(html);
            }
            $("#styleContainer").show();
        },
        error: function (jqXHR, textStatus, errorThrown) {
        	alert("실패");
            console.error("AJAX Error:", textStatus, errorThrown);
            alert("검색 중 오류가 발생했습니다. 자세한 내용은 콘솔을 확인하세요.");
        }
    });
}

</script>
</head>
<body>

<div class="body">
    <!-- 이미지 컨테이너 -->
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

    <!-- 나의 코디 버튼 -->
    <div class="d-flex justify-content-end">
        <input style="float: right;" type="button" value="나의 코디" onclick="location.href='insert.style'">
    </div>

	<c:set var="index" value="1"/>
    <!-- 스타일 컨테이너 -->
    <div class="d-flex flex-wrap" id="styleContainer">
    	<c:forEach var="styleBean" items="${styleList}" varStatus="status">
	            <c:if test="${status.index % 4 == 0}">
	              <c:if test="${status.index == 0}">
	                  <div class="flex-column" style="width: 25%;">
	              </c:if>
	           <div class="card m-2 border-0">
	               <a href="detail.style?style_number=${styleBean.style_number}" class="link-dark link-underline-opacity-0">
	                   <div class="card-body p-0">
	                      <img src="<%=request.getContextPath()%>/resources/styleImage/${styleBean.image1}" style="max-height: 300px;" class="card-img-top" >
	                      <div class="d-flex align-items-center">
	                      <img src="<%=request.getContextPath()%>/resources/memberImage/${styleBean.member_image}" id="profile" style="width:3vw; height: 3vw; margin-top: 5px; border-radius: 100%; border: 1px solid #C0C0C0;">
	                       &nbsp;${styleBean.nickname}
	                       </div>
	                       <p class="card-text" style="font-size: 10pt; margin-top: 5px;">${styleBean.content}</p>
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
	            <div class="card m-2 border-0">
	               <a href="detail.style?style_number=${styleBean.style_number}" class="link-dark link-underline-opacity-0">
	                   <div class="card-body p-0">
	                      <img src="<%=request.getContextPath()%>/resources/styleImage/${styleBean.image1}" style="max-height: 300px;" class="card-img-top" >
	                      <div class="d-flex align-items-center">
	                      <img src="<%=request.getContextPath()%>/resources/memberImage/${styleBean.member_image}" id="profile" style="width:3vw; height: 3vw; margin-top: 5px; border-radius: 100%; border: 1px solid #C0C0C0;">
	                       &nbsp;${styleBean.nickname}
	                       </div>
	                       <p class="card-text" style="font-size: 10pt; margin-top: 5px;">${styleBean.content}</p>
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
	
	           <div class="card m-2 border-0">
	               <a href="detail.style?style_number=${styleBean.style_number}" class="link-dark link-underline-opacity-0">
	                   <div class="card-body p-0">
	                      <img src="<%=request.getContextPath()%>/resources/styleImage/${styleBean.image1}" style="max-height: 300px;" class="card-img-top" >
	                      <div class="d-flex align-items-center">
	                      <img src="<%=request.getContextPath()%>/resources/memberImage/${styleBean.member_image}" id="profile" style="width:3vw; height: 3vw; margin-top: 5px; border-radius: 100%; border: 1px solid #C0C0C0;">
	                       &nbsp;${styleBean.nickname}
	                       </div>
	                       <p class="card-text" style="font-size: 10pt; margin-top: 5px;">${styleBean.content}</p>
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
	
	           <div class="card m-2 border-0">
	               <a href="detail.style?style_number=${styleBean.style_number}" class="link-dark link-underline-opacity-0">
	                   <div class="card-body p-0">
	                      <img src="<%=request.getContextPath()%>/resources/styleImage/${styleBean.image1}" style="max-height: 300px;" class="card-img-top" >
	                      <div class="d-flex align-items-center">
	                      <img src="<%=request.getContextPath()%>/resources/memberImage/${styleBean.member_image}" id="profile" style="width:3vw; height: 3vw; margin-top: 5px; border-radius: 100%; border: 1px solid #C0C0C0;">
	                       &nbsp;${styleBean.nickname}
	                       
	                       </div>
	                       <p class="card-text" style="font-size: 10pt; margin-top: 5px;">${styleBean.content}</p>
	                   </div>
	               </a>
	           </div>
	
	        </c:if>
	    </c:forEach>
	    </div>
	</div>
</div>
</body>
</html>
<%@ include file="../main/bottom.jsp" %>
