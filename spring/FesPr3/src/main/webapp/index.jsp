<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri= "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Festival For You</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    <script src=" https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js "></script>
</head>


<body>
    <!--헤더-->
    <div class="b-example-divider"></div>
    <div class="container">
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    </div>
    <!-- 헤더 끝 -->
    <div class="container-tabname">📅축제 달력📅
        <p></p>
    </div>
    <!-- 캘린더 영역 -->
    <div class="container-calendar">
        <div class="row justify-content-center">
            <div class="col-12 col-md-6">
                <div id="calendar" class="calendar">
                    <script>
                        document.addEventListener('DOMContentLoaded', function () {
                            const calendarEl = document.getElementById('calendar')
                            const calendar = new FullCalendar.Calendar(calendarEl, {
                                initialView: 'dayGridMonth'
                            })
                            calendar.render()
                        })
                    </script>
                    <!-- 캘린더가 이곳에 표시됩니다 -->
                </div>
            </div>
        </div>
    </div>

    <script>
        // 캘린더 만들기 예시 스크립트
        document.getElementById('calendar').innerHTML = new Date().toLocaleDateString('ko-KR', {
            weekday: 'long', year: 'numeric', month: 'long', day: 'numeric'
        });
    </script>

    <style>
        #calendar {
            border: 1px solid #ccc;
            padding: 20px;
            text-align: center;
            font-size: 10px;
            background-color: #f8f9fa;
        }
    </style>

    <!-- 캘린더 영역 끝-->


    <!-- 후기글 -->
    <div class="container-board">
        <div class="row justify-content-center">
            <div class="col-12 col-md-6">
                <div class="main_info">
                    <h3>최신 리뷰</h3>
                </div>
                <div>

                    <form class="d-flex" role="search">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>

            </div>
            <div class="index-review-wrap">
                <div class="card mb-3">
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
                            <div class="board-subject"><a href="view.html">글 제목이 들어갑니다.</a></div>
                            <div class="board-writer">김이름</div>
                            <div class="board-writeday">2021.1.15</div>
                            <div class="board-viewcnt">33</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    </div>
    <div class="text-center">
        <a href="${pageContext.request.contextPath}/board/review/reviewList.aws"class="btn btn-outline-secondary">더보기</a>
        <br>
        <!-- 후기글 끝 -->
        <br>
        <!--풋터-->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>

</html>