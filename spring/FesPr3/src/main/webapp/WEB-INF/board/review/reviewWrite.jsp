<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.myaws.myapp.domain.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${!empty msg }">
alert("");
</c:if>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>축제후기 수정하기</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/resources/css/write.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

<script>
	function check() {

		// 유효성 검사하기
		let fm = document.frm;

		if (fm.subject.value == "") {
			alert("제목을 입력해주세요");
			fm.subject.focus();
			return;
		} else if (fm.contents.value == "") {
			  alert("내용을 입력해주세요");
			  fm.contents.focus();
			  return;
		}
		let ans = confirm("저장하시겠습니까?");
		// 함수의 값은 참과 거짓 true & false로 나눈다.
		  
		if (ans == true) {
			fm.action="<%=request.getContextPath()%>/board/review/reviewWriteAction.aws";
			fm.method="post";
			fm.enctype="multipart/form-data"; // enctype
			fm.submit();
		  }	  	  
		  return;
	}
</script>
</head>

<body>
	<!--헤더-->
	<div class="b-example-divider"></div>
	<div class="container">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
	</div>
	<!-- 헤더 끝 -->

	<form name="frm">
		<div id="container-writebox">
			<div class="subject">
				<dl>
					<dt>제목</dt>
					<dd>
						<input type="text" name="subject" placeholder="제목 입력" >
					</dd>
				</dl>
					<br>
						<dt>내용</dt>
					<dd>
						<textarea name="contents" rows="6" placeholder="내용을 입력해주세요" style="width:100%"></textarea>
					</dd>
			</div>
					<br>
			<div id="writedetail">
				<dt>첨부파일</dt>
					<dd>
						<input type="file" id="filebox" name="attachfile">
					</dd>
				<dt>작성자</dt>
			        <dd>
			       	    <input type="text" name="writer">
			        </dd>
			</div>
			<br>
			<div class="text-center">
				<button type="button" class="btn btn-primary" onclick="check();">
					저장</button>
				<button type="button" class="btn btn-secondary">
					<a
						href="${pageContext.request.contextPath}/board/review/reviewList.aws">취소</a>
				</button>
			</div>
	</form>
	<br>
	<!-- 푸터 시작-->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>

</html>