<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.myaws.myapp.domain.*"%>
<%
BoardVo bv = (BoardVo) request.getAttribute("bv");
/*CommentVo cv = (CommentVo)request.getAttribute("cv");*/
//강제 형변환 양쪽형을 맞춰준다.
String memberName = "";
if (session.getAttribute("memberNickName") != null) {
	memberName = (String) session.getAttribute("memberNickName");
}
int midx = 0;
if (session.getAttribute("midx") != null) {
	midx = Integer.parseInt(session.getAttribute("midx").toString());
}
%>
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
<title>QnA</title>

<script> 

function commentDel(cidx){	
	let ans= confirm("삭제하시겠습니까?");	
	if (ans== true){
		
		$.ajax({
			type :  "get",    //전송방식
			url : "${pageContext.request.contextPath}/comment/"+cidx+"/commentDeleteAction.aws",
			dataType : "json",       // json타입은 문서에서  {"키값" : "value값","키값2":"value값2"}
			success : function(result){   //결과가 넘어와서 성공했을 받는 영역
			alert("전송성공 테스트");	
			//alert(result.value);
			$.boardCommentList();			
							
			},
			error : function(){  //결과가 실패했을때 받는 영역	
			//alert(result.value);
			alert("전송실패");
			}			
		});			
	}	
	return;
}




 //jquery로 만드는 함수  ready밖에 생성
$.boardCommentList = function(){
	//alert("ddddddd");
  	//alert("test");
	let block = $("#block").val();
  	//alert("block:"+block);
  	
	$.ajax({
		type :  "get",    //전송방식
		url : "${pageContext.request.contextPath}/comment/${bv.bidx}/"+block+"/commentList.aws",
		dataType : "json",       // json타입은 문서에서  {"키값" : "value값","키값2":"value값2"}
		success : function(result){   //결과가 넘어와서 성공했을 받는 영역
		//alert("전송성공 테스트");			
		
		
		var strTr = "";				
		$(result.clist).each(function(){	
			
			var btnn="";			
			 //현재로그인 사람과 댓글쓴 사람의 번호가 같을때만 나타내준다
			if (this.midx == "${midx}") {
				if (this.delyn=="N"){
					btnn= "<button type='button' onclick='commentDel("+this.cidx+");'>삭제</button>";
				}			
			}
			strTr = strTr + "<tr>"
			+"<td>"+this.cidx+"</td>"
			+"<td>"+this.cwriter+"</td>"
			+"<td class='content'>"+this.ccontents+"</td>"
			+"<td style='font-size:11px'>"+this.cwriteday+"</td>"
			+"<td>"+btnn+"</td>"
			+"</tr>";					
		});		       
		
		var str  = "<table class='replyTable'>"
			+"<colgroup>"
			+"<col width='10%'>"
			+"<col width='10%'>"
			+"<col width=>"
			+"<col width='20%'>"
			+"<col width='15%'>"
			+"</colgruop>"
		    +"<thead>"
			+"<th>번호</th>"
			+"<th>작성자</th>"
			+"<th>내용</th>"
			+"<th>날짜</th>"
			+"<th>DEL</th>"
			+"</thead>"
			+strTr
			+"</table>";		
		
		$("#commentListView").html(str);	
		
		if(result.moreView =="N") {
			$("#morebtn").css("display","none"); //감춘다
		} else {
			$("#morebtn").css("display","block"); //보여준다
		}
		
		let nextBlock = result.nextBlock;
		$("#block").val(nextBlock);
		
					
		},
		error : function(){  //결과가 실패했을때 받는 영역						
			//alert("전송실패");
		}			
	});	
} 

$(document).ready(function(){	
	
	$.boardCommentList();	
	
 	$("#cmtBtn").click(function(){
		//alert("ddd");
		let loginCheck = "${midx}";
		//alert(loginCheck);
		if (loginCheck == "" || loginCheck == "null" || loginCheck == null || loginCheck == 0){
			alert("로그인을 해주세요");
			return;
		}  				
		let cwriter = $("#cwriter").val();
		let ccontents = $("#ccontents").val();
		
		if (cwriter == ""){
			alert("작성자를 입력해주세요");
			$("#cwriter").focus();
			return;		
		}else if (ccontents ==""){
			alert("내용을 입력해주세요");
			$("#ccontents").focus();
			return;
		}
		
		$.ajax({
			type :  "post",    //전송방식
			url : "${pageContext.request.contextPath}/comment/commentWriteAction.aws",
			data : {"cwriter" : cwriter, 
					   "ccontents" : ccontents, 
					   "bidx" : "${bv.bidx}",
					   "midx" : "${midx}"
					   },
			dataType : "json",       // json타입은 문서에서  {"키값" : "value값","키값2":"value값2"}
			success : function(result){   //결과가 넘어와서 성공했을 받는 영역
				//alert("전송성공 테스트");			
				//var str ="("+result.value+")";			
				//alert(str);		
				if(result.value ==1){
					$("#ccontents").val("");
				}				
				$.boardCommentList();
			},
			error : function(){  //결과가 실패했을때 받는 영역						
				//alert("전송실패");
			}			
		});			
	});	 	
 	
 	$("#more").click(function(){
 		$.boardCommentList();
 	});
});




</script>

</head>
<body>
	<div class="b-example-divider"></div>
	<div class="container">
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	</div>
    <div class="container-Contents">
        <div class="contents">
            <strong>🔎QnA</strong>
            
            <!-- <p>쓸말적을까? </p>-->
             
         			<br> <br>
		</div>
		<div class="contents_view_wrap">
			<div class="contents_view">
				<div class="subject">${bv.subject}</div>
				<div class="info">
					<dl>
						<dt>번호</dt>
						<dd>${bv.bidx}</dd>
					</dl>
					<dl>
						<dt>글쓴이</dt>
						<dd>${bv.writer}</dd>
					</dl>
					<dl>
						<dt>작성일</dt>
						<dd>${bv.writeday}</dd>
					</dl>
					<dl>
						<dt>조회수</dt>
						<dd>${bv.viewCnt}</dd>
					</dl>
				</div>
				<br>
				<c:if test="${not empty bv.fileName}">
					<img
						src="${pageContext.request.contextPath}/board/displayFile.aws?fileName=${bv.fileName}">
				</c:if>
				<br>
				<div class="contents">${bv.contents}</div>
			</div>
			<br>
			
			<article class="commentContents">
				<div id="commentListView" class="commentList">
					<!-- 댓글 목록 -->
				</div>
				<form name="frm" class="commentForm">
					<p class="commentWriter">
						<label for="cwriter" class="form-label"></label> <input
							type="text" id="cwriter" name="cwriter" value="${memberNickName}"
							readonly="readonly" class="form-control"
							style="width: 100%; border: none; font-size: 1rem;">
					</p>
					<div class="input-group mb-3">
						<input type="text" id="ccontents" name="ccontents"
							class="form-control" placeholder="댓글을 입력하세요" aria-label="댓글 입력">
						<button type="button" id="cmtBtn" class="btn btn-primary replyBtn">댓글쓰기</button>
					</div>
				</form>


				<div id="morebtn" class="text-center">
					<button type="button" id="more" class="btn btn-secondary">더보기</button>
					<input type="hidden" id="block" value="1">
				</div>
			</article>

			<br>
			<div class="button-box">
				<div class="d-flex justify-content-between">

					<button id="editBtn" class="btn btn-primary">
						<a
							href="${pageContext.request.contextPath}/board/qna/qnaModify.aws?bidx=${bv.bidx}">수정</a>
					</button>
					<button id="deleteBtn" class="btn btn-secondary">
						<a href="${pageContext.request.contextPath}/board/qna/qnaDelete.aws?bidx=${bv.bidx}">삭제</a>
					</button>
					<button class="btn btn-secondary">
						<a
							href="${pageContext.request.contextPath}/board/qna/qnaList.aws">목록가기</a>
					</button>
				</div>
			</div>

		</div>
	</div>

	<br>
	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>