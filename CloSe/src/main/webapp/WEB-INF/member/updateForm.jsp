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
	    <a class="nav-link" data-bs-toggle="tab" href="aa" aria-selected="false" role="tab" tabindex="-1">내 코디</a>
	  </li>
	  <li class="nav-item" role="presentation">
	    <a class="nav-link" data-bs-toggle="tab" href="bb" aria-selected="false" role="tab" tabindex="-1">구매 상품</a>
	  </li>
	  <li class="nav-item" role="presentation">
	    <a class="nav-link" data-bs-toggle="tab" href="#delete" aria-selected="false" role="tab" tabindex="-1">회원탈퇴</a>
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
			                  <input type = "button" id="phoneVerificationButton" value = "인증번호 요청" onclick = "sendSMS($('input[name=phone]').val())" style="border-color: black;">
				           </td>
				        </tr>
				        <tr>
				        	<th>휴대폰 인증</th>
				        	<td>
				              <input type="text" id="verificationCode" name="verificationCode" style="border-color: black;">&nbsp;
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