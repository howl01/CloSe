<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

<script src="resources/js/bootstrap.bundle.min.js"></script>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/checkout.css" rel="stylesheet">
<script type="text/javascript" src = "resources/js/script.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript">
var registercheck = false; //인증번호 확인 여부를 저장할 변수
alert(registercheck);
var cert = false;

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
	
        /* $('#sub').click(function(){ // submit 클릭
            if(use == "impossible"){
                alert('이미 사용중인 아이디입니다.');
                return false;
                
            } else if(nickuse == "impossible"){
            	alert('이미 사용중인 닉네임입니다.');
            	return false;
            	
            }else if(pwuse == "nosame"){
            	alert('비밀번호가 일치하지 않습니다');
            	return false;
            	
            }else if(!cert){
            	alert('인증번호를 받으세요');
            	return false;
            	
            }else if(!registercheck){
            	alert('인증번호를 확인하세요');
            	return false;
            }

            f.submit();
        }); */
    });

    $("input[name='member_id']").keydown(function(){
        use="";
        $('#idmessage').css('display','none');
    });

    
    
    $('#email').keyup(function () {
        var enteredEmail = $(this).val();

        if (isValidEmail(enteredEmail)) {
            $('#emailmessage').hide();
        } else {
            $('#emailmessage').html("<font color='red'>형식이 올바르지 않습니다.</font>");
            $('#emailmessage').show();
        }
    });
    
});

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

            // 이 부분에서 필요한 로직을 추가하여 처리 결과를 사용자에게 보여줄 수 있습니다.
            // 예: 인증번호 입력 창을 보이게 한다거나, 메시지를 표시한다 등.
            document.getElementById('verificationSection').style.display = 'flex';
            cert = true;
            // 받은 랜덤 값(response)을 전역 변수에 저장
            window.randomValue = response;
        },
        error: function(error) {
            console.error(error);
            // 에러가 발생했을 경우에 대한 처리를 추가할 수 있습니다.
            cert = false;
            alert('전화번호가 일치하지 않습니다.');
        }
    });
}

function verify() {
    var verificationCode = document.getElementById('verificationCode').value;
    // 인증번호가 비어 있으면 알림창을 띄우고 함수를 종료
    if (verificationCode.trim() == '') {
        alert('인증번호를 입력하세요.');
        return;
    }

    // 사용자가 입력한 값
    var userInput = document.getElementById('verificationCode').value;

    // 전역 변수에 저장된 랜덤 값과 사용자가 입력한 값 비교
    if (userInput === window.randomValue) {
        // 일치할 경우, 여기에 원하는 동작 추가
        alert('인증 성공!');
        registercheck = true;
        location.reload();
    } else {
        // 불일치할 경우, 여기에 원하는 동작 추가
        alert('인증번호가 일치하지 않습니다. 다시 시도하세요.');
        // 여기에 추가로 원하는 동작을 넣으면 됩니다.
    }
}



function isValidEmail(email) {
    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}
	
function goLogin(){
	location.href="login.member";
}

function confirm() {
	if(!registercheck || registercheck == null){
		f.submit();
	} else if(registercheck){
		if(!cert){
			var phoneInput = document.getElementById('phone');
			var phoneValue = phoneInput.value;
			sendsms(phoneValue);
		} else if(cert){
			f.submit();
		}
	}
}

</script>

<style type="text/css">
   .err{
      color: red;
      font-weight: bold;
      font-size: 9pt;
   }
</style>

<div class="container">
  <main>
    <div class="py-5 text-center">
    
   <a href = "view.main">
      <img class="d-block mx-auto mb-4" src="resources/img/logo.png" alt="" width="500" height="100">
    </a>
      <h2>회원가입</h2>
    </div>
   
    <div align = "center">
      <div class="col-md-7 col-lg-8 text-start">
      <hr class="my-6">
        <form:form commandName="memberBean" name="f" class="needs-validation" action = "register.member" method="post">
          <div class="row">

            <div class="col-12">
              <label for="lastName" class="form-label">아이디</label>
              <div class="row">
              <div class="col-6">
              <input type="text" class="form-control" id="member_id" name = "member_id" readonly="readonly" value="${member_id}" style="border-color: black;">
              </div>
              </div>
            </div>
            
            <div class="col-12">
              <label for="nickname" class="form-label">닉네임</label>
              <div class="row">
              <div class="col-6">
              <input type="text" class="form-control" id="nickname" name = "nickname" placeholder="" value="${memberBean.nickname}" style="border-color: black;">
              <form:errors cssClass="err" path="nickname"/>
              &nbsp;<span id="nickmessage" style = "display: none;"></span>
              </div>
              </div>
            </div>

            <div class="col-9">
              <label for="password" class="form-label">비밀번호</label>
                <input type="password" class="form-control" id="username" name = "password" placeholder="영문 소문자 + 숫자 8~16자리" value="${memberBean.password}" onblur="pwcheck()" style="border-color: black;">
                <form:errors cssClass="err" path="password"/>
            </div>
            
            <div class="col-9">
              <label for="password2" class="form-label">비밀번호 확인</label>
                <input type="password" class="form-control" id="passwordcheck" name = "passwordcheck" placeholder="비밀번호와 동일하게 입력해 주세요." onKeyUp = "repassword_keyup()" value="${memberBean.passwordcheck}" style="border-color: black;">
                 &nbsp;<span id="pwmessage"></span>
            </div>

            <div class="col-4">
              <label for="name" class="form-label">이름</label>
              <input type="text" class="form-control" id="name" name = "name" value="${memberBean.name}" style="border-color: black;">
              <form:errors cssClass="err" path="name"/>
            </div>
            <div class="col-5">
            	<div class="row">
              <label for="email" class="form-label">성별</label><br>
              <%
				String[] mgender = {"남자","여자"};
			  %>
              <label class="btn btn-basic active">
                 <c:forEach var="gender" items="<%= mgender %>">
					<input type="radio" name="gender" value="${gender}" 
					<c:if test="${memberBean.gender == gender}">checked</c:if>>${gender}
				</c:forEach>
              </label>
              <form:errors cssClass="err" path="gender"/>
              </div>
            </div>

            <div class="col-9">
              <label for="address" class="form-label">주소</label>
              <input type="text" class="form-control" id="address1" name = "address1" placeholder="주소 찾기 클릭" value="${memberBean.address1}" style="border-color: black;">
              <form:errors cssClass="err" path="address1"/>
              <input type="text" class="form-control" id="address2" name = "address2" placeholder="상세주소 입력" value="${memberBean.address2}" style="border-color: black;">
              <button type="button" class="btn btn-outline-dark" onclick="searchAddress()">주소 찾기</button>
              <form:errors cssClass="err" path="address2"/>
            </div>
            
         	<div class="col-12">&nbsp;</div>
               <div class="col-md-6">
                 <label for="country" class="form-label">휴대폰 번호</label>
                 <input type="text" class="form-control" id="phone" name = "phone" maxlength="11" value="${memberBean.phone}" style="border-color: black;">
                 <form:errors cssClass="err" path="phone"/>
               </div>
               
            <div class="col-md-2" style="margin-top: 32px;">
               <input class="btn btn-outline-dark" type = "button" value = "인증번호 요청" onclick = "sendSMS($('#phone').val())" style="border-color: black;">
            </div>
            <div id="verificationSection" style="display: none; margin-top: 20px;">
              <!-- 이곳에 텍스트 상자 및 기타 요소 추가 -->
              <label for="verificationCode" class="form-label">인증번호 : </label>&nbsp;
              <input type="text" class="form-control" id="verificationCode" name="verificationCode" style="border-color: black; width: 155px;">&nbsp;
              <input type="button" value="인증하기" onClick="verify()">
              <form:errors cssClass="err" path="verificationCode"/>
            </div>
            
            <div class="col-12">&nbsp;</div>
               <div class="col-md-6">
                 <label for="country" class="form-label">이메일 주소</label>
                 <input type="text" class="form-control" id="email" name = "email" value="${memberBean.email}" style="border-color: black;">
                 <form:errors cssClass="err" path="email"/>
                  &nbsp;<span id="emailmessage" style = "display: none;"></span>
               </div>
            
            <div class="col-12">&nbsp;</div>
              
            <div class="col-md-4">
            <label for="birth" class="form-label">생년월일</label>
              <input type="date" class="form-control" id="birth" name = "birth" value="${memberBean.birth}" style="border-color: black;">
              <form:errors cssClass="err" path="birth"/>
            </div>
            <div class="col-md-3">
            <label for="height" class="form-label">키 (cm)</label>
              <input type="text" class="form-control" id="height" name = "height" value="${memberBean.height}" style="border-color: black;">
            </div>
            <div class="col-md-3">
            <label for="weight" class="form-label">몸무게 (kg)</label>
              <input type="text" class="form-control" id="weight" name = "weight" value="${memberBean.weight}" style="border-color: black;">
            </div>
          </div>

          <hr class="my-4">
         <div class="d-grid gap-2 d-md-block" align = "center">
          <input type="button" id="sub" class="btn btn-dark btn-md" value="인증요청" onclick="confirm()"/>
          <input type="button" class="btn btn-dark btn-md" value="취소" onclick="goLogin()">
         </div>
        </form:form>
      </div>
    </div>
  </main>

  <footer class="my-5 pt-5 text-body-secondary text-center text-small">
    <p class="mb-1">© 2023 Minhyeok, Byeon</p>
  </footer>
</div>