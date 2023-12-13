<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
noticeDetail.jsp <br>
<script type="text/javascript">
	function update(pageNumber, notice_number){
		alert(pageNumber + "/" + notice_number);
		location.href="update.notice?pageNumber="+pageNumber + "&notice_number=" + notice_number;
	}
</script>
<table border="1">
	<c:if test="${ member_id == 'admin' }">
		<tr>
			<td colspan="2" align="right">
				<input type="button" value="수정" onClick="update('${ pageNumber }', '${ noticeBean.notice_number }')">
			</td>
		</tr>
	</c:if>
	<tr>
		<td>제목</td>
		<td>내용</td>
	</tr>
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