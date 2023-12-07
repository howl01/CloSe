<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script src="resources/js/bootstrap.bundle.min.js"></script>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/checkout.css" rel="stylesheet">
<script type="text/javascript" src = "resources/js/script.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript">
function sendSMS(hp1, hp2, hp3) {
    alert('인증번호를 요청했습니다.');
    // 버튼 숨기기
    document.getElementById('verificationSection').style.display = 'flex';
  }

  function requestVerification() {
    // 버튼 숨기기
    document.getElementById('verificationSection').style.display = 'flex';
  }
  
  $(document).ready(function() { 
		var isCheck = false;
		
		$('#idcheck').click(function(){ // 중복체크버튼
			isCheck = true;
			
			$.ajax({
				url : "duplicate.member", // 요청url
				data : ({
					inputid : $('input[name="id"]').val()
				}),
				success : function(data){
					
					if($('input[name="id"]').val() == ""){
						$('#idmessage').html("<font color=red>아이디 입력 누락</font>");
						$('#idmessage').show();
					}
					else if(jQuery.trim(data)=='YES'){
						$('#idmessage').html("<font color=blue>사용 가능합니다.</font>");
						use = "possible";
						$('#idmessage').show();
					}else{
						$('#idmessage').html("<font color=red>이미 사용중인 아이디입니다.</font>")
						use = "impossible";
						$('#idmessage').show();
					}
				}//success
			});//ajax
			
		});//중복체크 click
		
		$("input[name='id']").keydown(function(){

			isCheck = false;
			use="";
			$('#idmessage').css('display','none');
		}); // keydown
		
		$('#sub').click(function(){ // submit 클릭
			if(use == "impossible"){
				alert('이미 사용중인 아이디입니다.');
				return false;
			}else if(isCheck == false){ 
				alert('중복체크 하세요');
				return false;
			} 
		});//click(submit 클릭)
		
	}); // ready
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
        <form:form commandName="memberBean" class="needs-validation" action = "register.member" method="post">
          <div class="row">

            <div class="col-12">
              <label for="lastName" class="form-label">아이디</label>
              <div class="row">
              <div class="col-6">
              <input type="text" class="form-control mb-1" id="member_id" name = "id" placeholder="" value="${memberBean.member_id}" style="border-color: black;">
              <form:errors cssClass="err" path="member_id"/>
              </div>
              <div class="col-4">
              <input class="btn btn-outline-dark" type = "button" id = "idcheck" name = "idcheck" value = "중복체크">
              </div>
              </div>
              &nbsp;<span id="idmessage" style = "display: none;"></span>
            </div>
            
            <div class="col-12">
              <label for="nickname" class="form-label">닉네임</label>
              <div class="row">
              <div class="col-6">
              <input type="text" class="form-control mb-1" id="nickname" name = "nickname" placeholder="" value="${memberBean.nickname}" style="border-color: black;">
              <form:errors cssClass="err" path="nickname"/>
              </div>
              </div>
            </div>

            <div class="col-9">
              <label for="password" class="form-label">비밀번호</label>
                <input type="password" class="form-control" id="username" name = "password" placeholder="영문 대/소문자 + 숫자 8~16자리" value="${memberBean.password}" style="border-color: black;">
                <form:errors cssClass="err" path="password"/>
            </div>
            
            <div class="col-9">
              <label for="password2" class="form-label">비밀번호 확인</label>
                <input type="password" class="form-control mb-2" id="username" name = "passwordcheck" placeholder="비밀번호와 동일하게 입력해 주세요." onKeyUp = "repassword_keyup()"  style="border-color: black;">
                 &nbsp;<span id="pwmessage"></span>
            </div>

            <div class="col-4">
              <label for="email" class="form-label">이름</label>
              <input type="text" class="form-control" id="email" name = "name"  style="border-color: black;">
            </div>
            <div class="col-4">
              <label for="email" class="form-label">성별</label><br>
              <label class="btn btn-basic active">
                 <input type="radio" id="gender" name = "gender">남자
              </label>
              <label class="btn btn-basic active">
                 <input type="radio" id="gender" name = "gender">여자
              </label>
            </div>

         <div class="col-12">&nbsp;</div>

            <div class="col-9">
              <label for="address" class="form-label">주소</label>
              <input type="text" class="form-control mb-2" id="address1" name = "address1" placeholder="주소 찾기 클릭"  style="border-color: black;">
              <input type="text" class="form-control mb-2" id="address2" name = "address2" placeholder="상세주소 입력"  style="border-color: black;">
              <button type="button" class="btn btn-outline-dark" onclick="searchAddress()">주소 찾기</button>
            </div>
            
            <div class="col-12">&nbsp;</div>
            
         <div class="col-12">&nbsp;</div>
               <div class="col-md-3">
                 <label for="country" class="form-label">휴대폰 번호</label>
                 <select class="form-select" id="hp1" name = "hp1"  style="border-color: black;">
                   <option value="">선택</option>
                   <option value="010">010</option>
                   <option value="011">011</option>
                   <option value="016">016</option>
                   <option value="017">017</option>
                   <option value="018">018</option>
                 </select>
               </div>
            
               <div class="col-md-2">
               <label for="country" class="form-label"><br></label>
                 <input type="text" class="form-control" id="hp2" name = "hp2" onblur="hp2check()" maxlength="4"  style="border-color: black;">
               </div>
            
               <div class="col-md-2">
               <label for="country" class="form-label"><br></label>
                 <input type="text" class="form-control" id="hp3" name = "hp3" onblur="hp3check()" maxlength="4"  style="border-color: black;">
               </div>
               
               <div class="col-md-2" style="margin-top: 32px;">
                 <input class="btn btn-outline-dark" type = "button" value = "인증번호 요청" onclick = "sendSMS($('#hp1').val(), $('#hp2').val(), $('#hp3').val())" style="border-color: black;">
               </div>
               <div id="verificationSection" style="display: none; margin-top: 20px;">
              <!-- 이곳에 텍스트 상자 및 기타 요소 추가 -->
              <label for="verificationCode" class="form-label">인증번호 : </label>&nbsp;
              <input type="text" class="form-control" id="verificationCode" name="verificationCode" style="border-color: black; width: 155px;">&nbsp;
              <input type="button" value="인증하기">
            </div>
            
            <div class="col-12">&nbsp;</div>
              
            <div class="col-md-4">
            <label for="country" class="form-label">생년월일</label>
              <input type="date" class="form-control" id="zip" name = "birth" style="border-color: black;">
            </div>
          </div>

          <hr class="my-4">
       <div class="d-grid gap-2 d-md-block" align = "center">
          <button id="sub" class="btn btn-outline-dark btn-md" type="submit">회원가입</button>
          <button class="btn btn-outline-dark btn-md" type="reset">취소</button>
         </div>
        </form:form>
      </div>
    </div>
  </main>

  <footer class="my-5 pt-5 text-body-secondary text-center text-small">
    <p class="mb-1">© 2023 Minhyeok, Byeon</p>
  </footer>
</div>