<%@page import="product.model.ProductBean"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../main/top.jsp"%>

<style type="text/css">
</style>
<script type="text/javascript">
	
</script>

<div class="body">


	<div class="row">
		<div class="col-lg-2"></div>
		<div class="col-lg-8">
			<div style="padding:20 10 20 10">
				<div style="">
					<h3 style="padding: 22 0 22 0">상품등록</h3>
				</div>
			
			<c:forEach var="cb" items="${cartLists }">
				${cb.cart_number } <br>
				${cb.product_number } <br>
				${cb.product_size } <br>
				${cb.qty } <br>
				${cb.member_id } <br>
			</c:forEach>





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

<button onclick="location.href='view2.main'">이동</button>
<%@ include file="../main/bottom.jsp"%>