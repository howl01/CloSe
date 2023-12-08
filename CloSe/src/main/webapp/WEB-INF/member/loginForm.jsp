<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<script src="resources/js/bootstrap.bundle.min.js"></script>
<link href="resources/css/sign-in.css" rel="stylesheet">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">

<body class="d-flex align-items-center py-4 bg-body-tertiary">

   <main class="form-signin w-100 m-auto">
      <form action = "login.member" method="post">
         <a href = "view.main">
         <img class="mb-3" src="resources/img/logo.png" alt="" width="350"
            height="100"
            style="margin-left: auto; margin-right: auto; display: block;">
         </a>
         <h1 class="h3 mb-4 fw-normal" align="center"><b>통합로그인</b></h1>

         <div class="form-floating">
            <input type="text" class="form-control" id="floatingInput"
               placeholder="Id" name = "member_id"> <label for="floatingInput">아이디</label>
         </div>
         <div class="form-floating">
            <input type="password" class="form-control" id="floatingPassword"
               placeholder="Password" name = "password"> <label for="floatingPassword">비밀번호</label>
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
         <button class="btn btn-primary w-100 py-2" type="submit">로그인</button>
         <p class="mt-5 mb-3 text-body-secondary">© 2023 Minhyeok, Byeon</p>
      </form>
   </main>

</body>