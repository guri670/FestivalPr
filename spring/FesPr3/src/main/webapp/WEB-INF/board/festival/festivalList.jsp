<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import ="java.util.*" %>
<%@page import ="com.myaws.myapp.domain.*" %>  
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

    <div class="container-tabname">✨Festival Information✨
        <p>최신 축제 정보를 확인하세요!</p>
    </div>


    <!-- 축제 사진 영역 -->
    <div class="carousel-silder">
        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
                    aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                    aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                    aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active" data-bs-interval="5000">
                    <img src="${pageContext.request.contextPath}/resources/images/lotus lantern.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="${pageContext.request.contextPath}/resources/images/hanbok.png" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="${pageContext.request.contextPath}/resources/images/firework.jpg" class="d-block w-100" alt="...">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

    <!-- 축제 사진 영역 끝-->


    <!-- 후기글 -->
    <div class="container-board">
        <div class="row justify-content-center">
            <div class="col-12 col-md-6">
				<div class="main_info">
					<h3>최신 축제 정보</h3>
				</div>
                <div>
                    <br>
                   <form class="d-flex" role="search" name=frm action="${pageContext.request.contextPath}/board/festival/festivalList.aws" method="get">
                <select>
                  <option value="subject">제목</option>
                  <option value="writer">작성자</option>
                </select>
                <input class="form-control me-2" type="text" name="keyword" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
              </form>
                    <br>
                </div>
                <div class="card mb-3">
                    <div class="festiList-wrap">
                        <div class="board">
                            <div class="top">
                                <div class="board-bidx">번호</div>
                                <div class="board-subject">제목</div>
                                <div class="board-writer">글쓴이</div>
                                <div class="board-writeday">작성일</div>
                                <div class="board-viewcnt">조회</div>
                            </div>
                            <c:forEach items="${blist}" var ="bv" varStatus="status">
                			<div>
			                  <div class="board-bidx">${bv.bidx}</div>
			                  <div class="board-subject"><a href="${pageContext.request.contextPath}/board/festival/festivalContents.aws?bidx=${bv.bidx}">${bv.subject}
			                  </a></div>
			                  <div class="board-writer">${bv.writer}</div>
			                  <div class="board-writeday">${bv.writeday}</div>
			                  <div class="board-viewcnt">${bv.viewCnt}</div>
			                </div>
			                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	<div class="page">
		<ul>
		<c:if test= "${pm.prev == true}">
		<li><a href="${pageContext.request.contextPath}/board/festival/festivalList.aws?page=${pm.startPage-1}&${queryParam}"></a>◀</li>
		</c:if>


		<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1"> 
		<li <c:if test="${i==pm.scri.page}"> class='on' </c:if>	>		
		<a href="${pageContext.request.contextPath}/board/festival/festivalList.aws?page=${i}&${queryParam}">
		<span style="font-size:20px;">${i}</span></a>
		</li>
		</c:forEach> 
		
		<c:if test="${pm.next == true}">
		<li><a href="${pageContext.request.contextPath}/board/festival/festivalList.aws?page=${pm.endPage+1}&${queryParam}">▶</a></li>
		</c:if>
		
		</ul>
	</div> 
    <div class="text-center">

        <button type="button" class="btn btn-secondary"><a href="${pageContext.request.contextPath}/board/festival/festivalWrite.aws">글쓰기</a></button>
    </div>

    <br>
    <!-- 후기글 끝 -->
    <br>
    <!--풋터-->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>

</html>