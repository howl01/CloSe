<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
qnaInsertForm.jsp <br>
<style>
	.err{
		color: red;
	}
</style>
<form:form id="insertForm" action="insert.qna" method="post" commandName="qnaBean" enctype="multipart/form-data">
<input type="hidden" name="member_id" value="${ member_id }">
<table border="1">
	<tr>
		<td>문의유형</td>
		<td colspan="2">
			<% String[] qna_categoryList = {"사이즈", "배송", "재입고", "상품상세","교환/환불/취소"};  %>
			<c:forEach var="qna_category" items="<%= qna_categoryList %>">
				<input type="radio" name="qna_category" value="${ qna_category }" <c:if test="${ qnaBean.qna_category == qna_category }">checked</c:if>>${ qna_category }
			</c:forEach>
			<br><form:errors cssClass="err" path="qna_category" />
		</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>
			<input type="text" name="title" value="${ qnaBean.title }"><br>
			<form:errors cssClass="err" path="title" />
		</td>
		<td>
			<input type="checkbox" name="secret" value="YES">비밀글
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td colspan="2">
			<textarea name="content" cols="50" rows="10"  style="resize: none;">${ qnaBean.content }</textarea>
			<br><form:errors cssClass="err" path="content" />
		</td>
	</tr>
	<tr>
		<td>사진첨부</td>
		<td colspan="2">
			<input type="file" name="upload" value="${ qnaBean.image }">
		</td>
	</tr>
	<tr>
		<td colspan="3">
			<input type="submit" value="작성">
		</td>
	</tr>
</table>
</form:form>