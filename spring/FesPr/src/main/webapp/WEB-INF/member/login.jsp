<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri= "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>전축당 로그인</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
</head>

<body>
  <!--헤더-->
  <div class="b-example-divider"></div>
  <div class="container">
  <%@ include file="/WEB-INF/views/common/header.jsp" %>
  </div>
  <!-- 헤더 끝 -->


  <div class="modal modal-sheet position-static d-block bg-body-secondary p-4 py-md-5" tabindex="-1" role="dialog"
    id="modalSignin">
    <div class="modal-dialog" role="document">
      <div class="modal-content rounded-4 shadow">
        <img src="/images/2017.jpg" alt="Image">

        <div class="modal-header p-5 pb-4 border-bottom-0">
          <h1 class="fw-bold mb-0 fs-3">로그인</h1>
        </div>

        <div class="modal-body p-5 pt-0">
          <form class="">
            <div class="form-floating mb-3">
              <!-- 이메일 필드에 "@"이 포함되도록 설정 -->
              <input type="email" class="form-control rounded-3" id="floatingInput" placeholder="name@example.com"
                required>
              <label for="floatingInput">Id</label>
            </div>
            <div class="form-floating mb-3">
              <input type="password" class="form-control rounded-3" id="floatingPassword" placeholder="Password"
                required>
              <label for="floatingPassword">Password</label>
            </div>

            <!-- 확인, 취소 버튼 가운데 정렬 -->
            <div class="d-flex-center mb-4">
              <div>
                <button type="button" class="btn btn-primary">로그인</button>
              </div>
              <div>
                <button type="button" class="btn btn-outline-primary ms-3"><a onclick="history.back();">취소</a></button>
              </div>
            </div>

            <!-- 아이디 없으신가요? -->
            <div class="login-signup-box">
              <h6 class="q-id">아이디가 없으신가요?</h6> &nbsp;
              <button class="w-40 mb-2 btn btn-lg rounded-3 btn-primary" type="submit"><a
                  href="/html2/member/Singup.html" class="listA">Sign up</a></button>
            </div>
            <br>
            <div class="login-find-id-pw">
              <small><a href="#">아이디 찾기 | 비밀번호찾기</a></small>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <div class="b-example-divider"></div>

  <script src="/docs/5.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
    crossorigin="anonymous"></script>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>

</html>