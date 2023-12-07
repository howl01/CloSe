<%@page import="product.model.ProductBean"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../main/top.jsp"%>

<style type="text/css">
.body {
	width: 100%;
	margin: auto;
}

#par {
	position: relative;
}

#chi {
	position: absolute;
	left: 0px;
	top: 0px;
	opacity: 0.4;
}

#carouselExampleAutoplaying {
	max-width: 66%; /* 최대 너비 설정 */
	margin: auto; /* 가운데 정렬 */
}
.productrow{
	border-bottom: 1px solid rgba(0, 0, 0, .1);
	padding: 15 0 15 10;
	

}
</style>
<script type="text/javascript">
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				document.getElementById('preview').src = e.target.result;
			};

			reader.readAsDataURL(input.files[0]);
		}
	}
</script>

<div class="body">




	<div class="row">
		<div class="col-lg-2"></div>
		<div class="col-lg-8">
	<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
			<div style="border-bottom: 3px solid;">
				<h3 style="padding: 22 0 22 0">상품등록</h3>
			</div>
			<form:form commandName="productBean" action="register.product"
				method="post" enctype="multipart/form-data">
				<div class="row productrow">
					<div class="col-2" style="white-space: nowrap;">
						<span>상품이미지<font color="red">*</font></span>
					</div>
					<div class="col-3">
					<img id="preview" width="200px" height="200px"
						style="margin: 10 0 10 0" /> 
						</div>
					<div class="col-3">
						<input type="file" name="pImage"
						onchange="readURL(this);">
					</div>
				</div>
				<div class="row productrow">
					<div class="col-2" style="white-space: nowrap;">
						<span>상품명<font color="red">*</font></span>
					</div>
					<div class="col-3">
						<input type="text" class="form-control mb-1" name="product_name">
					</div>
				</div>

				<div class="row productrow">
					<div class="col-2" style="white-space: nowrap;">
						<span>카테고리<font color="red">*</font></span>
					</div>
					<div class="col-6">
						<select size="10">
							<option>Lorem</option>
							<option>Ipsum</option>
							<option>Dolor</option>
							<option>Amet</option>
						</select> <select size="10" name="smallcategory_name">
							<option>니트</option>
							<option>반소매 티셔츠</option>
							<option>긴소매 티셔츠</option>
							<option>맨투맨</option>
							<option>후드 티셔츠</option>
						</select>
					</div>
				</div>
				<div class="row productrow">
					<div class="col-2" style="white-space: nowrap;">
						<span>가격<font color="red">*</font></span>
					</div>
					<div class="col-3">
						<input type="text" class="form-control mb-1" name="price">
					</div>
				</div>
				<div class="row productrow">
					<div class="col-2" style="white-space: nowrap;">
						<span>설명사진<font color="red">*</font></span>
					</div>
					<div class="col-3">
						<input type="file" name="pContent">
					</div>
				</div>
				<div class="row productrow">
					<div class="col-2" style="white-space: nowrap;">
						<span>추천온도<font color="red">*</font></span>
					</div>
					<div class="col-3">
						<select name="temperature">
							<option value="">옵션선택</option>
							<option value="0">~5</option>
							<option value="7">5~10</option>
							<option value="12">10~15</option>
							<option value="17">15~20</option>
							<option value="22">20~25</option>
							<option value="30">25~</option>
						</select>
					</div>
				</div>
				<div class="row productrow">
					<div class="col-2" style="white-space: nowrap;">
						<span>사이즈별 수량<font color="red">*</font></span>
					</div>
					<div class="col-2">
						S <input type="text" name="s_stock" class="form-control mb-1">
						M <input type="text" name="m_stock" class="form-control mb-1">
						L <input type="text" name="l_stock" class="form-control mb-1">
						XL <input type="text" name="xl_stock" class="form-control mb-1">
					</div>
				</div>
				<div style="padding-top: 15; float: right;">
					<input  class="btn btn-primary btn-md" type="submit" value="등록하기">
				</div>
			</form:form>
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
<%@ include file="../main/bottom.jsp"%>