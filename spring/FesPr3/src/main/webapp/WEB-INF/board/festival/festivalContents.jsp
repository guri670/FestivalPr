<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<link href="${pageContext.request.contextPath}/resources/css/contents.css" rel="stylesheet">
<title>축제 정보</title>
</head>
<body>
	<div class="b-example-divider"></div>
	<div class="container">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
	</div>
	<div class="container-Contents">
		<div class="contents">
			<strong>🎆축제 정보</strong>

			<!-- <p>쓸말적을까? </p>-->

			<br> <br>
		</div>
		<div class="contents_view_wrap">
			<div class="contents_view">
				<div class="subject">글 제목이 들어갑니다.</div>
				<div class="info">
					<dl>
						<dt>번호</dt>
						<dd>1</dd>
					</dl>
					<dl>
						<dt>글쓴이</dt>
						<dd>김이름</dd>
					</dl>
					<dl>
						<dt>작성일</dt>
						<dd>2021.1.16</dd>
					</dl>
					<dl>
						<dt>조회</dt>
						<dd>33</dd>
					</dl>
				</div>
				<div class="contents">
					글 내용이 들어갑니다<br> 
					글 내용이 들어갑니다<br> 
					글 내용이 들어갑니다<br> 
					글 내용이 들어갑니다<br> 
					글 내용이 들어갑니다<br> 
					글 내용이 들어갑니다<br> 
					글 내용이 들어갑니다<br> 
					글 내용이 들어갑니다
				</div>
			</div>
			<br>
			<div class="button-box">
				<div class="d-flex justify-content-between">
					<button type="submit" class="btn btn-primary">작성</button>
					<button class="btn btn-secondary">
						<a href="${pageContext.request.contextPath}/board/festival/festivalList.aws">
						목록가기</a>
					</button>
				</div>
			</div>
		</div>
	</div>
	<br>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>