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
		$('#tab-content')
				.html('<p>This is the content for tab ' + seq + '</p>');
	}
</script>

<div class="body">


	<div class="row">
		<div class="col-lg-2"></div>
		<div class="col-lg-8">
			<div style="padding: 20 10 20 10">





				<form action="" method="post">
					<input type="hidden" name="product_number" value="${pb.product_number }">
					<input type="hidden" name="member_id" value="">
					<input type="hidden" name="price" value="${pb.price }">
					<div class="row">
						<div class="col-lg-1"></div>
						<div class="col-lg-10 row">
							<div class="col-lg-7" style="text-align: center;">
								<img id="preview"
									src='<c:url value='/resources/product/image/'/>${pb.image }' />
							</div>
							<div class="col-lg-5">
								<div style="border-bottom:0.5px solid gray;">${fn:substringAfter(pb.product_name,' ') }</div>
								<div>브랜드 : ${fn:substringBefore(pb.product_name,' ') }</div>
								<div>가격 : ${pb.price }</div>
								<div>
									<div>사이즈</div> 
									<div>
										<select name="size">
											<option value="s_stock">S</option>
											<option value="m_stock">M</option>
											<option value="l_stock">L</option>
											<option value="xl_stock">XL</option>
										</select>
									</div>
								</div>
								<div>
									<div>수량선택</div>
									<div>
										<select name="qty">
											<c:forEach var="i" begin="1" end="10">
												<option value="${i }">${i }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div>
									<button type="button">장바구니</button>
									<button type="button">구매하기</button>
								</div>
								
								<div>${pb.s_stock }</div>
								<div>${pb.m_stock }</div>
								<div>${pb.l_stock }</div>
								<div>${pb.xl_stock }</div>
								<div>${pb.temperature }</div>
								<div>${pb.smallcategory_name }</div>
							</div>
						</div>
					</div>
				</form>
				
				
				<div>
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