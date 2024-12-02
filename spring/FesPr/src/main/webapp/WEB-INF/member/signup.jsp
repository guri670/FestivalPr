<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
const email = /[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]$/i;
    
    function check(){
    	
    	//유효성 검사하기	
    	var fm = document.frm;	
    	
    	if (fm.memberId.value ==""){
    		alert("아이디를 입력해주세요");
    		fm.memberId.focus();
    		return;
    	}else if (fm.memberPassword.value ==""){		
    		alert("비밀번호를 입력해주세요");
    		fm.memberPassword.focus();
    		return;
    	}else if (fm.memberPassword2.value ==""){
    		alert("비밀번호 확인을 입력해주세요");
    		fm.memberPassword2.focus();
    		return;
    	}else if (fm.memberPassword.value != fm.memberPassword2.value){
    		alert("비밀번호가 일치하지 않습니다.");
    		fm.memberPassword2.value="";
    		fm.memberPassword2.focus();
    		return;
    	}else if (fm.memberName.value ==""){
    		alert("이름을 입력해주세요");
    		fm.memberName.focus();
    		return;
    	}else if (fm.memberNickName.value ==""){
    		alert("닉네임을 입력해주세요");
    		fm.memberNickName.focus();
    		return;
    	}else if (fm.memberBirthday.value ==""){
    		alert("생년월일을 입력해주세요");
    		fm.memberBirthday.focus();
    		return;
    	}else if (fm.memberEmail.value ==""){
    		alert("이메일을 입력해주세요");
    		fm.memberEmail.focus();
    		return;
    	}else if (email.test(fm.memberEmail.value)== false){
    		alert("이메일 형식이 올바르지 않습니다.");
    		fm.memberEmail.value="";
    		fm.memberEmail.focus();
    		return;
    	}else if (fm.memberPhone.value ==""){
    		alert("연락처를 입력해주세요");
    		fm.memberPhone.focus();
    		return;
    	}else if (fm.btn.value=="N"){
    	alert("아이디중복체크를 해주세요");
    	fm.memberId.focus();
    	return;		
    	} 	
    	
    	var ans = confirm("저장하시겠습니까?");
    	
    	if (ans == true){
    		//alert("이동할 정보등록할 차례입니다.");
    		//action="./memberJoinAction.jsp" method="post"  html 홈태그 기능을 자바스크립트로 제어
    		
    		
    		//가상경로를 사용해서 쓸 예정   가짜경로 형식은  /기능/세부기능.aws
    		fm.action="<%=request.getContextPath()%>/member/signupAction.aws";
    		fm.method="post"; 
    		fm.submit();
    	}
    	return;
    }
    
    	$(document).ready(function(){
    		
    		$("#btn").click(function(){
    			//alert("중복체크버튼 클릭");	
    			let memberId = $("#memberId").val();
    			if (memberId ==""){
    				alert("아이디를 입력해주세요");
    				return;
    			}
    		
    			$.ajax({
    				type :  "post",    //전송방식
    				url : "<%=request.getContextPath()%>
	/member/memberIdCheck.aws",
				dataType : "json", // json타입은 문서에서  {"키값" : "value값","키값2":"value값2"}
				data : {
					"memberId" : memberId
				},
				success : function(result) { //결과가 넘어와서 성공했을 받는 영역
					//	alert("전송성공 테스트");
					//	alert("길이는"+result.length);
					//	alert("cnt값은"+result.cnt);
					if (result.cnt == 0) {
						alert("사용할수 있는 아이디입니다.");
						$("#btn").val("Y");
					} else {
						alert("사용할수 없는 아이디입니다.");
						$("#memberid").val(""); //입력한 아이디 지우기
					}
				},
				error : function() { //결과가 실패했을때 받는 영역						
					alert("전송실패 테스트");
				}
			});
		});
	});
</script>
</head>

<body>
	<!--헤더-->
	<div class="b-example-divider"></div>
	<div class="container">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>

	</div>
	<!-- 헤더 끝 -->
	<div class="container-signup">
		<!-- 회원가입 폼 -->
		<form id="frm">
			<!-- 아이디 -->
			<h3>전축당 회원가입</h3>
			<br>
			<div class="mb-3">
				<label for="username" class="form-label">아이디</label>
				<button type="button" class="btn btn-primary"
					style="height: 30px; width: auto; line-height: 15px; padding: 0 10px; font-size: 12px; text-align: center;"
					name="btn" id="btn" value="N">아이디 중복체크</button>
				<input type="text" class="form-control" id="memberId"
					name="memberId" placeholder="아이디를 입력하세요">

			</div>

			<!-- 비밀번호 -->
			<div class="mb-3">
				<label for="password" class="form-label">비밀번호</label> <input
					type="password" class="form-control" id="password"
					placeholder="비밀번호를 입력하세요">
			</div>

			<!-- 비밀번호 확인 -->
			<div class="mb-3">
				<label for="confirm-password" class="form-label">비밀번호 확인</label> <input
					type="password" class="form-control" id="confirm-password"
					placeholder="비밀번호를 확인하세요"> <span id="password-match"
					class="text-success d-none"> <svg
						xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-check2-all" viewBox="0 0 16 16">
                            <path
							d="M12.354 4.354a.5.5 0 0 0-.708-.708L5 10.293 1.854 7.146a.5.5 0 1 0-.708.708l3.5 3.5a.5.5 0 0 0 .708 0zm-4.208 7-.896-.897.707-.707.543.543 6.646-6.647a.5.5 0 0 1 .708.708l-7 7a.5.5 0 0 1-.708 0" />
                            <path
							d="m5.354 7.146.896.897-.707.707-.897-.896a.5.5 0 1 1 .708-.708" />
                        </svg>
				</span>
			</div>

			<!-- 이름 -->
			<div class="mb-3">
				<label for="name" class="form-label">이름</label> <input type="text"
					class="form-control" id="name" placeholder="이름을 입력하세요">
			</div>

			<!-- 닉네임 -->
			<div class="mb-3">
				<label for="nickname" class="form-label">닉네임</label> <input
					type="text" class="form-control" id="nickname"
					placeholder="닉네임을 입력하세요">
			</div>

			<!-- 생년월일 -->
			<div class="mb-3 row">
				<div class="col">
					<label for="birth" class="form-label">생년월일</label> <input
						class="form-control" id="birth"
						placeholder="생년월일을 입력하세요  예)20000101(8자리 입력)">
				</div>
			</div>

			<!-- 이메일 -->
			<div class="mb-3">
				<label for="email" class="form-label">이메일</label>
				<div class="input-group">
					<input type="text" class="form-control" id="email"
						placeholder="이메일을 입력하세요"> <select class="form-select"
						id="email-domain">
						<option value="">도메인 선택</option>
						<option value="@naver.com">naver.com</option>
						<option value="@google.com">google.com</option>
						<option value="@kakao.com">kakao.com</option>
					</select>
				</div>
			</div>

			<!-- 연락처 -->
			<div class="mb-3">
				<label for="phone" class="form-label">연락처</label> <input type="text"
					class="form-control" id="phone" placeholder="'-' 없이 입력해주세요">
				<small class="text-muted">'-'는 제외하여 입력해주세요</small>
			</div>

			<!-- 확인, 취소 버튼 -->
			<div class="d-flex justify-content-between">
				<button type="submit" class="btn btn-primary" onclick="check();">확인</button>
				<button onclick="history.back()" class="btn btn-secondary">
					</a>취소
				</button>
			</div>
		</form>
	</div>
	<br>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>


	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>

</html>