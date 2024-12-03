<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>축제후기 수정하기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/resources/css/write.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <!-- TUI 에디터 CSS CDN -->
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
</head>

<body>
    <!--헤더-->
    <div class="b-example-divider"></div>
    <div class="container">
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    </div>
        <!-- 헤더 끝 -->


        <div id="container-writebox">
            <div class="subject">
                <dl>
                    <dt>제목</dt>
                    <dd><input type="text" placeholder="제목 입력"></dd>
                </dl>
            </div>
            <!-- TUI 에디터 JS CDN -->
            <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
            <!-- 에디터를 적용할 요소 (컨테이너) -->
            <div id="content">
                <script>
                    const editor = new toastui.Editor({
                        el: document.querySelector('#content'), // 에디터를 적용할 요소 (컨테이너)
                        height: '500px', // 에디터 영역의 높이 값 (OOOpx || auto)
                        initialEditType: 'markdown', // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
                        initialValue: '궁금하신점을 작성해주세요!', // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
                        previewStyle: 'vertical' // 마크다운 프리뷰 스타일 (tab || vertical)
                    });
                </script>
            </div>
            <br>
            <div class="text-center">
                <button type="button" class="btn btn-primary" onclick="check();">
                저장</button>
                <button type="button" class="btn btn-secondary">
                <a href="${pageContext.request.contextPath}/board/review/reviewList.aws">취소</a>
                </button>
            </div>
        </div>

    <br>
    <!-- 푸터 시작-->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>

</html>