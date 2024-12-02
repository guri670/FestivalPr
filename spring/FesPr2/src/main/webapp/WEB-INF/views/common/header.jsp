<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib prefix = "c" uri= "http://java.sun.com/jsp/jstl/core" %>
    <header
      class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
      <div class="col-md-3 mb-2 mb-md-0">
        <a href="/html2/index.html" class="d-inline-flex link-body-emphasis text-decoration-none">전국 축제를 당신에게
          <svg class="bi" width="40" height="32" role="img" aria-label="Bootstrap">
            <use xlink:href="#bootstrap" />
          </svg>
        </a>
      </div>
      <div>
        <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
          <li><a href="${pageContext.request.contextPath}/index.aws" class="nav-link px-2 link-secondary">Home</a></li>
          <li><a href="${pageContext.request.contextPath}/board/festival/festivalList.aws" class="nav-link px-2">Festival Info</a></li>
          <li><a href="${pageContext.request.contextPath}/board/review/reviewList.aws" class="nav-link px-2">Festival Review</a></li>
          <li><a href="#" class="nav-link px-2">MyPage</a></li>
          <li><a href="${pageContext.request.contextPath}/board/qna/qnaList.aws" class="nav-link px-2">QnA</a></li>
        </ul>
      </div>
      <div class="col-md-3 text-end">
        <button type="button" class="btn btn-outline-primary me-2"><a href="${pageContext.request.contextPath}/member/login.aws">Login</a></button>
        <button type="button" class="btn btn-primary">
        <a class="listA" href="${pageContext.request.contextPath}/member/signup.aws">Sign-up</a></button>
      </div>
    </header>