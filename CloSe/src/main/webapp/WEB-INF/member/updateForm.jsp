<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<script src="resources/js/bootstrap.bundle.min.js"></script>
<script src="resources/js/jquery.js"></script>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/checkout.css" rel="stylesheet">
<script type="text/javascript" src = "resources/js/script.js"></script>

<style>
	table{
		text-align: center;
	}
	th{
		text-align: right;
	}
</style>

<script type="text/javascript">
$(document).ready(function() {
    
    $('#nickname').keyup(function(){ // 닉네임 중복체크

        $.ajax({
            url : "nickduplicate.member", // 요청url
            data : ({
                inputnick : $('input[name="nickname"]').val()
            }),
            success : function(data){
               if(jQuery.trim(data)=='YES'){
                    $('#nickmessage').html("<font color=blue>사용 가능합니다.</font>");
                    nickuse = "possible";
                    $('#nickmessage').show();
                } else {
                    $('#nickmessage').html("<font color=red>이미 사용중인 닉네임입니다.</font>")
                    nickuse = "impossible";
                    $('#nickmessage').show();
                }
            }
        });
    });
    
    $('#sub').click(function(event){ // submit 클릭
        if(nickuse == "impossible"){
        	alert('이미 사용중인 닉네임입니다.');
        	return false;
        }
    });
});

	function goMyPage(){
		location.href="mypage.member";
	}
</script>

<div class="container">
    <div class="py-5 text-center">
	   <a href = "view.main">
	      <img class="d-block mx-auto mb-4" src="resources/img/logo.png" width="500" height="100">
	   </a>
      <h2>마이페이지</h2>
    </div>
 
	<ul class="nav nav-tabs" role="tablist">
	  <li class="nav-item" role="presentation">
	    <a class="nav-link active" data-bs-toggle="tab" href="#home" aria-selected="true" role="tab">내 정보</a>
	  </li>
	  <li class="nav-item" role="presentation">
	    <a class="nav-link" data-bs-toggle="tab" href="#profile" aria-selected="false" role="tab" tabindex="-1">구매상품</a>
	  </li>
	</ul>
	
	<div id="myTabContent" class="tab-content">
		<!-- 첫번째 탭 -->
		<div class="tab-pane fade active show" id="home" role="tabpanel">
			<div class="row">
		        <form name="f" class="needs-validation" action = "update.member" method="post" onsubmit="return updatecheck()">
			        <table class="table" id="article-table">
			        	<c:if test="${not empty loginInfo or not empty kakaoLoginInfo}">
					        <tr>
					           <th>아이디</th>
					           <td>
					           	  <c:choose>
						              <c:when test="${not empty kakaoLoginInfo}">
				                        <input type="text" id="member_id" name="member_id" disabled="disabled" value="${kakaoLoginInfo.member_id}">
				                        <input type="hidden" name="member_id" value="${kakaoLoginInfo.member_id}">
				                        <input type="hidden" name="social" value="kakao">
				                      </c:when>
				                      <c:when test="${not empty loginInfo}">
				                        <input type="text" id="member_id" name="member_id" disabled="disabled" value="${loginInfo.member_id}">
				                        <input type="hidden" name="member_id" value="${loginInfo.member_id}">
				                        <input type="hidden" name="social" value="general">
				                      </c:when>
			                      </c:choose>
					           </td>
					        </tr>
					        <tr>
					           <th>닉네임</th>
					           <td>
					              <c:choose>
						              <c:when test="${not empty kakaoLoginInfo}">
				                        <input type="text" id="nickname" name="nickname" value="${kakaoLoginInfo.nickname}"><br>
				                        <span id="nickmessage" style = "display: none;"></span>
				                      </c:when>
				                      <c:when test="${not empty loginInfo}">
				                        <input type="text" id="nickname" name="nickname" value="${loginInfo.nickname}"><br>
				                        <span id="nickmessage" style = "display: none;"></span>
				                      </c:when>
			                      </c:choose>
					           </td>
					        </tr>
					        <tr>
				               <th>비밀번호</th>
					           <td>
					              <c:choose>
						              <c:when test="${not empty kakaoLoginInfo}">
				                        <input type="text" id="password" name="password" value="${kakaoLoginInfo.password}">
				                        <form:errors cssClass="err" path="password"/>
				                      </c:when>
				                      <c:when test="${not empty loginInfo}">
				                        <input type="text" id="password" name="password" value="${loginInfo.password}">
				                      </c:when>
			                      </c:choose>
					           </td>
					        </tr>
					        <tr>
					           <th>이름</th>
					           <td>
					           	  <c:choose>
						              <c:when test="${not empty kakaoLoginInfo}">
				                        <input type="text" id="name" name="name" disabled="disabled" value="${kakaoLoginInfo.name}">
				                        <input type="hidden" name="name" value="${kakaoLoginInfo.name}">
				                      </c:when>
				                      <c:when test="${not empty loginInfo}">
				                        <input type="text" id="name" name="name" disabled="disabled" value="${loginInfo.name}">
				                        <input type="hidden" name="name" value="${loginInfo.name}">
				                      </c:when>
			                      </c:choose>
					           </td>
					        </tr>
					        <tr>
					           <th>성별</th>
					           <td>
					              <c:choose>
						              <c:when test="${not empty kakaoLoginInfo}">
								        <input type="radio" id="gender" name="gender" value="남자" <c:if test="${kakaoLoginInfo.gender eq '남자'}">checked</c:if>> 남자
								        <input type="radio" id="gender" name="gender" value="여자" <c:if test="${kakaoLoginInfo.gender eq '여자'}">checked</c:if>> 여자
								      </c:when>
								      <c:when test="${not empty loginInfo}">
								        <input type="radio" id="gender" name="gender" value="남자" <c:if test="${loginInfo.gender eq '남자'}">checked</c:if>> 남자
								        <input type="radio" id="gender" name="gender" value="여자" <c:if test="${loginInfo.gender eq '여자'}">checked</c:if>> 여자
								      </c:when>
			                      </c:choose>
					           </td>
					        </tr>
					        <tr>
					           <th>도로명 주소</th>
					           <td>
					              <c:choose>
						              <c:when test="${not empty kakaoLoginInfo}">
				                        <input type="text" id="address1" name="address1" value="${kakaoLoginInfo.address1}">
				                      </c:when>
				                      <c:when test="${not empty loginInfo}">
				                        <input type="text" id="address1" name="address1" value="${loginInfo.address1}">
				                      </c:when>
			                      </c:choose>
					           </td>
					        </tr>
					        <tr>
					           <th>상세주소</th>
					           <td>
					              <c:choose>
						              <c:when test="${not empty kakaoLoginInfo}">
				                        <input type="text" id="address2" name="address2" value="${kakaoLoginInfo.address2}">
				                      </c:when>
				                      <c:when test="${not empty loginInfo}">
				                        <input type="text" id="address2" name="address2" value="${loginInfo.address2}">
				                      </c:when>
			                      </c:choose>
					           </td>
					        </tr>
					        <tr>
					           <th>휴대폰 번호</th>
					           <td>
					              <c:choose>
						              <c:when test="${not empty kakaoLoginInfo}">
				                        <input type="text" id="phone" name="phone" disabled="disabled" value="${kakaoLoginInfo.phone}">
				                        <input type="hidden" name="phone" value="${kakaoLoginInfo.phone}">
				                      </c:when>
				                      <c:when test="${not empty loginInfo}">
				                        <input type="text" id="phone" name="phone" disabled="disabled" value="${loginInfo.phone}">
				                        <input type="hidden" name="phone" value="${loginInfo.phone}">
				                      </c:when>
			                      </c:choose>
					           </td>
					        </tr>
					        <tr>
					           <th>이메일 주소</th>
					           <td>
					              <c:choose>
						              <c:when test="${not empty kakaoLoginInfo}">
				                        <input type="text" id="email" name="email" value="${kakaoLoginInfo.email}">
				                      </c:when>
				                      <c:when test="${not empty loginInfo}">
				                        <input type="text" id="email" name="email" value="${loginInfo.email}">
				                      </c:when>
			                      </c:choose>
					           </td>
					        </tr>
					        <tr>
					           <th>생년월일</th>
					           <td>
					              <c:choose>
						              <c:when test="${not empty kakaoLoginInfo}">
						              	<c:set var="kakaoBirth" value="${fn:substring(kakaoLoginInfo.birth, 0, 10)}" />
		    							<input type="date" id="birth" name="birth" value="${kakaoBirth}">
				                      </c:when>
				                      <c:when test="${not empty loginInfo}">
				                        <c:set var="Birth" value="${fn:substring(loginInfo.birth, 0, 10)}" />
		    							<input type="date" id="birth" name="birth" value="${Birth}">
				                      </c:when>
			                      </c:choose>
					           </td>
					        </tr>
					        <tr>
					           <th>키 (cm)</th>
					           <td>
					              <c:choose>
						              <c:when test="${not empty kakaoLoginInfo}">
				                        <input type="text" id="height" name="height" value="${kakaoLoginInfo.height}">
				                      </c:when>
				                      <c:when test="${not empty loginInfo}">
				                        <input type="text" id="height" name="height" value="${loginInfo.height}">
				                      </c:when>
			                      </c:choose>
					           </td>
					        </tr>
					        <tr>
					           <th>몸무게 (kg)</th>
					           <td>
					              <c:choose>
						              <c:when test="${not empty kakaoLoginInfo}">
				                        <input type="text" id="weight" name="weight" value="${kakaoLoginInfo.weight}">
				                      </c:when>
				                      <c:when test="${not empty loginInfo}">
				                        <input type="text" id="weight" name="weight" value="${loginInfo.weight}">
				                      </c:when>
			                      </c:choose>
					           </td>
					        </tr>
				        </c:if>
				        <tr>
				        	<td colspan="2">
						       <input type="submit" id="sub" class="btn btn-dark btn-md" value="수정"/>
						       <input type="button" class="btn btn-dark btn-md" value="돌아가기" onclick="goMyPage()">
				        	</td>
				        </tr>
			        </table>
		        </form>
		    </div>  
		</div>
		
		<!-- 두번째 탭 -->
		<div class="tab-pane fade" id="profile" role="tabpanel">
			aaa
		</div>
		
	</div>





    

	<footer class="my-5 pt-5 text-body-secondary text-center text-small">
	  <p class="mb-1">© 2023 Minhyeok, Byeon</p>
	</footer>
</div>