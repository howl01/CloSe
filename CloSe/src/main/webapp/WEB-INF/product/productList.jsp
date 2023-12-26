<%@page import="product.model.ProductBean"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../main/top.jsp"%>

<style type="text/css">
	.plist{
		display: flex;
        flex-direction: row;
        height: 800px;
	} 
	.filter .product{
		float: left;
	} 
	.filter{
		width:150px;
	}
	.product{
	}
	.small-category{
        display: none; /* 초기에는 하위 항목을 숨김 */
    }
    #small-brand{
    	display: none;
    }
    .categories{
    	list-style: none;
    }
    .category{
    	text-decoration: none;
    	color:black;
    }
</style>
<script type="text/javascript">
/* function toggleSmallCategories(bigCategoryName) {
    var smallCategories = document.querySelectorAll('.small-category');

    smallCategories.forEach(function (smallCategory) {
        if (smallCategory.id === 'small-' + bigCategoryName) {
            smallCategory.style.display = (smallCategory.style.display === 'none' || smallCategory.style.display === '') ? 'block' : 'none';
        } else {
            smallCategory.style.display = 'none';
        }
    });
} */
$(document).ready(function(){
	$(".big-category").click(function(){
		var bigCategoryId = $(this).attr("id");
        // Toggle the submenu when the menu item is clicked
        $(this).siblings("#small-" + bigCategoryId).stop().slideToggle();
    });
});

</script>

<div class="body">


	<div class="row">
		<div class="col-lg-2"></div>
		<div class="col-lg-8">
			<div style="padding:20 10 20 10">
				<div style="">
					<h3 style="padding: 10 0 10 0">상품</h3>
					<hr width="1280px">
				</div> 
				<div class="plist">
					<div class="filter">
					
					
					
						<ul class="categories">
					        <c:set var="previousBigCategory" value="" />
					        <c:forEach var="category" items="${clists}">
					            <c:if test="${!category.bigcategory_name.equals(previousBigCategory)}">
					                <li class="big-category" id="${category.bigcategory_name}">
					                    <h2 class="bc">${category.bigcategory_name}</h2>
					                </li>
					                <li class="small-category" id="small-${category.bigcategory_name}">
					            		<a class="category" href="list.product?bigcategory_name=${category.bigcategory_name}">전체</a>
					            	</li>
					            </c:if>
					            
					            	<li class="small-category" id="small-${category.bigcategory_name}">
					            		<a  class="category" href="list.product?smallcategory_name=${category.smallcategory_name}">${category.smallcategory_name}</a>
					            	</li>
					            
					            <c:set var="previousBigCategory" value="${category.bigcategory_name}" />
					        </c:forEach>
					        
					        <li class="big-category" id="brand">
					        	<h2 class="bc">브랜드</h2>
					        </li>
					        <c:forEach var="pb" items="${blists }">
					         <c:if test="${!fn:substringBefore(pb.product_name,'/').equals(previousBrand)}">
					        	<li id="small-brand">
					        		<a class="category" href="list.product?brand=${fn:substringBefore(pb.product_name,'/') }">
					        			${fn:substringBefore(pb.product_name,'/') }
					        		</a>
					        	</li>
					         </c:if>
					        	<c:set var="previousBrand" value="${fn:substringBefore(pb.product_name,'/') }" />
					        </c:forEach>
					    </ul>
					    
					    
					    
					    
					    
					</div>
					
					
					
					
					
					
					<div class="product">
						<table>
						  <c:choose>
						    <c:when test="${empty plists}">
						      <td align="center" width="300" height="200" style="padding: 10px; font-size: 30px;">
						        <span class="nog">등록된 제품이 없습니다.</span>
						      </td>
						    </c:when>
						    <c:otherwise>
						      <c:forEach var="pb" items="${plists}" varStatus="Status">
						        <c:set var="count" value="${Status.count}" />
						        <td align="center" valign="top" width="270px" style="padding:0 40px 0 0">
						          <div style=" height: 220px;">  
						           <a href="detail.product?product_number=${pb.product_number }">
						          	<img id="preview" width="100%" height="100%"
									src='<c:url value='/resources/product/image/'/>${pb.image }' />
						           </a> 
						          </div>  
						          <hr>
						          <div>브랜드:${fn:substringBefore(pb.product_name,'/') }</div>
						          <div>상품명:${fn:substringAfter(pb.product_name,'/') }</div> 
						          ★
						          <c:if test="${pb.average_rating == 0 }">
						          	-
						          </c:if>
						          <c:if test="${pb.average_rating != 0 }">
						          	<fmt:formatNumber value="${pb.average_rating }" pattern=".0"/>
						          </c:if>
						          <div>가격:<fmt:formatNumber value="${pb.price }" pattern="#,###" />원</div>
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
				<div>
					${pageInfo.pagingHtml }
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