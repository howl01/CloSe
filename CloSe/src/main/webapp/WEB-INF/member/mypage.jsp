<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<script src="resources/js/bootstrap.bundle.min.js"></script>
<script src="resources/js/jquery.js"></script>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/checkout.css" rel="stylesheet">

<style>
	table{
		text-align: center;
	}
	th{
		text-align: center;
	}
</style>

<script type="text/javascript">

	var cert = false;
	var registercheck = false;
	
	function sendSMS(phone) {
	    alert('인증번호를 요청했습니다.');
	    // Ajax 요청
	    $.ajax({
	        type: "GET",
	        url: "sendSms.member?phone="+phone,
	        data: { phone: phone },
	        success: function(response) {
	            // 서버에서 받은 응답(response)을 처리
	            console.log(response);
	
	            // 받은 랜덤 값(response)을 전역 변수에 저장
	            window.randomValue = response;
				cert = true;
	        },
	        error: function(error) {
	            console.error(error);
	            // 에러가 발생했을 경우에 대한 처리를 추가할 수 있습니다.
	            alert('전화번호가 일치하지 않습니다.');
	        }
	    });
	}
	
	function verify() {
	    var verificationCode = document.getElementById('verificationCode').value;

	    // 인증번호가 비어 있으면 알림창을 띄우고 함수를 종료
	    if (verificationCode.trim() === '') {
	        alert('인증번호를 입력하세요.');
	        return;
	    }

	    // 사용자가 입력한 값
	    var userInput = document.getElementById('verificationCode').value;

	    // 전역 변수에 저장된 랜덤 값과 사용자가 입력한 값 비교
	    if (userInput == window.randomValue) {
	        // 일치할 경우, 여기에 원하는 동작 추가
	        alert('인증 성공!');
	        registercheck = true;
	    } else {
	        // 불일치할 경우, 여기에 원하는 동작 추가
	        alert('인증번호가 일치하지 않습니다. 다시 시도하세요.');
	    }
	}

	function goMain(){
		location.href="view.main";
	}
	
	function goUpdate(){
		location.href="update.member";
	}
	
	function goDelete(member_id) {
	    if (!cert) {
	        alert('인증번호를 받으세요');
	        return;
	    } else if (!registercheck) {
	        alert('인증번호를 확인하세요');
	        return;
	    }

	    // If the conditions are met, proceed with the deletion
	    location.href = "delete.member?member_id=" + member_id;
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
	    <a class="nav-link active" data-bs-toggle="tab" href="#mypage" aria-selected="true" role="tab">내 정보</a>
	  </li>
	  <li class="nav-item" role="presentation">
	    <a class="nav-link" data-bs-toggle="tab" href="aa" aria-selected="false" role="tab" tabindex="-1">내 코디</a>
	  </li>
	  <li class="nav-item" role="presentation">
	    <a class="nav-link" data-bs-toggle="tab" href="bb" aria-selected="false" role="tab" tabindex="-1">구매 상품</a>
	  </li>
	  <li class="nav-item" role="presentation">
	    <a class="nav-link" data-bs-toggle="tab" href="#coupon" aria-selected="false" role="tab" tabindex="-1">보유쿠폰</a>
	  </li>
	  <li class="nav-item" role="presentation">
	    <a class="nav-link" data-bs-toggle="tab" href="#delete" aria-selected="false" role="tab" tabindex="-1">회원탈퇴</a>
	  </li>
	</ul>
	
	<div id="myTabContent" class="tab-content">
		<!-- 첫번째 탭 -->
		<div class="tab-pane fade active show" id="mypage" role="tabpanel">
			<div class="row">
				<form>
			        <table class="table" id="article-table">
			        	<c:if test="${not empty loginInfo or not empty kakaoLoginInfo}">
			        		<tr>
							    <th>프로필사진</th>
							    <td>
							        <c:choose>
							            <c:when test="${not empty kakaoLoginInfo}">
							                <img id="imgThumb" src="${kakaoLoginInfo.member_image}" width="100" height="100">
							            </c:when>
							            <c:when test="${not empty loginInfo}">
							                <c:choose>
							                    <c:when test="${not empty loginInfo.member_image}">
							                        <img src="<%=request.getContextPath()%>/resources/memberImage/${loginInfo.member_image}" width="100" height="100">
							                    </c:when>
							                    <c:otherwise>
							                        <div class="profile_photo">
							                            <img id="imgThumb" src="https://static.nid.naver.com/images/web/user/default.png" width="100" height="100">
							                            <span class="mask"></span>
							                        </div>
							                    </c:otherwise>
							                </c:choose>
							            </c:when>
							        </c:choose>
							    </td>
							</tr>
					        <tr>
					           <th>아이디</th>
					           <td>
					           	  <c:choose>
						              <c:when test="${not empty kakaoLoginInfo}">
				                        ${kakaoLoginInfo.member_id}
				                        <input type="hidden" name="member_id" value="${kakaoLoginInfo.member_id}">
				                      </c:when>
				                      <c:when test="${not empty loginInfo}">
				                        ${loginInfo.member_id}
				                        <input type="hidden" name="member_id" value="${loginInfo.member_id}">
				                      </c:when>
			                      </c:choose>
					           </td>
					        </tr>
					        <tr>
					           <th>닉네임</th>
					           <td>
					              <c:choose>
						              <c:when test="${not empty kakaoLoginInfo}">
				                        ${kakaoLoginInfo.nickname}
				                      </c:when>
				                      <c:when test="${not empty loginInfo}">
				                        ${loginInfo.nickname}
				                      </c:when>
			                      </c:choose>
					           </td>
					        </tr>
					        <tr>
				               <th>비밀번호</th>
					           <td>
					              <c:choose>
						              <c:when test="${not empty kakaoLoginInfo}">
				                        ${kakaoLoginInfo.password}
				                      </c:when>
				                      <c:when test="${not empty loginInfo}">
				                        ${loginInfo.password}
				                      </c:when>
			                      </c:choose>
					           </td>
					        </tr>
					        <tr>
					           <th>이름</th>
					           <td>
					           	  <c:choose>
						              <c:when test="${not empty kakaoLoginInfo}">
				                        ${kakaoLoginInfo.name}
				                        <input type="hidden" name="name" value="${kakaoLoginInfo.name}">
				                      </c:when>
				                      <c:when test="${not empty loginInfo}">
				                        ${loginInfo.name}
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
								        ${kakaoLoginInfo.gender}
								      </c:when>
								      <c:when test="${not empty loginInfo}">
								        ${loginInfo.gender}
								      </c:when>
			                      </c:choose>
					           </td>
					        </tr>
					        <tr>
					           <th>도로명 주소</th>
					           <td>
					              <c:choose>
						              <c:when test="${not empty kakaoLoginInfo}">
				                        ${kakaoLoginInfo.address1}
				                      </c:when>
				                      <c:when test="${not empty loginInfo}">
				                        ${loginInfo.address1}
				                      </c:when>
			                      </c:choose>
					           </td>
					        </tr>
					        <tr>
					           <th>상세주소</th>
					           <td>
					              <c:choose>
						              <c:when test="${not empty kakaoLoginInfo}">
				                        ${kakaoLoginInfo.address2}
				                      </c:when>
				                      <c:when test="${not empty loginInfo}">
				                        ${loginInfo.address2}
				                      </c:when>
			                      </c:choose>
					           </td>
					        </tr>
					        <tr>
					           <th>휴대폰 번호</th>
					           <td>
					              <c:choose>
						              <c:when test="${not empty kakaoLoginInfo}">
				                        ${kakaoLoginInfo.phone}
				                        <input type="hidden" name="phone" value="${kakaoLoginInfo.phone}">
				                      </c:when>
				                      <c:when test="${not empty loginInfo}">
				                        ${loginInfo.phone}
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
				                        ${kakaoLoginInfo.email}
				                      </c:when>
				                      <c:when test="${not empty loginInfo}">
				                        ${loginInfo.email}
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
		    							${kakaoBirth}
				                      </c:when>
				                      <c:when test="${not empty loginInfo}">
				                        <c:set var="Birth" value="${fn:substring(loginInfo.birth, 0, 10)}" />
		    							${Birth}
				                      </c:when>
			                      </c:choose>
					           </td>
					        </tr>
					        <tr>
					           <th>키 (cm)</th>
					           <td>
					              <c:choose>
						              <c:when test="${not empty kakaoLoginInfo}">
				                        ${kakaoLoginInfo.height}cm
				                      </c:when>
				                      <c:when test="${not empty loginInfo}">
				                        ${loginInfo.height}cm
				                      </c:when>
			                      </c:choose>
					           </td>
					        </tr>
					        <tr>
					           <th>몸무게 (kg)</th>
					           <td>
					              <c:choose>
						              <c:when test="${not empty kakaoLoginInfo}">
				                        ${kakaoLoginInfo.weight}kg
				                      </c:when>
				                      <c:when test="${not empty loginInfo}">
				                        ${loginInfo.weight}kg
				                      </c:when>
			                      </c:choose>
					           </td>
					        </tr>
				        </c:if>
				        <tr>
				        	<td colspan="2">
						       <input type="button" id="sub" class="btn btn-dark btn-md" value="수정하기" onclick="goUpdate()"/>
						       <input type="button" class="btn btn-dark btn-md" value="취소" onclick="goMain()">
				        	</td>
				        </tr>
			        </table>
		        </form>
		    </div>  
		</div>
		
		<!-- 두번째 탭 -->
		<div class="tab-pane fade" id="aa" role="tabpanel">
			<div class="row">
			
			</div>
		</div>
		
		<!-- 세번째 탭 -->
		<div class="tab-pane fade" id="bb" role="tabpanel">
			<div class="row">
			
			</div>
		</div>
		
		<!-- 네번째 탭 -->
		<div class="tab-pane fade" id="coupon" role="tabpanel">
			<div class="row">
				<table class="table" id="article-table">
		        	<c:if test="${not empty loginInfo or not empty kakaoLoginInfo}">
				        <tr>
				           <th>닉네임</th>
				           <th>보유쿠폰</th>
				           <th>할인률</th>
				        </tr>
				        <c:forEach var="loginList" items="${loginLists}">
					        <tr>
					            <td>
					                <c:if test="${not empty loginInfo}">
					                    ${loginInfo.nickname}
					                </c:if>
					            </td>
					            <td>
					                <c:if test="${not empty loginInfo}">
					                    ${loginList.coupon_name}
					                </c:if>
					            </td>
					            <td>
					                <c:if test="${not empty loginInfo}">
					                    ${loginList.coupon_discount}
					                </c:if>
					            </td>
					        </tr>
					    </c:forEach>
					    <c:forEach var="kakaoLoginList" items="${kakaoLoginLists}">
					        <tr>
					            <td>
					                <c:if test="${not empty kakaoLoginInfo}">
					                    ${kakaoLoginInfo.nickname}
					                </c:if>
					            </td>
					            <td>
					                <c:if test="${not empty kakaoLoginInfo}">
					                    ${kakaoLoginList.coupon_name}
					                </c:if>
					            </td>
					            <td>
					                <c:if test="${not empty kakaoLoginInfo}">
					                    ${kakaoLoginList.coupon_discount} %
					                </c:if>
					            </td>
					        </tr>
					    </c:forEach>
			        </c:if>
			        <c:if test="${empty loginLists and empty kakaoLoginLists}">
			        	<tr>
			        		<td colspan="3" align="center">
			        			사용가능한 쿠폰이 없습니다.
			        		</td>
			        	</tr>
			        </c:if>
		        </table>
			</div>
		</div>
		
		<!-- 다섯번째 탭 -->
		<div class="tab-pane fade" id="delete" role="tabpanel">
			<div class="row">
		        <table class="table" id="article-table">
		        	<c:if test="${not empty loginInfo or not empty kakaoLoginInfo}">
		        		<tr>
					       <th>아이디</th>
					           <td>
					           	  <c:choose>
						              <c:when test="${not empty kakaoLoginInfo}">
				                        ${kakaoLoginInfo.member_id}
				                        <input type="hidden" id="member_id" name="member_id" value="${kakaoLoginInfo.member_id}">
				                      </c:when>
				                      <c:when test="${not empty loginInfo}">
				                        ${loginInfo.member_id}
				                        <input type="hidden" id="member_id" name="member_id" value="${loginInfo.member_id}">
				                      </c:when>
			                      </c:choose>
					           </td>
					        </tr>
				        <tr>
			               <th>휴대폰번호</th>
				           <td>
				           &nbsp;&nbsp;&nbsp;
				              <c:choose>
					              <c:when test="${not empty kakaoLoginInfo}">
					              	${kakaoLoginInfo.phone}
			                        <input type="hidden" id="phone" name="phone">
			                      </c:when>
			                      <c:when test="${not empty loginInfo}">
			                      	${loginInfo.phone}
			                        <input type="hidden" id="phone" name="phone">
			                      </c:when>
		                      </c:choose>
			                  <input type = "button" id="phoneVerificationButton" value = "인증번호 요청" onclick = "sendSMS($('input[name=phone]').val())">
				           </td>
				        </tr>
				        <tr>
				        	<th>휴대폰 인증</th>
				        	<td>
				              <input type="text" id="verificationCode" name="verificationCode" size="7">&nbsp;
				              <input type="button" value="인증하기" onClick="verify()">
				        	</td>
				        </tr>
			        </c:if>
			        <tr>
				      <td colspan="2">
				       	<input type="button" id="sub" class="btn btn-dark btn-md" value="회원탈퇴" onclick="goDelete($('#member_id').val())"/>
				        <input type="button" class="btn btn-dark btn-md" value="취소" onclick="goMain()">
				      </td>
				    </tr>
		        </table>
	        </div>
		</div>
	</div>





    

	<footer class="my-5 pt-5 text-body-secondary text-center text-small">
	  <p class="mb-1">© 2023 Minhyeok, Byeon</p>
	</footer>
</div>