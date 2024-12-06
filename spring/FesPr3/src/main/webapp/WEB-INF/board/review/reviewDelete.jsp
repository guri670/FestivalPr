<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.myaws.myapp.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>축제 후기 삭제</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/resources/css/write.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<!-- TUI 에디터 CSS CDN -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<script>
	function check() {

		// 유효성 검사하기
		let fm = document.frm;

		if (fm.password.value == "") {
			alert("비밀번호를 입력해주세요");
			fm.password.focus();
			return;
		}

		let ans = confirm("삭제하시겠습니까?");

		if (ans == true) {
			fm.action = "${pageContext.request.contextPath}/board/festival/festivalDeleteAction.aws";
			fm.method = "post";
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
		<input type="hidden" name="bidx" value="${bidx}">
		<div id="container-writebox">
			<div class="board_title">
				<table class="writeTable">
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="password"></td>
					</tr>
				</table>
				<br>
				<div>
					<button type="button" class="btn btn-primary" onclick="check();">
						저장</button>
					<button type="button" class="btn btn-secondary">
						<a
							href="${pageContext.request.contextPath}/board/review/reviewList.aws">취소</a>
					</button>
				</div>
			</div>
		</div>
	</form>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>

</html>