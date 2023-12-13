<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<style>
	.err{
		color: red;
	}
</style>

<form:form action="update.notice" method="post" commandName="noticeBean" enctype="multipart/form-data">
<input type="hidden" name="notice_number" value="${ noticeBean.notice_number }">
<input type="hidden" name="pageNumber" value="${ pageNumber }">
<table border="1">
	<tr>
		<td>제목</td>
		<td>내용</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="title" value="${ noticeBean.title }">
			<br><form:errors cssClass="err" path="title" />
		</td>
		<td>
			<c:if test="${ noticeBean.image != null }">
				<img src="<%= request.getContextPath() %>/resources/uploadFolder/${ noticeBean.image }" width="150px" />
			</c:if>
			<input type="file" name="upload" value="${ noticeBean.image }">
			<input type="hidden" name="upload2" value="${ noticeBean.image }">
			<textarea name="content" cols="50" rows="10"  style="resize: none;">${ noticeBean.content }</textarea>
			<br><form:errors cssClass="err" path="content" />
		</td>
	</tr>
	<tr>
		<td colspan="2" align="right">
			<input type="submit" value="수정">
		</td>
	</tr>
</table>
</form:form>
