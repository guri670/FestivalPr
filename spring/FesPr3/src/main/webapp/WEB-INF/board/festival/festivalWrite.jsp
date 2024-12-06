<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.myaws.myapp.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Festival Info</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/resources/css/write.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <!-- TUI 에디터 CSS CDN -->
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />

<script>
   
   // 등록하기
   function check(action) {
	   
	  let festiStart = document.getElementById("startDate").value;
	  let festiEnd = document.getElementById("endDate").value;
	  if (!startDate || !endDate) {
	      alert("시작 날짜와 종료 날짜를 모두 선택해주세요!");
	      return;
	  }
   
     // 유효성 검사하기
     let fm = document.frm;  // 문자객체 안에 form 객체 생성하기
     
     if (fm.subject.value == "") {
        alert("제목을 입력해주세요");
        fm.title.focus();
        return;
	  } else if (fm.writer.value == "") {
		  alert("작성자를 입력해주세요");
		  fm.writer.focus();
		  return;
	  }else if (fm.password.value == "") {
		  alert("비밀번호를 입력해주세요");
		  fm.password.focus();
		  return;
	  } else if (fm.contents.value == "") {
		  alert("내용을 입력해주세요");
		  fm.contents.focus();
		  return;
	  }
/*      } else if (fm.attachfile.value == "") {
        alert("썸네일을 선택해주세요");
        fm.attachfile.focus();
        return;
     }
      */
     
  	  let ans = confirm("저장하시겠습니까?");
	  // 함수의 값은 참과 거짓 true & false로 나눈다.
	  
	  if (ans == true) {
		  fm.action="${pageContext.request.contextPath}/board/festival/festivalWriteAction.aws";
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
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    </div>
        <!-- 헤더 끝 -->

      <form name="frm">
		<div id="container-writebox">
			<div class="board_title">
				<strong>축제 정보</strong>
				<p>축제 정보를 입력합니다.</p>
			</div>
			<div class="boardcontents">
				<div class="subject">
					<dl>
						<dt>제목</dt>
						<dd>
							<input type="text" name="subject" placeholder="제목 입력">
						</dd>
					</dl>
				</div>
			<div class="info">
					<dl>
						<dt>글쓴이</dt>
						<dd>
							<input type="text" name="writer" placeholder="글쓴이 입력">
						</dd>
					</dl>
					<dl>
						<dt>비밀번호</dt>
						<dd>
							<input type="password" name="password" placeholder="비밀번호 입력">
						</dd>
					</dl>
				</div>
            <div class="festivaldate">
                <div class="date-input-wrapper">
                    <label for="startDate">시작 날짜:</label>
                    <input type="text" id="startDate" placeholder="시작 날짜를 선택하세요" readonly>
                    <label for="endDate">종료 날짜:</label>
                    <input type="text" id="endDate" placeholder="종료 날짜를 선택하세요" readonly>
                    <button id="saveDates" class="btn btn-primary">날짜 저장</button>
                </div>
                <div id="result"></div>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
            <script>
                // Flatpickr 초기화
                const startDatePicker = flatpickr("#startDate", {
                    dateFormat: "Y-m-d", // 날짜 형식
                    onChange: function (selectedDates, dateStr, instance) {
                        console.log("시작 날짜:", dateStr); // 시작 날짜 확인
                    }
                });

                const endDatePicker = flatpickr("#endDate", {
                    dateFormat: "Y-m-d", // 날짜 형식
                    onChange: function (selectedDates, dateStr, instance) {
                        console.log("종료 날짜:", dateStr); // 종료 날짜 확인
                    }
                });

                // 저장 버튼 이벤트 핸들러
                document.getElementById("saveDates").addEventListener("click", function(event) {
                    event.preventDefault(); // 기본 동작 방지

                    const festiStart = document.getElementById("startDate").value;
                    const festiEnd = document.getElementById("endDate").value;

                    if (!startDate || !endDate) {
                        alert("시작 날짜와 종료 날짜를 모두 선택해주세요!");
                        return;
                    }

                    // DB로 넘길 값 표시
                    const resultDiv = document.getElementById("result");
                    resultDiv.innerHTML =
                        `<div class="festiterm">
                            축제 시작일: ${startDate} 축제 종료일: ${endDate}
                        </div>`;

                    console.log("festiStart:", startDate);
                    console.log("festiEnd:", endDate);
                });
            </script>
            <hr>
            <!-- TUI 에디터 JS CDN -->
 
				<div class="contents">
					<textarea placeholder="내용 입력" name="contents"></textarea>
				</div>
				<div id="writedetail">
					<dt>첨부파일</dt>
					<dd>
						<input type="file" id="filebox" name="attachfile">
					</dd>
					<br>
				
					<button type="button" class="btn btn-primary" onclick="check();">
						저장</button>
					<button type="button" class="btn btn-secondary">
						<a
							href="${pageContext.request.contextPath}/board/festival/festivalList.aws">취소</a>
					</button>
				</div>
			</div>
		</div>
	</form>
	<br>
    <!-- 푸터 시작-->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>

</html>