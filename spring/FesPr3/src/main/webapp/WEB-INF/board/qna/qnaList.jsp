<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>축제리스트</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/resources/css/css.css" rel="stylesheet">
    <script src=" https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js "></script>
</head>

<body>
    <!--헤더-->
    <div class="b-example-divider"></div>
    <div class="container">
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    </div>
    <!-- 헤더 끝 -->

        <div class="container-tabname">🛠QnA🛠
            <p>궁금하신점이 있으면 질문해주세요</p>
        </div>
        <br>
        <div class="container-board">
            <div class="board_list_wrap">
                <div class="board">
                    <div class="top">
                        <div class="board-bidx">번호</div>
                        <div class="board-subject">제목</div>
                        <div class="board-writer">글쓴이</div>
                        <div class="board-writeday">작성일</div>
                        <div class="board-viewcnt">조회</div>
                    </div>
                    <div>
                        <div class="board-bidx">5</div>
                        <div class="board-subject"><a href="/html2/qna/QnAContents.html">글 제목이 들어갑니다.</a></div>
                        <div class="board-writer">김이름</div>
                        <div class="board-writeday">2021.1.15</div>
                        <div class="board-viewcnt">33</div>
                    </div>
                </div>
            </div>
        </div>
        <br>
	<div class="page">
		<ul>
		<c:if test= "${pm.prev == true}">
		<li><a href="${pageContext.request.contextPath}/board/review/reviewList.aws?page=${pm.startPage-1}&${queryParam}"></a>◀</li>
		</c:if>


		<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1"> 
		<li <c:if test="${i==pm.scri.page}"> class='on' </c:if>	>		
		<a href="${pageContext.request.contextPath}/board/review/reviewList.aws?page=${i}&${queryParam}">
		<span style="font-size:20px;">${i}</span></a>
		</li>
		</c:forEach> 
		
		<c:if test="${pm.next == true}">
		<li><a href="${pageContext.request.contextPath}/board/review/reviewList.aws?page=${pm.endPage+1}&${queryParam}">▶</a></li>
		</c:if>
		
		</ul>
	</div> 
        <div class="text-center">
            <button type="button" class="btn btn-secondary"><a href="${pageContext.request.contextPath}/board/qna/qnaWrite.aws">글쓰기</a></button>
        </div>
        <br>
    <!-- 후기글 끝 -->
    <br>
    <!--풋터-->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>

</html>