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
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
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
        <div class="board_page_nav">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </nav>
        </div>
        <div class="text-center">
            <button type="button" class="btn btn-secondary"><a href="/${pageContext.request.contextPath}/board/qna/qnawWrite.jsp">글쓰기</a></button>
        </div>
        </div>
        </div>
        </div>
        <br>
    <!-- 후기글 끝 -->
    <br>
    <!--풋터-->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>

</html>