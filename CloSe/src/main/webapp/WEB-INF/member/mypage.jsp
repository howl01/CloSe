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
		text-align: right;
	}
</style>

<script type="text/javascript">
	function goMain(){
		location.href="view.main";
	}
	
	function goUpdate(){
		location.href="update.member";
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
				<form>
			        <table class="table" id="article-table">
			        	<c:if test="${not empty loginInfo or not empty kakaoLoginInfo}">
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
		<div class="tab-pane fade" id="profile" role="tabpanel">
			aaa
		</div>
		
	</div>





    

	<footer class="my-5 pt-5 text-body-secondary text-center text-small">
	  <p class="mb-1">© 2023 Minhyeok, Byeon</p>
	</footer>
</div>