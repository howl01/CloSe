<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
noticeList.jsp <br>
<script type="text/javascript">
	function insert(){
		window.open('insert.notice', '공지사항 작성', 'width=500, height=350, top	=130px, left=500px, scrollbars=yes');
	}
</script>

<form action="list.notice" method="get">
	<select name="whatColumn">
		<option value="title">제목
	</select>
	<input type="text" name="keyword">
	<input type="submit" value="검색">
</form>
<table border="1">
	<c:if test="${ member_id == 'admin' }">
		<tr>
			<td colspan="2" align="right">
				<input type="button" value="추가하기" onClick="insert()">
				<input type="button" value="선택하기" onClick="location.href='delete.notice?pageNumber=${ pageInfo.pageNumber }'">
			</td>
		</tr>
	
	</c:if>
	<tr>
		<td>제목</td>
		<td>작성일자</td>
	</tr>
	<c:if test="${ fn:length(lists) == 0 }">
		<tr>
			<td colspan="3" align="center">
				검색된 레코드가 없습니다.
			</td>
		</tr>
	</c:if>
	<c:if test="${ fn:length(lists) != 0 }">
		<c:forEach var="noticeBean" items="${ lists }">
			<tr>
				<td><a href="detail.notice?pageNumber=${ pageInfo.pageNumber }&notice_number=${ noticeBean.notice_number }">${ noticeBean.title }</a></td>
				<td><fmt:formatDate value="${ noticeBean.write_date }" pattern="yyyy-MM-dd" /></td>
			</tr>
		</c:forEach>
	</c:if>
</table>
<br><br>
${ pageInfo.pagingHtml }