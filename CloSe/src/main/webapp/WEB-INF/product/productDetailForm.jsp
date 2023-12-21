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
.layer {
	display: none;
}


.td {
	position: relative;
	box-sizing: border-box;
	border-top: 1px solid #f2f2f2;
	margin-left: 100px;
}

.d {
	width: 100%;
	heiht: 100%;
}

.total_price {
    color: #666;
    font-size: 14px;
     padding: 20px 0 8px; 
    text-align: right;
    box-sizing: border-box;
}

.total_cartAdd {
    color: #666;
    font-size: 14px;
    box-sizing: border-box;
}
.totals-value {
    font-size: 30px;
    color: #333;
    font-style: normal;
    font-weight: bold;
    padding-left: 12px;
    text-align: right;
}
.section-01,.section-02,.section-03,.section-04  { position: relative;}

.fixed-menu {
  position: fixed;
  top: 142;
  left: 0;
  width: 100%;
  z-index: 1000;
  background-color: #fff; /* 배경색을 지정해주면 메뉴가 스크롤되는 내내 보일 것입니다. */
  box-shadow: 0px 1px 5px rgba(0, 0, 0, 0.1); /* 그림자 효과를 추가할 수 있습니다. */
}

fieldset {
        display: inline-block;
        direction: rtl;
        border:0;
}
#star {
        font-size: 1em;
        color: transparent;
        text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
} 
#gstar{
    font-size: 1em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
</style>
<script type="text/javascript">
window.addEventListener('scroll', function() {
    var floatingMenu = document.querySelector('.floating-menu');
    var scrollPosition = window.scrollY;

    if (scrollPosition > 600) { // Adjust this value based on when you want the menu to become fixed
      floatingMenu.classList.add('fixed-menu');
    } else {
      floatingMenu.classList.remove('fixed-menu');
    }
  });


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
	
	function deleteProduct(pnum){
		location.href="delete.product?product_number="+pnum;
	}
	function updateProduct(pnum){
		location.href="update.product?product_number="+pnum;
	}
	
	function addToCart(){
		var formData = $("#buyForm").serialize();

        $.ajax({
            type: "POST", // or "GET" depending on your server-side implementation
            url: "cartAdd.cart", // Specify the URL to your server-side endpoint
            async : false,
            data: formData,
            success: function(response) {
                var addToCart = confirm("상품을 장바구니에 추가했습니다. 장바구니로 이동하시겠습니까?");
        	    
        	    if (addToCart) {
        				location.href = "cartAdd.cart";
        	    } else{
        	    	return;
        	    }
            }
        });
	}
	
	$(document).ready(function() {
		$('#insertBasket').click(function () {
			alert("장바구니버튼");
			 
			<c:if test="${empty loginInfo and empty kakaoLoginInfo}">
				alert("로그인이 필요한 서비스입니다.");
				window.location.href = 'login.member';
				return;
			</c:if>

			if ($('.quantity-selection').length === 0) {
	            alert("사이즈를 선택해주세요.");
	            return;
	        }
			addToCart();
		});
		
		
		$('#goodsOrder').click(function () { 
			alert("구매하기버튼");
			
			<c:if test="${empty loginInfo and empty kakaoLoginInfo}">
				alert("로그인이 필요한 서비스입니다.");
				window.location.href = 'login.member';
				return;
			</c:if>
			
		  	if ($('.quantity-selection').length === 0) {
            	alert("사이즈를 선택해주세요.");
           	 	return;
        	}
		  	$("#buyForm").attr("action", "details2.orders");
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

		    $('#cart-total').html(totalSum);
	    });
		
		//=-==================================================
	    var $menu     = $('.floating-menu li.m'),
	        $contents = $('.scroll'),
	        $doc      = $('html, body');
	    $(function () {
	        // 해당 섹션으로 스크롤 이동
	        $menu.on('click','a', function(e){
	            var $target = $(this).parent(),
	                idx     = $target.index(),
	                section = $contents.eq(idx),
	                offsetTop = section.offset().top-200;
	            $doc.stop()
	                    .animate({
	                        scrollTop :offsetTop
	                    }, 1);
	            return false;
	        });
	    });

	    // menu class 추가
	    $(window).scroll(function(){
	        var scltop = $(window).scrollTop();
	        $.each($contents, function(idx, item){
	            var $target   = $contents.eq(idx),
	                i         = $target.index(),
	                targetTop = $target.offset().top;

	            if (targetTop <= scltop) {
	                $menu.removeClass('on');
	                $menu.eq(idx).addClass('on');
	            }
	            if (!(200 <= scltop)) {
	                $menu.removeClass('on');
	            }
	        })

	    });
	    
	    
	    
	    
	    
	});
	
	
		function removeQuantitySelection(button) { //사이즈별 수량 선택란 제거
		    $(button).closest('.quantity-selection').remove();
		    var totalSum = 0;
		    $('.quantity-selection .total-price').each(function () {
		        totalSum += Number($(this).text());
		    });

		    $('#cart-total').html(totalSum);
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

		    $('#cart-total').html(totalSum);
		}
</script>

<div class="body">


	<div class="row">
		<div class="col-lg-2"></div>
		<div class="col-lg-8">
				<form method="post" id="buyForm">
					<input type="hidden" name="product_number" value="${pb.product_number }"> 
					<div class="row">
						<div class="col-lg-1"></div>
						<div class="col-lg-10 row">
						
		<div style="width:100%; align:center; height:600px;">
		
		<div style="float:left; margin-left:30px; width: 40%;">
			<table border="0" width="100%">
				<tr>
					<td><img id="preview" width="100%"
						src='<c:url value='/resources/product/image/'/>${pb.image }' />
				</tr>
			</table>
		</div>

		<div style="float:left; margin-left:30px; width: 50%;">
			<table border="0">

				<tr>
					<td>
						<span
						style="background-color: #ff80bf; line-height: 27px; border-radius: 10px;"><font
						color="#ffffff" size="2">태그</font></span>
					</td>
				</tr>

				<tr>
					<td id="goodsName"><font size="5"
						style="box-sizing: border-box; position: relative;">${fn:substringAfter(pb.product_name,'/') }</font></td>
				</tr>

				<tr>
					<td><font size="3">브랜드 : ${fn:substringBefore(pb.product_name,'/') }</font></td>
				</tr>

				<tr>
					<td></td>
				</tr>

				<tr>
					<td id="price"
						style="font-weight: 600px; font-Size: 24px; line-height: 42px;">
						<fmt:formatNumber value="${pb.price }" pattern="#,###" />원
					</td>
				</tr>
			</table>

			<table>
				<tr>
					<td>
						<hr style="border-top: 1px solid #bbb;" width=500px>
					<td>
				</tr>
			</table>

			<br>

			<table>
				<tr class="option_section">
					<td width="100px"><font size="3">배송비</font></td>
					<td><font size="3">선불4,000원(50,000원 이상 무료배송)</font></td>
				</tr>
			</table>

			<table>
				<tr class="option_section">
					<td width="100px"><font size="3">배송종류</font></td>
					<td><font size="3">국내배송</font></td>
				</tr>
			</table>

			<br>
			<br>

			<div id="item_option">
				<table>
					<tr>
						<td>
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
						<div class="selSize">
							<!-- 수량선택 -->
						</div>
						</td>
					</tr>

					<tr>
						<td></td>
					</tr>
				</table>
			</div>

			<!-- <form id="frm" name="frm" method="post">

				<div>
					<table style="border:1px;" id="dynamicTable">
						<thead>
						</thead>

						<tbody id="dynamicTbody">

						</tbody>
						
					</table>
				</div>

			</form> -->
			
			<div class="totals-item totals-item-total" style="float:left; margin-left:200px;">
	      		<label class="total_price">총상품금액</label>&nbsp;&nbsp;
	     		 <div class="total_price" style="float:right;">원</div>
	      		<div class="totals-value" id="cart-total" style="float:right;">0</div>
	   	    </div>
			<br><br>
			
			<table>
				<tr>
					<td><hr style="border-top: 1px solid #bbb;" width=500px>
					<td>
				</tr>
			</table>

			<button type="button" style="width: 150px; margin-left:100px; height: 40px;"
				class="btn btn-dark" id="insertBasket">장바구니</button>
			<button type="button" style="width: 150px; height: 40px;"
				class="btn btn-dark" id="goodsOrder">구매하기</button>
			<br>

			<!-- <button id="update" onclick="fn_update()">수정하기</button> -->
		
		</div>
	</div>
						</div> 
					</div>
				</form>


				<div> <!-- 메뉴바 -->
					<div class="floating-menu" style="text-align: center;">
						<!-- <ul class="nav nav-tabs" id="myTab" role="tablist"
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
						</ul> -->
						<ul class="nav nav-tabs" role="tablist" style="width: 100%">
						  <li class="nav-item m" role="presentation" style="width: 25%">
						    <a class="nav-link menu-01 active" data-bs-toggle="tab" href="#section-01" aria-selected="true" role="tab">상품상세</a>
						  </li>
						  <li class="nav-item m" role="presentation" style="width: 25%">
						    <a class="nav-link menu-02" data-bs-toggle="tab" href="#section-02" aria-selected="false" role="tab" tabindex="-1">상품리뷰</a>
						  </li>
						  <li class="nav-item m" role="presentation" style="width: 25%">
						    <a class="nav-link menu-03" data-bs-toggle="tab" href="#section-03" aria-selected="false" role="tab" tabindex="-1">코디</a>
						  </li>
						  <li class="nav-item m" role="presentation" style="width: 25%">
						    <a class="nav-link menu-04" data-bs-toggle="tab" href="#section-04" aria-selected="false" role="tab" tabindex="-1">쇼핑가이드</a>
						  </li>
						</ul>
						
					</div>
				</div>

	<div style="margin-top: 30px">
		<div class="section-01 scroll">
	        <h2>상품상세</h2>
	        <hr>
	        <div>
	        	<img id="preview" width="100%"
						src='<c:url value='/resources/product/content/'/>${pb.content }' />
	        </div>
	    </div>
	
	    <div class="section-02 scroll">
	        <h2>상품리뷰</h2>
	        <hr>
	        <table width="100%" style="border-collapse: collapse;">
	        	<c:if test="${empty rlists }">
	        		<tr>
	        			<td align="center" height="200px;">등록된 리뷰이 없습니다.</td>
	        		</tr>
	        	</c:if>
	        	<c:if test="${not empty rlists }">
	        	<c:forEach var="ri" items="${rlists }">
	        		<tr>
	        			<td>
	        				<fieldset>
	        					<c:forEach begin="1" end="${5-ri.rating }">
   									<label id="gstar">★</label>
	        					</c:forEach>
	        					<c:forEach begin="1" end="${ri.rating }">
            						<label id="star">★</label>
	        					</c:forEach>
   							</fieldset>
	        			</td>
	        			<td> | ${ri.write_date }</td>
	        			<td> | ${ri.member_id }</td>
	        		</tr>
	        		<tr>
	        			<td><b>선택한옵션:${ri.product_size }</b></td>
	        		</tr>
	        		<tr style="border-bottom: 0.5px solid rgba(0, 0, 0, .1);"> 
	        			<td>${ri.text }
	        		</tr>
	        	</c:forEach>
	        	</c:if>  
	        </table>
	    </div>
	
	    <div class="section-03 scroll">
	        <h2>섹션 3</h2>
	    </div>
	    <div class="section-04 scroll">
	        <h2>섹션 4</h2>
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