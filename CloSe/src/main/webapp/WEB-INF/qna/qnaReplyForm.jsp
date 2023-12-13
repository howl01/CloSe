<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
qnaList.jsp <br>
<style>
	table{
		margin: auto;
	}
</style>
<script type="text/javascript">
	function insert(){
		alert(1);
		window.open('insert.qna', 'QnA 작성', 'width=430, height=500, margin=auto, scrollbars=yes');
	}
</script>

<center>
<form action="list.qna" method="get">
	<select name="whatColumn">
		<option value="all">전체
		<option value="nickname">작성자
		<option value="title">제목
	</select>
	<input type="text" name="keyword">
	<input type="submit" value="검색">
</form>
</center>
<table border="1">
	<tr>
		<td colspan="6" align="right">
			<c:if test="${ qnaBean.member_id == 'admin' }">
				<input type="button" value="삭제하기">
			</c:if>
			<input type="button" value="작성하기" onClick="insert()">
		</td>
	</tr>
	<tr>
		<td>번호</td>
		<td>답변여부</td>
		<td>문의유형</td>
		<td>제목</td>
		<td>작성자</td>
		<td>등록일자</td>
	</tr>
	<c:if test="${ fn:length(lists) == 0 }">
		<tr>
			<td colspan="6" align="center">검색된 레코드가 없습니다.</td>
		</tr>
	</c:if>
	<c:if test="${ fn:length(lists) != 0 }">
		<c:forEach var="qnaBean" items="${ lists }">
			<tr>			
				<td>${ number }
					<c:set var="number" value="${ number-1 }" />
				</td>
				<c:if test="${ qnaBean.answer == 0 }">
					<td>답변예정</td>
				</c:if>
				<c:if test="${ qnaBean.answer != 0 }">
					<td>답변완료</td>
				</c:if>
				<td>${ qnaBean.qna_category }</td>
				<c:if test="${member_id == 'admin'}">
				        <c:if test="${ qnaBean.qna_number != qna_number }">
				        	<c:if test="${ qnaBean.secret == 'YES' }">
				            <td>
				                <a href="detail.qna?pageNumber=${pageInfo.pageNumber}&qna_number=${qnaBean.qna_number}">
				                    ${qnaBean.title}
				                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill-lock" viewBox="0 0 16 16">
									  <path d="M11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm-9 8c0 1 1 1 1 1h5v-1a1.9 1.9 0 0 1 .01-.2 4.49 4.49 0 0 1 1.534-3.693C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4Zm7 0a1 1 0 0 1 1-1v-1a2 2 0 1 1 4 0v1a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-4a1 1 0 0 1-1-1v-2Zm3-3a1 1 0 0 0-1 1v1h2v-1a1 1 0 0 0-1-1Z"/>
									</svg>	
				                </a>
				            </td>
				            </c:if>
				        	<c:if test="${ qnaBean.secret == 'NO' }">
				            <td>
				                <a href="detail.qna?pageNumber=${pageInfo.pageNumber}&qna_number=${qnaBean.qna_number}">
				                    ${qnaBean.title}
				                </a>
				            </td>
				            </c:if>
				        </c:if>
				        <c:if test="${ qnaBean.qna_number == qna_number }">
				        	<c:if test="${ qnaBean.secret == 'YES' }">
				            <td>
				                <a href="list.qna?pageNumber=${ pageNumber }">${ qnaBean.title }
				                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill-lock" viewBox="0 0 16 16">
									  <path d="M11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm-9 8c0 1 1 1 1 1h5v-1a1.9 1.9 0 0 1 .01-.2 4.49 4.49 0 0 1 1.534-3.693C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4Zm7 0a1 1 0 0 1 1-1v-1a2 2 0 1 1 4 0v1a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-4a1 1 0 0 1-1-1v-2Zm3-3a1 1 0 0 0-1 1v1h2v-1a1 1 0 0 0-1-1Z"/>
									</svg>	
				                </a>
				            </td>
				            </c:if>
				        	<c:if test="${ qnaBean.secret == 'NO' }">
				            <td>
				                <a href="list.qna?pageNumber=${ pageNumber }">${ qnaBean.title }</a>
				            </td>
				            </c:if>
				        </c:if>
				</c:if>
				<c:if test="${member_id != 'admin'}">
					 <c:if test="${ qnaBean.qna_number != qna_number }">
					 	<c:if test="${ qnaBean.member_id != member_id && qnaBean.secret == 'YES' }">
				        	<td>
				                ${qnaBean.title}
				                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill-lock" viewBox="0 0 16 16">
								<path d="M11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm-9 8c0 1 1 1 1 1h5v-1a1.9 1.9 0 0 1 .01-.2 4.49 4.49 0 0 1 1.534-3.693C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4Zm7 0a1 1 0 0 1 1-1v-1a2 2 0 1 1 4 0v1a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-4a1 1 0 0 1-1-1v-2Zm3-3a1 1 0 0 0-1 1v1h2v-1a1 1 0 0 0-1-1Z"/>
								</svg>
				            </td>
				        </c:if>
				        <c:if test="${qnaBean.member_id != member_id && qnaBean.secret == 'NO'}">
				            <td>
								<a href="detail.qna?pageNumber=${pageInfo.pageNumber}&qna_number=${qnaBean.qna_number}">
				                    ${qnaBean.title}
				                </a>
							</td>
				        </c:if>
				        <c:if test="${qnaBean.member_id == member_id && qnaBean.secret == 'YES'}">
				            <td>
				                <a href="detail.qna?pageNumber=${pageInfo.pageNumber}&qna_number=${qnaBean.qna_number}">
				                    ${qnaBean.title}
				                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill-lock" viewBox="0 0 16 16">
									  <path d="M11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm-9 8c0 1 1 1 1 1h5v-1a1.9 1.9 0 0 1 .01-.2 4.49 4.49 0 0 1 1.534-3.693C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4Zm7 0a1 1 0 0 1 1-1v-1a2 2 0 1 1 4 0v1a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-4a1 1 0 0 1-1-1v-2Zm3-3a1 1 0 0 0-1 1v1h2v-1a1 1 0 0 0-1-1Z"/>
									</svg>	
				                </a>
				            </td>
				        </c:if>
				        <c:if test="${qnaBean.member_id == member_id && qnaBean.secret == 'NO'}">
				            <td>
								<a href="detail.qna?pageNumber=${pageInfo.pageNumber}&qna_number=${qnaBean.qna_number}">
				                    ${qnaBean.title}
				                </a>
							</td>
				        </c:if>
					</c:if>
					 <c:if test="${ qnaBean.qna_number == qna_number }">
				        <c:if test="${qnaBean.member_id != member_id && qnaBean.secret == 'NO'}">
				            <td>
								<a href="list.qna?pageNumber=${ pageNumber }">${ qnaBean.title }</a>
							</td>
				        </c:if>
				        <c:if test="${qnaBean.member_id == member_id && qnaBean.secret == 'YES'}">
				            <td>
				                <a href="list.qna?pageNumber=${ pageNumber }">${ qnaBean.title }
				                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill-lock" viewBox="0 0 16 16">
									  <path d="M11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm-9 8c0 1 1 1 1 1h5v-1a1.9 1.9 0 0 1 .01-.2 4.49 4.49 0 0 1 1.534-3.693C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4Zm7 0a1 1 0 0 1 1-1v-1a2 2 0 1 1 4 0v1a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-4a1 1 0 0 1-1-1v-2Zm3-3a1 1 0 0 0-1 1v1h2v-1a1 1 0 0 0-1-1Z"/>
									</svg>	
				                </a>
				            </td>
				        </c:if>
				        <c:if test="${qnaBean.member_id == member_id && qnaBean.secret == 'NO'}">
				            <td>
								<a href="list.qna?pageNumber=${ pageNumber }">${ qnaBean.title }
				                </a>
							</td>
				        </c:if>
					</c:if>
				</c:if>
				<td>${ qnaBean.nickname }</td>
				<td><fmt:formatDate value="${ qnaBean.write_date }" pattern="yyyy-MM-dd" /></td>
			</tr>
			<c:if test="${ qnaBean.qna_number == qna_number }">
				<tr>
					<td colspan="6">
						내용 : 
						<c:if test="${ qnaBean.image != null }">
							<img src="<%= request.getContextPath() %>/resources/uploadFolder/${ qnaBean.image }" width="150px">
						</c:if>
						${ content }
						<c:if test="${ qnaBean.member_id == member_id }">
							<input type="button" value="수정" style="float: right;" onClick="location.href='update.qna?pageNumber=${ pageInfo.pageNumber }&qna_number=${ qnaBean.qna_number }'">
						</c:if>
						<c:if test="${ member_id == 'admin' }">
							<tr>
								<td colspan="6">
									<form:form action="reply.qna" method="post">
										<input type="hidden" name="qna_number" value="${ qnaBean.qna_number }">
										<input type="hidden" name="ref" value="${ ref }">
										<input type="hidden" name="pageNumber" value="${ pageNumber }">
										<input type="hidden" name="member_id" value="${ qnaBean.member_id }">
										<input type="hidden" name="title" value="re:${ qnaBean.title }">
										<textarea name="content" cols="50" rows="10"  style="resize: none;"></textarea>
										<br><form:errors cssClass="err" path="content" />
										<input type="submit" value="작성">
									</form:form>
								</td>
							</tr>
						</c:if>
					</td>
				</tr>
			</c:if>
		</c:forEach>
	</c:if>
</table>
<br><br>
<center>
	${pageInfo.pagingHtml}
</center>
