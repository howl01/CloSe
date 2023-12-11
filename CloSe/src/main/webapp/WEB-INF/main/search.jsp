<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Search Page</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>

<form name="searchForm" method="get">
    <input type="text" id="searchWord" name="searchWord" size="50" autocomplete="off">
</form>

<div id="displayList" style="border: solid 1px gray; height: 100px; overflow: auto; margin-left: 77px; margin-top: -1px; border-top: 0px;"></div>

<script type="text/javascript">
    $(document).ready(function () {
        $("#searchWord").on("input", function () {
            var searchWord = $(this).val().trim();
            if (searchWord.length === 0) {
                $("#displayList").hide();
            } else {
                $.ajax({
                    url: "wordSearchShow.main",
                    type: "get",
                    data: {"searchWord": searchWord},
                    dataType: "text", // JSON 데이터를 문자열로 받음
                    success: function (json) {
                        if (json.length > 0) {
                            var html = "<ul>";  // 리스트로 표시하기 위해 ul 태그 추가
                            var jsonArray = JSON.parse(json);  // 문자열을 JSON 객체로 변환
                            $.each(jsonArray, function (index, item) {
                                html += "<li class='result' style='cursor:pointer;'>" + item.word + "</li>";
                            });
                            html += "</ul>";  // 리스트 닫기
                            var inputWidth = $("#searchWord").css("width");
                            $("#displayList").css({"width": inputWidth});
                            $("#displayList").html(html);
                            $("#displayList").show();
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.error("AJAX Error:", textStatus, errorThrown);
                        alert("검색 중 오류가 발생했습니다. 자세한 내용은 콘솔을 확인하세요.");
                    }
                });
            }
        });

        $(document).on('click', ".result", function () {
            var word = $(this).text();
            $("#searchWord").val(word);
            $("#displayList").hide();
        });
    });
</script>

</body>
</html>
