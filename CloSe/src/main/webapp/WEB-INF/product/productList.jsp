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
				<table width="800">
				  <c:choose>
				    <c:when test="${empty plists}">
				      <td align="center" width="300" height="200" style="padding: 10px; font-size: 30px;">
				        <span class="nog">등록된 제품이 없습니다.</span>
				      </td>
				    </c:when>
				    <c:otherwise>
				      <c:forEach var="pb" items="${plists}" varStatus="Status">
				        <c:set var="count" value="${Status.count}" />
				        <td align="center" valign="top" width="300" height="200" style="padding: 10px">
				          <div>
				           <a href="detail.product?product_number=${pb.product_number }">
				          	<img id="preview" width="70px"
							src='<c:url value='/resources/product/image/'/>${pb.image }' />
				           </a>
				          </div>
				          
				          <div>브랜드:${fn:substringBefore(pb.product_name,'/') }</div>
				          <div>상품명:${fn:substringAfter(pb.product_name,'/') }</div>
				          <div>가격:${pb.price }원</div>
				        </td>
				        <c:if test="${count % 4 == 0}">
				          </tr><tr>
				        </c:if>
				      </c:forEach>
				    </c:otherwise>
				  </c:choose>
				</table>

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