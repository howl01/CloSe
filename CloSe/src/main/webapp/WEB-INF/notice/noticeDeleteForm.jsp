<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
noticeDeleteForm.jsp <br>
<script type="text/javascript">
	function allChecked(target){
		const checkbox = document.getElementById("allCheckBox");
		const is_checked = checkbox.checked;
		if(is_checked){
			chkAllChecked()
		}else{
			chkAllUnChecked()
		}
	}
	
	function chkClicked(){
		const allCount = document.querySelectorAll(".chk").length;
		
		const query = 'input[name="chk"]:checked'
		const selectedElements = document.querySelectAll(query)
		const selectedElementsCnt = selectedElements.length;
		
		if(allCount == selectedElementsCnt){
            document.getElementById('allCheckBox').checked = true;
       }

       else{
           document.getElementById('allCheckBox').checked = false;
       }
		
	}
	
	function chkAllChecked(){
        document.querySelectorAll(".chk").forEach(function(v, i) {
            v.checked = true;
        });
	}
	
	function chkAllUnChecked(){
        document.querySelectorAll(".chk").forEach(function(v, i) {
            v.checked = false;
        });
    }
</script>

<form action="list.notice" method="get">
	<select name="whatColumn">
		<option value="title">제목
	</select>
	<input type="text" name="keyword">
	<input type="submit" value="검색">
</form>
<form action="delete.notice" method="post">
<input type="hidden" name="pageNumber" value="${ pageInfo.pageNumber }">
<table border="1">
	<c:if test="${ member_id == 'admin' }">
		<tr>
			<td colspan="2" align="right">
				<input type="submit" value="삭제하기">
			</td>
		</tr>
	</c:if>
	<tr>
		<td>
			<input type="checkbox" id="allCheckBox" onClick="allChecked()">
		</td>
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
				<td><input type="checkbox" name="chk" class="chk" value="${ noticeBean.notice_number }" onClick="chkClicked()"></td>
				<td><a href="detail.notice?pageNumber=${ pageInfo.pageNumber }&notice_number=${ noticeBean.notice_number }">${ noticeBean.title }</a></td>
				<td><fmt:formatDate value="${ noticeBean.write_date }" pattern="yyyy-MM-dd" /></td>
			</tr>
		</c:forEach>
	</c:if>
</table>
</form>
<br><br>
${ pageInfo.pagingHtml }