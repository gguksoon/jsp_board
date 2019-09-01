<%@page import="kr.or.ddit.user.model.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">
<title>Jsp-basicLib</title>
<%@ include file="/commonJsp/basicLib.jsp" %>
<style>
	.replyList {
 		margin: 15px;
	}
	
	.replyList .stat0 {
		color: silver;
		background-color: #F2F2F2;
		padding: 20px;
	}
	
	.replyList .stat1 {
		background-color: #F2F2F2;
		padding: 20px;
	}
	
	.repArea {
		background: silver;
	}
	
	.btnGroup {
		margin-right: 10px;
	}
</style>
<script>
	$(function() {
		$(".btnDeleteReply").on("click", function() {
			var result = confirm("정말로 삭제하시겠습니까?");
			
			if(result) {
				$(this).parent().parent().submit();
			}
		});
		
		$("#btnInsertRePost").on("click", function() {
 			$("#insertRePost").submit();
		});
		
		$("#btnDeletePost").on("click", function() {
			var result = confirm("정말로 삭제하시겠습니까?");
			
			if(result) {
				$("#deletePost").submit();
			}
		});
		
		$("#btnUpdatePost").on("click", function() {
// 			updatePost
		});
	});

</script>
</head>

<body>
	<!-- 개발자 입장에서 데이터를 전송하기 위하여 사용하는 form -->
	<form id="frm" action="${cp }/postPagingList" method="get">
		<input type="hidden" id="boardSeq" name="boardSeq"/>
	</form>
	
	<!-- header -->
	<%@ include file="/header.jsp" %> 

	<div class="container-fluid">
		<div class="row">

			<div class="col-sm-3 col-md-2 sidebar">
				<!-- left -->
				<%@ include file="/left.jsp" %>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

				<div class="row">
					<div class="col-sm-10 blog-main">
						<!-- 제목 -->
						<h1>${post.postNm }</h1>
						작성자: ${post.userId } | 작성일: ${post.postRegDate }
						<hr>
						<!-- 내용 -->
						${post.postContent }
						<hr> 
						첨부파일:
						<hr> 
						<!-- 댓글 내용 -->
						<div class="replyList"> 
							<c:forEach items="${replyList }" var="reply">
								<c:choose>
									<c:when test="${reply.replyStatus == 1 }">
										<form class="deleteReply" action="${cp }/deleteReply" method="post">
											<p class="stat1">
												${reply.replyContent } [ ${reply.userId } / ${reply.replyRegDate } ]
												<c:if test="${reply.userId == S_USERVO.userId }">
													<input type="hidden" name="postSeq" value="${post.postSeq }"/>
													<input type="hidden" name="replySeq" value="${reply.replySeq }" />
													<button type="button" class="btnDeleteReply btn btn-link btn-xs">
														<span class="glyphicon glyphicon-remove"></span>
													</button>
												</c:if>
											</p>
										</form>
									</c:when>
									<c:otherwise>
										<p class="stat0">삭제된 댓글입니다.</p>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>

						<!-- 댓글 입력창 -->
						<div class="form-group repArea">
							<form method="post" action="${cp }/insertReply">
								<input type="hidden" name="postSeq" value="${post.postSeq }"/>
								<input type="hidden" name="userId" value="${S_USERVO.userId }"/>
								<span class="col-sm-10">
									<textarea class="form-control" rows="4" name="replyContent" id="replyContent" placeholder="댓글을 입력하세요." style="resize: none;"></textarea>
								</span>
								<span class="col-sm-2">
								<button type="submit" class="btn btn-info btn-lg btn-block" style="height: 95px;">입력</button>
								</span>
							</form>
						</div>
						<br><br><br><br><br>
						<hr>
						<form id="updatePost" method="post" action="${cp }/modifyPost">
						</form>
						
						<form id="deletePost" method="post" action="${cp }/deletePost">
							<input type="hidden" name="postSeq" value="${post.postSeq }">
							<input type="hidden" name="boardSeq" value="${post.boardSeq }">
						</form>
						
						<form id="insertRePost" method="get" action="${cp }/insertPost?">
							<input type="hidden" name="postSeq" value="${post.postSeq }">
							<input type="hidden" name="postGn" value="${post.postGn }">
							<input type="hidden" name="boardSeq" value="${post.boardSeq }">
						</form>
						
						<button type="button" id="btnInsertRePost" class="btn btn-default btn-md pull-right btnGroup"><span class="glyphicon glyphicon-pencil"></span> 답글</button>
						<c:if test="${post.userId == S_USERVO.userId}">
							<button type="button" id="btnDeletePost" class="btn btn-default btn-md pull-right btnGroup"><span class="glyphicon glyphicon-remove"></span> 삭제</button>
							<button type="button" id="btnUpdatePost" class="btn btn-default btn-md pull-right btnGroup"><span class="glyphicon glyphicon-wrench"></span> 수정</button>
						</c:if>
						
						<div class="text-center">
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
