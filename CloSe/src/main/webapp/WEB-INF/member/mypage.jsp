<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="resources/js/bootstrap.bundle.min.js"></script>
<script src="resources/js/jquery.js"></script>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/checkout.css" rel="stylesheet">

<style>
	table{
		text-align: center;
	}
	th{
		text-align: right;
	}
</style>

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
		        <table class="table" id="article-table">
			        <tr>
			           <th>아이디</th>
			           <td>
			              <input type="text" name="member_id" disabled="disabled" value="${loginInfo.member_id}">
			           </td>
			        </tr>
			        <tr>
		               <th>비밀번호</th>
			           <td>
			              <input type="text" name="password" value="${loginInfo.password}">
			           </td>
			        </tr>
			        <tr>
			           <th>이름</th>
			           <td>
			           	  <input type="text" name="name" value="${loginInfo.name}">
			           </td>
			        </tr>
			        <tr>
			           <th>전화번호</th>
			           <td>
			              <input type="text" name="phone" value="${loginInfo.phone}">
			           </td>
			        </tr>
		        </table>
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