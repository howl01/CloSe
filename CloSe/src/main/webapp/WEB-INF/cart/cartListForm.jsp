<%@page import="product.model.ProductBean"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../main/top.jsp"%>

<style type="text/css">
	.body {
		width: 75%;
		margin: auto;
	}
	
	.a {
		text-align: center;
	}
	
	.b {
		text-align: center;
		margin-bottom: 10px;
	}
	
	.bg-body-white {
		text-align: center;
	}
	
	.empty {
		width: 150px;
		height: 150px;
		margin-top: 50px;
	}
	
	.name {
		text-align: left;
		margin-top: 2em;
	}
	
	#procheck {
		margin-top: 65px;
		width: 25px;
		height: 25px;
	}
	.form-check-input {
		width: 25px;
		height: 25px;
	}
	#aaa {
		width: 110%;
	}
	
	#ddd {
		display: inline;
		float: right;
	}
</style>
<script type="text/javascript">
	function allCheck(all) {
		rcheck = document.getElementsByName("rowcheck");
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
	} // allCheck

	function selectDelete() {
		rcheck = document.getElementsByName("rowcheck");
		flag = false;

		for (i = 0; i < rcheck.length; i++) {
			if (rcheck[i].checked) {
				flag = true;
			}
		}

		if (!flag) {
			alert("하나 이상 체크해야 삭제 가능합니다.");
			return;
		}

		myform.submit();
	} // selectDelete

	function fnCalCount(type, cindex) {
        // size를 사용하여 적절한 선택자를 찾도록 수정
        var $input = $("#oqty"+cindex);
        var tCount = Number($input.val());
        
        if (type == 'p') {
            if (tCount < 100) $input.val(Number(tCount) + 1);
        } else {
            if (tCount > 1) $input.val(Number(tCount) - 1);
        }
        //updateTotalPrice(size, $input.val());
    }
	function cartUpdate(cnum,cindex){
		var oqty = document.getElementById("oqty" + cindex).value;
		
		location.href="qtyUpdate.cart?cart_number="+cnum+"&qty="+oqty;
	}
	/* function plus(stock, index) {
		var inputValue = parseInt(document.getElementById("oqty" + index).value);
		inputValue = inputValue + 1;
		document.getElementById("oqty" + index).value = inputValue;

		document.getElementById("minus" + index).disabled = false;

		if (stock == inputValue) {
			document.getElementById("plus" + index).disabled = true;
		}
		updateTotalValue();
	}

	function minus(index) {
		var inputValue = parseInt(document.getElementById("oqty" + index).value);
		inputValue = inputValue - 1;
		document.getElementById("oqty" + index).value = inputValue;

		if (inputValue == 1) {
			document.getElementById("minus" + index).disabled = true;
		}

		updateTotalValue();
	} 

	var oqtyInputs = document.querySelectorAll(".form-control.oqty");
	var priceElements = document.querySelectorAll(".mb-0.price");
	var sumpElement = document.getElementById("sump");
	var delcElement = document.getElementById("delc");
	var finalpElement = document.getElementById("finalp");
	var sumPrice = 0;
	var deliveryPrice = 0;
	var totalValue = 0;

	function updateTotalValue() {
		totalValue = 0;
		sumPrice = 0;
		deliveryPrice = 0;
		oqtyInputs.forEach(function(input, index) {
			var quantity = parseInt(input.value);
			var price = parseInt(priceElements[index].textContent);
			totalValue += quantity * price;
		});
		if (totalValue >= 30000) {
			delcElement.textContent = "무료";
			deliveryPrice = 0;
		} else {
			delcElement.textContent = "3000원";
			deliveryPrice = 3000;
		}
		sumPrice = totalValue + deliveryPrice;
		sumpElement.textContent = totalValue + "원";
		finalpElement.textContent = sumPrice + "원";
	}

	updateTotalValue();

	oqtyInputs.forEach(function(input) {
		input.addEventListener("change", updateTotalValue);
	});

	function cal(orderPName) {
		location.href = "calculate.jsp?pname=" + orderPName + "&amount="
				+ sumPrice;
	} */
</script>

<div class="body">


	<div class="row">
		<div class="col-lg-2"></div>
		<div class="col-lg-8">
			<div style="padding:20 10 20 10">
				<div style="">
					<h3 style="padding: 22 0 22 0">장바구니</h3>
				</div>
				
				
				<c:set var="cartlists" value="${cartInfoLists}" />
				<c:set var="sumPrice" value="0" />

<c:choose>
    <c:when test="${fn:length(cartInfoLists) == 0}">
        <div class="bg-body-white">
            <img class="empty" src="../img/empty.png">
            <br>
            <font size="4" style="vertical-align: inherit;">
                <b>장바구니에 담긴 상품이 없습니다.</b>
            </font>
            <br>
            <br>
        </div>
    </c:when>
    
    
    <c:otherwise>
            <form method="post" name="myform" action="cartDelAll.jsp">
            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">
                                        	<input id = "bbb" size="3" class="form-check-input" type="checkbox" name = "allcheck" onclick = "allCheck(this)">
								        </th>
                                        <th scope="col">이미지</th>
                                        <th scope="col">상품정보</th>
                                        <th scope="col">가격</th>
                                        <th scope="col">주문수량</th>
                                        <th scope="col">소계</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="cib" items="${cartInfoLists}" varStatus="status">
                                        <tr>
                                            <%-- <th scope="row">${status.index + 1}</th> --%>
                                            <td>
                                                <input class="form-check-input pnum" type="checkbox" id="procheck"
                                                    name="rowcheck" value="${cib.cart_number}">
                                            </td>
                                            <td>
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
                                            	${cib.price}원
                                            	<c:set var="totalPrice" value="${totalPrice + (cib.price * cib.qty)}" />
                                            </td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <button type="button" class="btn btn-light"
                                                     onclick="fnCalCount('m','${status.index}')">
                                                        -
                                                    </button>
                                                    <input type="text" class="form-control oqty" style="width: 50px;"
                                                        id="oqty${status.index}" name="oqty" value="${cib.qty}" size="3"
                                                        disabled>
                                                    <button type="button" class="btn btn-light"
                                                     onclick="fnCalCount('p','${status.index}')">
                                                        +
                                                    </button>
                                                </div>
                                                <div>
                                                	<button type="button" 
                                                	onclick="cartUpdate('${cib.cart_number}','${status.index}')">변경</button>
                                                </div>
                                            </td>
                                            <td>
                                            	${cib.price*cib.qty}원
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                                <tr>
                                	<td colspan="6">
                                		${totalPrice }
                                	</td>
                                </tr>
                                <tr>
                                	<td colspan="6">
                                		<button type="button">선택삭제</button>
                                		<button type="button">선택구매</button>
                                	</td>
                                </tr>
                            </table>
            </form>
    </c:otherwise>
</c:choose>


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