<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<script src="resources/js/bootstrap.bundle.min.js"></script>
<link href="resources/css/sign-in.css" rel="stylesheet">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/script.js"></script>
<script>
      function loginValidation() {
         var memberId = document.getElementById('floatingInput').value;
         var password = document.getElementById('floatingPassword').value;

         // 아이디 또는 비밀번호가 비어있는 경우
         if (memberId.trim() === '' || password.trim() === '') {
            // 경고 메시지 또는 특정 스타일 적용
            alert('아이디와 비밀번호를 입력하세요.');
            return false; // 폼 제출을 막음
         }
         
      	// "기억하기" 체크박스가 선택되었을 경우, 쿠키에 사용자명 저장
         if (document.getElementById('flexCheckDefault').checked) {
             setCookie('rememberMe', memberId, 30); // 30일 동안 유효한 쿠키 생성
         } else {
             deleteCookie('rememberMe'); // 선택이 해제되면 쿠키 삭제
         }

         return true; // 유효한 경우 폼을 제출
      }
      
   	  // 쿠키 설정 함수
      function setCookie(name, value, days) {
          var expires = '';
          if (days) {
              var date = new Date();
              date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
              expires = '; expires=' + date.toUTCString();
          }
          document.cookie = name + '=' + value + expires + '; path=/';
      }

   	  // 쿠키 삭제 함수
      function deleteCookie(name) {
          setCookie(name, '', -1);
      }

  	  // 쿠키 값 가져오기 함수
      function getCookie(name) {
          var nameEQ = name + '=';
          var ca = document.cookie.split(';');
          for (var i = 0; i < ca.length; i++) {
              var c = ca[i];
              while (c.charAt(0) === ' ') c = c.substring(1, c.length);
              if (c.indexOf(nameEQ) === 0) return c.substring(nameEQ.length, c.length);
          }
          return null;
      }

   	  // 페이지 로드 시 실행되는 이벤트
      window.onload = function () {
    	  // 쿠키에서 기억된 사용자명 가져오기
          var rememberedUsername = getCookie('rememberMe');
          if (rememberedUsername) {
        	  // 입력 필드에 사용자명 설정 및 "기억하기" 체크박스 선택
              document.getElementById('floatingInput').value = rememberedUsername;
              document.getElementById('flexCheckDefault').checked = true;
          }
      };
</script>

<body class="d-flex align-items-center py-4 bg-body-tertiary">

   <main class="form-signin w-100 m-auto">
      <form action="login.member" method="post" onSubmit="return loginValidation()">
         <a href="view.main">
         <img class="mb-3" src="resources/img/logo.png" alt="" width="350"
            height="100"
            style="margin-left: auto; margin-right: auto; display: block;">
         </a>
         <h1 class="h3 mb-4 fw-normal" align="center"><b>통합로그인</b></h1>

         <div class="form-floating">
            <input type="text" class="form-control" id="floatingInput"
               placeholder="Id" name="member_id"> <label for="floatingInput">아이디</label>
         </div>
         <div class="form-floating">
            <input type="password" class="form-control" id="floatingPassword"
               placeholder="Password" name="password"> <label for="floatingPassword">비밀번호</label>
         </div>

         <div class="form-check text-start my-3">
            <input class="form-check-input" type="checkbox" value="remember-me"
               id="flexCheckDefault"> <label class="form-check-label"
               for="flexCheckDefault"> 아이디 저장 </label> <label
               style="float: right;"> <a href="findid.jsp"
               class="text-secondary link-underline link-underline-opacity-0"><font
                  size="2">아이디/비밀번호 찾기</font></a> <a href="register.member"
               class="text-secondary link-underline link-underline-opacity-0"><font
                  size="2">회원가입</font></a>
            </label>
         </div>
         <button class="btn btn-dark w-100 py-2" type="submit">로그인</button>
         <p class="mt-5 mb-3 text-body-secondary">© 2023 Minhyeok, Byeon</p>
      </form>
   </main>

</body>
