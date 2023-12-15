<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ include file="../main/top.jsp"%>
<style>
.search-form {
	width: 80%;
	margin: 0 auto;
	margin-top: 1rem;
}

.search-form input {
	height: 100%;
	background: transparent;
	border: 0;
	display: block;
	width: 100%;
	padding: 1rem;
	height: 100%;
	font-size: 1rem;
}

.search-form select {
	background: transparent;
	border: 0;
	padding: 1rem;
	height: 100%;
	font-size: 1rem;
}

.search-form select:focus {
	border: 0;
}

.search-form button {
	height: 100%;
	width: 100%;
	font-size: 1rem;
}

.search-form button svg {
	width: 24px;
	height: 24px;
}

.card-margin {
	margin-bottom: 1.875rem;
}

@media ( min-width : 992px) {
	.col-lg-2 {
		flex: 0 0 16.66667%;
		max-width: 16.66667%;
	}
}

.card {
	border: 0;
	box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
	-webkit-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
	-moz-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
	-ms-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
}

.card {
	position: relative;
	display: flex;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #ffffff;
	background-clip: border-box;
	border: 1px solid #e6e4e9;
	border-radius: 8px;
}
</style>

<div class="row">
	<div class="card card-margin search-form">
		<div class="card-body p-0">
			<form action="list.qna" method="get">
				<div class="row">
					<div class="col-12">
						<div class="row no-gutters">
							<div class="col-lg-3 col-md-3 col-sm-12 p-0">
								<label for="search-type" hidden>검색 유형</label> <select
									class="form-control" id="search-type" name="whatColumn">
									<option value="all">전체
									<option value="nickname">작성자
									<option value="title">제목
								</select>
							</div>

							<div class="col-lg-8 col-md-6 col-sm-12 p-0">
								<label for="search-value" hidden>검색어</label> <input type="text"
									placeholder="검색어..." class="form-control" id="search-value"
									name="keyword">
							</div>
							<div class="col-lg-1 col-md-3 col-sm-12 p-0">
								<button type="submit" class="btn btn-base">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-search">
                                            <circle cx="11" cy="11"
											r="8"></circle>
                                            <line x1="21" y1="21"
											x2="16.65" y2="16.65"></line>
                                        </svg>
								</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

    <div class="row">
        <table class="table" id="article-table" style="width: 70%; margin: auto;">
            <thead>
            <tr>
                <th class="title col-6"><a>제목</a></th>
                <th class="user-id"><a>내용</a></th>
                <th class="created-at"><a>작성일</a></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td class="title"><a>첫글</a></td>
                <td class="hashtag">#java</td>
                <td class="user-id">Uno</td>
                <td class="created-at">
                    <time>2022-01-01</time>
                </td>
            </tr>
            <tr>
                <td>두번째글</td>
                <td>#spring</td>
                <td>Uno</td>
                <td>
                    <time>2022-01-02</time>
                </td>
            </tr>
            <tr>
                <td>세번째글</td>
                <td>#java</td>
                <td>Uno</td>
                <td>
                    <time>2022-01-03</time>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <div class="row">
        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
            <a class="btn btn-primary me-md-2" role="button" id="write-article">글쓰기</a>
        </div>
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

<table border="1">
	<c:if test="${ member_id == 'admin' }">
		<tr>
			<td colspan="2" align="right">
				<input type="button" value="수정" onClick="update('${ pageNumber }', '${ noticeBean.notice_number }')">
			</td>
		</tr>
	</c:if>
	
	<tr>
		<td>${ noticeBean.title }</td>
		<td>
			<c:if test="${ noticeBean.image != null }">
				<img src="<%= request.getContextPath() %>/resources/uploadFolder/${ noticeBean.image }" width="150px">
			</c:if>
			${ noticeBean.content }
		</td>
	</tr>
</table>