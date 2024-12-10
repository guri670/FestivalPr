<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.myaws.myapp.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>축제리스트</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/resources/css/css.css"
	rel="stylesheet">
<script
	src=" https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js "></script>
</head>

<body>
	<!--헤더-->
	<div class="b-example-divider"></div>
	<div class="container">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
	</div>
	<!-- 헤더 끝 -->

	<div class="container-tabname">
		🛠QnA🛠
		<p>궁금하신점이 있으면 질문해주세요</p>
	</div>
	
	
	<br>
	
	<div class="container-board">
              <form class="d-flex" role="search" name=frm action="${pageContext.request.contextPath}/board/qna/qnaList.aws" method="get">
                <select name="searchType">
                  <option value="subject">제목</option>
                  <option value="writer">작성자</option>
                </select>
                <input class="form-control me-2" type="text" name="keyword" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
              </form>

	<c:set var="queryParam" value="keyword=${pm.scri.keyword}&searchType=${pm.scri.keyword}"></c:set>
	<br>
	
		<div class="board_list_wrap">
			<div class="board">
				<div class="top">
					<div class="board-bidx">번호</div>
					<div class="board-subject">제목</div>
					<div class="board-writer">글쓴이</div>
					<div class="board-writeday">작성일</div>
					<div class="board-viewcnt">조회</div>
				</div>
				<c:forEach items="${blist}" var="bv" varStatus="status">
					<div>
						<div class="board-bidx">${bv.bidx}</div>
						<div class="board-subject">
							<a
								href="${pageContext.request.contextPath}/board/qna/qnaContents.aws?bidx=${bv.bidx}">${bv.subject}
							</a>
						</div>
						<div class="board-writer">${bv.writer}</div>
						<div class="board-writeday">${bv.writeday}</div>
						<div class="board-viewcnt">${bv.viewCnt}</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<br>
	<div class="page">
		<ul>
			<c:if test="${pm.prev == true}">
				<li><a
					href="${pageContext.request.contextPath}/board/qna/qnaList.aws?page=${pm.startPage-1}&${queryParam}"></a>◀</li>
			</c:if>


			<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}"
				step="1">
				<li <c:if test="${i==pm.scri.page}"> class='on' </c:if>><a
					href="${pageContext.request.contextPath}/board/qna/qnaList.aws?page=${i}&${queryParam}">
						<span style="font-size: 20px;">${i}</span>
				</a></li>
			</c:forEach>

			<c:if test="${pm.next == true}">
				<li><a
					href="${pageContext.request.contextPath}/board/qna/qnaList.aws?page=${pm.endPage+1}&${queryParam}">▶</a></li>
			</c:if>

		</ul>
	</div>
	<div class="text-center">
		<button type="button" class="btn btn-secondary">
			<a href="${pageContext.request.contextPath}/board/qna/qnaWrite.aws">글쓰기</a>
		</button>
	</div>
	<br>
	<!-- 후기글 끝 -->
	<br>
	<!--풋터-->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>

</html>