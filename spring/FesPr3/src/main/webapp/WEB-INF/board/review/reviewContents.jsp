<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.myaws.myapp.domain.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-latest.min.js"></script> 
<link href="${pageContext.request.contextPath}/resources/css/contents.css" rel="stylesheet">
<title>축제 리뷰</title>
<script>
// 현재 로그인한 사용자의 midx 가져오기 (세션에서)
var currentMidx = ${sessionScope.midx};
var postMidx = ${bv.midx}; // 해당 게시글의 작성자 midx

// 삭제와 수정 버튼 보이기 조건: 현재 사용자가 작성자와 같거나, 관리자(mid1)일 경우
if (currentMidx === postMidx || currentMidx === 1) {
    $('#deleteBtn').show();
    $('#editBtn').show();
}

// 삭제 버튼 클릭 시, 확인 팝업
$('#deleteBtn').on('click', function() {
    // 팝업창 띄우기
    if (confirm("삭제하시겠습니까? 삭제된 게시글은 복구할 수 없습니다.")) {
        var bidx = ${bv.bidx}; // 현재 게시글의 bidx
        
        // Ajax 요청을 통해 삭제 처리
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/board/boardDeleteAction.aws", // 삭제 Action URL
            data: {
                bidx: bidx
            },
            success: function(response) {
                if (response === "success") {
                    alert("삭제되었습니다.");
                    window.location.href = "${pageContext.request.contextPath}/board/review/reviewList.aws"; // 삭제 후 목록 페이지로 이동
                } else {
                    alert("삭제 실패했습니다.");
                }
            },
            error: function(xhr, status, error) {
                alert("서버 오류가 발생했습니다.");
            }
        });
    }
});
</script>

</head>
<body>
	<div class="b-example-divider"></div>
	<div class="container">
<%@ include file="/WEB-INF/views/common/header.jsp"%>
  </div>
    <div class="container-Contents">
        <div class="contents">
            <strong>📑축제 후기</strong>
            
            <!-- <p>쓸말적을까? </p>-->
             
            <br>
            <br>
        </div>
        <div class="contents_view_wrap">
            <div class="contents_view">
                <div class="subject">
                    ${bv.subject}
                </div>
                <div class="info">
                    <dl>
                        <dt>번호</dt>
                        <dd>${bv.bidx}</dd>
                    </dl>
                    <dl>
                        <dt>글쓴이</dt>
                        <dd>${bv.writer}</dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd>${bv.writeday}</dd>
                    </dl>
                    <dl>
                        <dt>조회수</dt>
                        <dd>${bv.viewCnt}</dd>
                    </dl>
                </div>
                <div class="contents">
					${bv.contents}
                </div>
            </div>
            <br>
            <div class="button-box">
                <div class="d-flex justify-content-between">
                    <button id="editBtn" class="btn btn-primary" style="display:none;"> 
                    <a href="${pageContext.request.contextPath}/board/review/reviewModify.aws?bidx=${bv.bidx}">수정</a>
                    </button>
                    <button id="deleteBtn" class="btn btn-secondary" style="display:none;">
					<a href="javascript:void(0);">삭제</a>
					</button>
                    <button class="btn btn-secondary">
                    <a href="${pageContext.request.contextPath}/board/review/reviewList.aws">목록가기</a>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <br>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>