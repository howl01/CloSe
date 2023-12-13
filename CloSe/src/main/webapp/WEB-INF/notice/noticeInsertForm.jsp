<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
noticeInsertForm.jsp <br>
<style>
	.err{
		color: red;
	}
</style>
<script type="text/javascript">
function insertForm() {
    var formData = new FormData(document.getElementById("insertForm"));

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "insert.notice", true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                var result = xhr.responseText;
                window.opener.location.reload();
                window.close();
            } else {
                alert("서버 오류 발생");
            }
        }
    };
    xhr.send(formData);
}
</script>
<form:form action="insert.notice" method="post" commandName="noticeBean" enctype="multipart/form-data">
	<tr>
		<td>제목</td>
		<td>
			<input type="text" name="title" value="${ noticeBean.title }">
			<form:errors cssClass="err" path="title" />
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
			<textarea name="content" cols="50" rows="10"  style="resize: none;">${ qnaBean.content }</textarea>
			<br><form:errors cssClass="err" path="content" />
		</td>
	</tr>
	<tr>
		<td>사진첨부</td>
		<td><input type="file" name="upload" value="${ noticeBean.image }"></td>
	</tr>
	<tr>
		<td>
			<input type="submit" value="작성">
		</td>
	</tr>
</form:form>