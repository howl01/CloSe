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

<div class="container">
    <div class="py-5 text-center">
	   <a href = "view.main">
	      <img class="d-block mx-auto mb-4" src="resources/img/logo.png" width="500" height="100">
	   </a>
      <h2>관리자 페이지</h2>
    </div>
    
<div class="body">
   <div class="row">
      <div class="col-lg-2"></div>
      <div class="col-lg-8">
         <div style="padding:20 10 20 10">
            <div style="">
               <h3 style="padding: 22 0 22 0">주문내역</h3>
            </div>
            
            <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">이미지</th>
                            <th scope="col">상품정보</th>
                            <th scope="col">가격</th>
                            <th scope="col">옵션</th>
                            <th scope="col">주문수량</th>
                            <th scope="col">소계</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="oi" items="${olists}" varStatus="status">
                           <c:set var="totalPrice" value="${totalPrice + (oi.price*oi.qty)}" />
                            <tr>
                                <td>
                                    <img id="preview" width="100px"
                                        src='<c:url value='/resources/product/image/'/>${oi.image }'
                                        class="rounded" />
                                </td>
                                <td>
                                   <a href="detail.product?product_number=${oi.product_number }">[${fn:substringBefore(oi.product_name,'/') }] <br>
                                   ${fn:substringAfter(oi.product_name,'/') }</a> 
                                </td>
                                <td>
                                   ${oi.price}원
                                </td>
                                <td>
                                    ${oi.product_size }
                                </td>
                                <td>
                                    ${oi.qty }
                                </td>
                                <td>
                                   ${oi.price*oi.qty}원
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            
            <div style="">
               <h3 style="padding: 22 0 22 0">구매자 정보</h3>
            </div>
            <table class="table">
               <tbody>
                  <c:forEach var="oi" items="${olists}" begin="0" end="0" varStatus="status">
                  <c:set var="order_id" value="${oi.orders_id }"/>
                  <tr>
                     <td>주문자</td>
                     <td>${oi.name }</td>
                  </tr>
                  <tr>
                     <td>연락처</td>
                     <td>${oi.phone }</td>
                  </tr>
                  <tr>
                     <td>이메일</td>
                     <td>${oi.email }</td>
                  </tr>
                  </c:forEach>
               </tbody>
            </table>
            
            <div style="">
               <h3 style="padding: 22 0 22 0">배송지 정보</h3>
            </div>
            <table class="table">
               <tbody>
                  <c:forEach var="oi" items="${olists}" begin="0" end="0" varStatus="status">
                  <tr>
                     <td>수령인</td>
                     <td>${oi.receiver }</td>
                  </tr>
                  <tr>
                     <td>연락처</td>
                     <td>${oi.receiver_phone }</td>
                  </tr>
                  <tr> 
                     <td>배송지</td>
                     <td>${oi.address }</td>
                  </tr>
                  <tr>
                     <td>배송메모</td>
                     <td>${oi.d_message }</td>
                  </tr>
                  </c:forEach>
               </tbody>
            </table>
            
            <div style="">
               <h3 style="padding: 22 0 22 0">주문 금액 상세</h3>
            </div>
            <table class="table">
               <tbody>
                  <tr>
                     <td>상품금액</td>
                     <td>${totalPrice }</td>
                  </tr>
                  <tr>
                     <td>배송비</td>
                     <td>
                        ${totalPrice > 50000 ? '0' : '4000'}
                        <c:set var="delivery" value="${totalPrice > 50000 ? '0' : '4000'}"/>
                     </td>
                     
                  </tr>
                  <tr>
                     <td>총 주문금액</td>
                     <td>${totalPrice+delivery }</td>
                  </tr>
               </tbody>
            </table>
            <input type="button" class="btn btn-Dark me-md-2" value="목록보기" onClick="location.href='adminPage.member?pageNumber=${ pageInfo.pageNumber }'">
            <input type="button" class="btn btn-Dark me-md-2" value="환불하기" onclick="location.href='refund.orders?order_id=${order_id}&pageNumber=${pageNumber }'">
             
         </div>
      </div>


   </div>
</div>

	<footer class="my-5 pt-5 text-body-secondary text-center text-small">
	  <p class="mb-1">© 2023 Minhyeok, Byeon</p>
	</footer>
</div>