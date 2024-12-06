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

     <div class="container-tabname">📝Festival Review📝
    <p>여러분들의 생생한 축제 경험을 이야기를 들려주세요</p>
  </div>
  
  
  <!--  시작   -->
  <div class="album py-5 bg-body-tertiary">
    <div class="container">
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
      <c:forEach items="${blist}" var="bv" varStatus="status" begin="0" end="2">
        <div class="col"> 
        <a href="${pageContext.request.contextPath}/board/review/reviewContents.aws?bidx=${bv.bidx}" class="card-link">
          <div class="card shadow-sm">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg"
              role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
              <title>리뷰 게시글로 이동!</title>
			<c:if test="${not empty bv.fileName}">
    		<image href="${pageContext.request.contextPath}/board/displayFile.aws?fileName=${bv.fileName}" width="100%" height="100%">
			</c:if>
             <rect width="100%" height="100%" fill="#55595c"/>
            </svg>
            <div class="card-body">
              <p class="card-text"><a href="${pageContext.request.contextPath}/board/review/reviewContents.aws?bidx=${bv.bidx}">${bv.subject}
                  </a></p>
              <div class="d-flex justify-content-between align-items-center">
               <div class="board" style="border:none;">작성자 : ${bv.writer}
            	</div>
                <small class="board" style="border:none;">조회수 : ${bv.viewCnt}</small>
              </div>
            </div>
          </div>
         </div>
        </c:forEach>
       </div>
     </div>
   </div>

      
      <!-- 끝 -->
      
      
      
      <div class="container-board">
        <div class="row justify-content-center">
          <div class="col-12 col-md-6">
            <div>
              <br>
              <h3>축제 후기</h3>
              <form class="d-flex" role="search" name=frm action="${pageContext.request.contextPath}/board/review/reviewList.aws" method="get">
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
                  <div class="board-subject"><a href="${pageContext.request.contextPath}/board/review/reviewContents.aws?bidx=${bv.bidx}">${bv.subject}
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
          <!-- 네비게이션바 예정 -->
          <button type="button" class="btn btn-secondary"><a href="${pageContext.request.contextPath}/board/review/reviewWrite.aws">글쓰기</a></button>
        </div>
      </div>
    </div>
  </div>
  <br>
    <!--풋터-->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>

</html>