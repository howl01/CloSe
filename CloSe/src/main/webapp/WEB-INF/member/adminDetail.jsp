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
            <tr>
                <th>신고유형</th>
                <td>${ reportBean.report_category  }</td>
                <th>신고자</th>
                <td>${ reportBean.reporter_id  }</td>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th>신고대상자</th>
                <td>${ reportBean.reported_user_id  }</td>
                <th>신고일</th>
                <td>${ reportBean.write_date  }</td>
            
            </tr>
            <tr>
                <th colspan="4">내용</th>
            </tr>
            <tr>
                <td colspan="4">
                	<c:if test="${ reportBean.image != null }">
                		<img src="<%= request.getContextPath() %>/resources/uploadReport/${ reportBean.image }" width="150px">
                	</c:if>
                	${ reportBean.content  }
                </td>
            </tr>
            </tbody>
        </table>
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