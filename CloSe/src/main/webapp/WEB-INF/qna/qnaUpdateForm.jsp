<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
qnaUpdateForm.jsp <br>
<style>
	table{
		margin: auto;
	}
	.err{
		color: red;
	}
</style>

<form:form action="update.qna" method="post" commandName="qnaBean" enctype="multipart/form-data">
<input type="hidden" name="pageNumber" value="${ pageNumber }">
<input type="hidden" name="qna_number" value="${ qnaBean.qna_number }">
<table border="1">
	<tr>
		<td>문의유형</td>
		<td>
			<% String[] qna_categoryList = {"사이즈", "배송", "재입고", "상품상세","교환/환불/취소"};  %>
			<c:forEach var="qna_category" items="<%= qna_categoryList %>">
				<input type="radio" name="qna_category" value="${ qnaBean.qna_category }" <c:if test="${ qnaBean.qna_category == qna_category }">checked</c:if>>${ qna_category }
			</c:forEach>
			<br><form:errors cssClass="err" path="qna_category" />
		</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>
			<input type="text" name="title" value="${ qnaBean.title }">
			<input type="checkbox" name="secret" value="YES" <c:if test="${ qnaBean.secret == 'YES' }">checked</c:if>>비밀글
			<br><form:errors cssClass="err" path="title" />
		</td>
	</tr>
	<tr>
		<td>작성자</td>
		<td>${ qnaBean.nickname }
			<input type="hidden" name="nickname" value="${ qnaBean.nickname }">
		</td>
	</tr>
	<tr>
		<td colspan="6">
			내용 :
				<c:if test="${ qnaBean.image != null }">
					<img src="<%= request.getContextPath() %>/resources/uploadFolder/${ qnaBean.image }" width="150px" />
				</c:if>
				<input type="file" name="upload" value="${ qnaBean.image }">
				<input type="hidden" name="upload2" value="${ qnaBean.image }">
				<textarea name="content" cols="50" rows="10"  style="resize: none;">${ qnaBean.content }</textarea>
				<br><form:errors cssClass="err" path="content" />
			<input type="submit" value="수정" style="float: right;">
		</td>
	</tr>
</table>
</form:form>
<br><br>
<center>
	${pageInfo.pagingHtml}
</center>
