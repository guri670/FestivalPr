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

     <div class="container-tabname">📝Festival Review📝
    <p>여러분들의 생생한 축제 경험을 이야기를 들려주세요</p>
  </div>
  <div class="album py-5 bg-body-tertiary">
    <div class="container">
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
        <div class="col">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg"
              role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
              <title>Placeholder</title>
              <rect width="100%" height="100%" fill="#55595c" /><text x="50%" y="50%" fill="#eceeef"
                dy=".3em">Thumbnail</text>
            </svg>
            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional
                content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
                <small class="text-body-secondary">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg"
              role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
              <title>Placeholder</title>
              <rect width="100%" height="100%" fill="#55595c" /><text x="50%" y="50%" fill="#eceeef"
                dy=".3em">Thumbnail</text>
            </svg>
            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional
                content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
                <small class="text-body-secondary">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg"
              role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
              <title>Placeholder</title>
              <rect width="100%" height="100%" fill="#55595c" /><text x="50%" y="50%" fill="#eceeef"
                dy=".3em">Thumbnail</text>
            </svg>
            <div class="card-body">
              <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional
                content. This content is a little bit longer.</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
                <small class="text-body-secondary">9 mins</small>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="container-board">
        <div class="row justify-content-center">
          <div class="col-12 col-md-6">
            <div>
              <br>
              <h3>축제 후기</h3>
              <form class="d-flex" role="search">
                <select>
                  <option value="subject">제목</option>
                  <option value="writer">지역</option>
                </select>
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
              </form>
              <br>
            </div>
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
                <div>
                  <div class="board-bidx">5</div>
                  <div class="board-subject"><a href="view.html">글 제목이 들어갑니다.</a></div>
                  <div class="board-writer">김이름</div>
                  <div class="board-writeday">2021.1.15</div>
                  <div class="board-viewcnt">33</div>
                </div>
                <div>
                  <div class="board-bidx">5</div>
                  <div class="board-subject"><a href="view.html">글 제목이 들어갑니다.</a></div>
                  <div class="board-writer">김이름</div>
                  <div class="board-writeday">2021.1.15</div>
                  <div class="board-viewcnt">33</div>
                </div>
                <div>
                  <div class="board-bidx">5</div>
                  <div class="board-subject"><a href="view.html">글 제목이 들어갑니다.</a></div>
                  <div class="board-writer">김이름</div>
                  <div class="board-writeday">2021.1.15</div>
                  <div class="board-viewcnt">33</div>
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
          <!-- 네비게이션바 예정 -->
          <button type="button" class="btn btn-secondary"><a href="/${pageContext.request.contextPath}/board/review/reviewWrite.jsp">글쓰기</a></button>
        </div>
      </div>
    </div>
  </div>
  <br>
    <!--풋터-->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>

</html>