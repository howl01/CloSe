<%@page import="org.springframework.ui.Model"%>
<%@page import="cart.model.CartInfoBean"%>
<%@page import="java.util.List"%>
<%@page import="product.model.ProductBean"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../main/top.jsp"%>

<style type="text/css">
</style>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src = "resources/js/script.js"></script>
<script type="text/javascript">
function updatePrices() {
    var totalPrice = parseInt(document.getElementById('totalPrice').innerText);
    var deliveryPrice = totalPrice <= 50000 ? 4000 : 0;
    var total = totalPrice + deliveryPrice;

    document.getElementById('deliveryPrice').innerText = deliveryPrice;
    document.getElementById('total').innerText = total;
    document.getElementById('totalAmount').value = total;
}

window.onload = function () {
    updatePrices();
};


function goCart() {
		location.href = "cartAdd.cart";
}

function allCheck(all) { //전체체크박스를 눌렀을때
	rcheck = document.getElementsByClassName("term");
	acheck = all.checked;

	if (acheck) {
		for (i = 0; i < rcheck.length; i++) {
			rcheck[i].checked = true;
		}
	} else {
		for (i = 0; i < rcheck.length; i++) {
			rcheck[i].checked = false;
		}
	}
}
function rowCheck(){ //약관
	var rcheck = document.getElementsByClassName('term');
    var acheck = document.getElementById('selectAll');
    
    for (var i = 0; i < rcheck.length; i++) {
        if (!rcheck[i].checked) {
        	acheck.checked = false;
            return; 
        }
    }
    acheck.checked = true;
}

function openDetailWindow() {
    // 새로운 윈도우 창 열기
    var detailWindow = window.open('', '_blank', 'width=600,height=400');
    // 윈도우 창에 JSP를 로드
    detailWindow.location.href = 'resources/jsp/term1.jsp';
}


var inputData = false; // 주문사람과 동일한지 여부를 저장하는 변수

function inputInfo() {
    var ordererName = '${mb.name}';
    var ordererPhone = '${mb.phone}';
    var ordererAddress1 = '${mb.address1}';
    var ordererAddress2 = '${mb.address2}';

    if (!inputData) {
        document.getElementsByName('receiver')[0].value = ordererName;
        document.getElementsByName('receiver_phone')[0].value = ordererPhone;
        document.getElementsByName('address1')[0].value = ordererAddress1;
        document.getElementsByName('address2')[0].value = ordererAddress2;
    } else {
        document.getElementsByName('receiver')[0].value = '';
        document.getElementsByName('receiver_phone')[0].value = '';
        document.getElementsByName('address1')[0].value = '';
        document.getElementsByName('address2')[0].value = '';
    }

    inputData = !inputData;
}

function pay() {
    var IMP = window.IMP;
    IMP.init("imp58878478");
    
    //유효성검사
    var receiver = document.getElementsByName('receiver')[0].value.trim();
    var receiverPhone = document.getElementsByName('receiver_phone')[0].value.trim();
    var address1 = document.getElementsByName('address1')[0].value.trim();

    if (receiver === '') {
        alert('받으시는 분 이름을 입력해주세요.');
        return false;
    }
    if(receiverPhone === ''){
    	alert('연락처는 필수 입력 항목입니다.');
        return false;
    }
    if(address1 === ''){
    	alert('주소는 필수 입력 항목입니다.');
        return false;
    }
    
    //약관체크
    if(!document.getElementById('selectAll').checked){
    	alert("모든 약관에 동의하셔야 구매가 가능합니다.")
    	return;
    }
    
    var totalP = document.getElementById('total').innerText;
    // 원포트 관리자 페이지 -> 내정보 -> 가맹점식별코드
    // ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
    IMP.request_pay({
        pg: 'html5_inicis',  // 실제 계약 후에는 실제 상점아이디로 변경
        pay_method: 'card', // 'card'만 지원됩니다.
        merchant_uid: 'merchant_' + new Date().getTime(), // 상점에서 관리하는 주문 번호
        name: '옷비서 결제', // 상품 이름
        amount: '100',//totalP, // 결제창에 표시될 금액. 실제 승인이 이뤄지지는 않습니다. 
        buyer_email: '${mb.email}',
        buyer_name: '${mb.name}', 
        buyer_tel: '${mb.phone}',
        buyer_addr: '${mb.address1}',
    }, function (rsp) {
        if (rsp.success) {  // 결제가 성공했을 떄
            // 결제가 완료되었을 떄 결제 정보를 뜨게 만듬
            var msg = '결제가 완료되었습니다.';
            msg += '고유ID : ' + rsp.imp_uid;
            msg += '상점 거래ID : ' + rsp.merchant_uid;
            msg += '결제 금액 : ' + rsp.paid_amount;
            msg += '카드 승인번호 : ' + rsp.apply_num;
            
          
            
        } else {    // 결제가 실패했을 때
            // 결제에 실패했을떄 실패메세지와 실패사유를 출력
            var msg = '결제에 실패하였습니다.';
            msg += '실패 사유 : ' + rsp.error_msg;
            document.getElementById('orders_id').value = 'merchant_' + new Date().getTime();
            document.orderform.submit();
        }
        alert(msg);
    });
}
</script>

<div class="body">


	<div class="row">
		<div class="col-lg-2"></div>
		<div class="col-lg-8">
			<div style="padding:20 10 20 10">
				<div style="">
					<h3 style="padding: 22 0 22 0">주문상세</h3>
				</div>
					<h4>1.주문하는상품</h4>
					<form method="post" action="order.orders" name="orderform">
						<input type="hidden" name="orders_id" id="orders_id" value="">
						
						<c:if test="${not empty loginInfo }">
							<input type="hidden" name="member_id" value="${loginInfo.member_id}">
						</c:if>
						<c:if test="${not empty kakaoLoginInfo }">
							<input type="hidden" name="member_id" value="${kakaoLoginInfo.member_id}">
						</c:if>
						<input type="hidden" name="totalamount" id="totalAmount">
			            <table class="table">
                           <thead>
                                    <tr>
                                        <th scope="col" colspan="2">상품정보</th>
                                        <th scope="col">수량</th>
                                        <th scope="col">소계</th>
                                        <th scope="col">배송비</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="cib" items="${clists}" varStatus="status">
                                        <tr>
                                            <td>
                                            	<input type="hidden" name="cnums" value="${cib.cart_number}">
                                                <img id="preview" width="100px"
                                                    src='<c:url value='/resources/product/image/'/>${cib.image }'
                                                    class="rounded" />
                                            </td>
                                            <td> 
                                                [${fn:substringBefore(cib.product_name,'/') }] <br>
                                            	${fn:substringAfter(cib.product_name,'/') } <br>
                                            	사이즈:${cib.product_size }
                                            </td>
                                            <td>
                                            	${cib.qty }
                                            </td>
                                            <td>
                                            	${cib.qty * cib.price }
                                            	<c:set var="totalPrice" value="${totalPrice + (cib.price * cib.qty)}" />
                                            </td>
                                            <c:if test="${status.index == 0 }">
												<td rowspan="100%">
													<span>0</span>원
												</td>
											</c:if>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                                
                            </table>
            			
            			
            			
				<h4>2.주문고객/배송지정보</h4>
				<table class="table">
				 <tbody>
                	<tr>
                		<td>주문하시는 분</td>
                		<td>${mb.name }/${mb.phone }/${mb.email }</td>
                	</tr>
                	<tr>
                		<td>받으시는 분</td>
                		<td>
                			<input type="text" name="receiver">
                			<button type="button" onclick="inputInfo()">같게</button>
                		</td>
                	</tr>           
                	<tr>
                		<td>연락처</td>
                		<td><input type="text" name="receiver_phone"></td>
                	</tr>
                	<tr>
                		<td>주소</td>
                		<td>
                			<input type="text" id="address1" name="address1" placeholder="주소 찾기 클릭"> <br>
				            <input type="text" id="address2" name="address2" placeholder="상세주소 입력"> <br>
				            <button type="button" onclick="searchAddress()">주소 찾기</button>
                		</td>
                	</tr>
                	<tr>
                		<td>배송메시지</td>
                		<td><input type="text" name="d_message"></td>
                	</tr>
                 </tbody>
                </table>
               </form>
               
               <table class="table">
               	<tr>
                 <td>
                  상품금액:<span id="totalPrice">${totalPrice }</span>원 <br>
                 </td>
                 <td>
                  배송비:<span id="deliveryPrice"></span>원
                 </td>
                 <td>
                  총결제금액:<span id="total"></span>원
                 </td>
                </tr>
               </table>
               
               
               <input type="checkbox" id="selectAll" onclick="allCheck(this)"> 전체 동의
				<br>
				<!-- 각각의 약관 동의 체크박스 -->
				<input type="checkbox" class="term" id="terms1" onclick="rowCheck()"> 약관 1 동의 <a href="#" onclick="openDetailWindow()">자세히</a> <br>
				<input type="checkbox" class="term" id="terms2" onclick="rowCheck()"> 약관 2 동의 <a href="">자세히</a> <br>
               
               <button onclick="goCart()">장바구니</button>
               <button onclick="pay()">결제하기</button>
               
			</div>
		</div>

		<div class="col-lg-2 mt-5 px-5">
			<div class="bs-component">
				<div class="card mb-3">
					<h3 class="card-header">오늘의 날씨 정보</h3>
					<div class="card-body">
						<h5 class="card-title">Special title treatment</h5>
						<h6 class="card-subtitle text-muted">Support card subtitle</h6>
					</div>
					<svg xmlns="http://www.w3.org/2000/svg"
						class="d-block user-select-none" width="100%" height="200"
						aria-label="Placeholder: Image cap" focusable="false" role="img"
						preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180"
						style="font-size: 1.125rem; text-anchor: middle">
                  <rect width="100%" height="100%" fill="#868e96"></rect>
                  <text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text>
                </svg>
				</div>
			</div>
		</div>



	</div>
</div>




<button onclick="location.href='view.main'">이동</button>
<%@ include file="../main/bottom.jsp"%>