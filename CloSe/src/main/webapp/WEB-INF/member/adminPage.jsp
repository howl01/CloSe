<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

<script src="resources/js/bootstrap.bundle.min.js"></script>
<script src="resources/js/jquery.js"></script>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/checkout.css" rel="stylesheet">
<script type="text/javascript" src = "resources/js/script.js"></script>

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
      <h2>관리자페이지</h2>
    </div>
 
   <ul class="nav nav-tabs" role="tablist">
     <li class="nav-item" role="presentation">
       <a class="nav-link active" data-bs-toggle="tab" href="#home" aria-selected="true" role="tab">회원관리</a>
     </li>
     <li class="nav-item" role="presentation">
       <a class="nav-link" data-bs-toggle="tab" href="#profile" aria-selected="false" role="tab" tabindex="-1">구매상품</a>
     </li>
   </ul>
   
    <div id="myTabContent" class="tab-content">
      <div class="tab-pane fade active show" id="home" role="tabpanel">
         <div class="row">

   	 <div class="row">
   	 
        <table class="table" id="article-table">
            <thead>
            <tr align="left">
                <th class="report_number col-1">번호</th>
                <th class="report_category col-2">신고유형</th>
                <th class="content col-3">내용</th>
                <th class="reporter_id">신고자</th>
                <th class="reported_user_id">신고대상자</th>
                <th class="created-at">신고일</th>
            </tr>
            </thead>
            <tbody>
            <c:if test="${ fn:length(lists) == 0 }">
            	<tr>
            		<td colspan="6">
            			신고 목록이 없습니다.
            		</td>
            	</tr>
            </c:if>
            <c:if test="${ fn:length(lists) != 0 }">
            	<c:forEach var="reportBean" items="${ lists }">
	            	<tr>
		                <td class="report_number col-1">${ reportBean.report_number }</td>
		                <td class="report_category col-2">${ reportBean.report_category  }</td>
		                <td class="content col-3"><a href="reportDetail.member?report_number=${ reportBean.report_number }&pageNumber=${ pageInfo.pageNumber }">${ reportBean.content  }</a></td>
		                <td class="reporter_id">${ reportBean.reporter_id  }</td>
		                <td class="reported_user_id">${ reportBean.reported_user_id  }</td>
		                <td class="created-at">${ reportBean.write_date  }</td>
	            	</tr>
            	</c:forEach>
            </c:if>
            </tbody>
        </table>
    </div>

    <div class="row">
        <nav id="pagination" aria-label="Page navigation">
            <ul class="pagination justify-content-center">
                <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>
        </nav>
    </div>
          </div>  
      </div>
      
      <div class="tab-pane fade" id="profile" role="tabpanel">
      	 <div class="row">
              ㅋㅋㅋ
          </div>  
      </div>
      
   </div>





    

   <footer class="my-5 pt-5 text-body-secondary text-center text-small">
     <p class="mb-1">© 2023 Minhyeok, Byeon</p>
   </footer>
</div>