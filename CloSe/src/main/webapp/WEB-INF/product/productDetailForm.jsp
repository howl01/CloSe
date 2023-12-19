<%@page import="product.model.ProductBean"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../main/top.jsp"%>

<style type="text/css">
#preview {
	width: 100%;
}

.ptab {
	text-decoration: none;
	color: black;
}

.nav-item {
	cursor: pointer;
}
#totalP{
	border:none; 
	text-align:right;
}
#totalP:focus{
	outline:none;
}
</style>
<script type="text/javascript">
	function fnMove(seq) { 
		// 모든 <li> 안의 <a> 태그에서 'active' 클래스 제거
		$('ul.nav-tabs li a').removeClass('nav-link active');
		// 클릭한 <li> 안의 <a> 태그에 'active' 클래스 추가
		$('#tab' + seq + ' a').addClass('nav-link active');
		updateTabContent(seq);
	}

	
	function updateTabContent(seq) {
		$('#tab-content').html('<p>This is the content for tab ' + seq + '</p>');
	}
	
	function fnCalCount(type, size) {
        // size를 사용하여 적절한 선택자를 찾도록 수정
        var $input = $("input[name='" + size + "']");
        var tCount = Number($input.val());
        var max;
        if(size == "s_stock"){
        	max = '${pb.s_stock}';
        }
        if(size == "m_stock"){
        	max = '${pb.m_stock}';
        }
        if(size == "l_stock"){
        	max = '${pb.l_stock}';
        }
        if(size == "xl_stock"){
        	max = '${pb.xl_stock}';
        }
        if (type == 'p') {
            if (tCount < max) $input.val(Number(tCount) + 1);
        } else {
            if (tCount > 1) $input.val(Number(tCount) - 1);
        }
        updateTotalPrice(size, $input.val());
    }
	
	
	$(document).ready(function() {
		$('#cartBtn').click(function () {
			alert("장바구니버튼");
			if ($('.quantity-selection').length === 0) {
	            alert("사이즈를 선택하세요.");
	            return;
	        }
			var addToCart = confirm("상품을 장바구니에 추가했습니다. 장바구니로 이동하시겠습니까?");
	        
	        if (addToCart) {
	            $("#buyForm").attr("action", "cartAdd.cart");
	        } else {
	        	return;
	        }
			$("#buyForm").submit();
		});
		
		$('#buyNow').click(function () { 
			alert("구매하기버튼");
		  	if ($('.quantity-selection').length === 0) {
            	alert("사이즈를 선택하세요.");
           	 	return;
        	}
		  	$("#buyForm").attr("action", "/your_buy_now_action_url");
		  	$("#buyForm").submit();
		});
		
		$('select[name="size"]').change(function() {
	        // 기존의 수량 선택 요소를 제거합니다.
			
	        // 선택된 사이즈 값을 가져옵니다.
	        var selectedSize = $(this).val();
	        var selectedSizeText = $(this).find('option:selected').text();
	        var sST = selectedSizeText.split(' ');
	        
	        
	        // 유효한 사이즈가 선택된 경우
	        if (selectedSize !== "") {
	            // 동적으로 수량 선택 버튼을 생성합니다.
	            if (!$('.quantity-selection[data-size="' + selectedSize + '"]').length) {
                // 동적으로 수량 선택 버튼을 생성합니다.
                var quantitySelection = '<div class="quantity-selection" data-size="' + selectedSize + '">';
                quantitySelection += '<span>' + sST[0] + '</span>';
                quantitySelection += '<button type="button" onclick="fnCalCount(\'m\', \'' + selectedSize + '\')">-</button>';
                quantitySelection += '<input type="text" name='+selectedSize+' class="sq" size="2" value="1" readonly style="text-align:right;"/>';
                quantitySelection += '<button type="button" onclick="fnCalCount(\'p\', \'' + selectedSize + '\')">+</button>';
                var totalPrice = ${pb.price} * 1;
                quantitySelection += '<span class="total-price">' + totalPrice + '</span>원';
                quantitySelection += '<button type="button" class="remove-button" onclick="removeQuantitySelection(this)">X</button>';
                quantitySelection += '</div>';

	            // 생성한 수량 선택 버튼을 컨테이너에 추가합니다.
	            $('.selSize').append(quantitySelection);
	            }
	        }
	        
	        $("#selsize option:eq(0)").prop("selected", true);
	        
	        
	        var totalSum = 0;
		    $('.quantity-selection .total-price').each(function () {
		        totalSum += Number($(this).text());
		    });

		    $('#totalP').text(totalSum);
	    });
		
		
	});
	
	
		function removeQuantitySelection(button) { //사이즈별 수량 선택란 제거
		    $(button).closest('.quantity-selection').remove();
		    var totalSum = 0;
		    $('.quantity-selection .total-price').each(function () {
		        totalSum += Number($(this).text());
		    });

		    $('#totalP').text(totalSum);
		}
		function updateTotalPrice(selectedSize, quantity) {
		    var productPrice = ${pb.price};
		    var totalPrice = productPrice * quantity;
		    alert(totalPrice);
		    $('.quantity-selection[data-size="' + selectedSize + '"] .total-price').text(totalPrice);
		    
		    var totalSum = 0;
		    $('.quantity-selection .total-price').each(function () {
		        totalSum += Number($(this).text());
		    });

		    $('#totalP').text(totalSum);
		}
</script>

<div class="body">


	<div class="row">
		<div class="col-lg-2"></div>
		<div class="col-lg-8">
			<div style="padding: 20 10 20 10">





				<form method="post" id="buyForm">
					<input type="hidden" name="product_number" value="${pb.product_number }"> 
					<input type="hidden" name="member_id" value="kim"> 
					<div class="row">
						<div class="col-lg-1"></div>
						<div class="col-lg-10 row">
							<div class="col-lg-7" style="text-align: center;">
								<img id="preview"
									src='<c:url value='/resources/product/image/'/>${pb.image }' />
							</div>
							<div class="col-lg-5">
								<div style="border-bottom: 0.5px solid gray;">${fn:substringAfter(pb.product_name,'/') }</div>
								<div>브랜드 : ${fn:substringBefore(pb.product_name,'/') }</div>
								<div>가격 : ${pb.price }</div>
								<div>
									<div>사이즈</div>
									<div>
										<select id="selsize" name="size">
											<option value="">옵션선택</option>
											<option value="s_stock"
												<c:if test="${pb.s_stock == 0}"> disabled </c:if>>
												S
												<c:if test="${pb.s_stock == 0}">(품절)</c:if><c:if
													test="${1<=pb.s_stock and 5>=pb.s_stock}"> [${pb.s_stock }개 남음]</c:if>
											</option>
											<option value="m_stock"
												<c:if test="${pb.m_stock == 0}"> disabled </c:if>>
												M
												<c:if test="${pb.m_stock == 0}">(품절)</c:if><c:if
													test="${1<=pb.m_stock and 5>=pb.m_stock}"> [${pb.m_stock }개 남음]</c:if>
											</option>
											<option value="l_stock"
												<c:if test="${pb.l_stock == 0}"> disabled </c:if>>
												L
												<c:if test="${pb.l_stock == 0}">(품절)</c:if><c:if
													test="${1<=pb.l_stock and 5>=pb.l_stock}"> [${pb.l_stock }개 남음]</c:if>
											</option>
											<option value="xl_stock"
												<c:if test="${pb.xl_stock == 0}"> disabled </c:if>>
												XL
												<c:if test="${pb.xl_stock == 0}">(품절)</c:if><c:if
													test="${1<=pb.xl_stock and 5>=pb.xl_stock}"> [${pb.xl_stock }개 남음]</c:if>
											</option>
										</select>
									</div>
								</div>

								<div class="selSize">
									<!-- 수량선택 -->
								</div>
								<div style="display: flex;">
									<span>총 상품 금액</span> 
									<span id="totalP">0</span> 
									<span>원</span>
								</div>

								<div>
									<button id="cartBtn" type="button">장바구니</button>
									<button id="buyNow" type="button">구매하기</button>
								</div>

								<div>온도:${pb.temperature }</div>
								<div>소분류:${pb.smallcategory_name }</div>
							</div>
						</div> 
					</div>
				</form>


				<div> <!-- 메뉴바 -->
					<div align="center">
						<ul class="nav nav-tabs" id="myTab" role="tablist"
							style="width: 90%">
							<li class="nav-item" id="tab1" style="width: 25%"
								onClick="fnMove(1)"><a class="ptab nav-link active" id=""
								href="#">상세정보</a></li>
							<li class="nav-item" id="tab2" style="width: 25%"
								onClick="fnMove(2)"><a class="ptab" id="" href="#">상품리뷰</a></li>
							<li class="nav-item" id="tab3" style="width: 25%"
								onClick="fnMove(3)"><a class="ptab" id="" href="#">코디</a></li>
							<li class="nav-item" id="tab4" style="width: 25%"
								onClick="fnMove(4)"><a class="ptab" id="" href="#">쇼핑가이드</a></li>
						</ul>
					</div>


					<div id="tab-content">
						<%-- <img id="" src='<c:url value='/resources/product/content/'/>${pb.content }' /> --%>
					</div>

				</div>



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